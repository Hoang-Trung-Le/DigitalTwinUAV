function J = Ja(I, phi, tta)
%JA Jacobian matrix J from angular velocity to rotation rate
%   Detailed explanation goes here

% Matrix describing the relation between angular velocity and rotation rate
w = [1          0           -sin(tta)
     0   cos(phi)   sin(phi)*cos(tta)
     0  -sin(phi)   cos(phi)*cos(tta)];

 J = w.'*I*w;

end

