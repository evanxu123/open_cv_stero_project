
% Fundamental Matrix
fNorm8Point = estimateFundamentalMatrix(cpstruct.inputPoints(inliers,:),cpstruct.basePoints(inliers,:),'Method','Norm8Point');

%
E = estimateEssentialMatrix(cpstruct.inputPoints,cpstruct.basePoints,cameraParams);