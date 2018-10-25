syms rot1 rot2 rot3 rot4 rot5 rot6;

%the dh parameters are 
%[alpha	,a	,theta	,d		] 

%[x_rot,x_trans,z_rot,z_trans]

irb1400_dh = [ ...

-pi/2	,0.15	,rot1	,0.475	; ...
0		,0.6	,rot2	,0.0	; ... 
-pi/2	,0.12	,rot3	,0  	; ...
pi/2	,0.0	,rot4	,0.72	; ...
-pi/2	,0		,rot5	,0		; ... 
0		,0		,rot6	,0.085	];

irb1400_zero_pos = irb1400_dh;
irb1400_zero_pos(:,3)=[0, -pi/2, 0, 0, 0, pi];

%map to version1: not confident with sequance
%[rotz	,transz	,transx	,rotx	]

%map to version2: not confident with this too
%[transz,rotz	,transx	,rotx	]

