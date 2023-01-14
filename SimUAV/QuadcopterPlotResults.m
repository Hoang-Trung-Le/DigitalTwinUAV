% Code to plot simulation results from sm_quadcopter
%% Plot Description:
%
% The plot below shows the actual and desired Position of the Quadcopter

% Copyright 2021 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_sm_quadcopter', 'var')
    sim('sm_quadcopter')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_sm_quadcopter', 'var') || ...
        ~isgraphics(h1_sm_quadcopter, 'figure')
    h1_sm_quadcopter = figure('Name', 'sm_quadcopter');
end
figure(h1_sm_quadcopter)
clf(h1_sm_quadcopter)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
xpos  = logsout_sm_quadcopter.get('xpos');
ypos  = logsout_sm_quadcopter.get('ypos');
zpos  = logsout_sm_quadcopter.get('zpos');
xpos_des  = logsout_sm_quadcopter.get('xpos_des');
ypos_des  = logsout_sm_quadcopter.get('ypos_des');
zpos_des  = logsout_sm_quadcopter.get('zpos_des');

% Plot results

simlog_handles(1) = subplot(3, 1, 1);
plot(xpos_des.Values.Time(:,1),xpos_des.Values.Data(:,1),'LineWidth', 1)
hold on
plot(xpos.Values.Time(:,1),xpos.Values.Data(:,1),'LineWidth', 1)
grid on
title('Position of the Quadcopter')
ylabel('X Position (m)')
xlabel('Time (s)')
axis([0 25 -8 8])
l = legend('Desired Position of the Quadcopter','Position of the Quadcopter', 'Location','best');
l.Box = 'off';

simlog_handles(1) = subplot(3, 1, 2);
plot(ypos_des.Values.Time(:,1),ypos_des.Values.Data(:,1),'LineWidth', 1)
hold on
plot(ypos.Values.Time(:,1),ypos.Values.Data(:,1),'LineWidth', 1)
grid on
ylabel('Y Position (m)')
xlabel('Time (s)')
axis([0 25 -5 5])

simlog_handles(2) = subplot(3, 1, 3);
plot(zpos_des.Values.Time(:,1),zpos_des.Values.Data(:,1),'LineWidth', 1)
hold on
plot(zpos.Values.Time(:,1),zpos.Values.Data(:,1),'LineWidth', 1)
grid on
ylabel('Z Position (m)')
xlabel('Time (s)')
axis([0 25 0 8])

linkaxes(simlog_handles, 'x')

% Remove temporary variables
clear xpos ypos zpos xpos_des ypos_des zpos_des