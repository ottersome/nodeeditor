#ifndef __REALSENSE__
#define __REALSENSE__

#include <librealsense2/rs.hpp>

//Include, my computer needs opencv4 prefixed there
//if yours doesnt work like that then just delete it 
//and have opencv2/...
#include <opencv4/opencv2/opencv.hpp>
#include <opencv4/opencv2/core/core.hpp>
#include <opencv4/opencv2/highgui/highgui.hpp>

#include <pcl/point_types.h>
#include <pcl/filters/passthrough.h>
#include <pcl/visualization/cloud_viewer.h>
#include <iostream>
#include <pcl/io/io.h>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>

#include <librealsense2/rsutil.h>
//#include "example.hpp"  

#include <string>

#include <boost/shared_ptr.hpp>
#include <QImage>

class RealSense
{
public:
	typedef boost::shared_ptr< RealSense > Ptr;

private:

    //This needs to be static 
    //we cant have multiple instances of these
    //managing the same set of devices
	const static rs2::context ctx;

	// RealSense
    //This repreents a single device
	rs2::pipeline pipeline;
	rs2::pipeline_profile pipeline_profile;
	rs2::frameset frameset;
	rs2::frameset aligned_frameset;

	// Color Buffer(1920*1080)
	rs2::frame color_frame;
	cv::Mat color_mat;
	int32_t color_width = 1280;
	uint32_t color_height = 720;
	uint32_t color_fps = 30;

	// Depth Buffer(1280*720)
	rs2::frame depth_frame;
	cv::Mat depth_mat;
	/*  uint32_t depth_width = 640;
	uint32_t depth_height = 480;*/
	uint32_t depth_width = 1280;
	uint32_t depth_height = 720;
	uint32_t depth_fps = 30;

	// Infrared Buffer
	rs2::frame infrared_frame;
	cv::Mat infrared_mat;
	uint32_t infrared_width = 1280;
	uint32_t infrared_height = 720;
	uint32_t infrared_fps = 30;

	// Point Cloud Buffer
	rs2::pointcloud pointcloud;
	rs2::points points;
	cv::Mat vertices_mat;
	cv::Mat texture_mat;

	// File
	//std::string file_name = "file.bag";
	std::string file_name = "";

	
public:
	// Constructor
	RealSense();

	bool init_status =false ;

	// Destructor
	~RealSense();

	//set and get for 2D to 3D
	cv::Point2f   image_2d_in_class;
	pcl::PointXYZ camera_point_in_class;

	//set and get for 3D to 2D
	cv::Point2f   project_2d_in_class;
	pcl::PointXYZ pcl_point_in_class;

	// Processing
	void run(cv::Mat &color_image, cv::Mat &depth_image, cv::Mat &infared_image, pcl::PointCloud<pcl::PointXYZRGB>::Ptr &layers);

	// eGt_distance
	void get_distance(float &x, float &y, float & distance);

	// set 2D point to class
	void set_2d_to_class(cv::Point2f &get_image_2d);

	// get 3D from glacc
	void get_3d_from_class(pcl::PointXYZ &get_camera_point);
	//de project 2d to 3d
	void project_to_3d();

	// set 3D point to class
	void set_3d_to_class(pcl::PointXYZ &get_pcl_point);

	// get 3D from glacc
	void get_2d_from_class(cv::Point2f &get_project_2d);

	//project 3d to 2d
	void project_to_2d();

	// Initialize
	bool initialize(std::string &serial_num, std::string &json_file);

	// Enable Advanced Mode
	void enableAdvancedMode(int min, int max);

	void set_depth_range(int min, int max);

	std::tuple<uint8_t, uint8_t, uint8_t> RGB_Texture(rs2::video_frame texture, rs2::texture_coordinate Texture_XY);

    //For Realsense direct support
    rs2::frame returnColorFrame();
    QImage rsFrameToQImage(const rs2::frame & f);
    static rs2::device_list getDeviceList(){return ctx.query_devices();}

private:
	//// Initialize
	//void initialize();

	// Initialize Sensor
	inline void initializeSensor(std::string &serial_num, std::string &json_file);

	// Finalize
	void finalize();

	// Update Data
	void update(pcl::PointCloud<pcl::PointXYZRGB>::Ptr &layers);

	// Update Frame
	inline void updateFrame();

	// Update Color
	inline void updateColor();

	// Update Depth
	inline void updateDepth();

	// Update Infrared
	inline void updateInfrared();

	// Update Point Cloud
	inline void updatePointCloud(pcl::PointCloud<pcl::PointXYZRGB>::Ptr &layers);

	// Draw Data
	void draw();

	// Draw Color
	inline void drawColor();

	// Draw Depth
	inline void drawDepth();

	// Draw Infrared
	inline void drawInfrared();

	// Draw Point Cloud
	inline void drawPointCloud();

	// Show Data
	void show(cv::Mat &color_image, cv::Mat &depth_image, cv::Mat &infared_image);

	// Show Color
	inline void showColor(cv::Mat &color_image);

	// Show Depth
	inline void showDepth(cv::Mat &depth_image);

	// Show Infrared
	inline void showInfrared(cv::Mat &infrared_image);

	// Show Point Cloud
	inline void showPointCloud();

	//// Enable Advanced Mode
	//inline void enableAdvancedMode();


public:
	//Create for realsense.
	cv::Mat color_img, depth_img, infared_img;
	//pcl::PointCloud<pcl::PointXYZ>::Ptr clouds;
	pcl::PointCloud<pcl::PointXYZRGB>::Ptr clouds;
};

#endif // __REALSENSE__
