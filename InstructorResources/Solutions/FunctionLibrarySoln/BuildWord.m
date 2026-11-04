function word = BuildWord(len)
% BuildWord creates a random string of letters
%
% len is a positive integer defining the number of 
%     random letters to string together
% word is the output, consisting of a string of len letters
arguments
    len (1,1) {mustBePositive,mustBeInteger}
end
alphabet = ["a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" ...
    "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"];
word = "";
for i = 1:len
    idx = randi(26,1);
    word = word + alphabet(idx);
end
end


%[appendix]{"version":"1.0"}
%---
