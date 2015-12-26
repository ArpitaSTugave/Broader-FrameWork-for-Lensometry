function varargout = start2(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @start2_OpeningFcn, ...
                   'gui_OutputFcn',  @start2_OutputFcn, ...
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
function start2_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);


function varargout = start2_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function loadimage_Callback(hObject, eventdata, handles)
warning('off','all');
warning;
DatabasePath = uigetdir(strcat(matlabroot,'\work'), 'Select database' );
prompt = {'Enter image name :'};
dlg_title = 'Input of to analyse lens behaviour ';
num_lines= 1;
def = {'1'};
Image  = inputdlg(prompt,dlg_title,num_lines,def);
i=char(Image);
Image1 = strcat(DatabasePath,'\',char(Image),'.jpg');
handles.I = imread(Image1 );
handles.J = i;
axes(handles.axes1);
imshow(handles.I);
hold on
title('mire with lens', 'FontSize', 16);
guidata(hObject, handles);



function edges_Callback(hObject, eventdata, handles)
[handles.K  handles.L]=edgemat(handles.I,handles.J,handles.axes1);
guidata(hObject, handles);


% --- Executes on button press in cropcircle.
function cropcircle_Callback(hObject, eventdata, handles)
handles.M=cropcircle(handles.I,handles.J,handles.axes1);
[handles.N, handles.O,handles.P] = size(handles.M);
syms x y
       p00 =      0.4146;
       p10 =      -1.851;
       p01 =      -6.048;
       p20 =       15.58;
       p11 =       21.45;
       p02 =       28.92;
       p30 =      -46.59;
       p21 =       1.328;
       p12 =      -118.8;
       p03 =      -54.74;
       p40 =       64.46;
       p31 =      -64.42;
       p22 =       78.69;
       p13 =       217.3;
       p04 =       33.89;
       p50 =      -32.53;
       p41 =       44.83;
       p32 =       41.35;
       p23 =      -121.4 ;
       p14 =      -112.1 ;
       p05 =      0.2152 ;
  sfr(x,y) = p00 + p10*x + p01*y + p20*x^2 + p11*x*y + p02*y^2 + p30*x^3 +...
                     p21*x^2*y + p12*x*y^2 + p03*y^3 + p40*x^4 + p31*x^3*y ...
                    + p22*x^2*y^2 + p13*x*y^3 + p04*y^4 + p50*x^5 + p41*x^4*y ...
                    + p32*x^3*y^2 + p23*x^2*y^3 + p14*x*y^4 + p05*y^5;
            handles.Q=sfr;    
        p00 =      0.5279 ;
       p10 =      -5.178 ;
       p01 =      -2.174 ;
       p20 =        15.3 ;
       p11 =       44.85 ;
       p02 =        7.48 ;
       p30 =      -16.81 ;
       p21 =      -158.8 ;
       p12 =      -76.32;
       p03 =       -16.4 ;
       p40 =       0.894 ;
       p31 =       212.3 ;
       p22 =       229.2;
       p13 =       11.54;
       p04 =       31.57 ;
       p50 =       5.873 ;
       p41 =      -93.12;
       p32 =      -171.6 ;
       p23 =      -68.43;
       p14 =       28.71;
       p05 =      -23.28;
       sfg(x,y) = p00 + p10*x + p01*y + p20*x^2 + p11*x*y + p02*y^2 + p30*x^3 +...
                     p21*x^2*y + p12*x*y^2 + p03*y^3 + p40*x^4 + p31*x^3*y ...
                    + p22*x^2*y^2 + p13*x*y^3 + p04*y^4 + p50*x^5 + p41*x^4*y ...
                    + p32*x^3*y^2 + p23*x^2*y^3 + p14*x*y^4 + p05*y^5;
                handles.R=sfg; 

guidata(hObject, handles);


function findpower_Callback(hObject, eventdata, handles)

[handles.S handles.T handles.U handles.V handles.W]=linetransformation(handles.K , handles.L , handles.M ,handles.Q , handles.R ,handles.N, handles.O,handles.axes1);
guidata(hObject, handles);
  


% --- Executes on button press in deflections.
function deflections_Callback(hObject, eventdata, handles)
yl=inv(handles.L );
handles.X=lensvariation( handles.S ,handles.T , handles.M ,handles.K ,yl, handles.L,handles.N, handles.O);
guidata(hObject, handles);
