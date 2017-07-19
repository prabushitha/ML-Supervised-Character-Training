load "Group03 UCSC.mat"
pkg load image

size_max = 30; #max number of elements in each character set
size_train = 21; #size of training set for each character set
size_test = 6; #size of testing set for each character set
size_validation = 3; #size of validating set for each character set

resize_nm = 14*14;
for n=1:size_max
  #clean image
  ch11(n).im = cleanimg(ch1(n).im); 
  ch21(n).im = cleanimg(ch2(n).im); 
  ch31(n).im = cleanimg(ch3(n).im); 
  
  if (n <= size_train)
    #TRAINING SET
    #add image to training set
    #column in P represents an image
    P(:,n) = ch11(n).im(:); 
    P(:,n+size_train) = ch21(n).im(:); 
    P(:,n+size_train*2) = ch31(n).im(:); 
  elseif (n <= size_train+size_test)
    #TESTING SET
    Test(:,n-size_train) = ch11(n).im(:); 
    Test(:,n-size_train+size_test) = ch21(n).im(:); 
    Test(:,n-size_train+size_test*2) = ch31(n).im(:); 
  else
    #Validating SET
    VV.P(:,n-size_train-size_test) = ch11(n).im(:); 
    VV.P(:,n-size_train-size_test+size_validation) = ch21(n).im(:); 
    VV.P(:,n-size_train-size_test+size_validation*2) = ch31(n).im(:); 
  endif;
end;

#pad training and testing set

# WE HAVE 64 inputs
P(resize_nm+1,1:size_train*3)=0;
P = double(P);

Test(resize_nm+1,1:size_test*3)=0;
Test = double(Test);

VV.P(resize_nm+1,1:size_validation*3)=0;
VV.P = double(VV.P);


#setting target for training and validation
# 3 output nodes are required
# 1 0 0
# 0 1 0
# 0 0 1
# for training set
T = zeros(3,size_train*3);
T(1,1:size_train) = 1;
T(2,size_train+1:size_train*2) = 1;
T(3,size_train*2+1:size_train*3) = 1;

# for validating set
VV.T = zeros(3,size_validation*3);
VV.T(1,1:size_validation) = 1;
VV.T(2,size_validation+1:size_validation*2) = 1;
VV.T(3,size_validation*2+1:size_validation*3) = 1;

disp("Dataset completed");

figure(1);
for n=1:size_max
    #show image
  subplot(6,5,n);
  imshow(ch11(n).im);
 end;
 figure(2);
 for n=1:size_max
    #show image
  subplot(6,5,n);
  imshow(ch21(n).im);
 end;
 figure(3);
 for n=1:size_max
    #show image
  subplot(6,5,n);
  imshow(ch31(n).im);
 end;