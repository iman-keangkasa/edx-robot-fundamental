function r =load_param_irb1400()
syms rot1 rot2 rot3 rot4 rot5 rot6;

%the dh parameters are 
%[a_	,alpha_	,theta_	,d_		] 
%[xtrans,xrot	,zrot	,z		]

dh = [ ...

-pi/2	,0.15	,rot1	,0.475	; ...
0		,0.6	,rot2	,0		; ... 
-pi/2	,0.12	,rot3	,0		; ...
pi/2	,0		,rot4	,0.72	; ...
-pi/2	,0		,rot5	,0		; ... 
0		,0		,rot6	,0.085	];

irb1400_zero_pos = irb1400_dh;
irb1400_zero_pos(:,3)=[0, -pi/2, 0, 0, 0, pi];

%map to version1: not confident with sequance
%[rotz	,transz	,transx	,rotx	]
[rows cols] = size(dh);
for row= 1:rows
		for col = 1:cols
			T(:,:,col)=z_rot.h(dh(row,col)*z_trans.h(dh(row,col)*x_trans.h(dh)*x_rot.h() %redo this
%map to version2: not confident with this too
%[transz,rotz	,transx	,rotx	]
end
