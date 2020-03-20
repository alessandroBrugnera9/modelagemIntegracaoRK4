function a2 = calcAceleracao2 ( x1, x2, v1, v2, a1, m2, vel, fprop)
	%Constantes
	L1=2;
	L2=2.5;
	L2e=1.8;

	m1=450;

	miI=2.7;
	R=0.3;
	g=9.81;

	F1 = fprop*m1*g/2;
	F2 = -m2*g/2;


	B0 = L2*L2*R*m2;
	B1 = -L1*L2*R*m2*cos(x1-x2);
	B2 = L1*L2*R*m2*sin(x1-x2);
	B3 = -miI*vel;
	B4 = L2e*sin(x2)*R*F2;

	%aplica as formulas apos calcular As e Bs
	a2= (B1*a1 + B2*v1^2 + B3*v2 + B4)/B0;
end