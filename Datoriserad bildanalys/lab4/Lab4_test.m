load cdata

figure(1); plot(cdata(:,1),cdata(:,2),'.')

I = imread('handBW.pnm'); % Read the image
figure(2);imshow(I); % Show the image
figure(3);imhist(I); % Show the histogram
figure(4);mtresh(I, 115, 116); 
% Does not work well for ring and hand. Would work for separating hand and
% ring from background with one threshold around 120 though
%%
clear all
I2 = imread('hand.pnm'); % Read the image
figure(5);imshow(I2); % Show the image
R = I2(:,:,1); % Separate the three layers, RGB
G = I2(:,:,2);
B = I2(:,:,3);
figure(6);plot3(R(:),G(:),B(:),'.') % 3D scatterplot of the RGB data

figure(7)
subplot(2,3,1)
imshow(R)
subplot(2,3,2)
imshow(G)
subplot(2,3,3)
imshow(B)
subplot(2,3,4)
imhist(R)
subplot(2,3,5)
imhist(G)
subplot(2,3,6)
imhist(B)



label_im = imread('hand_training.png'); % Read image with labels
figure(8);imagesc(label_im); % View the training areas

%I3(:,:,1) = R; % Create an image with two bands/features
%I3(:,:,2) = G;
I3(:,:,1) = B;
%I3 = im2gray(imread('hand.pnm'));
[data,class] = create_training_data(I3,label_im); % Arrange the training data intovectors

% figure(9);scatterplot2D(data,class); % View the training feature vectors

Itest = im2testdata(I3); % Reshape the image before classification
C = classify(double(Itest),double(data),double(class)); % Train classifier and classify the data
ImC = class2im(C,size(I3,1),size(I3,2)); % Reshape the classification to an image
figure(10);imagesc(ImC); % View the classification result

%%
load landsat_data.mat

figure(11)
subplot(2,4,1)
imshow(landsat_data(:,:,1)./255);
subplot(2,4,2)
imshow(landsat_data(:,:,2)./255);
subplot(2,4,3)
imshow(landsat_data(:,:,3)./255);
subplot(2,4,4)
imshow(landsat_data(:,:,4)./255);
subplot(2,4,5)
imshow(landsat_data(:,:,5)./255);
subplot(2,4,6)
imshow(landsat_data(:,:,6)./255);
subplot(2,4,7)
imshow(landsat_data(:,:,7)./255);

