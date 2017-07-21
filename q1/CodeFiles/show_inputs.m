load "Group03 UCSC.mat"
pkg load image
figure(1);
for n=1:30
    subplot(6,5,n);
    imshow(ch1(n).im);
end;

figure(2);
for n=1:30
    subplot(6,5,n);
    imshow(ch2(n).im);
end;

figure(3);
for n=1:30
    subplot(6,5,n);
    imshow(ch3(n).im);
end;