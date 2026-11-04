function runConwayGame(width, height, padding, newBoard, maxIter)
% RUNCONWAYGAME implements Conway's Game of Life
% RUNCONWAYGAME takes the width and height, as positive doubles, 
%     of the board which is in play
% padding is a non-negative double that gives the width of a ring 
%     of invisible cells that are still tracked
%     by the updating algorithm around the visible board;
%     outside of the (width + 2*padding)x(height + 2*padding)
%     rectangle, all cells are 'dead'
% newBoard is a width-by-height matrix that sets up the initial 
%     configuration of living and dead cells
% maxIter is the maximum number of iterations
%
% The updating rules will be applied until either the maximum number of
%     iterations is reached or the system stabilizes into a static
%     configuration. 

% Set up the initial game board with the data that was passed in,
% including requested padding to be computed but not shown
startboard = ones(width+2*padding,height+2*padding)*.9;
startboard(padding+1:end-padding,padding+1:end-padding) = newBoard;
im2 = imshow(newBoard,"InitialMagnification","fit");

% Update the game board as long as the board is changing and the maximum
% number of iterations set by the user has not been reached
k = -3;
while sum(round(im2.CData),"All") < width*height && k < maxIter
    k = k+1;
    if k < 1
        % Force refreshes so that the initial position will be picked
        % up by the animation code in Live Editor
        im2.CData = newBoard;
        title("Starting configuration")
        pause(0.1)
    else
        nextBoard = runUpdate(startboard);

        % Update the visualization of the board and pause to allow the user
        % to observe the changes before the next update
        im2.CData = nextBoard(padding+1:end-padding,padding+1:end-padding);
        if k == 1
            title("After 1 iteration")
        else
            title("After " + k + " iterations")
        end
        pause(0.2)

        % Determine if interations should continue
        if startboard == nextBoard
            % If the entire board, including the unprinted regions, are in
            % a steady state, inform the user and terminate the loop
            numSteps = k-1;
            title("Steady state achieved after " + numSteps + " steps.")
            k = maxIter+1;
        elseif all(round(nextBoard) == 1,"all")
            title("All cells died after " + k + " steps.")
        else
            startboard = nextBoard;
        end
    end
end

% If the loop terminated by reaching the maximum number of iterations,
% inform the user so they can increase the number of iterations allowed if
% they want to see more
if k == maxIter
    title("Time's up: maximum number of iterations reached")
end

end
%%
function live = checkNeighbors(reg)
% Calculate the number of living neighbors
% and apply the rules to determine color of
% the cell in the next iteration
reg = 1-round(reg);
liveNeighbors = sum(reg,"all")-reg(2,2);
if liveNeighbors < 2
    live = 0;
elseif liveNeighbors == 2
    live = reg(2,2);
elseif liveNeighbors == 3
    live = 1;
else
    live = 0;
end
end

function newBoard = runUpdate(board)
% Apply the rules from Conway's game of life with 'dead' areas
% surrounding the active area chosen by the user and return an updated
% board with the next iteration of 'living' and 'dead' cells

newBoard = board;
% The living/dead values may not be 1/0 so that the board shows 
% up as distinct from its and the code should handle these
% values appropriately
liveVal = min(board,[],"all");
if round(liveVal) > 0
    deadVal = 1-liveVal;
else
    deadVal = max(board,[],"all");
end
[width,height] = size(board);
% Add 'dead' cells around the area of computation
paddedBoard = ones(width+2,height+2);
paddedBoard(2:end-1,2:end-1) = board;
for x = 1:width
    for y = 1:height
        live = checkNeighbors(paddedBoard(x:x+2,y:y+2));
        if live
            newBoard(x,y) = liveVal;
        else
            newBoard(x,y) = deadVal;
        end
    end
end

end





%[appendix]{"version":"1.0"}
%---
