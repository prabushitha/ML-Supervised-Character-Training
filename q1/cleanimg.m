%To clean and resize any image array
function retval = cleanimg (img)
  
  
  resizedimg = imresize(img, [14 14]); #resize image [7 9]
  bwimg = im2bw(resizedimg); #make image black and white
  retval = bwimg;
endfunction