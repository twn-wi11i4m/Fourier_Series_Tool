% Fourier_Series_Plot_and_Animation_V2
% author: Ng Tsz Wai (3035468043)
% date: 25/6/2021
% ----------------------------------------------------------------------
% Please run the "Fourier_Series_Coefficients.m" or import the coefficients
% csv before you run.

h = figure('visible', 'off');

% axis tight manual % this ensures that getframe() returns a consistent size
% the size is automuticlly adjusted by max(f) and min(f)
upper_bdd = double(max(f_x_range) + 0.7*(max(f_x_range)-min(f_x_range)));
lower_bdd = double(min(f_x_range) - 0.7*(max(f_x_range)-min(f_x_range)));
% axis_boundary = [interval_start,interval_end,lower_bdd,upper_bdd];
% axis_boundary = [interval_start,interval_end,(-7*pi/40),(17*pi/40)];
axis_boundary = [interval_start,6,lower_bdd,upper_bdd];

% create a folder for the snapshot
if ~exist(append(folder_name,'/snapshot_of_gif'), 'dir')
    mkdir(append(folder_name,'/snapshot_of_gif'));
end

% default n for level of speed up
speed_up_n = [20,50,200];

disp('Creating animation...');

% plotting process
clf
hold on
grid on
% pbaspect([1 1 1])   % Control Ratio of Axis Lengths and Data Unit Lengths
% original_function = plot(x_range,f_x_range,'color','k','linewidth',2);
original_function = fplot(f,'color','k','linewidth',2);
title(append('Fourier Series of ',function_name,' (type: ',series_type,')'),'Interpreter','none');
xlabel('x','Interpreter','none');
ylabel('f(x)      ','rotation',1,'Interpreter','none');
axis(axis_boundary)
gif_file_name = append(folder_name,'/',folder_name,'.gif');
for i = 1:(n+1)
    fs_i = plot(x_range,result_sum_terms(i,:),'color','r','linewidth',2);
    fs_ann_i = annotation('textbox',[0.75,0.75,0.1,0.1],'String',['n=',num2str(i-1)],'FontSize',18,'color','r');
    drawnow 
    [imind,cm] = rgb2ind(frame2im(getframe(h)),256);
    % save as .gif
    if i == 1 
        imwrite(imind,cm,gif_file_name,'gif','DelayTime',1, 'Loopcount',inf); 
    
    elseif i <= speed_up_n(1) + 1
        imwrite(imind,cm,gif_file_name,'gif','DelayTime',1, 'WriteMode','append');
    
    elseif speed_up_n(1) + 1 < i && any(i == (speed_up_n(1)+1):2:(speed_up_n(2)+1))
        imwrite(imind,cm,gif_file_name,'gif','DelayTime',0.2, 'WriteMode','append');
    
    elseif speed_up_n(2) + 1 < i && any(i == (speed_up_n(2)+1):5:(speed_up_n(3)+1))
        imwrite(imind,cm,gif_file_name,'gif','DelayTime',0.1, 'WriteMode','append');
    
    elseif speed_up_n(3) + 1 < i && any(i == (speed_up_n(3)+1):20:(n+1))
        imwrite(imind,cm,gif_file_name,'gif','DelayTime',0.1, 'WriteMode','append');
    end
    
    % save as .png
    imwrite(imind,cm,append(folder_name,'/snapshot_of_gif/',folder_name,'_',num2str(i-1),'.png'),'png');
    
    % only delete the fourier series plot and the annotation
    delete(fs_i)
    delete(fs_ann_i)
end
close

disp('Animation done!')
