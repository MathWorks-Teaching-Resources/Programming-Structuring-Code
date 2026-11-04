%[text] %[text:anchor:T_70B7534C] # Comments and Documentation
%[text] [⇦ Main Menu](file:MainMenu.m)
%[text] You should expect that people, including yourself, will read your code more often than you write it. Documentation explains to users how they can interact with a function or script. Comments explain to a programmer why the author of a piece of code wrote it in a particular way. Comments might include details about the design choices, or they might make explicit assumptions about arguments or relationships between system components. Using standard formatting for your code is enforced by some language's syntax, but nearly all common programming languages articulate best practices for formatting their code. 
%[text:tableOfContents]{"heading":"**Table of Contents**"}
%[text] %[text:anchor:H_54E3700B] ## Writing Documentation
%[text] When you create a function, it is good practice to document its behavior. The documentation is where you explain what your code is doing and how to use it. In MATLAB, this is done with a block of comments directly following the function declaration that summarize what the function does and describe what the input and output arguments are supposed to be. 
%[text] ```matlabCodeExample
%[text] function im = sierpinski(n,col)
%[text] % SIERPINSKI recursively plots a Sierpinski triangle using n iterations
%[text] % SIERPINSKI takes two arguments 
%[text] % n is the number of iterations to calculate and plot
%[text] % col is a color or a vector of 3 colors used to identify parts of the triangle
%[text] % SIERPINSKI returns one value
%[text] % im is a handle to the plot of the triangle 
%[text] 
%[text] [details of the code]
%[text] 
%[text] end
%[text] ```
%[text] In an elaborate function, the documentation can be significantly longer than the details of the code. Consider the `readtable` function in MATLAB:
% Open the MATLAB documentation
doc readtable
% Open the MATLAB implementation
edit("readtable.m")
%[text] As you can see, the same type of information is present in the formal documentation and in the comments: how can you call this function, what will it do, what arguments can you pass, and what will the function return?
%[text] ![](text:image:3ba5) **Try**. 
%[text] 1. Pick a function you have written, such as `BuildWord,` and run \
%[text] ```matlabCodeExample
%[text] help BuildWord
%[text] ```
%[text]             to see the help text MATLAB identifies from the comments you include in your function. 
help BuildWord
%[text] Did you write helpful documentation? Don't forget to follow the documentation link and read the help text that appears in the script window. If you have not written proper documentation yet, please improve it and run `help` again. 
%[text] The main question to ask yourself is: "Reading only the help text, can I use this function properly?"
%%
%[text] %[text:anchor:H_0286AEBE] ## Commenting Code While Coding
%[text] You can use comments while writing code to record your plans for how a particular section of code you have not written will interact with other code you have already written. 
%[text] ```matlabCodeExample
%[text] % Set up the matrix A as a sparse tridiagonal matrix
%[text] A = gallery("tridiag",minus1Diag,mainDiag,plus1Diag);
%[text] 
%[text] % Use matrix operations to solve Ad = r
%[text] d = A\r;
%[text] 
%[text] % % Set up the coefficients for P(x) in each interval where
%[text] % % xData(k) <= x < xData(k+1) and P_k(x) = a3*s^3+a2*s^2+a1*s+a0
%[text] ```
%[text] %[text:anchor:H_166F843B] ## Comments in Completed Code
%[text] Perhaps you have decided that the documentation you have written for your function is incomplete, and you have to open the function itself to review how the code is put together. The comments you write throughout your code should guide any reader on how and why the code is structured the way it is. You do not want to add comments that simply restate in prose what a line of code is doing, but if there is something to clarify or explain about the code, it should appear in a comment.
%[text] %[text:anchor:H_1648B17F] ### Unhelpful comments in completed code
%[text] While these comments might be a helpful guide before you have written the code, once the code is there, the comments do not add anything to a reader's ability to understand why the code was written.  
% Define y
y = 1:10;

% Plot y
plot(y)
%[text] %[text:anchor:H_93B76935] ### Helpful comments in completed code
%[text] Perhaps you want to explain coding choices that you made for efficiency:
%[text] ```matlabCodeExample
%[text] % Initialize a vector of point values of the appropriate size
%[text] % For a large number of iterations, this is much more efficient than
%[text] % adding a new point to the end at each step which requires reallocating
%[text] % memory for a different size array each time
%[text] startingVals = startingPoint.*ones([numPts 1]);
%[text] ```
%[text] Or perhaps choices you made for aesthetic reasons: 
%[text] ```matlabCodeExample
%[text] % Set the axis to be square so that the figure will print elegantly and set
%[text] % the coordinate axes to be off, so they don't distract from the picture
%[text] axis square off
%[text] ```
%[text] In some cases, perhaps you are just warning future readers that there are complicated relationships captured in a section of code and that they should be very careful if they start changing things in this section. 
%[text] ```matlabCodeExample
%[text] % Careful index manipulation to build trapezoid approximation plot
%[text] tvals = reshape(xAll,1,[]).*ones(3,1);
%[text] tAllVals = reshape(tvals,1,[]);
%[text] pvals = reshape(yAll,1,[]).*[0;0;1];
%[text] pParVals = reshape(pvals,1,[]);
%[text] pAllVals = pParVals(2:end-1) + [pParVals(4:end) 0];
%[text] tAllVals = tAllVals(2:end-1);
%[text] plot(ax,tAllVals,pAllVals,"r-")
%[text] ```
%[text] In many cases, careful selection of variable names can capture all the necessary information, so additional code comments are unnecessary. 
%[text] ```matlabCodeExample
%[text] numCats = 12;
%[text] reproductionRate = 1.3;
%[text] 
%[text] numKittens = (numCats/2)*reproductionRate
%[text] ```
%%
%[text] ![](text:image:8230) **Exercise 1**.
%[text] Pick a function you have written, such as `BuildWord,` and run
%[text] ```matlabCodeExample
%[text] edit BuildWord
%[text] ```
edit("BuildWord2.m")
%[text]             Are there appropriate comments and documentation in this function? If not, write some.
%%
%[text] ![](text:image:981b) **Exercise 2**.
%[text] Improve this code by choosing more helpful function and variable names, as well as adding documentation and comments.
f("turkeys1.jpg")

% Original code
edit("f.m")

% Improved code
edit("SplitChannels.m")
%%
%[text] %[text:anchor:H_187208AF] ## Formatting Code
%[text] %[text:anchor:H_F2D1DC8E] ### One instruction per line
%[text] As an [interpreted language](file:./DebuggingSoln.m:H_17AF3022), MATLAB is the easiest to read when there is one instruction on each line, even if this does not impact the computer's ability to run the code. 
%[text] ![](text:image:7803) **Try**.  
%[text] 1. Run the code below. Does it work? 
%[text] 2. Restructure the following code so that it contains one instruction on each line. Is it easier to read? Does it give the same output? Are there any characters that are no longer necessary? Why or why not? \
% Original code
countdown = zeros(1,10); for k=0:9; countdown(end-k)=k+1; end; countdown

% %% Solution: Improved code
countdown = zeros(1,10);
for k=0:9
    countdown(end-k)=k+1;
end
countdown
% %% End Solution
%%
%[text] %[text:anchor:H_954F9FFD] ### Clarifying logical groupings: white space and parentheses
%[text] There are two main ways white space can improve the readability of your code. First, skipping a single line between blocks of code will visually group your component pieces so a reader can quickly skim through the logical flow from comment to comment. Skipping too many lines adds length to your program for no reason, so skipping more than a single line is unnecessary. Also, whitespace or optional parentheses within a line can clarify logical groupings in mathematics or Boolean arithmetic.
testValue1 = 3 + 51/3;
testValue2 = (12 + 5)*4;

if (testValue1 > 19) && (mod(testValue2,17) == 0)
    disp("The logical combination is true.")
else
    disp("The logical combination is false.")
end
%%
%[text] %[text:anchor:H_B412BC08] ### Indentation 
%[text] Indentation, most commonly by four spaces, is also used to show control flow within a program. Careful use of indentation can also help with matching the start and end of control flow blocks. There is an option on the toolstrip in the **Code** section of the **Live Editor** tab called ![](text:image:4071)**Smart Indent** that will apply standard MATLAB indentation to your code. 
%[text] ![](text:image:8d7b) **Try**.  Use ![](text:image:5a50)**Smart Indent** to fix the indentation in the code below:
    for k = 1:7 %[text:anchor:H_EFD7929C]
 if mod(k,2)
disp(k + " is odd.")
  else
       disp(k + " is even.")
    end
 end

% %% Solution
for k = 1:7
    if mod(k,2)
        disp(k + " is odd.")
    else
        disp(k + " is even.")
    end
end
% %% End Solution
%%
%[text] %[text:anchor:H_41897F33] ## Further Exploration
%[text] You can read the documentation on [adding help for your program](https://www.mathworks.com/help/matlab/matlab_prog/add-help-for-your-program.html) or [adding comments to code](https://www.mathworks.com/help/matlab/matlab_prog/comments.html). 
%%
%[text] [⇦ Main Menu](file:MainMenu.m)
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":40}
%---
%[text:image:3ba5]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:8230]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:981b]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:7803]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:4071]
%   data: {"align":"baseline","height":16,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8\/9hAAACTklEQVR42p2RS2sTURiG81cEEaQg9uKlUitKN+LKlSsRsagUdOdK3ehCtEhsSqLoolShxWoDVrQWUbFapVrbGtMmaZs095lMJpPLZJJMJsnrd07SA9k28A4DZ57n\/c4XGwDb0PQAdhPG2thjcOIU2n8NNBp11BsWavUqpQKrXka1ZsCs6TCtPFpMU3B+7GQbziDTKqJkZlAoJ6AZQSgFL6TcEmLady5oMU3BuScnRLPL5YTT5cCo046R0WHYHffw8NEdDNtvI5n7jaj2DRUStJim4OxIPxuamk1YtTI16ChVNegVGblSGGoxgFThLxLZRUQyX7mAMUJw5kEf3blGYAGn7\/e1RTO2kNbXIOWXEc\/+QFj9zOWMEYKBu8d4u2GmYVQU6GUJ+VIMWbq7qvuQyq8ikVuk8eexrX5EsSKBMULQf6uXNlzkUL4URc7YxvGbvSLs7jFtgbcHlVl+LcYIwdEbR1CmsTLFTcoGtfr51mVq3oEjmS8IpeewmZqhb\/xgjBB0XT\/Mx1IKHlqWh4Od1w61hcPKW\/jlaTpfAWOE4MBQD40VorZffNPx7E\/eGqWNh9VPCKY\/CHg9OUnnC2CMEHRc7aFNewmY538TG7fjSjfPlvIeG6k3Av6XGEdInQNjhGD\/5W6+ZTZmiNqC6VkC3xE4g4Dshk+awlpygsOrsWckc4MxQrDvUhcflTWx9500wUl4Ey\/giY9hJfYUfyJOeEjEzoVg78VOBFLuZsjul1\/DJ7\/CuvSy1fycC1j7cvQxlsIOMEYI9lw4iN2Esf8BFAoP\/WPZUQkAAAAASUVORK5CYII=","width":16}
%---
%[text:image:8d7b]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:5a50]
%   data: {"align":"baseline","height":16,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8\/9hAAACTklEQVR42p2RS2sTURiG81cEEaQg9uKlUitKN+LKlSsRsagUdOdK3ehCtEhsSqLoolShxWoDVrQWUbFapVrbGtMmaZs095lMJpPLZJJMJsnrd07SA9k28A4DZ57n\/c4XGwDb0PQAdhPG2thjcOIU2n8NNBp11BsWavUqpQKrXka1ZsCs6TCtPFpMU3B+7GQbziDTKqJkZlAoJ6AZQSgFL6TcEmLady5oMU3BuScnRLPL5YTT5cCo046R0WHYHffw8NEdDNtvI5n7jaj2DRUStJim4OxIPxuamk1YtTI16ChVNegVGblSGGoxgFThLxLZRUQyX7mAMUJw5kEf3blGYAGn7\/e1RTO2kNbXIOWXEc\/+QFj9zOWMEYKBu8d4u2GmYVQU6GUJ+VIMWbq7qvuQyq8ikVuk8eexrX5EsSKBMULQf6uXNlzkUL4URc7YxvGbvSLs7jFtgbcHlVl+LcYIwdEbR1CmsTLFTcoGtfr51mVq3oEjmS8IpeewmZqhb\/xgjBB0XT\/Mx1IKHlqWh4Od1w61hcPKW\/jlaTpfAWOE4MBQD40VorZffNPx7E\/eGqWNh9VPCKY\/CHg9OUnnC2CMEHRc7aFNewmY538TG7fjSjfPlvIeG6k3Av6XGEdInQNjhGD\/5W6+ZTZmiNqC6VkC3xE4g4Dshk+awlpygsOrsWckc4MxQrDvUhcflTWx9500wUl4Ey\/giY9hJfYUfyJOeEjEzoVg78VOBFLuZsjul1\/DJ7\/CuvSy1fycC1j7cvQxlsIOMEYI9lw4iN2Esf8BFAoP\/WPZUQkAAAAASUVORK5CYII=","width":16}
%---
