classdef FunctionTests < matlab.unittest.TestCase

    methods(Test)    
        
        function runCheckExercise5(testCase)
            roundedOut = checkExercise5(1.1022);
            correctOut = checkExercise5(fzero(@(t) cos(t)-t*exp(-sin(t)),1));
            incorrectOut = checkExercise5(0);
            verifyEqual(testCase,[roundedOut correctOut incorrectOut], [0.5 1 0])
        end

    end % methods

end % classdef