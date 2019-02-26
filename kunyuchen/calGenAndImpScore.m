function [ genuine,impostor, source ] = calGenAndImpScore( coeff, total, type )
%CALGENANDIMPSCORE Calculating genuine scores and impostor scores 
% and show histogram
gCount = 1;
iCount = 1;
sCount = 1;
for i= 1:total
    for j = i+1:total
        temp = sqrt(sum((coeff(:,i)-coeff(:,j)).^2));        
        % Own face scores
        source(sCount) = temp;
        sCount = sCount + 1;
        if idivide(i-1,int32(5)) == idivide (j-1,int32(5))
            % Genuine scores
            genuine(gCount) = temp;
            gCount = gCount + 1;
        else
            % Impostor scores
            impostor(iCount) = temp;
            iCount = iCount + 1;
        end
    end
end

if type == 'T'
    % plot histogram
    figure;
    [n1,x1] = hist(genuine,15);
    [n2,x2] = hist(impostor,20);
    [ax,h1,h2]=plotyy(x1,n1,x2,n2,@bar,@bar);
    set(h1,'facecolor','b')
    set(h2,'facecolor','r')
end
end

