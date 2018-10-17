function r=rodrigues_formula(rot)
%RODRIGUES_FORMULA(ROT_MATRIX) extract the axis of rotation and the angle
%ROT_MATRIX is a 3x3 matrix
%Return value is a 4x1 struct containing the [x y z] and theta
%This function requires the IDENTITY() and SKEW_SYMMETRIC() functions
syms x y z theta;
v=[x y z];
skew=skew_symmetric(v);
unsolve = identity()+sin(theta)*skew+(1-cos(theta))*skew^2 == rot;
%unsolve_ = unsolve == rot;
unsolve_linear = unsolve(:);
r = solve(unsolve_linear,[x y z theta]);
end
