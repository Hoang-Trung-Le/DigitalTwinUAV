% Simscape(TM) Multibody(TM) version: 7.5

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiDataDrone.RigidTransform(8).translation = [0.0 0.0 0.0];
smiDataDrone.RigidTransform(8).angle = 0.0;
smiDataDrone.RigidTransform(8).axis = [0.0 0.0 0.0];
smiDataDrone.RigidTransform(8).ID = "";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiDataDrone.RigidTransform(1).translation = [0 0 0];  % mm
smiDataDrone.RigidTransform(1).angle = 0;  % rad
smiDataDrone.RigidTransform(1).axis = [0 0 0];
smiDataDrone.RigidTransform(1).ID = "B[3drDrone-1:-:]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiDataDrone.RigidTransform(2).translation = [0 0 0];  % mm
smiDataDrone.RigidTransform(2).angle = 0;  % rad
smiDataDrone.RigidTransform(2).axis = [0 0 0];
smiDataDrone.RigidTransform(2).ID = "F[3drDrone-1:-:]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiDataDrone.RigidTransform(3).translation = [29.156397883432749 0 59.77947458701788];  % mm
smiDataDrone.RigidTransform(3).angle = 0.45378560551851749;  % rad
smiDataDrone.RigidTransform(3).axis = [-1.914044106613663e-15 1 -4.418919006284327e-16];
smiDataDrone.RigidTransform(3).ID = "B[3drDrone-1:-:3DR-Solo-Leg-Rev-B-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiDataDrone.RigidTransform(4).translation = [-101.92807309667205 -17.119611302530636 2.8421709430404007e-14];  % mm
smiDataDrone.RigidTransform(4).angle = 2.79572646561141;  % rad
smiDataDrone.RigidTransform(4).axis = [-5.6351675902084132e-16 2.9855437656401263e-16 -1];
smiDataDrone.RigidTransform(4).ID = "F[3drDrone-1:-:3DR-Solo-Leg-Rev-B-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiDataDrone.RigidTransform(5).translation = [-62.247236556969412 18.448984326827642 104.36000581696211];  % mm
smiDataDrone.RigidTransform(5).angle = 2.8046769621891525;  % rad
smiDataDrone.RigidTransform(5).axis = [0.22477759115386423 0.039263671434298736 0.97361871316268656];
smiDataDrone.RigidTransform(5).ID = "RootGround[3DR-Solo-Leg-Rev-B-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiDataDrone.RigidTransform(6).translation = [62.247236556969412 18.44898432682761 104.36000581696211];  % mm
smiDataDrone.RigidTransform(6).angle = 3.0641575594711901;  % rad
smiDataDrone.RigidTransform(6).axis = [0.96055652403131808 0.16778797014432445 0.22176194717696526];
smiDataDrone.RigidTransform(6).ID = "SixDofRigidTransform[3DR-Solo-Leg-Rev-B-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiDataDrone.RigidTransform(7).translation = [62.247236556969412 18.448984326827574 -104.36000581696211];  % mm
smiDataDrone.RigidTransform(7).angle = 3.0641575594711901;  % rad
smiDataDrone.RigidTransform(7).axis = [-0.96055652403131808 -0.16778797014432445 0.22176194717696526];
smiDataDrone.RigidTransform(7).ID = "SixDofRigidTransform[3DR-Solo-Leg-Rev-B-4]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiDataDrone.RigidTransform(8).translation = [-62.247236556969412 18.44898432682761 -104.36000581696211];  % mm
smiDataDrone.RigidTransform(8).angle = 2.8046769621891525;  % rad
smiDataDrone.RigidTransform(8).axis = [-0.22477759115386425 -0.039263671434298736 0.97361871316268656];
smiDataDrone.RigidTransform(8).ID = "SixDofRigidTransform[3DR-Solo-Leg-Rev-B-3]";


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiDataDrone.Solid(2).mass = 0.0;
smiDataDrone.Solid(2).CoM = [0.0 0.0 0.0];
smiDataDrone.Solid(2).MoI = [0.0 0.0 0.0];
smiDataDrone.Solid(2).PoI = [0.0 0.0 0.0];
smiDataDrone.Solid(2).color = [0.0 0.0 0.0];
smiDataDrone.Solid(2).opacity = 0.0;
smiDataDrone.Solid(2).ID = "";

%Inertia Type - Custom
%Visual Properties - Simple
smiDataDrone.Solid(1).mass = 0.012755868887564253;  % kg
smiDataDrone.Solid(1).CoM = [0.48738922455334932 45.497838640531448 -0.033208789107245347];  % mm
smiDataDrone.Solid(1).MoI = [19.195202045928497 1.3180023052323839 20.107162197508568];  % kg*mm^2
smiDataDrone.Solid(1).PoI = [-0.019077867712234894 -0.0044258505439991585 0.66489576099204539];  % kg*mm^2
smiDataDrone.Solid(1).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiDataDrone.Solid(1).opacity = 1;
smiDataDrone.Solid(1).ID = "3DR-Solo-Leg-Rev-B*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiDataDrone.Solid(2).mass = 1.2531103496980196;  % kg
smiDataDrone.Solid(2).CoM = [-1.2226806861282418e-06 25.717686641128111 7.1168206437069188e-05];  % mm
% smiData.Solid(2).MoI = [8673.2627647635072 12374.825986605376 4402.9971368414026];  % kg*mm^2
smiDataDrone.Solid(2).MoI = [Ixx Iyy Izz];  % kg*mm^2
smiDataDrone.Solid(2).PoI = [-0.0019136532447630991 -0.079631182227300312 -0.0003280238135390729];  % kg*mm^2
smiDataDrone.Solid(2).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiDataDrone.Solid(2).opacity = 1;
smiDataDrone.Solid(2).ID = "3drDrone*:*Default";

