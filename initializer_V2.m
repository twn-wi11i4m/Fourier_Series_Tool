% Fourier Series initializer V2
% author: Ng Tsz Wai (3035468043)
% date: 10/7/2021
% ------------------------------------------------------------------------
% for plotting Fourier series of given function, you need to run this
% programme to initialize the workspace of Matlab before running other
% programme under this folder.
% ------------------------------------------------------------------------

clear
format long

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define f(x) [symbolic function]
syms x
f = piecewise((0<=x&x<=pi/2),x,(pi/2<=x&x<=pi),-x+pi , (pi<=x & x<=2*pi),sqrt((pi/2)^2 - (x-3*pi/2).^2));
% f = piecewise((0<=x&x<=pi/2),1,(pi/2<=x&x<=pi),0,(pi<=x&x<=3*pi/2),1,(3*pi/2<=x&x<=2*pi),0);
% f = piecewise((-2*pi<=x & x<=-3*pi/2),x+2*pi,(-3*pi/2<=x & x<=-pi),x+3*pi/2,(-pi<=x & x<=-pi/2),x+pi,(-pi/2<=x & x<=0),x+pi/2,(0<=x & x<=pi/2),x,(pi/2<=x & x<=pi),x-pi/2,(pi<=x & x<=3*pi/2),x-pi, (3*pi/2<=x & x<=2*pi),x-3*pi/2);
% f = piecewise((0<=x & x<=pi/2),x,(pi/2<=x & x<=pi),x-pi/2,(pi<=x & x<=3*pi/2),x-pi, (3*pi/2<=x & x<=2*pi),x-3*pi/2);
% f = piecewise((0<=-2*pi&x<=-pi),x+2*pi,(-pi<=x&x<=0),-x,(0<=x&x<=2*pi),sqrt((pi)^2 - (x-pi)^2));
% f = -x^2;
% f = piecewise((0<=x&x<=1/2),-x,(1/2<=x&x<=1),-x+1);
f = piecewise((0<=x&x<=pi),0,(pi<=x&x<=2*pi),1);

% Interval and number of series
interval_start = 0;
% interval_start = -2*pi;
interval_end = 2*pi;
n = 100;

% Series type choose from ['Sine','Cosine','Sine_and_Cosine']
series_type = 'Sine';

% Function name
function_name = 'Gibbs_Phenomenon_zoom_in_Animation_v2';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Check parameter
if ~(strcmp(series_type,'Sine') || strcmp(series_type,'Cosine') || strcmp(series_type,'Sine_and_Cosine'))
    error("Error. Series type must be either 'Sine', or 'Cosine', or 'Sine_and_Cosine'.")
elseif strcmp(series_type,'Sine') || strcmp(series_type,'Cosine')
    if interval_start ~= 0
        error("Error. Interval start cannot be non-zero.")
    end
    if interval_end <= 0
        error("Error. Interval end must be positive value.")
    end
elseif strcmp(series_type,'Sine_and_Cosine')
    if interval_start >= 0
        error("Error. Interval start must be negative.")
    end
    if interval_end <= 0
        error("Error. Inerval end must be positive.")
    end
    if -interval_start ~= interval_end
        error("Error. The range of interval is not correct. It must be [-L, L].")
    end
end
if ~(floor(n) == n && n>=0)
    error("Error. n must be non-negative integer.")
end

% default folder name
folder_name = append('Fourier_Series_',function_name,'_(n=',num2str(n),')_[',num2str(interval_start),', ',num2str(interval_end),']_',series_type);

% check the output folder and creat a folder under working directory
if ~exist(folder_name, 'dir')
    mkdir(folder_name);
else
    warning('The folder already exists and not yet overwritten. Please check the folder.');
end

% set number of plotting data point (default:10000). 
num_plotting_data_point = 20000;

% write the information into text file
fid = fopen(append(folder_name,'/','info.txt'),'wt');
fprintf(fid, append('Fourier Series (',function_name,')\n'));
fprintf(fid, append('function f(x) = ',char(f),'\n'));
fprintf(fid, append('Series type: ',series_type,'\n'));
fprintf(fid, append('n = ',num2str(n),'\n'));
fprintf(fid, append('Interval start = ',num2str(interval_start),'\n'));
fprintf(fid, append('Interval end = ',num2str(interval_end),'\n'));
fprintf(fid, append('Number of data point = ',num2str(num_plotting_data_point),'\n'));
fclose(fid);

disp('Initialization finished.')
