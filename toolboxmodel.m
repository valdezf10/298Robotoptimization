%% Inverse Kinematics testing
% I applied a simple incremental position command to play with the ik
% system. There are more advance ways to do this but now I know ik is easy
% enough.

clear
load exampleRobots.mat
showdetails(puma1)
show(puma1)
randConfig = puma1.randomConfiguration;
tform = getTransform(puma1,randConfig,'L6','base');
weights = [0.25 0.25 0.25 1 1 1];
initialguess = puma1.homeConfiguration;
show(puma1,randConfig);

for i = 1:100
    ik = robotics.InverseKinematics('RigidBodyTree',puma1);
    [configSoln,solnInfo] = ik('L6',tform,weights,initialguess);
    initialguess = configSoln;
    show(puma1,configSoln);
    tform(2,4) = tform(2,4)+.01; %increment y position of end effector
    pause(.1)
    
end