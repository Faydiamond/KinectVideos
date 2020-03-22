function varargout = Proo(varargin)
% PROO MATLAB code for Proo.fig
%      PROO, by itself, creates a new PROO or raises the existing
%      singleton*.
%
%      H = PROO returns the handle to a new PROO or the handle to
%      the existing singleton*.
%
%      PROO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROO.M with the given input arguments.
%
%      PROO('Property','Value',...) creates a new PROO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Proo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Proo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Proo

% Last Modified by GUIDE v2.5 29-Jan-2018 17:26:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Proo_OpeningFcn, ...
                   'gui_OutputFcn',  @Proo_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Proo is made visible.
function Proo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Proo (see VARARGIN)

% Choose default command line output for Proo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Proo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Proo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
%Calibracion del sensor:
set(handles.axes1,'visible','off');
global valor1;                                           %declaro  la  variable
global vid;
valor1=get(hObject, 'Value')                             %asigno  lo que  recibe  del slider
str1=num2str(valor1)                                 %convierto  la  variable a  un numero     
set(handles.text6, 'String', str1)   
vid = videoinput('kinect', 2, 'Depth_640x480');

    src = getselectedsource(vid);
    src.CameraElevationAngle = valor1;


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% Captura de video de profundidad
set(handles.slider1,'visible','off');
disp('daniel melero')
global vid;                       

vid = videoinput('kinect', 2, 'Depth_640x480');
vid.FramesPerTrigger = Inf;
vid.FramesPerTrigger = Inf;
himage=image(zeros(640, 480, 3),'parent', handles.axes1);
preview(vid,himage);
preview(vid)
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
%Grabar
global vid; 
set(handles.slider1,'visible','off');
set(handles.axes1,'visible','on');

vid.FramesPerTrigger = Inf;

start(vid);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% clc,clear;
global vid;

stoppreview(vid);
stop(vid);
diskLogger = VideoWriter('C:\Users\user\Desktop\No2.mp4', 'MPEG-4');
open(diskLogger);
data = getdata(vid, vid.FramesAvailable, 'uint8');
numFrames = size(data, 4);
for ii = 1:numFrames
    writeVideo(diskLogger, data(:,:,:,ii));
end
close(diskLogger);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% 
%msgbox('Inicializar la rgv','Título de la ventana');
% Captura de video de profundidad
set(handles.slider1,'visible','off');
disp('daniel melero')
global vid2;                       

vid2 = videoinput('kinect', 1, 'RGB_1280x960');
vid2.FramesPerTrigger = Inf;
vid2.FramesPerTrigger = Inf;
himage=image(zeros(640, 480, 3),'parent', handles.axes2);
preview(vid2,himage);
preview(vid2)

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%msgbox('Grabar copn la  rgv','Título de la ventana');
global vid; 
set(handles.slider1,'visible','off');
set(handles.axes2,'visible','on');

vid.FramesPerTrigger = Inf;

start(vid);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid;

stoppreview(vid);
stop(vid);
diskLogger = VideoWriter('C:\Users\user\Desktop\Noorgb2.mp4', 'MPEG-4');
open(diskLogger);
data = getdata(vid, vid.FramesAvailable, 'uint8');
numFrames = size(data, 4);
for ii = 1:numFrames
    writeVideo(diskLogger, data(:,:,:,ii));
end
close(diskLogger);


function No_Callback(hObject, eventdata, handles)
% hObject    handle to No (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of No as text
%        str2double(get(hObject,'String')) returns contents of No as a double


% --- Executes during object creation, after setting all properties.
function No_CreateFcn(hObject, eventdata, handles)
% hObject    handle to No (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
