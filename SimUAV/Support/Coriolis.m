function C = Coriolis(I, rot, drot)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% syms phi tta  phiD ttaD psiD
% syms Ixx Iyy Izz
% sym psi
% C = sym(zeros(3));

Ixx = I(1,1);
Iyy = I(2,2);
Izz = I(3,3);
phi = rot(1);
tta = rot(2);
phiD = drot(1);
ttaD = drot(2);
psiD = drot(3);
C = zeros(3);
C(1,1) = 0;
C(1,2) = (Iyy-Izz)*(ttaD*cos(phi)*sin(phi)+psiD*sin(phi)^2*cos(tta))+(Izz-Iyy)*(psiD*cos(phi)^2*cos(tta))-Ixx*psiD*cos(tta);
C(1,3) = (Izz-Iyy)*psiD*cos(phi)*sin(phi)*cos(tta)^2;
C(2,1) = (Izz-Iyy)*(ttaD*cos(phi)*sin(phi)+psiD*sin(phi)*cos(tta)) + (Iyy-Izz)*psiD*cos(phi)^2*cos(tta) + Ixx*psiD*cos(tta);
C(2,2) = (Izz-Iyy)*phiD*cos(phi)*sin(phi);
C(2,3) = -Ixx*psiD*sin(tta)*cos(tta) + Iyy*psiD*sin(phi)^2*sin(tta)*cos(tta) + Izz*psiD*cos(phi)^2*sin(tta)*cos(tta);
C(3,1) = (Iyy-Izz)*psiD*cos(tta)^2*sin(phi)*cos(phi) - Ixx*ttaD*cos(tta);
C(3,2) = (Izz-Iyy)*(ttaD*cos(phi)*sin(phi)*sin(tta)+phiD*sin(phi)^2*cos(tta)) + (Iyy-Izz)*phiD*cos(phi)^2*cos(tta) + Ixx*psiD*sin(tta)*cos(tta) - Iyy*psiD*sin(phi)^2*sin(tta)*cos(tta) - Izz*psiD*cos(phi)^2*sin(tta)*cos(tta);
C(3,3) = (Iyy-Izz)*phiD*cos(phi)*sin(phi)*cos(tta)^2 - Iyy*ttaD*sin(phi)^2*cos(tta)*sin(tta) - Izz*ttaD*cos(phi)^2*cos(tta)*sin(tta) + Ixx*ttaD*cos(tta)*sin(tta);

end

