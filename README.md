# Fourier Series MATLAB Tool
This project is supervised by Dr. Tak Kwong WONG and use as teaching material. This project aims to build a useful MATLAB tool for studying the Fourier series of any function and some special phenomenon.

## What is Fourier Series...
The Fourier series is named in honor of Jean-Baptiste Joseph Fourier (1768–1830), and the series approximate an arbitrary function ![equation](http://www.sciweavers.org/upload/Tex2Img_1625132683/eqn.png) in an interval ![equation](http://www.sciweavers.org/upload/Tex2Img_1625132830/eqn.png) or ![equation](http://www.sciweavers.org/upload/Tex2Img_1625132916/eqn.png). <br>
[Wikipedia](https://en.wikipedia.org/wiki/Fourier_series)

## Different Types of Fourier Series
### Fourier Sine Series on ![equation](http://www.sciweavers.org/upload/Tex2Img_1625132830/eqn.png)
![SineSeries](http://www.sciweavers.org/upload/Tex2Img_1625135508/eqn.png)
### Fourier Cosine Series on ![equation](http://www.sciweavers.org/upload/Tex2Img_1625132830/eqn.png)
![CosineSeries](http://www.sciweavers.org/upload/Tex2Img_1625135678/eqn.png)
### Fourier (Sine and Cosine) Series on ![equation](http://www.sciweavers.org/upload/Tex2Img_1625132916/eqn.png)
![SineCosineSeries](http://www.sciweavers.org/upload/Tex2Img_1625136045/eqn.png)


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

## Example 1 (Plot a gif)

The show the Fourier sine series ![ex1](http://www.sciweavers.org/upload/Tex2Img_1625145951/eqn.png) on interval ![ex1interval](http://www.sciweavers.org/upload/Tex2Img_1625141408/eqn.png) from n = 1 to n = 50.

1. Open ```initializer.m``` and change the parameter as following, inculding ```f(x)```, ```interval_start```, ```interval_end```, ```n```, ```series_type```, and ```function_name```. 
```matlab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define f(x)
syms f(x)
f(x) = sin(2*x) + x^2;

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
3. Run ```Fourier_Series_Coefficients.m``` and it will take some time to compute each of the coefficients of Fourier series, i.e. ![A_n](http://www.sciweavers.org/upload/Tex2Img_1625143324/eqn.png) or ![B_n](http://www.sciweavers.org/upload/Tex2Img_1625143359/eqn.png)
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
In MATLAB, there is the partition on the interval for plotting the graph, i.e., ![partition](http://www.sciweavers.org/upload/Tex2Img_1625146561/eqn.png). <br>
The variable ```result_ind_terms``` contain the value of different terms. <br>
<br>
The ```result_ind_terms``` matrix<br>
![RIT](http://www.sciweavers.org/upload/Tex2Img_1625147956/eqn.png) ![RIT2](http://www.sciweavers.org/upload/Tex2Img_1625147997/eqn.png) <br>
<br>
The ```result_sum_terms``` matrix<br>
![RST](http://www.sciweavers.org/upload/Tex2Img_1625148429/eqn.png) <br>
The row refer to the Fourier series value on each partition point ![pt](http://www.sciweavers.org/upload/Tex2Img_1625148586/eqn.png). <br>

5. Run ```Fourier_Series_Plot_and_Animation.m```. It plot all series and create the gif. This takes some time.
```
>> Fourier_Series_Plot_and_Animation
Animation done!
```
6. After then, there will be ```Fourier_Series_function 1_(n=50)_[0, 6.2832]_Sine.gif``` in the folder and ```/snapshot_og_gif/``` folder contain all snapshot of gif.

## Example 2 (Import existing Fourier series coefficients)
1.


## Authors
@twn-wi11i4m

## Version History
* Ver 1.0
  - Initial Release

## License
This project is licensed under the MIT License - see the LICENSE.md file for details

## Acknowledgments
Special thanks to Dr. Wong, who give the idea and comment on this project.
