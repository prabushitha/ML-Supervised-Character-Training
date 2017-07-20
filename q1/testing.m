load trained_network.mat;
#TESTING
figure(1);
for n=1:size_test*3
  #Testing letter as a 196x1 column vector
  img_test = Test(:,n);
  result_text = testimg_func(img_test,net,false,false);
  
  #make 14*14 image matrix using the 196*1 vector
  img = reshape(img_test(1:196,1), 14, 14);
  img = logical (img);
  
  #plot result
  subplot(3,6,n);
  imshow(img);
  hText = text(0,0,result_text,'Color',[1 0 0],'FontSize',20);
  
end;