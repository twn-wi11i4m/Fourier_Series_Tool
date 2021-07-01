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
Click **Change Folder** and the MATLAB working directory will be redirected to ```Fourier_Series_tool``` folder. <br>

4. Check the working directory is it correct.
``` matlab
>> pwd

ans =

    '/Users/YourName/Document/Folder/MATLAB/Fourier_Series_tool'

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

## Example 1




## Authors
@twn-wi11i4m

## Version History
* Ver 1.0
  - Initial Release

## License
This project is licensed under the MIT License - see the LICENSE.md file for details

## Acknowledgments
Special thanks to Dr. Wong, who give the idea and comment on this project.
