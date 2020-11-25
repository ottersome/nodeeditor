#include "realsense.h"
#include <streambuf>
#include <rs_advanced_mode.hpp>
#define RECORD

const rs2::context RealSense::ctx;

// Constructor
RealSense::RealSense()
{
}

// Destructor
RealSense::~RealSense()
{
	// Finalize
	finalize();
}

// Processing
void RealSense::run(cv::Mat &color_image, cv::Mat &depth_image, cv::Mat &infared_image, pcl::PointCloud<pcl::PointXYZRGB>::Ptr &layers)
{
	// Update Data
	update(layers);

	// Draw Data
	draw();

	// Show Data
	show(color_image, depth_image, infared_image);
}

rs2::frame RealSense::returnColorFrame(){
    return color_frame;
}

// Initialize
bool RealSense::initialize(std::string &serial_num, std::string &json_file)
{
	rs2_error* e = 0;
	init_status =false ;
	cv::setUseOptimized(true);
	// Initialize Sensor
	initializeSensor(serial_num, json_file);
	return init_status;
}

// Initialize Sensor
inline void RealSense::initializeSensor(std::string &serial_num, std::string &json_file)
{
	rs2_error* e = 0;
	
	// Create librealsense context for managing devices
    // No need for this
	//pipeline = rs2::context();
	
	// Set Device Config
	rs2::config config;

	//config.enable_stream(rs2_stream::RS2_STREAM_COLOR, color_width, color_height, rs2_format::RS2_FORMAT_BGR8, color_fps);
	config.enable_stream(rs2_stream::RS2_STREAM_COLOR, color_width, color_height, RS2_FORMAT_RGB8, color_fps);

	config.enable_stream(rs2_stream::RS2_STREAM_DEPTH, depth_width, depth_height, rs2_format::RS2_FORMAT_Z16, depth_fps);

	config.enable_stream(rs2_stream::RS2_STREAM_INFRARED, infrared_width, infrared_height, rs2_format::RS2_FORMAT_Y8, infrared_fps);

	// Set Record File
	//config.enable_record_to_file(file_name);

	if (!serial_num.empty())
	config.enable_device(serial_num);

	// Start Pipeline
	try { pipeline_profile = pipeline.start(config); }
	catch (const rs2::error &e) 
	{
		std::cout << "RealSense error calling" << e.get_failed_function() << "(" << e.get_failed_args() << "):\n"
			<< e.what() << endl;
		return;
	}
	
	auto profile = pipeline.get_active_profile();
	
	if (!json_file.empty())
	{
		std::ifstream t(json_file);
		std::string str((std::istreambuf_iterator<char>(t)), std::istreambuf_iterator<char>());
		rs400::advanced_mode dev = profile.get_device();
		dev.load_json(str);
	}

	//enableAdvancedMode();

	init_status = true;
}

// Finalize
void RealSense::finalize()
{
	// Stop Pipline
	//pipeline.stop();
}

// Update Data
void RealSense::update(pcl::PointCloud<pcl::PointXYZRGB>::Ptr &layers)
{
	// Update Frame
	updateFrame();

	// Update Color
	updateColor();

	// Update Depth
	updateDepth();

	// Update Infrared
	updateInfrared();

	// Update Point Cloud
	updatePointCloud(layers);
}

// Update Frame
inline void RealSense::updateFrame()
{
	// Update Frame
	frameset = pipeline.wait_for_frames();

	// Retrieve Aligned Frame
	rs2::align align(rs2_stream::RS2_STREAM_COLOR);
	aligned_frameset = align.process(frameset);
	if (!aligned_frameset.size())
	{
		std::cout << "aligned_frameset.size() failed" << std::endl;
		return;
	}
}

// Update Color
inline void RealSense::updateColor()
{
	// Retrieve Color Flame
	color_frame = aligned_frameset.get_color_frame();

	// Retrive Frame Size
	color_width = color_frame.as<rs2::video_frame>().get_width();
	color_height = color_frame.as<rs2::video_frame>().get_height();
}

// Update Depth
inline void RealSense::updateDepth()
{
	// Retrieve Depth Flame
	depth_frame = aligned_frameset.get_depth_frame();

	// Retrive Frame Size
	depth_width = depth_frame.as<rs2::video_frame>().get_width();
	depth_height = depth_frame.as<rs2::video_frame>().get_height();
}


void RealSense::get_distance(float & x, float & y, float & distance)
{
	rs2::depth_frame dpt_frame = depth_frame.as<rs2::depth_frame>();
	float pixel_distance_in_meters = dpt_frame.get_distance(x, y);
	distance = pixel_distance_in_meters;
}

void RealSense::set_2d_to_class(cv::Point2f & get_image_2d)
{
	image_2d_in_class = get_image_2d;
}

void RealSense::get_3d_from_class(pcl::PointXYZ & get_camera_point)
{
	camera_point_in_class.x *= 1000;
	camera_point_in_class.y *= 1000;
	camera_point_in_class.z *= 1000;
	get_camera_point = camera_point_in_class;
}

// Update Infrared
inline void RealSense::updateInfrared()
{
	// Retrieve Infrared Flame
	infrared_frame = frameset.first(rs2_stream::RS2_STREAM_INFRARED);

	// Retrive Frame Size
	infrared_width = infrared_frame.as<rs2::video_frame>().get_width();
	infrared_height = infrared_frame.as<rs2::video_frame>().get_height();
}

inline void RealSense::updatePointCloud(pcl::PointCloud<pcl::PointXYZRGB>::Ptr &layers)
{

	// Declare pointcloud object, for calculating pointclouds and texture mappings
	rs2::pointcloud pc;

	auto frames = pipeline.wait_for_frames();
	auto depth = frames.get_depth_frame();
	auto colored_frame = frames.get_color_frame();

	pc.map_to(colored_frame);
	auto points = pc.calculate(depth);

	pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZRGB>);

	auto sp = points.get_profile().as<rs2::video_stream_profile>();
	
	// Config of PCL Cloud object
	cloud->width = static_cast<uint32_t>(sp.width());
	cloud->height = static_cast<uint32_t>(sp.height());
	cloud->is_dense = false;
	cloud->points.resize(points.size());

	auto tex_coords = points.get_texture_coordinates();
	auto vertices = points.get_vertices();

	for (int i = 0; i < points.size(); ++i)
	{
		cloud->points[i].x = vertices[i].x;
		cloud->points[i].y = vertices[i].y;
		cloud->points[i].z = vertices[i].z;

		std::tuple<uint8_t, uint8_t, uint8_t> current_color;
		current_color = RGB_Texture(colored_frame, tex_coords[i]);

		// Reversed order- 2-1-0 because of BGR model used in camera
		cloud->points[i].r = std::get<2>(current_color);
		cloud->points[i].g = std::get<1>(current_color);
		cloud->points[i].b = std::get<0>(current_color);
	}

	////----------------------------------------------------//
	//// Calculate Point Cloud
	//points = pointcloud.calculate(depth_frame);

	//// Declare pointcloud object, for calculating pointclouds and texture mappings
	//rs2::pointcloud pc;
	//// We want the points object to be persistent so we can display the last cloud when a frame drops
	//rs2::points points;

	//// Wait for the next set of frames from the camera
	//auto frames = pipeline.wait_for_frames();
	//auto depth = frames.get_depth_frame();
	//auto color = frames.get_color_frame();

	//// Generate the pointcloud and texture mappings
	//points = pc.calculate(depth);

	//// Mapping Texture to Point Cloud
	//pointcloud.map_to(color);
	//
	////auto pcl_points = points_to_pcl(points);
	//pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZRGB>);
	//

	//auto sp = points.get_profile().as<rs2::video_stream_profile>();
	//cloud->width = sp.width();
	//cloud->height = sp.height();
	//cloud->is_dense = false;
	//cloud->points.resize(points.size());
	//auto Texture_Coord = points.get_texture_coordinates();
	//auto Vertex = points.get_vertices();
	////for (auto& p : cloud->points)
	//for (int i = 0; i < points.size(); i++)
	//{
	//	cloud->points[i].x = Vertex[i].x;
	//	cloud->points[i].y = Vertex[i].y;
	//	cloud->points[i].z = Vertex[i].z;
	//	std::tuple<uint8_t, uint8_t, uint8_t> RGB_Color;
	//	RGB_Color = RGB_Texture(color, Texture_Coord[i]);
	//	if (i < 10)
	//	{
	//		std::cout << "r: " << cloud->points[i].r << std::endl;
	//	}
	//	cloud->points[i].r = std::get<2>(RGB_Color); // Reference tuple<2>
	//	cloud->points[i].g = std::get<1>(RGB_Color); // Reference tuple<1>
	//	cloud->points[i].b = std::get<0>(RGB_Color); // Reference tuple<0>
	//	//Vertex++;
	//}

	layers = cloud;
}

// Draw Data
void RealSense::draw()
{
	// Draw Color
	drawColor();

	// Draw Depth
	drawDepth();

	// Draw Infrared
	drawInfrared();

	// Draw Point Cloud
	//drawPointCloud();
}

// Draw Color
inline void RealSense::drawColor()
{
	// Create cv::Mat form Color Frame
	color_mat = cv::Mat(color_height, color_width, CV_8UC3, const_cast<void*>(color_frame.get_data()));
}

// Draw Depth
inline void RealSense::drawDepth()
{
	// Create cv::Mat form Depth Frame
	depth_mat = cv::Mat(depth_height, depth_width, CV_16SC1, const_cast<void*>(depth_frame.get_data()));
}

// Draw Infrared
inline void RealSense::drawInfrared()
{
	// Create cv::Mat form Infrared Frame
	infrared_mat = cv::Mat(infrared_height, infrared_width, CV_8UC1, const_cast<void*>(infrared_frame.get_data()));
}

// Draw Point Cloud
inline void RealSense::drawPointCloud()
{
	// Retrieve Vetrices
	const rs2::vertex* vertices = points.get_vertices();

	// Retrieve Coordinated Texture
	const rs2::texture_coordinate* texture_coordinates = points.get_texture_coordinates();

	// Create cv::Mat from Vertices and Texture
	vertices_mat = cv::Mat(depth_height, depth_width, CV_32FC3, cv::Vec3f::all(std::numeric_limits<float>::quiet_NaN()));
	texture_mat = cv::Mat(depth_height, depth_width, CV_8UC3, cv::Vec3b::all(0));

#pragma omp parallel for
	for (int32_t index = 0; index < points.size(); index++) 
	{
		if (vertices[index].z) 
		{
			// Set Vetices to cv::Mat
			const rs2::vertex vertex = vertices[index];
			vertices_mat.at<cv::Vec3f>(index) = cv::Vec3f(vertex.x, vertex.y, vertex.z);

			// Set Texture to cv::Mat
			const rs2::texture_coordinate texture_coordinate = texture_coordinates[index];
			const uint32_t x = static_cast<uint32_t>(texture_coordinate.u * static_cast<float>(color_width)); // [0.0, 1.0) -> [0, width)
			const uint32_t y = static_cast<uint32_t>(texture_coordinate.v * static_cast<float>(color_height)); // [0.0, 1.0) -> [0, height)
			if ((0 <= x) && (x < color_width) && (0 <= y) && (y < color_height)) {
				texture_mat.at<cv::Vec3b>(index) = color_mat.at<cv::Vec3b>(y, x);
			}
		}
	}
}

// Show Data
void RealSense::show(cv::Mat &color_image, cv::Mat &depth_image, cv::Mat &infared_image)
{
	// Show Color
	showColor(color_image);

	// Show Depth
	showDepth(depth_image);

	// Show Infrared
	showInfrared(infared_image);

	// Show Point Cloud
	showPointCloud();
}

// Show Color
inline void RealSense::showColor(cv::Mat &color_image)
{
	if (color_mat.empty()) {
		return;
	}

	// Show Color Image
	color_image = color_mat.clone();
	//cv::imshow( "Color", color_mat );
}

// Show Depth
inline void RealSense::showDepth(cv::Mat &depth_image)
{
	if (depth_mat.empty()) {
		return;
	}
	//depth_image = depth_mat.clone();

	////// Scaling
	cv::Mat scale_mat;
	////depth_mat.convertTo( scale_mat, CV_8U, -255.0 / 100, 255.0 ); // 0-10000 -> 255(white)-0(black)
	depth_mat.convertTo(scale_mat, CV_8U, -255.0 / 1000.0, 255.0); // 0-10000 -> 255(white)-0(black)

	//double min, max;
	//cv::minMaxLoc(depth_mat, &min, &max);
	//float scale = 255 / (max - min);
	//depth_mat.convertTo(scale_mat, CV_8UC1, scale, 255);
	//cv::applyColorMap(scale_mat, scale_mat, cv::COLORMAP_AUTUMN);

	depth_image = scale_mat.clone();
}

// Show Infrared
inline void RealSense::showInfrared(cv::Mat &infared_image)
{
	if (infrared_mat.empty()) {
		return;
	}

	// Show Infrared Image
	infared_image = infrared_mat.clone();
	//cv::imshow( "Infrared", infrared_mat );
}

// Show Point Cloud
inline void RealSense::showPointCloud()
{
	if (vertices_mat.empty()) {
		return;
	}

	if (texture_mat.empty()) {
		return;
	}
}

void RealSense::project_to_3d()
{
	float pixel[2];
	float point[3]; // From point (in 3D)
	pixel[0] = image_2d_in_class.x;
	pixel[1] = image_2d_in_class.y;
	float dist = aligned_frameset.get_depth_frame().get_distance(pixel[0], pixel[1]);

	rs2_intrinsics intr = color_frame.get_profile().as<rs2::video_stream_profile>().get_intrinsics();
	rs2_deproject_pixel_to_point(point, &intr, pixel, dist);
	camera_point_in_class.x = point[0];
	camera_point_in_class.y = point[1];
	camera_point_in_class.z = point[2];
}

void RealSense::set_3d_to_class(pcl::PointXYZ & get_pcl_point)
{
	pcl_point_in_class = get_pcl_point;
}

void RealSense::get_2d_from_class(cv::Point2f & get_project_2d)
{
	get_project_2d = project_2d_in_class;
}

void RealSense::project_to_2d()
{
	float pixel[2]; // From point (in 2D)
	float point[3]; // From point (in 3D)
	
	point[0] = pcl_point_in_class.x ;
	point[1] = pcl_point_in_class.y ;
	point[2] = pcl_point_in_class.z ;

	rs2_intrinsics intr = color_frame.get_profile().as<rs2::video_stream_profile>().get_intrinsics();
	rs2_project_point_to_pixel(pixel, &intr, point);

	project_2d_in_class.x = pixel[0];
	project_2d_in_class.y = pixel[1];
}

// Enable Advanced Mode
void RealSense::enableAdvancedMode(int min, int max)
{
	// Retrieve Device
	rs2::device device = pipeline_profile.get_device();

	// Advanced Mode
	if (device.is<rs400::advanced_mode>()) 
	{
		// Enable Advanced Mode
		rs400::advanced_mode advanced_mode = device.as<rs400::advanced_mode>();
		if (!advanced_mode.is_enabled()) {
			advanced_mode.toggle_advanced_mode(true);
		}
		//std::cout << "debug\n";
		// e.g. Control Depth Table (Clamp Depth to Specified Range)
		STDepthTableControl depth_table_control = advanced_mode.get_depth_table();
		depth_table_control.depthClampMin = min; // Min Depth 1.0m = 1000
		depth_table_control.depthClampMax = max; // Max Depth 2.0m = 2000
		advanced_mode.set_depth_table(depth_table_control);

		// e.g. Apply Visual Preset (https://github.com/IntelRealSense/librealsense/wiki/D400-Series-Visual-Presets)
	}
}

void RealSense::set_depth_range(int min, int max)
{
	
}

std::tuple<uint8_t, uint8_t, uint8_t> RealSense::RGB_Texture(rs2::video_frame texture, rs2::texture_coordinate Texture_XY)
{
	// Get Width and Height coordinates of texture
	int width = texture.get_width();  // Frame width in pixels
	int height = texture.get_height(); // Frame height in pixels

									   // Normals to Texture Coordinates conversion
	int x_value = std::min(std::max(int(Texture_XY.u * width + .5f), 0), width - 1);
	int y_value = std::min(std::max(int(Texture_XY.v * height + .5f), 0), height - 1);

	
	int idx = x_value * texture.get_bytes_per_pixel() + y_value * texture.get_stride_in_bytes();
	const auto texture_data = reinterpret_cast<const uint8_t*>(texture.get_data());
	return std::tuple<uint8_t, uint8_t, uint8_t>(texture_data[idx], texture_data[idx + 1], texture_data[idx + 2]);
}
QImage RealSense::rsFrameToQImage(const rs2::frame &f){
    using namespace rs2;

    ///Get width and height
    auto vf = f.as<video_frame>();
    const int w = vf.get_width();
    const int h = vf.get_height();

    if(f.get_profile().format() == RS2_FORMAT_RGB8){
        auto r = QImage((uchar*) f.get_data(),
                w, h, w*3,QImage::Format_RGB888);
        return r; }else if(f.get_profile().format() == RS2_FORMAT_Z16){
        auto r = QImage((uchar*)f.get_data(), w,h,w*2,
                QImage::Format_Grayscale16);
        return r;
    }
    throw std::runtime_error("Frame format not yet supported");

}
