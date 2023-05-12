pkg load symbolic
syms t

r = 2 + sin(6*t)
phi = 6.5*t + 1.2*cos(6*t)

x = r*cos(phi)
y = r*sin(phi)

Vx = diff(x)
Vy = diff(y)
Ax = diff(Vx)
Ay = diff(Vy)

step = 0.001;
t = 0:step:20;

x = eval(x);
y = eval(y);
Vx = eval(Vx);
Vy = eval(Vy);
Ax = eval(Ax);
Ay = eval(Ay);

figure
axis equal
xlim([-20 20])
ylim([-20 20])
xlim manual
ylim manual
hold on

plot(x, y);
Pnt = plot(x(1), y(1), 'o', 'markersize', 8, 'markerfacecolor', [0.5 0.5 0])
Vp = plot([x(1) x(1)+Vx(1)], [y(1) y(1)+Vy(1)], 'color', [1 0 0]);
Ap = plot([x(1) x(1)+Ax(1)], [y(1) y(1)+Ay(1)], 'color', [0 0 0]);

VE = Povorot(Vy(1), Vx(1));
AE = Povorot2(Ay(1), Ax(1));

VEp = plot(x(1)+Vx(1)+VE(1,:), y(1)+Vy(1)+VE(2,:), 'color', [1 0 0])
AEp = plot(x(1)+Ax(1)+AE(1,:), y(1)+Ay(1)+AE(2,:), 'color', [0 0 0])

for i = 1:length(t)-1
  set(Pnt, 'xdata', x(i), 'ydata', y(i))
  set(Vp, 'xdata', [x(i) x(i)+Vx(i)], 'ydata', [y(i) y(i)+Vy(i)])

  VE = Povorot(Vy(i), Vx(i));
  set(VEp, 'xdata', x(i)+Vx(i)+VE(1,:), 'ydata', y(i)+Vy(i)+VE(2,:))

  set(Ap, 'xdata', [x(i) x(i)+Ax(i)], 'ydata', [y(i) y(i)+Ay(i)])

  AE = Povorot2(Ay(i), Ax(i));
  set(AEp, 'xdata', x(i)+Ax(i)+AE(1,:), 'ydata', y(i)+Ay(i)+AE(2,:))

  pause(0.01)
end
