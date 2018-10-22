function r=testfkine()

%	this parameters is local to only testkine
	param_irb1400;
	[rows cols] = size(irb1400_dh);
%	_dh.a = irb1400_dh(row,2)
%	_dh.alpha = irb1400_dh(row,1)
%	_dh.d = irb1400_dh(row,4)
%	_dh.theta = irb1400_dh(row,3)
%	
%	option1 Probably for backup
%	z_trans(dh.d)*z_rot(dh.theta)*x_trans(dh.a)*x_rot(dh.alpha)

%	option2 from Niku we will follow this convention
%	z_rot(dh.theta)*z_trans(dh.d)*x_trans(dh.a)*x_rot(dh.theta)
%
%	option3 to use robotic toolbox to represent the robot
%	their dh convention is the same with niku 
%	[theta, d, a, alpha] 
%
%	T_1, T_2, T_3, T_4, T-5, T_6
%	T=cell(6,1);
%	for row=1:rows
%		T{row} = z_rot(dh.theta)*z_trans(dh.d)*x_trans(dh.a)*x_rot(dh.theta)
%	

%	pose link1
%	j_01 = T{1};
%	j_02 = T{2}*T{1};
%	j_03 = T{3}*T{2}*T{1};
%	j_04 = T{4}*T{3}*T{2}*T{1};
%	j_05 = T{5}*T{4}*T{3}*T{2}*T{1};
%	j_06 = T{6}*T{5}*T{4}*T{3}*T{2}*T{1};
%	pose link2
%	pose link3
%	pose link4
%	pose link5
%	pose link6
end
