image = imread("D:\Higher_Order_Safety_Barrier\Custom_Map_square_obs.png");
grayimage = rgb2gray(image);
bwimage = grayimage < 0.5;
refMap = binaryOccupancyMap(bwimage);

lidar = rangeSensor;
lidar.Range = [0,100];

Robot_x = 10;
Robot_y = 20;
Sigma = 0.5;

position = [Robot_x Robot_y 0];
Robot_x = position(1);
Robot_y = position(2);

[ranges, angles] = lidar(position,refMap);
scan = lidarScan(ranges,angles);