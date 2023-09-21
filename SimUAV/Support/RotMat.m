function R = RotMat(ang)
%ROTMAT Summary of this function goes here
%   Detailed explanation goes here

Rx = [1         0            0;
   0  cos(ang(1))    -sin(ang(1));
   0  sin(ang(1))     cos(ang(1));];

Ry = [cos(ang(2))   0   sin(ang(2));
   0   1          0;
   -sin(ang(2))  0   cos(ang(2));];

Rz = [cos(ang(3))   -sin(ang(3))   0;
   sin(ang(3))    cos(ang(3))   0;
   0           0   1;];

R = Rz*Ry*Rx;

end