function Ar = Povorot (Vy, Vx)

  a = 0.2;
  b = 0.3;
  Arrow = [-b 0 -b; a 0 -a];
  
  phi = atan2(Vy, Vx);
  
  Ar(1,:) = Arrow(1,:)*cos(phi) - Arrow(2,:)*sin(phi);
  Ar(2,:) = Arrow(1,:)*sin(phi) + Arrow(2,:)*cos(phi);

end
