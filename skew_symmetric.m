function r = skew_symmetric(v)
%transform a 3x1 vector to its 3x3 skew symmetric equivalence
r=[0,	v(3),	v(2);
		-v(3),	0,	-v(1);
		-v(2),	v(1),	0];
end
