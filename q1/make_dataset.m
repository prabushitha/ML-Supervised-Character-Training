load "Group03 UCSC.mat"
pkg load image

size_max = 30; #max number of elements in each character set
size_train = 21; #size of training set for each character set
size_test = 6; #size of testing set for each character set
size_validation = 3; #size of validating set for each character set


resize_nm = 14*14;
# Now WE HAVE 14*14=196 inputs


for n=1:size_max
  #clean image
  ch11(n).im = cleanimg_func(ch1(n).im); 
  ch21(n).im = cleanimg_func(ch2(n).im); 
  ch31(n).im = cleanimg_func(ch3(n).im); 
  
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

#padding is not neccessary for this because we could resize all 3 characters to same column height

#convert Vector values to double
P = double(P);
Test = double(Test);
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

#Show the cleaned dataset images
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