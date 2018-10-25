function r=plot_robot()

%configuration_space
cs = [0, 0, 0, 0, 0, 0];
M=fkine(cs);
base = [0; 0; 0; 1];

%axes axis.x = axes(:,1)
axes  =[0.2,   0,   0;
          0, 0.2,   0;
          0,   0, 0.2;
 		  1,   1,   1];

axis.x = axes(:,1);
axis.y = axes(:,2);
axis.z = axes(:,3);

joint_tail=zeros(4,6)
joint_tail(:,1) = M.j_01*base;
joint_tail(:,2) = M.j_02*base;
joint_tail(:,3) = M.j_03*base;
joint_tail(:,4) = M.j_04*base;
joint_tail(:,5) = M.j_05*base;
joint_tail(:,6) = M.j_06*base;
r.tail=joint_tail;
%x-arrow
joint_x=zeros(4,6)
joint_x(:,1) = M.j_01*axis.x;
joint_x(:,2) = M.j_02*axis.x;
joint_x(:,3) = M.j_03*axis.x;
joint_x(:,4) = M.j_04*axis.x;
joint_x(:,5) = M.j_05*axis.x;
joint_x(:,6) = M.j_06*axis.x;


%y-arrow
joint_y=zeros(4,6)
joint_y(:,1) = M.j_01*axis.y;
joint_y(:,2) = M.j_02*axis.y;
joint_y(:,3) = M.j_03*axis.y;
joint_y(:,4) = M.j_04*axis.y;
joint_y(:,5) = M.j_05*axis.y;
joint_y(:,6) = M.j_06*axis.y;

%z-arrow
joint_z=zeros(4,6)
joint_z(:,1) = M.j_01*axis.z;
joint_z(:,2) = M.j_02*axis.z;
joint_z(:,3) = M.j_03*axis.z;
joint_z(:,4) = M.j_04*axis.z;
joint_z(:,5) = M.j_05*axis.z;
joint_z(:,6) = M.j_06*axis.z;

%skeleton
%plot()


r.x = [joint_tail,joint_x];
r.y = [joint_tail,joint_y];
r.z = [joint_tail,joint_z];
r.vex=[r.x(1:3,:);r.y(1:3,:);r.z(1:3,:)];

%arrow3([x0, y0,z0],[x1,y1,y2])
%arrow3(base.',point.')
end
