function r=fkine(options)
%	This function finds the matrices of the homogenous transformation
%	to access the homogenous transformation from base to their respective joint
% 	M_base_joint3 = r.j_03
%
%	Transformation sequence is M = [rot_z][trans_z][trans_x][rot_x]
%								 = [theta][  d    ][   a   ][alpha]
%
%	This function will load the variables from param_irb1400 for now
%	Consider writing a more general function to accept other robots

param_irb1400
[rows cols] = size(irb1400_dh);

switch nargin
	case 1
		type = class(options)
		switch type
			case "string"
				if options == "zero"
					irb1400 = irb1400_zero_pos
				else
					disp("The argument is invalid");
				end
			case "double"
				[v_rows, v_columns] = size(options);
				%v=rows*columns;
				if v_rows*v_columns == 6
					irb1400_zero_pos(:,3) = options;
					irb1400 = irb1400_zero_pos
				else
					disp("Argument has to be 6-element array");
				end

			case "sym"
				[v_rows, v_columns] = size(options);
				%v=rows*columns;
				if v_rows*v_columns == 6
					irb1400_zero_pos(:,3) = options;
					irb1400 = irb1400_zero_pos
				else
					disp("Argument has to be 6-element array");
				end


		end
	case 0
		irb1400 = irb1400_dh;
end
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
	dh.a = irb1400(row,2);
	dh.alpha = irb1400(row,1);
	dh.d = irb1400(row,4);
	dh.theta = irb1400(row,3);

	zrot= z_rot(dh.theta);
	ztrans= z_trans(dh.d);
	xrot= x_rot(dh.alpha);
	xtrans= x_trans(dh.a);

	T{row} = (zrot.h)*(ztrans.h)*(xtrans.h)*(xrot.h);
end

%r(1).T=T;
%   pose link1
r(1).j_01 = T{1}
r(1).j_02 = T{1}*T{2};
r(1).j_03 = T{1}*T{2}*T{3};
r(1).j_04 = T{1}*T{2}*T{3}*T{4};
r(1).j_05 = T{1}*T{2}*T{3}*T{4}*T{5};
r(1).j_06 = T{1}*T{2}*T{3}*T{4}*T{5}*T{6};
