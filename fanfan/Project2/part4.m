numPoints = size(cpstruct.inputPoints, 1);

%// Cast data to double to be sure
cpstruct.inputPoints = double(cpstruct.inputPoints);
cpstruct.basePoints = double(cpstruct.basePoints);

%//Extract relevant data
xSource = cpstruct.inputPoints(:,1);
ySource = cpstruct.inputPoints(:,2);
xTarget = cpstruct.basePoints(:,1);
yTarget = cpstruct.basePoints(:,2);

%//Create helper vectors
vec0 = zeros(numPoints, 1);
vec1 = ones(numPoints, 1);

xSourcexTarget = -xSource.*xTarget;
ySourcexTarget = -ySource.*xTarget;
xSourceyTarget = -xSource.*yTarget;
ySourceyTarget = -ySource.*yTarget;

%//Build matrix
A = [xSource ySource vec1 vec0 vec0 vec0 xSourcexTarget ySourcexTarget; ...
    vec0 vec0 vec0 xSource ySource vec1 xSourceyTarget ySourceyTarget];

%//Build RHS vector
b = [xTarget; yTarget];

%//Solve homography by least squares
h = A \ b;

%// Reshape to a 3 x 3 matrix (optional)
%// Must transpose as reshape is performed
%// in column major format
h(9) = 1; %// Add in that h33 is 1 before we reshape
hmatrix = reshape(h, 3, 3)';