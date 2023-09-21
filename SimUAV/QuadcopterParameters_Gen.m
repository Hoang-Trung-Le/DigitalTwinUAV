%% Package Delivery Quadcopter Parameter Initialization

% Copyright 2021 The MathWorks, Inc.
clear;clc;
addpath(genpath('./Support'));
addpath(genpath('./model'));
load('Best_Position\Best_Position.mat')
% ref = load('Reference\Reference.mat');
% park_rigid_terrain_params;

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

% crane = [40 48 0 0 0 pi;...
%          74 43 0 0 0 -pi/6;...
%          20 70 0 0 0 pi/2;...
%          70 60 0 0 0 0];
% 
% building = [60 20 0];
% excavator = [ 0  0 0;...
%              10 45 0;...
%              50 65 0];

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
stiff = 1e6;
damp = 1e7;
trw = 1e-6;

%% Propeller Characteristics

propD    = 0.25;  % m
propHoverSpeed = 650;    % rpm
rpmSat = 10000;
rotorDistribution = 1/6;

g = 9.81;
l = 0.5;
b = 1.14*10^-7;                   % Drag constant
k = 2.98*10^-6;                   % Lift constant
kt = 6*k/g;
m = 1.2; %kg
Ixx = 8.85*10^-3; %kg.m2
Iyy = 8.85*10^-3; %kg.m2
Izz = 16.09*10^-3; %kg.m2

% SoloCAD_DataFile;
Airport_DataFile;
%% Initial Position and Orientation of the Quadcopter
%  Position
% xStart = -5;                        % m
% yStart = -3;                        % m
% zStart = 0.06;                      % m

uav(1).traj = Best_Position_1;
% uav(2).traj = Best_Position_2;
% uav(3).traj = Best_Position_3;

uav(1).traj(3,5) = uav(1).traj(3,5) + 4;
uav(1).traj(3,6) = uav(1).traj(3,6) + 8;
uav(1).traj(3,7:end) = uav(1).traj(3,7:end) + 12;
% 
% uav(2).traj(3,5) = uav(2).traj(3,5) + 4;
% uav(2).traj(3,6) = uav(2).traj(3,6) + 8;
% uav(2).traj(3,7:end) = uav(2).traj(3,7:end) + 12;
% 
% uav(3).traj(3,5) = uav(3).traj(3,5) + 4;
% uav(3).traj(3,6) = uav(3).traj(3,6) + 8;
% uav(3).traj(3,7:end) = uav(3).traj(3,7:end) + 12;

uav(1).start = uav(1).traj(:,1) + [0; 12; 0];                        % m
% uav(2).start = uav(2).traj(:,1);                        % m
% uav(3).start = uav(3).traj(:,1);                        % m

uav(1).wps = uav(1).traj(:,2:end);                        % m

% uav(1).traj = [18.5*ones(1,9);...
%               42*ones(1,9);...
%               25*ones(1,9)];


% uav(2).wps = uav(2).traj(:,2:end);                        % m
% uav(3).wps = uav(3).traj(:,2:end);

% yStart = [0 1];                        % m
% zStart = [0.06 1];                      % m

%  Orientation (Euler Angles)
xrot = 0;                       % deg
yrot = 0;                       % deg
zrot = 0;                       % deg
rotLim = pi/6;
 %% Individual UAV
% uav(1).traj = [0 1 2 3 4 5 6 7 8 9;...
%                0 1 2 3 4 5 6 7 8 9;...
%                15.1 15.2 15.3 15.4 16.5 17.6 18.7 19.8 25.9 26.0];
% 15.1 15.2 15.3 15.4 15.5 15.6 15.7 15.8 15.9 16.0
% 1 2 3 4 5 6 7 8 9
% 0 0 0 0 0 0 0 0 0 0
% 6 7 8 9 10 12 12 12 12
% 6 7 8 9 10 20 30 40 50
% 12 15 20 25  25.1  25.2  25.3  25.4  25.5
% uav(1).start = uav(1).traj(:,1);
% uav(1).wps = uav(1).traj(:,2:end); 

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
% uav(1).timeStamp = zeros(length(uav(1).traj),1);
% uav(2).timeStamp = zeros(length(uav(2).traj),1);
% uav(3).timeStamp = zeros(length(uav(3).traj),1);

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
% uav(1).target = uav(1).traj(:,end);
% uav(2).target = uav(2).traj(:,end);
% uav(3).target = uav(3).traj(:,end);

%% Quadcopter Position Controller Gains
% KP_position = 0.1; %0.175
% KD_position = 0.85; %0.85
kp_pos.x = 1;
kp_pos.y = 1;
kp_pos.z = 10;
ki_pos.x = 0.1;
ki_pos.y = 0.1;
ki_pos.z = 0.1;
kd_pos.x = 15;
kd_pos.y = 15;
kd_pos.z = 8;

%% Quadcopter Attitude Controller Gains
% kp_attitude = 1;%2;
% ki_attitude = 0.01;%0.01;
% kd_attitude = 20; %10;
kp_ori.phi = 1;
kp_ori.theta = 1;
kp_ori.yaw = 1;
ki_ori.phi = 0.01;
ki_ori.theta = 0.01;
ki_ori.yaw = 0.1;
kd_ori.phi = 30;
kd_ori.theta = 30;
kd_ori.yaw = 30;

%% Quadcopter Altitude Controller Gains
% KP_altitude = 0.8; %0.8
% ki_altitude = 0.275; %0.275
% kd_altitude = 0.475; %0.475

%% Hexacopter Simulation with Lagrangian Dynamics

% % Define Constants
% m = 1;            % Mass (kg)
% g = 9.81;         % Acceleration due to gravity (m/s^2)
% I = eye(3);       % Inertia matrix (assumed diagonal)
% 
% % Define Symbolic Variables
% syms x y z phi theta psi dx dy dz dphi dtheta dpsi real
% q = [x; y; z; phi; theta; psi];
% dq = [dx; dy; dz; dphi; dtheta; dpsi];
% q_dot = dq.';
% T = 0.5 * m * dq.' * dq;    % Kinetic Energy
% U = m * g * z;              % Potential Energy
% L = T - U;                  % Lagrangian
% 
% % Derive Equations of Motion
% dL_dq = jacobian(L, q);
% dL_dq_dot = jacobian(L, dq);
% dL_dq_dot_dt = jacobian(dL_dq_dot, q) * dq;
% EOM = simplify(dL_dq - dL_dq_dot_dt.');
% 
% % Define System Parameters
% tspan = [0 10];    % Simulation time span
% dt = 0.01;         % Time step
% t = tspan(1):dt:tspan(2);
% n_steps = length(t);
% 
% % Initialize State Vectors
% q_init = [0; 0; 0; 0; 0; 0];    % Initial position and attitude
% dq_init = zeros(6, 1);           % Initial velocity and angular rates
% q_state = zeros(6, n_steps);
% dq_state = zeros(6, n_steps);
% 
% % Numerical Integration
% q_state(:, 1) = q_init;
% dq_state(:, 1) = dq_init;
% for i = 1:n_steps-1
%     q_dot_val = subs(EOM, [q.' dq.'], [q_state(:, i).' dq_state(:, i).']);
%     dq_state(:, i+1) = dq_state(:, i) + dt * q_dot_val(4:9);
%     q_state(:, i+1) = q_state(:, i) + dt * dq_state(:, i);
% end
% 
% % Plot Results
% figure;
% plot3(q_state(1,:), q_state(2,:), q_state(3,:), 'LineWidth', 2);
% xlabel('X');
% ylabel('Y');
% zlabel('Z');
% title('Hexacopter Trajectory');
% 
% % Add additional plots or analysis as desired

%%
% l = 0.2;
%     k = 2;
%     b = 0.5;
% ctrlAllocationMat = [k*ones(1,6);...
%                      l*k*[0.5 1 0.5 -0.5 -1 -0.5];...
%                      sqrt(3)/2*l*k*[-1, 0, 1, 1, 0, -1];...
%                      b*ones(1,6)];