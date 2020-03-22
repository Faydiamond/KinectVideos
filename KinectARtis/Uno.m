function varargout = Uno(varargin)
% UNO MATLAB code for Uno.fig
%      UNO, by itself, creates a new UNO or raises the existing
%      singleton*.
%
%      H = UNO returns the handle to a new UNO or the handle to
%      the existing singleton*.
%
%      UNO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNO.M with the given input arguments.
%
%      UNO('Property','Value',...) creates a new UNO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Uno_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Uno_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Uno

% Last Modified by GUIDE v2.5 29-Jan-2018 13:50:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Uno_OpeningFcn, ...
                   'gui_OutputFcn',  @Uno_OutputFcn, ...
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


% --- Executes just before Uno is made visible.
function Uno_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Uno (see VARARGIN)

% Choose default command line output for Uno
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Uno wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Uno_OutputFcn(hObject, eventdata, handles) 
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
global vid;                       
set(handles.slider1,'visible','off');
set(handles.axes1,'visible','on');
vid = videoinput('kinect', 2, 'Depth_640x480');
vid.FramesPerTrigger = Inf;
himage=image(zeros(640, 480, 3),'parent', handles.axes1);
preview(vid,himage);
preview(vid)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
%Grabar




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% clc,clear;

global vid;
start(vid)
% delete(vid)
% clearclose(gcf)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
