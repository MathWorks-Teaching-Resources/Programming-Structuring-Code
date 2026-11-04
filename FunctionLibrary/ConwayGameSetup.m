%[text] # Conway's Game of Life
%[text] Define a board for [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) with dimensions `width` and `height`.
function newBoard = ConwayGameSetup(width,height)
% Set up a board for Conway's Game of Life 
% The board will be (width) x (height) and shade the 
% board area so it shows up against the background

board = ones(width,height)*.9;

% Initialize newBoard
newBoard = board;
%[text] Click on the grey region to designate 'living' cells. When you are satisfied with your starting position, run the game using the `RunConwayGame` function.
% Load the blank board as an image with scaled pixels to fit the size of
% the figure window.
im = imshow(board,"InitialMagnification","fit");
title("Select 'live' squares by left-clicking on the board.")
im.ButtonDownFcn = @Pickpoint;
end 

%%
function [x,y] = Pickpoint(obj,ev)
% PICKPOINT Callback to interactively pick a point to flip
%
% PICKPOINT is not meant be called directly. 
%
% im.ButtonDownFcn = @pickpoint

x = ev.IntersectionPoint(1);
y = ev.IntersectionPoint(2);

% [width,height] = size(obj.CData);
m = ceil(y);
n = ceil(x);

obj.CData(m,n) = 1-obj.CData(m,n);

% Assign the updated board into base workspace 
% so it is accessible from elsewhere in the script
assignin("caller","newBoard",obj.CData)
end 




%[appendix]{"version":"1.0"}
%---
