pkg load image;
pkg load nnet;
load 'Group03 UCSC.mat';
load group03q1.mat


size_train = 21;
size_test = 6;

figure(1);
for n=1:size_test*3
  #Testing letter as a 196x1 column vector
  img_test = Test(:,n);
  
  #bias input (x0)
  img_test(197,1)=1;
  
  result = round(sim(net,img_test)); # Simulate network
  
  #Show results
  result_text = "No Match";
  if (result(1)==1)
    disp ([num2str(reshape(result, 1, 3)+0) "\t : ම (MA)"]);
    result_text = "Ma";
  elseif (result(2)==1)
    disp ([num2str(reshape(result, 1, 3)+0) "\t : ර (RA)"]);
    result_text = "Ra";
  elseif (result(3)==1)
    disp ([num2str(reshape(result, 1, 3)+0) "\t : ද (DA)"]);
    result_text = "Da";
  endif;
  
  #load original image
  if (n<=size_test)
    img = ch1(:,n+size_train).im;
  elseif (n<=size_test*2)
    img = ch2(:,n+size_train-size_test).im;
  else
    img = ch3(:,n+size_train-size_test*2).im;
  endif;
  
  #plot result
  subplot(3,6,n);
  imshow(img);
  hText = text(0,0,result_text,'Color',[1 0 0],'FontSize',20);
  
end;