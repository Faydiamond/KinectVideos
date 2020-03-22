hwInfo = imaqhwinfo('kinect')

% Create the VIDEOINPUT objects for the two streams
colorVid = videoinput('kinect',1)


depthVid = videoinput('kinect',2)

% Set the triggering mode to 'manual'
triggerconfig([colorVid depthVid],'manual');
Set the FramesPerTrigger property of the VIDEOINPUT objects to '100' to acquire 100 frames per trigger. In this example 100 frames are acquired to give the Kinect for Windows sensor sufficient time to start tracking a skeleton.

colorVid.FramesPerTrigger = 100;
depthVid.FramesPerTrigger = 100;
% Start the color and depth device. This begins acquisition, but does not
% start logging of acquired data.
start([colorVid depthVid]);
% Trigger the devices to start logging of data.
trigger([colorVid depthVid]);
% Retrieve the acquired data
[colorFrameData,colorTimeData,colorMetaData] = getdata(colorVid);
[depthFrameData,depthTimeData,depthMetaData] = getdata(depthVid);
% Stop the devices
stop([colorVid depthVid]);