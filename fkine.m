function r=fkine()
param_irb1400
[rows cols] = size(irb1400_dh)

%   option1 Probably for backup
%   z_trans(dh.d)*z_rot(dh.theta)*x_trans(dh.a)*x_rot(dh.alpha)

%   option2 from Niku we will follow this convention
%   z_rot(dh.theta)*z_trans(dh.d)*x_trans(dh.a)*x_rot(dh.alpha)

%   option3 to use robotic toolbox to represent the robot
%   their dh convention is the same with niku
%   [theta, d, a, alpha]
%
%   T_1, T_2, T_3, T_4, T-5, T_6
T=cell(6,1);
for row=1:rows
	dh.a = irb1400_dh(row,2)
	dh.alpha = irb1400_dh(row,1)
	dh.d = irb1400_dh(row,4)
	dh.theta = irb1400_dh(row,3)

	zrot= z_rot(dh.theta)
	ztrans= z_trans(dh.d)
	xrot= x_rot(dh.alpha)
	xtrans= x_trans(dh.a)

	T{row} = (zrot.h)*(ztrans.h)*(xtrans.h)*(xrot.h)

end

%   pose link1
r(1).j_01 = T{1};
r(1).j_02 = T{2}*T{1};
r(1).j_03 = T{3}*T{2}*T{1};
r(1).j_04 = T{4}*T{3}*T{2}*T{1};
r(1).j_05 = T{5}*T{4}*T{3}*T{2}*T{1};
r(1).j_06 = T{6}*T{5}*T{4}*T{3}*T{2}*T{1};
