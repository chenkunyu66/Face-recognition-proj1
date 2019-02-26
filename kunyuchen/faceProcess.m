function [gen,imp,source] = faceProcess( total, num,px, py, all_images,images,type)
%% a
[E,sumImage ] = calMeanEigenFace(images ,num,px, py );

%% b
% Getting the eigen-coefficients for all the images in the database set
for i = 1:total
    coeff(:,i) = E*(double(all_images(:,i))-sumImage(:,1));
end
disp(coeff);

%% c
[ gen,imp, source ] = calGenAndImpScore( coeff, total, type );
%% d
drawROC(gen',imp','d');


end

