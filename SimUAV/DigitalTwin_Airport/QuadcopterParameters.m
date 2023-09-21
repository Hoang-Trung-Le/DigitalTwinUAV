%% Quadcopter Digital Twin Package Parameter Initialization

clear;clc;
addpath(genpath('./Support'));
addpath(genpath('./images'));
load('Best_Position\Best_Position.mat');

%% Time Step
Tsc = 1e-3;
Ts = 1e-3;

%% Ground contact properties
pkgGrndStiff  = 10000;          % N/m
pkgGrndDamp   = 1e3;             % N/(m/s)
pkgGrndTransW = 1e-6;           % m

%% Drone Characteristics
propD    = 0.25;  % m
propHoverSpeed = 650;    % rpm
rpmSat = 15000;

m = 1.5; %kg
Ixx = 8.85*10^-3; %kg.m2
Iyy = 15.5*10^-3; %kg.m2
Izz = 23.09*10^-3; %kg.m2

SoloCAD_DataFile;
Airport_DataFile;
%% Trajectory and Initial position settings
trajColor = [0 0 0; 1 0 0; 0 0 1];

uav(1).traj = Best_Position_1;
uav(2).traj = Best_Position_2;
uav(3).traj = Best_Position_3;

uav(1).traj(3,5) = uav(1).traj(3,5) + 4;
uav(1).traj(3,6) = uav(1).traj(3,6) + 8;
uav(1).traj(3,7:end) = uav(1).traj(3,7:end) + 12;

uav(2).traj(3,5) = uav(2).traj(3,5) + 4;
uav(2).traj(3,6) = uav(2).traj(3,6) + 8;
uav(2).traj(3,7:end) = uav(2).traj(3,7:end) + 12;

uav(3).traj(3,5) = uav(3).traj(3,5) + 4;
uav(3).traj(3,6) = uav(3).traj(3,6) + 8;
uav(3).traj(3,7:end) = uav(3).traj(3,7:end) + 12;

uav(1).start = uav(1).traj(:,1);                        % m
uav(2).start = uav(2).traj(:,1);                        % m
uav(3).start = uav(3).traj(:,1);                        % m

uav(1).wps = uav(1).traj(:,2:end);                      % m
uav(2).wps = uav(2).traj(:,2:end);                      % m
uav(3).wps = uav(3).traj(:,2:end);                      % m

%  Orientation (Euler Angles)
xrot = 0;                       % deg
yrot = 0;                       % deg
zrot = 0;                       % deg

%% Quadcopter Position Controller Gains
KP_position = 0.1; %0.175
KD_position = 0.85; %0.85

%% Quadcopter Attitude Controller Gains
kp_attitude = 1; %2;
ki_attitude = 0.01; %0.01;
kd_attitude = 10; %10;

%% Quadcopter Altitude Controller Gains
KP_altitude = 0.8; %0.8
ki_altitude = 0.275; %0.275
kd_altitude = 0.475; %0.475