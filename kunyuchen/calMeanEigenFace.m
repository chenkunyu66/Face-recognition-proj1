function [E,mean_images ] = calMeanEigenFace(images ,num,px, py )
%GETIMAGES Calculation Mean face calculations and Getting eigen-face
%
%
%% Mean face calculations
for k =  1:900
    mean_images(k,1) = mean(images(k,:));
    
end

meanFace = reshape(mean_images,30,30);
figure
imshow(meanFace,[]);
title('Mean Face')
%% Original face subtracted by the mean face
for i = 1: sqrt(length(images))
   sub(:,i)=double(images(:,i))-mean_images(:,1);
end
%% Mean Faces subtracted images
covariance = cov(sub');
%% Getting eigen-face
[V,D] = eigs(covariance,num);

figure;
% Comuting the num eigen faces and displaying them

for i = 1:num
    subplot(px,py,i);
    imshow(reshape(V(:,i),30,30),[]);
    title(['Eigen' num2str(i)]);
end
E = V';

end

