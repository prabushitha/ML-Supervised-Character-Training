%To test an image
%returns english term for the character

function result_text= testimg_func (img, net, clean=true, showimg=true)
  original = img;
  if (clean == true)
    #clean the image and resize to 14x14
    img = cleanimg_func(img);
  endif;
  
  #Testing letter as a 196x1 column vector
  img_test = img(:);
  
  #add bias input
  img_test(197,1)=1;
  
  #TESTING
  result = round(sim(net,img_test));
  
  #Show results
  result_text = "No Match";
  if (result(1)==1)
    disp ("ම");
    result_text = "Ma";
  elseif (result(2)==1)
    disp ("ර");
    result_text = "Ra";
  elseif (result(3)==1)
    disp ("ද");
    result_text = "Da";
  endif;
  
  if (showimg == true)
    #plot image
    imshow(original);
    hText = text(0,0,result_text,'Color',[1 0 0],'FontSize',40);
  endif;
endfunction