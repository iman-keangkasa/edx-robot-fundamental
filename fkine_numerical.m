function [ pos_ ] = fkine_numerical(theta1,theta2,theta3,theta4,theta5,g)
	a=3;
	b=5.75;
	c=7.375;
	d=4.125;
	e=1.125;
	pos = zeros(10,3);
	pos0 = [ 0; 0; 0; 1 ];
%function A = compute_dh_matrix( r--x, alpha--x, d--z, theta--z )
	T0_1 = compute_dh_matrix( 0,-pi/2,a,theta1 );
	T1_2 = compute_dh_matrix( b,0,0,theta2-(pi/2) );
	T2_3 = compute_dh_matrix( c,0,0,theta3+(pi/2) );
	T3_4 = compute_dh_matrix( 0,-pi/2,0,theta4-(pi/2) );
	T4_5 = compute_dh_matrix(0,0,d,theta5);
	

	
	A1=T0_1;
	A2=T0_1*T1_2;
	A3=T0_1*T1_2*T2_3;
	A_5=T0_1*T1_2*T2_3*T3_4; %just a rotation about x_3
	A5=A_5*T4_5;

	pos(1,:) = pos0(1:3)';
	
	pos2 = (A1*pos0);
	pos3 = (A2*pos0);
	pos4 = (A3*pos0);
	pos5 = (A5*pos0);
	pos_hand = (A5*pos0);
	prepos6 = [ 0 0 -e ];
	prepos7 = [g/2 0 -e];
	prepos8 = [-g/2 0 -e];
	prepos9 = [g/2 0 0];
	prepos10 = [-g/2 0 0];

	pos(2,:) = pos2(1:3)';
	pos(3,:) = pos3(1:3)';
	pos(4,:) = pos4(1:3)';
	pos(5,:) = pos5(1:3)';
	pos(6,:) = pos_hand(1:3)'+prepos6;
	pos(7,:) = pos_hand(1:3)'+prepos7;
	pos(8,:) = pos_hand(1:3)'+prepos8;
	pos(9,:) = pos_hand(1:3)'+prepos9;
	pos(10,:) = pos_hand(1:3)'+prepos10;
	pos_ = pos
end

%function A = compute_dh_matrix(r, alpha, d, theta)

%	rotz = [ cos(theta) -sin(theta) 0 0; ...
%			 sin(theta) cos(theta) 0 0 ; ...
%			 0 0 1 0; ...
%			 0 0 0 1 ]
	
%	rotx = [ 1 0 0 0; ...
%			 0 cos(alpha) -sin(alpha) 0; ...
%			 0 sin(alpha) cos(alpha) 0; ...
%			 0 0 0 1];
	
%	transz = [ 1 0 0 0; ...
%			   0 1 0 0; ...
%			   0 0 1 d; ...
%			   0 0 0 1 ];
	
%	transx = [ 1 0 0 r; ...
%			   0 1 0 0; ...
%			   0 0 1 0; ...
%			   0 0 0 1];

%	A = rotz*transz*transx*rotx;
%end
