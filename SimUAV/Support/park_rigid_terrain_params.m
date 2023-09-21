%% Grid Surface Data

% This script creates the parameters necessary to create a Grid Sruface
% from a STL file.

% Copyright 2021-2022 The MathWorks, Inc

%% Get xyz points from STL representing the rigid terrain
stl_points = stlread('parkEwen1.STL') ;
terrain_points = stl_points.Points;

% Remove repeated XY points
[newXY ,uniqueInd] = unique(terrain_points(:,[1 2]),'Rows');
terrain_points_new = terrain_points(uniqueInd,:);

% seperate them into x, y, and z variables
rows = size(terrain_points_new,1);
x = terrain_points_new(:,1); 
y = terrain_points_new(:,2);
z = terrain_points_new(:,3);

% Create Grid Vectors & Z height parameters for grid surface block

xg = linspace(min(x), max(x), 100); % x-grid vector
yg = linspace(min(y), max(y), 100); % y-grid vector

% Create an interpolant that fits a surface of the form z = F(x,y)  
F = scatteredInterpolant(x,y,z);
z_heights = F({xg,yg}); %  Using this syntax to conserve memory when querying a large grid of points.