# Fourier Series MATLAB Tool
This project is supervised by Dr. Tak Kwong WONG and use as teaching material. This project aims to build a useful MATLAB tool for studying the Fourier series of any function and some special phenomenon.

## What is Fourier Series...
The Fourier series is named in honor of Jean-Baptiste Joseph Fourier (1768–1830), and the series approximate an arbitrary function ![f_x](https://user-images.githubusercontent.com/67225779/126026535-e12a9b04-c7b2-4be3-96fb-941e28c20af1.png) in an interval ![interval_0_to_L](https://user-images.githubusercontent.com/67225779/126026696-06cef807-3695-4852-94b8-121b7c740419.png) or ![interval_neg_L_to_L](https://user-images.githubusercontent.com/67225779/126026705-5ffec3c9-b546-4406-baf6-346fe1a2cacb.png). <br>
[Wikipedia](https://en.wikipedia.org/wiki/Fourier_series)




## Different Types of Fourier Series
### Fourier Sine Series on ![interval_0_to_L](https://user-images.githubusercontent.com/67225779/126026696-06cef807-3695-4852-94b8-121b7c740419.png)
![Fourier_Sine_Series_formula](https://user-images.githubusercontent.com/67225779/126027424-88692555-8119-4001-a370-cb250ac07b32.png)
### Fourier Cosine Series on ![interval_0_to_L](https://user-images.githubusercontent.com/67225779/126026696-06cef807-3695-4852-94b8-121b7c740419.png)
![Fourier_Cosine_Series_formula](https://user-images.githubusercontent.com/67225779/126028356-7b2987b9-aff4-48e8-afae-f7c00b58e279.png)


### Fourier (Sine and Cosine) Series on ![interval_neg_L_to_L](https://user-images.githubusercontent.com/67225779/126026705-5ffec3c9-b546-4406-baf6-346fe1a2cacb.png)

![Fourier_Full_Series_formula_part_1](https://user-images.githubusercontent.com/67225779/126028997-1d96d08e-3b95-49af-9695-9c1620239f8b.png)
![Fourier_Full_Series_formula_part_2](https://user-images.githubusercontent.com/67225779/126028998-a346e0b7-91bb-424b-adec-1ae8d8760a56.png)

## Getting Started
### Dependencies
- MATLAB (R2021a or latest version)
- Symbolic Math Toolbox ([link](https://www.mathworks.com/help/symbolic/))

### Installing
1. Download
2. Place the folder under the MATLAB working directory. If you not sure where is the directory, you can type the following in the command window of MATLAB.
``` matlab
>> pwd

ans =

    '/Users/YourName/Document/Folder/MATLAB'

>>
```
3. Open ```initializer.m``` and run it
For first time you run, you will see a message <br>
![image](https://user-images.githubusercontent.com/67225779/124116060-1a412980-daa1-11eb-873a-689b16ba0ff5.png) <br>
Click **Change Folder** and the MATLAB working directory will be redirected to ```Fourier_Series_tool-main``` folder. <br>

4. Check the working directory is it correct.
``` matlab
>> pwd

ans =

    '/Users/YourName/Document/Folder/MATLAB/Fourier_Series_tool-main'

>>
```
For any question, please refert to MATLAB Help Center. [Link](https://www.mathworks.com/help/matlab/file-operations.html?s_tid=CRUX_lftnav)

## Executing program
1. edit the parameter in ```initializer.m``` and run it. Then it will create a folder.
> /Fourier_Series_YOUR_FUNCTION_(n=123)_[INTERVAL_START, INTERVAL_END]_SERIES_TYPE <br>
> <br>
> For example, <br>
> Fourier_Series_piecewise(x in Dom//Interval([1], [2]) | x in Dom//Interval([3], [4]) | x in Dom//Interval([5], [6]), 1, symtrue, 0)_(n=1000)_[0, 6.2832]_Sine
3. run ```Fourier_Series_Coefficients.m``` and then it will export a ```.csv``` file that contain all coefficients.
4. run ```Fourier_Series_Result.m```
5. run ```Fourier_Series_Plot_and_Animation.m``` and then it will return a animation ```.gif``` file and the snapshot in ```/snapshot_of_gif``` folder.

## Example 1 (Plot a gif of Fourier Series)

The show the Fourier sine series ![ex1_f_x](https://user-images.githubusercontent.com/67225779/126029135-b2003622-6605-4e87-928e-115e64af9613.png) on interval ![interval_0_to_2pi](https://user-images.githubusercontent.com/67225779/126029161-9a5191f0-d052-4ba1-ad07-5b496e5864da.png) from n = 1 to n = 50.

1. Open ```initializer.m``` and change the parameter as following, inculding ```f(x)```, ```interval_start```, ```interval_end```, ```n```, ```series_type```, and ```function_name```. 
```matlab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define f(x)
syms x
f = sin(2*x) + x^2;

% Interval and number of series
interval_start = 0;
interval_end = 2*pi;
n = 50;

% Series type choose from ['Sine','Cosine','Sine_and_Cosine']
series_type = 'Sine';

% Function name
function_name = 'function 1';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
```
> For the detail of creating symbolic functions on MATLAB, please refer to https://www.mathworks.com/help/symbolic/syms.html#buoeaym-1

2. Run ```initializer.m``` and there will be a folder ```Fourier_Series_function 1_(n=50)_[0, 6.2832]_Sine``` and a ```info.txt``` file. The variables will be stored in MATLAB.
```
>> initializer
Initialization finished.
```
3. Run ```Fourier_Series_Coefficients.m``` and it will take some time to compute each of the coefficients of Fourier series, i.e. ![A_n](https://user-images.githubusercontent.com/67225779/126029248-b453c5e8-9598-46d5-bee1-6392f735e495.png)  or ![B_n](https://user-images.githubusercontent.com/67225779/126029251-0c1bab87-3f70-4390-bedd-0bc86f42a2bb.png)
 

```
>> Fourier_Series_Coefficients
The Fourier Series Coefficients have been calculated.
Exported! csv file name: Fourier_Coefficients_function 1_(n=50)_[0, 6.2832]_Sine.csv
Exported! png file name: Fourier_Coefficients_function 1_(n=50)_[0, 6.2832]_Sine.png
Elapsed time is 4.637936 seconds.
```
It will export ```.csv```  and ```.png``` files of the coefficients.
4. Run ```Fourier_Series_Result.m```. It will based on the pervious coefficients.
``` 
>> Fourier_Series_Result
Fourier Series result from 0 to 50 have been generated.
```
In MATLAB, there is the random partition on the interval for plotting the graph, i.e., ![Random_Partition_from_0_1000](https://user-images.githubusercontent.com/67225779/126029705-01b2965a-2581-487f-bcda-c0304aeb6bd0.png). <br>
The variable ```result_ind_terms``` contain the value of different terms. <br>
<br>
The ```result_ind_terms``` matrix<br>
![result_ind_terms_matrix_part_1](https://user-images.githubusercontent.com/67225779/126030097-31f8f441-bb42-43e3-bde0-f01a527f67e4.png) ![result_ind_terms_matrix_part_2](https://user-images.githubusercontent.com/67225779/126030098-fb2332fe-9367-4c03-be5d-3d5569a32791.png) <br>
<br>
The ```result_sum_terms``` matrix<br>
![result_sum_terms_matrix](https://user-images.githubusercontent.com/67225779/126030392-1a5d7c69-84d5-4318-bd7a-a442159d8727.png)<br>
The row refer to the Fourier series value on each partition point ![Random_Partition_from_0_1000](https://user-images.githubusercontent.com/67225779/126030412-2bf442c4-b631-40da-aa19-7e4f7aeb40d6.png). <br>

5. Run ```Fourier_Series_Plot_and_Animation.m```. It plot all series and create the gif. This takes some time.
```
>> Fourier_Series_Plot_and_Animation
Animation done!
```
> To view the plotting process, you can change ```h = figure('visible', 'off')``` to be ```h = figure('visible', 'on')```.


6. After then, there will be ```Fourier_Series_function 1_(n=50)_[0, 6.2832]_Sine.gif``` in the folder and ```/snapshot_og_gif/``` folder contain all snapshot of gif.

## Example 2 (Import existing Fourier series coefficients from external sources)

Given you would import a Fourier Coefficients  ```.csv``` file for some function ![f_x](https://user-images.githubusercontent.com/67225779/126030572-58fa6f70-aed6-4f9a-862d-879ad33d77c4.png). For example, a coefficient of Fourier Sine series,
| n | B_n |
| --- | ----------- |
| 0 | 0 |
| 1 | 4 |
| 2 | 2 |
| 3 | 1.33333333333 |
| 4 | 1 |
| 5 | 0.8 |
| ... | ... |

1. First, you need to initialize the parameter in ```initializer.m``` and then run it. There will be a folder created.
2. To import the ```.csv``` file, you need to place the file under the folder.
3. Edit the parameter in ```Import_the_Fourier_Coefficients_csv.m```
```matlab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Make sure the file name and the folder path is correct
folder_name_import = 'Fourier_Series_Triangle_and_Semicircle_(n=400)_[0, 6.2832]_Sine';
file_name_import = 'Fourier_Coefficients_Triangle_and_Semicircle_(n=400)_[0, 6.2832]_Sine.csv';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
```
4. Run it
```matlab
>> Import_the_Fourier_Coefficients_csv
Imported!
Exported! png file name: Fourier_Coefficients_Triangle_and_Semicircle_(n=400)_[0, 6.2832]_Sine.png
>> 
```
5. Run ```Fourier_Series_Result.m``` and ```Fourier_Series_Plot_and_Animation.m``` as usual.

## Example 3 (Plot different n terms in one plot)
1. Run ```initializer.m```,```Fourier_Series_Coefficients.m```,```Fourier_Series_Result.m```,and ```Fourier_Series_Plot_and_Animation.m``` as usual.
2. open ```Different_Fourier_Series_plot``` and edit the following parameter
```matlab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% list of n to plot
list_of_n_to_plot = [1,2,4,10,50,200];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
```
> Change axis_boundary in case you need.
3. Run it and then different ```.png``` plot will be in the folder.

## Example 4 (Zoom in to show Gibbs Phenomenon)
``` Gibbs_Phenomenon_zoom_in_Animation.m``` is a independent programme to show Gibbs phenomenon ([Wikipedia](https://en.wikipedia.org/wiki/Gibbs_phenomenon)) in ![unit_step_function_in_Gibbs_Phenomenon](https://user-images.githubusercontent.com/67225779/126031881-3dc12325-0e59-485f-a5ca-ae5c517169f6.png) . It will show the near 9 percent of the jump at the a jump discontinuity.

Example:<br>
<p align="center">
    <img src="https://user-images.githubusercontent.com/67225779/126031916-3561bfa4-ec34-4f52-b812-fe18785a1b01.gif" alt="Gibbs_Phenomenon_zoom_in_Animation" >
</p>

## Example 5 (Animaation of wave equation solution)
The homogeneous Dirichlet conditions for the wave equation with some initial conditions:<br>
<p align="center">
    <img src="https://user-images.githubusercontent.com/67225779/126032908-091d38da-057c-48ae-8ded-d4407e559968.png" alt="Homogeneous_Dirichlet_conditions_wave_equation_inital_condition" >
</p>

By method of separation of variables, the solutio will be
<p align="center">
    <img src="https://user-images.githubusercontent.com/67225779/126033114-b8618739-48c0-48ba-8ddb-52f7f45eda55.png" alt="Solution_Homogeneous_Dirichlet_conditions_wave_equation_inital_condition" >
</p>

where the coefficients ![A_n](https://user-images.githubusercontent.com/67225779/126033209-1802eae5-37c5-4dc8-998c-11ad4967bd0f.png) is the Fourier coefficients of Fourier sine series of ![phi_x](https://user-images.githubusercontent.com/67225779/126033358-1b3aae86-8eef-4a0a-a360-144a04b9d87c.png) , that is ![phi_x_fourier_series](https://user-images.githubusercontent.com/67225779/126033435-0c810e8e-d9eb-4f3e-8551-39cb914be686.png), and the coefficients ![B_n](https://user-images.githubusercontent.com/67225779/126033216-32361de6-0861-443a-8fcb-6c3dca8572fb.png) is ![psi_x_fourier_series](https://user-images.githubusercontent.com/67225779/126033574-243f956f-df75-44d3-8189-3ea39aa00afc.png) .

1. open ```Homogeneous_Dirichlet_Conditions_for_Wave_Equation_with_IC``` and edit the following parameter
```matlab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define the parameter
syms x;
c = 10;
L = 2*pi;
phi = 0.5*x^2;
psi = x;
n = 500;
t_end = 10;

function_name = 'testing_result_v7';

% axis tight manual
axis_boundary = [0,L,-10,30];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%








> Reference: W.A. Strauss: Partial Differential Equations: An Introduction, Hoboken, N.J. : Wiley c2008 2nd ed. Chapter 4







## Authors
@twn-wi11i4m

## Version History
* Ver 1.0
  - Initial Release
* Ver 2.0
  - Improve the algorithm to compute the Fourier coefficients.

## License
This project is licensed under the MIT License - see the LICENSE.md file for details

## Acknowledgments
Special thanks to Dr. Wong, who give the idea and comment on this project.
