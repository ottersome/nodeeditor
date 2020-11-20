#include <iostream>
#include <sstream>
#include <time.h>

//#include "realsense.h"

//Coordinate [0,0,0] referring to the center of the physical imager. 
//Within this space, the positive x-axis points to the right,
//the positive y-axis points down, and the positive z-axis points forward. 

int count_save(0);
float distance;

int main(int argc, char* argv[])
{
	//1. Create for realsense.
	cv::Mat ground_truth, color_img, depth_img, infared_img;

	cv::Mat ground_truth2, color_img2, depth_img2, infared_img2;

	pcl::PointCloud<pcl::PointXYZRGB>::Ptr layers;
	pcl::PointCloud<pcl::PointXYZRGB>::Ptr layers2;

	//2. declare the camera config file
	std::string serial_num = "825312070179";
	std::string serial_num2 = "827312070893";
	std::string json_file = "";

	RealSense realsense;
	RealSense realsense2;


	if (realsense.initialize(serial_num, json_file))
	{
		std::cout << "camera connect success\n";
	}
	else
	{
		std::cout << "camera no connect\n";
		return 0;
	}

	if (realsense2.initialize(serial_num2, json_file))
	{
		std::cout << "camera connect success\n";
	}
	else
	{
		std::cout << "camera no connect\n";
		return 0;
	}


	//3. define the windows
	pcl::visualization::CloudViewer viewer("Cloud Viewer");
	//pcl::visualization::CloudViewer viewer2("Cloud Viewer2");
	cv::namedWindow("Depth_Map",cv::WINDOW_NORMAL);
	cv::namedWindow("Depth_Map2", cv::WINDOW_NORMAL);
	cv::namedWindow("Color_Map", cv::WINDOW_NORMAL);
	cv::namedWindow("Color_Map2", cv::WINDOW_NORMAL);
	//3. start sensing
	while (1)
	{
		int key = cv::waitKey(1);

		//Realsense preprocess.
		realsense.run(color_img, depth_img, infared_img, layers);

		realsense2.run(color_img2, depth_img2, infared_img2, layers2);

		ground_truth=color_img.clone();
		
		//Demo for getting 3D (CCS) point by 2D pixel (ICS)
		cv::Point2f center(color_img.cols / 2, color_img.rows / 2);
		realsense.set_2d_to_class(center);
		realsense.project_to_3d();
		pcl::PointXYZ get_camera_point;
		realsense.get_3d_from_class(get_camera_point);
		get_camera_point.x *= 1000;
		get_camera_point.y *= 1000;
		get_camera_point.z *= 1000;
		std::cout << "camera XYZ: " << get_camera_point << std::endl;

		//Demo for getting z from pixel point
		realsense.get_distance(center.x, center.y, distance);
		std::cout << "center distance : " << distance << std::endl;
		cv::circle(color_img, center, 3, cv::Scalar(0, 255, 0), 2);
	  
		//save data
		if (cv::waitKey(40) == 's')
		{
			std::cout << "User type [S]" << std::endl;

			std::time_t rawtime;
			struct tm timeinfo;
			char buffer[80];

			std::time(&rawtime);
			localtime_s(&timeinfo, &rawtime);

			std::strftime(buffer, 80, "%Y%m%d_%H%M%S", &timeinfo);

		    std::stringstream color_path;
			color_path << "./images/ground_truth/" << buffer << count_save << "color_.png";
			cv::imwrite(color_path.str(), ground_truth);

			std::stringstream depth_path;
			depth_path << "./images/ground_truth/" << buffer << count_save << "depth_.png";
			cv::imwrite(depth_path.str(), depth_img);

			std::stringstream cloud_path;
			cloud_path << "./images/ground_truth/" << buffer << count_save << "pcl.pcd";
			pcl::io::savePCDFile(cloud_path.str(), *layers, false);

			count_save++;
		}
		else if (cv::waitKey(40) == 'q')
		{
			break;
		}
	
		cv::imshow("Depth_Map", depth_img);
		cv::imshow("Color_Map", color_img);
		cv::imshow("Depth_Map2", depth_img2);
		cv::imshow("Color_Map2", color_img2);
		viewer.showCloud(layers);
		//viewer2.showCloud(layers2);
	}
	
	return 0;
}


