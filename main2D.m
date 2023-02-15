clear all;clc;close all;

h = 0.001;
m2 = 650;
vel = 80/3.6;
fprop = 1;
tFinal = 60;
t = 0:h:tFinal;

[Eulerx1,Eulerv1,Eulera1,Eulerx2,Eulerv2,Eulera2] = Euler (h,tFinal,m2,vel,fprop);
[RK2x1,RK2v1,RK2a1,RK2x2,RK2v2,RK2a2] = RK2 (h,tFinal,m2,vel,fprop);
[RK4x1,RK4v1,RK4a1,RK4x2,RK4v2,RK4a2] = RK4 (h,tFinal,m2,vel,fprop);

	figure1 = figure(1)
	hold on
	plot(t, Eulerx1, 'r')
	plot(t, RK2x1, 'b')
	plot(t, RK4x1, 'g')
	legend('Euler','RK2','RK4', 'Location','NW');
	grid on
	anot=sprintf('h = %0.0d', h);
	title({'Compara\c{c}\~{a}o de $\theta_{1}$ com diferentes m\''etodos num\''ericos', anot}, 'Interpreter','latex');
	hold off
	xlabel('Tempo [s]', 'Interpreter','latex');
	ylabel('$\theta_{1} [rad]$', 'Interpreter','latex');

	figure2 = figure(2)
	hold on
	plot(t, Eulerx2, 'r')
	plot(t, RK2x2, 'b')
	plot(t, RK4x2, 'g')
	legend('Euler','RK2','RK4', 'Location','NW');
	grid on
	anot=sprintf('h = %0.0d', h);
	title({'Compara\c{c}\~{a}o de $\theta_{2}$ com diferentes m\''etodos num\''ericos', anot}, 'Interpreter','latex');
	hold off
	xlabel('Tempo [s]', 'Interpreter','latex');
	ylabel('$\theta_{2} [rad]$', 'Interpreter','latex');

	figure3 = figure(3)
	hold on
	plot(t, Eulerv1, 'r')
	plot(t, RK2v1, 'b')
	plot(t, RK4v1, 'g')
	legend('Euler','RK2','RK4', 'Location','NW');
	grid on
	anot=sprintf('h = %0.0d', h);
	title({'Compara\c{c}\~{a}o de $\dot{\theta}_{1}$ com diferentes m\''etodos num\''ericos', anot}, 'Interpreter','latex');
	hold off
	xlabel('Tempo [s]', 'Interpreter','latex');
	ylabel('$\dot{\theta}_{1} [rad/s]$', 'Interpreter','latex');

	figure4 = figure(4)
	hold on
	plot(t, Eulerv2, 'r')
	plot(t, RK2v2, 'b')
	plot(t, RK4v2, 'g')
	legend('Euler','RK2','RK4', 'Location','NW');
	grid on
	anot=sprintf('h = %0.0d', h);
	title({'Compara\c{c}\~{a}o de $\dot{\theta}_{2}$ com diferentes m\''etodos num\''ericos', anot}, 'Interpreter','latex');
	hold off
	xlabel('Tempo [s]', 'Interpreter','latex');
	ylabel('$\dot{\theta}_{2} [rad/s]$', 'Interpreter','latex');

	figure5 = figure(5)
	hold on
	plot(t, Eulera1, 'r')
	plot(t, RK2a1, 'b')
	plot(t, RK4a1, 'g')
	legend('Euler','RK2','RK4', 'Location','NW');
	grid on
	anot=sprintf('h = %0.0d', h);
	title({'Compara\c{c}\~{a}o de $\ddot{\theta}_{1}$ com diferentes m\''etodos num\''ericos', anot}, 'Interpreter','latex');
	hold off
	xlabel('Tempo [s]', 'Interpreter','latex');
	ylabel('$\ddot{\theta}_{1} [rad/s^{2}]$', 'Interpreter','latex');

	figure6 = figure(6)
	hold on
	plot(t, Eulera2, 'r')
	plot(t, RK2a2, 'g')
	plot(t, RK4a2, 'b')
	legend('Euler','RK2','RK4', 'Location','NW');
	grid on
	anot=sprintf('h = %0.0d', h);
	title({'Compara\c{c}\~{a}o de $\ddot{\theta}_{2}$ com diferentes m\''etodos num\''ericos', anot}, 'Interpreter','latex');
	hold off
	xlabel('Tempo [s]', 'Interpreter','latex');
	ylabel('$\ddot{\theta}_{2} [rad/s^{2}]$', 'Interpreter','latex');


		figure9 = figure(9);
	subplot(3,2,1);
	title({'RK4', anot}, 'Interpreter','latex');
	hold on
	plot(t, RK4x1, 'g')
	grid on
	title({'RK4', anot,'$\theta_{1}$'}, 'Interpreter','latex');
	ylabel('$\theta_{1} [rad]$', 'Interpreter','latex');
	hold off

	subplot(3,2,2);
	hold on
	plot(t, RK4x2, 'g')
	grid on	
	title({'$\theta_{2}$'}, 'Interpreter','latex');
	ylabel('$\theta_{2} [rad]$', 'Interpreter','latex');
	hold off

	subplot(3,2,3);
	hold on
	plot(t, RK4v1, 'g')
	grid on	
	title({'$\dot{\theta}_{1}$'}, 'Interpreter','latex');
	ylabel('$\dot{\theta}_{1} [rad/s]$', 'Interpreter','latex');
	hold off

	subplot(3,2,4);
	hold on
	plot(t, RK4v2, 'g')
	grid on	
	title({'$\dot{\theta}_{2}$'}, 'Interpreter','latex');
	ylabel('$\dot{\theta}_{2} [rad/s]$', 'Interpreter','latex');
	hold off

	subplot(3,2,5);
	hold on
	plot(t, RK4a1, 'g')
	grid on	
	title({'$\ddot{\theta}_{1}$'}, 'Interpreter','latex');
	ylabel('$\ddot{\theta}_{1} [rad/s^{2}]$', 'Interpreter','latex');
	hold off

	subplot(3,2,6);
	hold on
	plot(t, RK4a2, 'g')
	grid on	
	title({'$\ddot{\theta}_{2}$'}, 'Interpreter','latex');
	ylabel('$\ddot{\theta}_{2} [rad/s^{2}]$', 'Interpreter','latex');
	hold off


saveas(figure9,sprintf('GraficosRK4(h=%0.0d)(F=0.5m1+gN).jpg', h));