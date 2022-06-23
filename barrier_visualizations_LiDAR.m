image = imread("D:\Higher_Order_Safety_Barrier\Custom_Map_square_empty.png");
grayimage = rgb2gray(image);
bwimage = grayimage < 0.5;
refMap = binaryOccupancyMap(bwimage);

lidar = rangeSensor;
lidar.Range = [0,100];

Robot_x = 39;
Robot_y = 25;
Sigma = 2.5;

position = [Robot_x Robot_y 0];
Robot_x = position(1);
Robot_y = position(2);

[ranges, angles] = lidar(position,refMap);
scan = lidarScan(ranges,angles);

Obs = zeros(length(ranges),2);
for i = 1:1:length(ranges)

    Obs(i,1) = Robot_x + ranges(i)*cos(angles(i));
    Obs(i,2) = Robot_y + ranges(i)*sin(angles(i));

end

x=0:1:50;
y=0:1:50;
[X,Y]=meshgrid(x,y);
%Z=sin(X).^2+cos(Y).^2;

Z = (0.6 - exp(-((X-Obs(1,1)).^2 + (Y-Obs(1,2)).^2)/Sigma));

for i = 2:1:length(Obs(:,1))

    Z = Z - exp(-((X-Obs(i,1)).^2 + (Y-Obs(i,2)).^2)/Sigma);

end
Z = sign(Z);

pcolor(X,Y,Z)
colorbar;