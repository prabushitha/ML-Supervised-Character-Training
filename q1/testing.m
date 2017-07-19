load trained_network.mat;
#TESTING
for n=1:size_test*3
  #Testing letter as a 64x1 column vector
  img_test = Test(:,n);
  #test
  result = round(sim(net,img_test));
  
  if (result(1)==1)
    disp ("ම");
  elseif (result(2)==1)
    disp ("ර");
  elseif (result(3)==1)
    disp ("ද");
  endif;
end;