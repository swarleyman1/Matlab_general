I = imread('napoleon.png'); % read the image
imshow(I); % show image I using ’imshow’
figure % open a new figure window
image(I) % show image I using ’image’
colorbar % add a colorbar showing the colormap
figure % open a new figure window
imagesc(I) % show matrix I using ’imagesc’
colorbar % add a colorbar

%% Q2
I = imread('napoleon.png'); % read the image
I_light = imread('napoleon_light.png'); % read the image
I_dark = imread('napoleon_dark.png'); % read the image
figure
imhist(I)
figure
imhist(I_light)
figure
imhist(I_dark)

%% Q3
I = imread('napoleon.png'); % read the image
Is = single(I); % Convert from uint8 to single
imtool(I) % This looks OK!
imtool(Is) % This looks strange!
imtool(Is/255) % This looks OK!

figure(1)
imagesc((I/64)*64)
figure(2)
imagesc((Is/64)*64)

%% Q4-Q5
I = imread('napoleon.png'); % read the image
figure
imhist(I)
I2 = I+10;
figure
imhist(I2)
I3 = I*0.8;
figure
imhist(I3)

%% Q6
g=2;
I = imread('napoleon.png');
figure(1)
imhist(I);
L = double(I).^g;
out = uint8(L .* (255/max(max(L))));
figure(2)
imhist(out);

%% Q7
I = imread('napoleon.png');
J = histeq(I);
figure(1)
imhist(J);
figure(2)
imshow(J)
figure(3)
imshow(I)

%% Q8
I = imread('zebra.png');
imshow(I)
Jnf = imresize(I, [78 78], 'nearest', 'antialiasing', false);
Jnt = imresize(I, [78 78], 'nearest', 'antialiasing', true);
Jbf = imresize(I, [78 78], 'bilinear', 'antialiasing', false);
Jbt = imresize(I, [78 78], 'bilinear', 'antialiasing', true);
figure(1)
imagesc(Jnf)
figure(2)
imagesc(Jnt)
figure(3)
imagesc(Jbf)
figure(4)
imagesc(Jbt)

%% Q10

B1 =imread('brain1.png');
B2 =imread('brain2.png');
B3 =imread('brain3.png');

healthy = (B1./2)+(B2./2);
stroke = healthy-B3;
figure(1)
imshow(healthy)
figure(2)
imshow(stroke)

%% Q13

w = imread('wrench.png');
tic
J = imrotate(I,20);
toc
K = imrotate(I,20,'bilinear');

tic
J = imrotate(I,90);
toc

%% Q 15
sb = imread('spongebob.jpg');
sb = rgb2gray(sb);
sb = imresize(sb,[128,128]);

new = uint8(255*ones(128));
for r = 3:126
    for k = 3:126
        new(r,k) = uint8(sum(sum(sb(r-2:r+2,k-2:k+2)))/25);
    end
end
figure(1)
imagesc(sb)
figure(2)
imagesc(new)        
filter = new-sb;
figure(3)
imagesc(filter)

%% Q 16
sb = imread('spongebob.jpg');
sb = rgb2gray(sb);
sb = imresize(sb,[128,128]);



