IntrinsicMatrix = [3338   0       0;0     3339  0;1997  1499  1];
radialDistortion = [0.1679 -0.699];
cameraParams = cameraParameters('IntrinsicMatrix',IntrinsicMatrix,...
            'RadialDistortion',radialDistortion);

I1 = imread('img/img1.JPG');
J1 = undistortImage(I1,cameraParams);

I2 = imread('img/img2.JPG');
J2 = undistortImage(I2,cameraParams);

I3 = imread('img/img3.JPG');
J3 = undistortImage(I3,cameraParams);

imwrite(J1,'img/1.JPG');
imwrite(J2,'img/2.JPG');
imwrite(J3,'img/3.JPG');