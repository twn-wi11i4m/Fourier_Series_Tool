% Homogeneous_Dirichlet_Conditions_for_Wave_Equation_with_IC
% author: Ng Tsz Wai (3035468043)
% date: 17/7/2021
% ----------------------------------------------------------------------
% This programme is to show the solution of wave equation with Dirichlet
% condition and initial conditions.
% Format of wave equation
% \partial_{tt} {u(x,t)} - c^2 \partial_{xx} {u(x,t)} = 0
% u(0,t) = u(L,t) = 0
% u(x,0) = \phi (x)
% \partial_{t} {u(x,0)} = \psi (x)
% The structure is based on "Fourier Series tool V2".
clear
format long

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define the parameter
syms x;
c = 5;
L = 20*pi;
phi =  (1/(1*sqrt(2*pi)))*exp(-((x-10*pi)^2)/(2*1^2));
psi = 0;
n = 220;
t_end = 20;

function_name = 'wave propagation';

% axis tight manual
axis_boundary = [0,L,-0.8,0.8];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% default folder name
folder_name = append('Wave_Equation_simulation_',function_name,'_(n=',num2str(n),')_[',num2str(0),', ',num2str(L),']_t=',num2str(t_end));

% check the output folder and creat a folder under working directory
if ~exist(folder_name, 'dir')
    mkdir(folder_name);
else
    warning('The folder already exists and not yet overwritten. Please check the folder.');
end

% increment of t
inc_t = 0.01;

% write the information into text file
fid = fopen(append(folder_name,'/','info.txt'),'wt');
fprintf(fid, append('Wave Equation Simulation on (',function_name,') :\n\n'));
fprintf(fid, append("partial_{tt} {u(x,t)} - (",num2str(c),")^2 partial_{xx} {u(x,t)} = 0",'\n'));
fprintf(fid, append("u(0,t) = u(",num2str(L),',t) = 0\n'));
fprintf(fid, append("u(x,0) = ",char(phi),'\n'));
fprintf(fid, append("partial_{t} {u(x,0)} = ",char(psi),'\n\n'));
fprintf(fid, append('n = ',num2str(n),'\n'));
fclose(fid);

disp('Initialization finished.');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic
% define sine function and number
syms i x;
S = sin(i*x*pi/L);
number = 1:n;

% A_n
A_n = sym([]);
symbolic_integral_phi_and_sine(i) = (2/L)*vpaintegral(phi * S,x,0,L);
A_n = [symbolic_integral_phi_and_sine(number)];
A_n = double(real(A_n));

% C_n
C_n = sym([]);
symbolic_integral_psi_and_sine(i) = (2/L)*vpaintegral(psi * S,x,0,L);
C_n = [symbolic_integral_psi_and_sine(number)];
C_n = double(real(C_n));

% B_n
factor_B_n_to_C_n = [(L/(pi*c))*(1./(number))];
B_n = factor_B_n_to_C_n .* C_n;

disp('The Fourier Series Coefficients have been calculated.');
toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic
% export the Fourier Coefficients csv file
% default csv file name
Fourier_Coefficients_csv = append('Wave_Equation_simulation_',function_name,'_(n=',num2str(n),')_[0, ',num2str(L),']_t=',num2str(t_end),'.csv');
writetable(table(number', A_n', B_n', 'VariableNames',{'n','A_n','B_n'}),append(folder_name,'/', Fourier_Coefficients_csv));
disp(append('Exported! csv file name: ',Fourier_Coefficients_csv));
toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic
% export the Fourier Coefficients of A_n and B_n
h = figure('visible', 'off');
hold on
grid on
title(append('Coefficients of Wave Equation ',function_name),'Interpreter','none');
xlabel('n','Interpreter','none');
plot(number,A_n);
plot(number,B_n);
legend('A_n','B_n');
drawnow 
frame = getframe(h); 
im = frame2im(frame); 
[imind,cm] = rgb2ind(im,256);
Fourier_Coefficients_png = append('Wave_Equation_simulation_',function_name,'_(n=',num2str(n),')_[0, ',num2str(L),']_t=',num2str(t_end),'.png');
imwrite(imind,cm,append(folder_name,'/',Fourier_Coefficients_png),'png');
close
disp(append('Exported! png file name: ',Fourier_Coefficients_png));
toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic
% Let T(t) and X(x) be a vector, so that u(x,t) is the dot product of T(t) and
% X(x)
% define T(t) a function with t only. Each row will be different n.
syms t;
T = simplify(A_n.*cos(number*pi*c*t/L) + B_n.*sin(number*pi*c*t/L));

% define X(x) a function with x only. Each row will be different n.
syms x;
X = simplify(sin(number*pi*x/L));

% define u(x,t)
u = sum(T.*X);
disp(append('Wave Equation simulation result from t=0 to t=',num2str(t_end),' have been generated.'));
toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic
% To create the animation
h = figure('visible', 'on');

% create a folder for the snapshot
if ~exist(append(folder_name,'/snapshot_of_gif'), 'dir')
    mkdir(append(folder_name,'/snapshot_of_gif'));
end

% default n for level of speed up (in case you need)
% speed_up_n = [20,50,200];

disp('Creating animation...');

% plotting process
clf
hold on
grid on
% pbaspect([1 1 1])   % Control Ratio of Axis Lengths and Data Unit Lengths
title(append('Wave equation simulation of ',function_name,' (n = ',num2str(n),')'),'Interpreter','none');
xlabel('x','Interpreter','none');
ylabel('u(x,t)      ','rotation',1,'Interpreter','none');
axis(axis_boundary)
gif_file_name = append(folder_name,'/',folder_name,'.gif');
u_subs_time = subs(u,t,0:inc_t:t_end);
index = 1;
for time = 0:inc_t:t_end  
    ws = fplot(u_subs_time(index),'color','r','linewidth',2);
    index = index +1;
    ws_ann_i = annotation('textbox',[0.75,0.75,0.1,0.1],'String',['t=',num2str(time)],'FontSize',18,'color','r');
    [imind,cm] = rgb2ind(frame2im(getframe(h)),256);
    if time == 0
        imwrite(imind,cm,gif_file_name,'gif','DelayTime',0.1, 'Loopcount',inf);
    else
        imwrite(imind,cm,gif_file_name,'gif','DelayTime',0.1, 'WriteMode','append');
    end
%     % save as .gif with speed up part
%     if time == 0
%         imwrite(imind,cm,gif_file_name,'gif','DelayTime',1, 'Loopcount',inf); 
%     
%     elseif time <= speed_up_n(1) 
%         imwrite(imind,cm,gif_file_name,'gif','DelayTime',1, 'WriteMode','append');
%     
%     elseif speed_up_n(1) < time && any(time == (speed_up_n(1)):2:(speed_up_n(2)))
%         imwrite(imind,cm,gif_file_name,'gif','DelayTime',0.2, 'WriteMode','append');
%     
%     elseif speed_up_n(2) < time && any(time == (speed_up_n(2)):5:(speed_up_n(3)))
%         imwrite(imind,cm,gif_file_name,'gif','DelayTime',0.1, 'WriteMode','append');
%     
%     elseif speed_up_n(3) < time && any(time == (speed_up_n(3)):20:(n))
%         imwrite(imind,cm,gif_file_name,'gif','DelayTime',0.1, 'WriteMode','append');
%     end
    
    % save as .png
    imwrite(imind,cm,append(folder_name,'/snapshot_of_gif/',folder_name,'_t=',num2str(time),'.png'),'png');
    
    % only delete the wave equation plot and the annotation
    delete(ws)
    delete(ws_ann_i)
end
close

disp('Animation done!')
toc















