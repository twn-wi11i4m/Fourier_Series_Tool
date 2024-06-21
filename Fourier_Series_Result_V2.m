% Fourier_Series_Result_V2
% author: Ng Tsz Wai (3035468043)
% date: 10/7/2021
% ----------------------------------------------------------------------
% Please run the "Fourier_Series_Coefficients.m" before you run.

tic
x_range = sort((interval_end-interval_start)*rand(1,num_plotting_data_point)+interval_start,'ascend');
% to evaluate the max of f
syms another_f(x);
another_f(x) = f;
f_x_range = another_f(x_range);

result_ind_terms = [];
if strcmp(series_type,'Sine')
    result_ind_terms(1,:) = B_n(1).*ones(1,num_plotting_data_point);
    parfor i = 2:(n+1)
        result_ind_terms(i,:) = B_n(i).*sin((i-1)*pi.*x_range/L);
    end

elseif strcmp(series_type,'Cosine')
    result_ind_terms(1,:) = A_n(1).*ones(1,num_plotting_data_point);
    parfor i = 2:(n+1)
        result_ind_terms(i,:) = A_n(i).*cos((i-1)*pi.*x_range/L);   
    end
    
elseif strcmp(series_type,'Sine_and_Cosine')
    result_ind_terms(1,:) = (A_n(1)+B_n(1)).*ones(1,num_plotting_data_point);
    parfor i = 2:(n+1)
        result_ind_terms(i,:) = A_n(i).*cos((i-1)*pi.*x_range/L) + B_n(i).*sin((i-1)*pi.*x_range/L);
    end
    
end

result_sum_terms = cumsum(result_ind_terms);
disp(append('Fourier Series result from ',num2str(0),' to ',num2str(n),' have been generated.'))
toc
