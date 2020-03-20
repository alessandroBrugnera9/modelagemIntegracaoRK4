function a1 = calcAceleracao1 ( x1, x2, v1, v2, m2, vel, fprop)
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


	A0 = L1^2*L2*R*( m2*cos(2*x1-2*x2) - 2*m1 - m2);
	A1 = L1^2*L2*R*m2*sin(2*x1-2*x2);
	A2 = 2*L1*L2^2*R*m2*sin(x1-x2);
	A3 = -2*L2*miI*vel;
	A4 = -2*L1*miI*vel*cos(x1-x2);
	A5 = -R*L1*(L2e*F2*sin(x1-2*x2) + 2*sin(x1)*(F1*L2 + L2e*F2/2));

	%aplica as formulas apos calcular As e Bs
	a1= (A1*v1^2 + A2*v2^2 + A3*v1 + A4*v2 + A5)/A0;
end