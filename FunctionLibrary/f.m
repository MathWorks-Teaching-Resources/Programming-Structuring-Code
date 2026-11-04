function f(x)
A = imread(x);
[m,n] = size(A);
v = min(m,n);
B = A(1:v,1:v,:);
B1 = zeros(size(B));
B2 = zeros(size(B));
B3 = zeros(size(B));
B1(:,:,1) = B(:,:,1);
B2(:,:,2) = B(:,:,2);
B3(:,:,3) = B(:,:,3);
image([B1,B2;B3,B])
end


%[appendix]{"version":"1.0"}
%---
