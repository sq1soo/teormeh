function Ar2 = Povorot2 (Ay, Ax)

  a = 0.2;
  b = 0.3;
  Arrow2 = [-b 0 -b; a 0 -a];

  phi = atan2(Ay, Ax);

  Ar2(1,:) = Arrow2(1,:)*cos(phi) - Arrow2(2,:)*sin(phi);
  Ar2(2,:) = Arrow2(1,:)*sin(phi) + Arrow2(2,:)*cos(phi);

end
