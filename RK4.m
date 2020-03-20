function [x1,v1,a1,x2,v2,a2] = RK2 (h,tFinal,m2,vel,fprop)
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


	for i = 1:passos
		a1(i) = calcAceleracao1 ( x1(i), x2(i), v1(i), v2(i), m2, vel, fprop);
		a2(i) = calcAceleracao2 ( x1(i), x2(i), v1(i), v2(i), a1(i), m2, vel, fprop);

		%encontrando Ks
		k1v1 = v1(i);
		k1v2 = v2(i);
		k1a1 = a1(i);
		k1a2 = a2(i);
		k2v1 = v1(i) + h/2*k1a1;
		k2v2 = v2(i) + h/2*k1a2;
		k2a1 = calcAceleracao1 ( x1(i) + h/2*k1v1, x2(i) + h/2*k1v2, k1v1, k1v2, m2, vel, fprop);
		k2a2 = calcAceleracao2 ( x1(i) + h/2*k1v1, x2(i) + h/2*k1v2, k1v1, k1v2, k2a1, m2, vel, fprop);
		k3v1 = v1(i) + h*k2a1;
		k3v2 = v2(i) + h*k2a2;
		k3a1 = calcAceleracao1 ( x1(i) + h/2*k2v1, x2(i) + h/2*k2v2, k2v1, k2v2, m2, vel, fprop);
		k3a2 = calcAceleracao2 ( x1(i) + h/2*k2v1, x2(i) + h/2*k2v2, k2v1, k2v2, k3a1, m2, vel, fprop);
		k4v1 = v1(i) + h*k3a1;
		k4v2 = v2(i) + h*k3a2;
		k4a1 = calcAceleracao1 ( x1(i) + h*k3v1, x2(i) + h*k3v2, k3v1, k3v2, m2, vel, fprop);
		k4a2 = calcAceleracao2 ( x1(i) + h*k3v1, x2(i) + h*k3v2, k3v1, k3v2, k4a1, m2, vel, fprop);

		v1(i+1) = v1(i) + h/6*(k1a1 + 2*k2a1 + 2*k3a1 + k3a1);
		v2(i+1) = v2(i) + h/6*(k1a2 + k2a2 + 2*k3a2 + k3a2);
		x1(i+1) = x1(i) + h/6*(k1v1 + k2v1 + 2*k3v1 + k3v1);
		x2(i+1) = x2(i) + h/6*(k1v2 + k2v2 + 2*k3v2 + k3v2);
	end;
	a1(passos+1) = calcAceleracao1 ( x1(passos+1), x2(passos+1), v1(passos+1), v2(passos+1), m2, vel, fprop);
	a2(passos+1) = calcAceleracao2 ( x1(passos+1), x2(passos+1), v1(passos+1), v2(passos+1), a1(passos+1),m2, vel, fprop);
end