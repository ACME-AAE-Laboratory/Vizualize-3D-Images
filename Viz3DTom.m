function varargout = Viz3DTom(varargin)
% VIZ3DTOM MATLAB code for Viz3DTom.fig
%      VIZ3DTOM, by itself, creates a new VIZ3DTOM or raises the existing
%      singleton*.
%
%      H = VIZ3DTOM returns the handle to a new VIZ3DTOM or the handle to
%      the existing singleton*.
%
%      VIZ3DTOM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VIZ3DTOM.M with the given input arguments.
%
%      VIZ3DTOM('Property','Value',...) creates a new VIZ3DTOM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Viz3DTom_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Viz3DTom_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Viz3DTom

% Last Modified by GUIDE v2.5 27-Aug-2018 10:33:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Viz3DTom_OpeningFcn, ...
                   'gui_OutputFcn',  @Viz3DTom_OutputFcn, ...
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


% --- Executes just before Viz3DTom is made visible.
function Viz3DTom_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Viz3DTom (see VARARGIN)

set(gcf, 'units', 'normalized', 'position', [0.05 0.15 0.5 0.7]); %this sets the window aspect ratio
daspect(handles.axes1, [1 1 1]); %this sets the aspect ratio of axes1

z=1; %intializes as slice = first slice

data1=varargin{1}; %asigns the first window data1
imagesc(handles.axes1, data1(:,:,z)); %visualize the data
colormap(handles.axes1, gray) %set the colormap for tomography

% Choose default command line output for Viz3DTom
handles.output = hObject;

handles.size=size(data1);
handles.data1=data1;

s=handles.size;
set(handles.slider1, 'min',1);
set(handles.slider1, 'max',s(3));
set(handles.slider1, 'Value', 1);
set(handles.slider1, 'SliderStep', [1/(s(3)-1) , 1/(s(3)-1) ]);

set(handles.text2, 'String', num2str(s(3)))
set(handles.text3, 'String', num2str(1))

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Viz3DTom wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Viz3DTom_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
z=get(handles.slider1,'Value');

xlim = get(handles.axes1, 'XLim');
ylim = get(handles.axes1, 'YLim');

data1=handles.data1;
imagesc(handles.axes1, data1(:,:,floor(z)));

set(handles.axes1, 'XLim', xlim);
set(handles.axes1, 'YLim', ylim);

set(handles.text6, 'String', num2str(floor(z)));




% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);

end
