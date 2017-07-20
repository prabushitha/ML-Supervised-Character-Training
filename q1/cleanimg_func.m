%To clean and resize any image array
function retval = cleanimg_func (img)
  #CROP IMAGE
  cropbw = im2bw(img);
  
  rows = size(cropbw)(1);
  newcrop = cropbw;
  for n=1:rows
    maxel = max(cropbw(n,:));
    minel = min (cropbw(n,:));
    if (maxel == minel && maxel == 1)
      #delete the row from top
      img(n,:) = [];
      newcrop(n,:) = [];
    else
      break;
    endif;
  end;
  
  cropbw = newcrop;
  rows = size(cropbw)(1);
  for n=1:rows
    maxel = max(cropbw(rows-n+1,:));
    minel = min (cropbw(rows-n+1,:));
    if (maxel == minel && maxel == 1)
      #delete the row from bottom
      img(rows-n+1,:) = [];
      newcrop(rows-n+1,:) = [];
    else
      break;
    endif;
  end;
  
  cropbw = newcrop;
  columns = size(cropbw)(2);
  for n=1:columns
    maxel = max(cropbw(:,n));
    minel = min (cropbw(:,n));
    if (maxel == minel && maxel == 1)
      #delete the column from left
      img(:,n) = [];
      newcrop(:,n) = [];
    else
      break;
    endif;
  end;
  
  cropbw = newcrop;
  columns = size(cropbw)(2);
  for n=1:columns
    maxel = max(cropbw(:,columns-n+1));
    minel = min (cropbw(:,columns-n+1));
    if (maxel == minel && maxel == 1)
      #delete the column from right
      img(:,columns-n+1) = [];
      newcrop(:,columns-n+1) = [];
    else
      break;
    endif;
  end;
  
  #RESIZE IMAGE
  resizedimg = imresize(img, [14 14]); #resize image to 14*14 matrix
  bwimg = im2bw(resizedimg); #make image black and white
  retval = bwimg;
endfunction