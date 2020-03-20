function [x1,v1,a1,x2,v2,a2] = Euler (h,tFinal,m2,vel,fprop)
	passo=1;
	passos=tFinal/h;
	x1 = zeros(passos,1);
	v1 = zeros(passos,1);
	a1 = zeros(passos,1);
	x2 = zeros(passos,1);
	v2 = zeros(passos,1);
	a2 = zeros(passos,1);

	x1(1)=0;
	x2(1)=0;
	v1(1)=0.4;
	v2(1)=-0.1;


	for i = 1:passos-1
		a1(i) = calcAceleracao1 ( x1, x2, v1, v2, m2, vel, fprop);
		a2(i) = calcAceleracao2 ( x1, x2, v1, v2, m2, vel, fprop);
		v1(i+1) = v1(i) + h*a1(i);
		v2(i+1) = v2(i) + h*a2(i);
		x1(i+1) = x1(i) + h*v1(i);
		x2(i+1) = x2(i) + h*v2(i);
	end;
end