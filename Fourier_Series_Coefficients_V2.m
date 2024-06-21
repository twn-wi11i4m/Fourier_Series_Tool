% % Fourier_Series_Coefficients_V2
% author: Ng Tsz Wai (3035468043)
% date: 25/6/2021
% ----------------------------------------------------------------------

tic
L = interval_end - interval_start;

% Define Sine function and Cosine function [symbolic function]
syms i x;
S = sin(i*x*pi/L);
C = cos(i*x*pi/L);

number = 0:n;

if strcmp(series_type,'Sine')
    B_n = sym([]);
    symbolic_integral_f_and_sine(i) = (2/L)*vpaintegral(f * S,x,interval_start,interval_end);
    B_n = [0 symbolic_integral_f_and_sine(1:n)];
    B_n = double(real(B_n));

elseif strcmp(series_type,'Cosine')
    A_n = sym([]);
    symbolic_integral_f_and_cosine(i) = (2/L)*vpaintegral(f * C,x,interval_start,interval_end);
    A_n = [(1/L)*vpaintegral(f,x,interval_start,interval_end) symbolic_integral_f_and_cosine(1:n)];
    A_n = double(real(A_n));
    
elseif strcmp(series_type,'Sine_and_Cosine')
    A_n = sym([]);
    B_n = sym([]);
    symbolic_integral_f_and_sine(i) = (1/L)*vpaintegral(f * S,x,interval_start,interval_end);
    symbolic_integral_f_and_cosine(i) = (1/L)*vpaintegral(f * C,x,interval_start,interval_end);
    A_n = [(1/(2*L))*vpaintegral(f,x,interval_start,interval_end) symbolic_integral_f_and_cosine(1:n)];
    B_n = [0 symbolic_integral_f_and_sine(1:n)];
    A_n = double(real(A_n));
    B_n = double(real(B_n));
end

disp('The Fourier Series Coefficients have been calculated.')

% export the Fourier Coefficients csv file
% default csv file name
Fourier_Coefficients_csv = append('Fourier_Coefficients_',function_name,'_(n=',num2str(n),')_[',num2str(interval_start),', ',num2str(interval_end),']_',series_type,'.csv');

if strcmp(series_type,'Sine')
    T = table(number', B_n', 'VariableNames',{'n','B_n'});
    
elseif strcmp(series_type,'Cosine')
    T = table(number', A_n', 'VariableNames',{'n','A_n'});
    
elseif strcmp(series_type,'Sine_and_Cosine')
    T = table(number', A_n', B_n', 'VariableNames',{'n','A_n','B_n'});
    
end

writetable(T,append(folder_name,'/', Fourier_Coefficients_csv));
disp(append('Exported! csv file name: ',Fourier_Coefficients_csv))

% export the Fourier Coefficients of A_n and B_n
h = figure('visible', 'off');
hold on
grid on
title(append('Fourier Coefficients of ',function_name,' (type: ',series_type,')'),'Interpreter','none');
xlabel('n','Interpreter','none');
if strcmp(series_type,'Sine')
    plot(number,B_n)
    legend('B_n')
elseif strcmp(series_type,'Cosine')
    plot(number,A_n)
    legend('A_n')
elseif strcmp(series_type,'Sine_and_Cosine')
    plot(number,A_n)
    plot(number,B_n)
    legend('A_n','B_n');
end
drawnow 
frame = getframe(h); 
im = frame2im(frame); 
[imind,cm] = rgb2ind(im,256);
Fourier_Coefficients_png = append('Fourier_Coefficients_',function_name,'_(n=',num2str(n),')_[',num2str(interval_start),', ',num2str(interval_end),']_',series_type,'.png');
imwrite(imind,cm,append(folder_name,'/',Fourier_Coefficients_png),'png');
close

disp(append('Exported! png file name: ',Fourier_Coefficients_png))
toc
