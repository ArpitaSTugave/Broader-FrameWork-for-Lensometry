
function varargout = start1(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @start1_OpeningFcn, ...
                   'gui_OutputFcn',  @start1_OutputFcn, ...
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
function start1_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
function varargout = start1_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function load_image_Callback(hObject, eventdata, handles)
axes(handles.axes5);
y=imread('image.jpg');
imshow(y);
title('mire image', 'FontSize', 16);
function grayscale_image_Callback(hObject, eventdata, handles)
axes(handles.axes5);
x=imread('image.jpg');
a=rgb2gray(x);
imshow(a);
title('mire in grayscale', 'FontSize', 16);
function sobel_detector_Callback(hObject, eventdata, handles)
axes(handles.axes5);

x=imread('image.jpg');
a=rgb2gray(x);
normal_edges = edge(a,'sobel');
imshow(normal_edges);                                                  
title('edges using sobel detection', 'FontSize', 16);
function hough_transform_Callback(hObject, eventdata, handles)
axes(handles.axes5);
a = imread('image.jpg');                                 
I = rgb2gray(a);                                            
edges = edge(I, 'sobel');                                   
[H, T, R] = hough(edges);                                   
peaks = houghpeaks(H, 6, 'Threshold', 0.4*max(H(:)));       
lines = houghlines(edges, T, R, peaks, 'FillGap', 200, 'MinLength', 400);  
 imshow(I), hold on
 title('edges using hough transform', 'FontSize', 16);
max_len = 0;                                                   
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

end
hold off

function corner_detector_Callback(hObject, eventdata, handles)
axes(handles.axes5);
a = imread('image.jpg');                                 
lineparameters(1, :) = [88,93]; 
lineparameters(2, :) = [-32,1252];
lineparameters(3, :) = [28,2210];
lineparameters(4, :) = [88,1824];
lineparameters(5, :) = [-32,-466];
lineparameters(6, :) = [28,488];
for i = 1:6
    lineabc(i, 1) = cos((pi*lineparameters(i, 1))/180);
    lineabc(i, 2) = sin((pi*lineparameters(i, 1))/180);
    lineabc(i, 3) = lineparameters(i, 2);
end
A = lineabc(:, 1:2);
B = lineabc(:, 3);
for j = 1:5                                             
    a1 = A(j,1);
    a2 = A(j,2);
    b1 = A(j+1, 1);
    b2 = A(j+1, 2);
    c1 = B(j);
    c2 = B(j+1);
    c(j,:) = [a1 a2; b1 b2]\[c1;c2];
end
c(6,:) = [A(6,1) A(6,2); A(1,1) A(1,2)]\[B(6);B(1)];
x=[ c(1,1) c(2,1) c(3,1) c(4,1) c(5,1) c(6,1)];
y=[ c(1,2) c(2,2) c(3,2) c(4,2) c(5,2) c(6,2)];
imshow(a)
hold on
title('corners of mire', 'FontSize', 16);
plot(x,y,'w*','MarkerSize',8);
axis([0,2082 ,0,2082]);
hold off
