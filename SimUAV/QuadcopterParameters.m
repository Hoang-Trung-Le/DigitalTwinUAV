%% Package Delivery Quadcopter Parameter Initialization

% Copyright 2021 The MathWorks, Inc.
clear;clc;
addpath(genpath('Support'));
load('Best_Position\Best_Position.mat')
ref = load('Reference\Reference.mat');
rigid_terrain_params;

%% Time Step
Tsc = 1e-3;
Ts = 1e-3;

%% Size of the ground
% infPlane.x = 2;%12.5;              % m
% infPlane.y = 2;%8.5;               % m
% infPlane.z = 2;%0.2;               % m
planeX = 500;
planeY = 500;
planeZ = 0.5;

crane = [40 48 0 0 0 pi;...
         74 43 0 0 0 -pi/6;...
         20 70 0 0 0 pi/2;...
         70 60 0 0 0 0];

building = [60 20 0];
excavator = [ 0  0 0;...
             10 45 0;...
             50 65 0];

trajColor = [0 0 0;...
             1 0 0;...
             0 0 1;];

%% Package size and density
% prcSize = [0.1 0.1 0.1];     % m
% pkgDensity = 1;                 % kg/m^3

%% Package ground contact properties
pkgGrndStiff  = 10000;          % N/m
pkgGrndDamp   = 1e3;             % N/(m/s)
pkgGrndTransW = 1e-6;           % m

%% Propeller Characteristics

propD    = 0.25;  % m
propHoverSpeed = 650;    % rpm
rpmSat = 15000;

m = 1.5; %kg
Ixx = 8.85*10^-3; %kg.m2
Iyy = 15.5*10^-3; %kg.m2
Izz = 23.09*10^-3; %kg.m2

% SoloCAD_DataFile;
SoloCAD_DataFile;
Airport_DataFile;
%% Initial Position and Orientation of the Quadcopter
%  Position
% xStart = -5;                        % m
% yStart = -3;                        % m
% zStart = 0.06;                      % m

uav(1).traj = Best_Position_1;
uav(2).traj = Best_Position_2;
uav(3).traj = Best_Position_3;
uav(1).traj(3,:) = uav(1).traj(3,:) + 15;
uav(2).traj(3,:) = uav(2).traj(3,:) + 15;
uav(3).traj(3,:) = uav(3).traj(3,:) + 15;

uav(1).start = uav(1).traj(:,1);                        % m
uav(2).start = uav(2).traj(:,1);                        % m
uav(3).start = uav(3).traj(:,1);                        % m

uav(1).wps = uav(1).traj(:,2:end);                        % m

% uav(1).wps = [18.5 20 25 30 40 50 62 72 85;...
%               42.5 45 45 45 45 45 45 45 45;...
%               20*ones(1,9)];

uav(1).wps = [18.5 20 25 30 40 50 62 72 85;...
              42.5 45 45 45 45 45 45 45 45;...
              20*ones(1,9)];
uav(2).wps = uav(2).traj(:,2:end);                        % m
uav(3).wps = uav(3).traj(:,2:end);

% yStart = [0 1];                        % m
% zStart = [0.06 1];                      % m

%  Orientation (Euler Angles)
xrot = 0;                       % deg
yrot = 0;                       % deg
zrot = 0;                       % deg

%% Material Property
rho_nylon = 1.41;               % g/cm^3
rho_glass = 2.56;               % g/cm^3
rho_pla   = 1.25;               % g/cm^3
rho_cfrp  = 6.32/3;             % g/cm^3
rho_al    = 2.66;               % g/cm^3

%% Trajectory Generation
% Waypoints
% xWaypt = [0 -1 -2; 1 1 1]';
% yWaypt = [0 0 0; 1 1 1]';
% zWaypt = [3 3 1; 1 1 1]';
% wayPoints = [xWaypt yWaypt zWaypt]';
%
% xTrajPts = [xStart;xWaypt];
% yTrajPts = [yStart;yWaypt];
% zTrajPts = [zStart;zWaypt];

% Nominal Velocity
V_nom = 2; % m/s

% Time spot for the trajectory design between the waypoints
uav(1).timeStamp = zeros(length(uav(1).traj),1);
uav(2).timeStamp = zeros(length(uav(2).traj),1);
uav(3).timeStamp = zeros(length(uav(3).traj),1);

% for k = 1:3
%    for i = 1:1:(length(uav(1).traj)-1)
%       dTraj(:,i,k) = uav(k).traj(:,i) - uav(k).traj(:,i+1);
%       tTraj(:,i,k) = abs(dTraj(:,i,k))/V_nom;
%       uav(k).timeStamp(i,1) = max(tTraj(:,i,k));
%    end
% end


% for k = 1:1:2
%    for i = 1:1:length(uav(1).traj)
%       dx = uav(i).traj(i) - uav(i).traj(i+1);
%       dy = yTrajPts(i) - yTrajPts(i+1);
%       dz = zTrajPts(i) - zTrajPts(i+1);
%       tx = abs(dx)/V_nom;
%       ty = abs(dy)/V_nom;
%       tz = abs(dz)/V_nom;
%       uav(i).timeStamp(i,1) = max([tx ty tz]);
%    end
% end
% Simulation Stop time
T_stop = 25;

% Target location
% targetX = wayPoints(1,end);
% targetY = wayPoints(2,end);
% targetZ = wayPoints(3,end);
uav(1).target = uav(1).traj(:,end);
uav(2).target = uav(2).traj(:,end);
uav(3).target = uav(3).traj(:,end);

%% Quadcopter Position Controller Gains
KP_position = 0.1; %0.175
KD_position = 0.85; %0.85

%% Quadcopter Attitude Controller Gains
kp_attitude = 1;%2;
ki_attitude = 0.01;%0.01;
kd_attitude = 10; %10;

%% Quadcopter Altitude Controller Gains
KP_altitude = 0.8; %0.8
ki_altitude = 0.275; %0.275
kd_altitude = 0.475; %0.475