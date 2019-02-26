clear;
close all;
clc;

%% Pre-Process
files = dir('images/*.bmp');
count = 1;

%% Getting the face images
for i = 1:length(files)
    filename =  ['images/' files(i).name];
    
    % 30 faces images
    if mod(i,5)<= 3 && mod(i,5) >= 1
        img = imread(filename);           
        images(:,count) = reshape(img,900,1);      
        count = count + 1;
    end
    % all faces images
    all_images(:,i) = reshape(imread(filename),900,1);
end

% Showing 30 face images
figure;
for i=1:30
        subplot(3,10,i);
        imshow(reshape(images(:,i),30,30),[]);
        title(['30faces' num2str(i)]);     
end
% Each top num eigen-faces
% Process 100 EIGEN-FACE
[gen,imp] = faceProcess(50,100,10,10, all_images, images,'T');


% Process 25 EIGEN-FACE
% [gen,imp] = faceProcess(50,25,5,5, all_images, images,'T');
% 
% Process 50 EIGEN-FACE
% [gen,imp] = faceProcess(50,50,5,10, all_images, images,'T');


% Process 75 EIGEN-FACE
% [gen,imp] = faceProcess(50,75,3,25, all_images, images,'T');



% %% My Images
% Running Own Face Images
files2 = dir('Own_Face_Images/*.jpg');
all_my_images = cell(1,10);
count = 1;
figure;

for i = 1:length(files2)
    filename =  ['Own_Face_Images/' files2(i).name];
    file2 = imread(filename);
    images(:,count) = reshape(file2,900,1);
    count = count + 1;
    subplot(2,5,i);
   
    imshow(file2,[]);
    title(['Own-face' num2str(i)]);
    all_my_images{i} = reshape(file2,900,1);
end

all_my_images = cell2mat(all_my_images);

[~,~,source] = faceProcess(10,25,5,5, all_my_images, images,'F');
% disp(source);
% figure();
% hist(source)

% faceProcess(50,25,5,5, all_images, images,'F');

figure();
[n1,x1] = hist(gen,15);
[n2,x2] = hist(imp,20);
[ax,h1,h2]=plotyy(x1,n1,x2,n2,@bar,@bar);
set(h1,'facecolor','b')
set(h2,'facecolor','r')
hold on
[n3,x3] = hist(source,25);
disp(source);
bar(x3,n3)
hold off

 