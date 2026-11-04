%[text] # checkBuildWord
%[text] The function `checkBuildWord` generates strings of various random lengths and checks that the `buildWord` function creates strings consisting of the correct number of letters. 
function checkBuildWord(buildWord)
    try
        lengths = randi(10,3);
        str1 = buildWord(lengths(1));
        str2 = buildWord(lengths(2));
        str3 = buildWord(lengths(3));
        fmtStr = "Running buildWord(%d), and buildWord(%d), and buildWord(%d).\n" + ...
            "The results are %s, %s, and %s.";
        disp(compose(fmtStr,lengths(1),lengths(2),lengths(3),str1,str2,str3))
        if length(char(str1)) == lengths(1) && length(char(str2)) == lengths(2) && length(char(str3)) == lengths(3)
            disp("The lengths are correct.")
        else
            disp("The lengths are incorrect. Please check your code.")
        end
        if all(isletter(str1)) && all(isletter(str2)) && all(isletter(str3))
            disp("The strings are composed of letters. Good work.")
            disp("How might you improve your function further?")
        else
            disp("There are non-letter characters in your words.")
            disp("Can you fix that?")
        end
    catch
        disp("Have you written buildWord yet? Is it on the path?")
    end
end


%[appendix]{"version":"1.0"}
%---
