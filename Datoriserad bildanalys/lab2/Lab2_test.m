% Lab 2 test CAIA
%% Q1
img = double(imread('cameraman.png'));
prewitt = fspecial('prewitt');
smooth5 = fspecial('average', 5);
smooth9 = fspecial('average', 9);

alpha = 3;
smooth = imfilter(img, smooth5);
sharp = uint8((alpha)*img - alpha * smooth);
img = uint8(img);

figure(2)
imshow(sharp) % Sharpened image
figure(3)
imshow(uint8(smooth)) % Smoothened image
figure(4)
imshow(imfilter(img, smooth9)) % Smoother image

%% Q2-3  (Needs work)
img = double(imread('cameraman.png'));
h = fspecial('disk', 15);
filtered = imfilter(img, h);
hh = fspecial('disk',3);
filter_high = imfilter(img, hh);

alpha = 1;

high =  alpha*img - alpha*filter_high;
band = uint8( alpha*img - alpha*filtered - alpha*high);
filtered = uint8(filtered);
high = uint8(high);
figure(1)
subplot(1,2,1)
imshow(uint8(img))
subplot(1,2,2)
imshow(filtered)
figure(2)
imshow(high)
figure(3)
imshow(band)


%% Q4
img = double(imread('cameraman.png'));
img2 = double(imread('wagon.png'));
h = fspecial('sobel');


Sx1 = imfilter(img, h');
Sy1 = imfilter(img, h);
grad1 = sqrt(Sx1.^2 + Sy1.^2)./2;
figure(1)
imshow(uint8(grad1)) %shows edges

Sx2 = imfilter(img2, h');
Sy2 = imfilter(img2, h);
grad2 = sqrt(Sx2.^2 + Sy2.^2)./2;
figure(2)
imshow(uint8(grad2)) %shows edges

%% Q5-7
img = imread('wagon_shot_noise.png');
figure
subplot(2,2,1)
imshow(img)
subplot(2,2,2)
imshow(medfilt2(img, [3 3]))
subplot(2,2,3)
imshow(imfilter(img, fspecial('average', 3)))
subplot(2,2,4)
imshow(imfilter(img, fspecial('gaussian', 3, 1)))

%% Q8
img = imread('wagon_shot_noise.png');

new = 255*ones(size(img));

for r = 3:height(img)-3
    for k = 3:width(img)-3
        new(r,k) = median(img(r-2:r+2,k-2:k+2), 'all');
    end
end

figure(1)
subplot(1,2,1)
imshow(img)
subplot(1,2,2)
imshow(uint8(new))

%% Q9
img = imread('cameraman.png');
imshow(imfilter(img, fspecial('gaussian', 50, 10)))

%% Q10
im = double(imread('lines.png'));
f = fftshift(fft2(im));
im2 = double(imread('cameraman.png'));
f2 = fftshift(fft2(im2));

figure(1)
subplot(2,2,1)
imagesc(im)
subplot(2,2,2)
imagesc(log(abs(f)))
subplot(2,2,3)
imagesc(im2)
subplot(2,2,4)
imagesc(log(abs(f2)))

%% Q11
x = rand(1,5)
f = fftshift(fft2(x))

% hold on
% plot(x,zeros(length(x),1),'bo')
% plot(real(f),imag(f),'rx')
% hold off

f(1,2) = 0;
f(1,4) = 0;
im = ifft2(ifftshift(f))

%% Q12
img = imread('cameraman.png');
if rem(width(img),2) == 0 || rem(height(img),2) == 0
    img = img(1:end-1,1:end-1); % HAS TO BE ODD!! (bc mid has to be int)
end
f = fftshift(fft2(img));
r = 10;
mid = [(height(f)+1)/2 (width(f)+1)/2];
f = blank_high(f, mid, r);
figure(1)
imagesc(log(abs(f)))
img_filtered = ifft2(ifftshift(f));
figure(2)
imagesc(img_filtered)

%% Q13

img = imread('freqdist.png');
% if rem(width(img),2) == 0 || rem(height(img),2) == 0
%     img = img(1:end-1,1:end-1); % HAS TO BE ODD!! (bc mid has to be int)
% end
f = fftshift(fft2(img));
% [A, I] = max(log(abs(f))); % Max of every column
% [AA, II] = maxk(A,5,2); % 5 greatest values of the previous column values
% points = [I(II); II]; 
points = [ 100 100 158 158; 92 109 149 166]; 
radius = 10;
for i = 1:length(points)
    f = blank_low(f, points(:,i), radius);
end
figure(1)
subplot(1,2,1)
imagesc(img)
subplot(1,2,2)
imagesc(log(abs(f)))
img_filtered = ifft2(ifftshift(f));
figure(2)
imagesc(img_filtered)

function matrix = blank_high(matrix, point, radius)
    for y = 1:height(matrix)
        for x = 1:width(matrix)
            if sqrt((x-point(1))^2 + (y-point(2))^2) >= radius
                matrix(x,y) = 0;
            end
        end
    end
end

function matrix = blank_low(matrix, point, radius)
    for y = 1:height(matrix)
        for x = 1:width(matrix)
            if sqrt((x-point(1))^2 + (y-point(2))^2) <= radius
                matrix(x,y) = 0;
            end
        end
    end
end