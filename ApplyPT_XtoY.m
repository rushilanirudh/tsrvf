function ApplyPT_XtoY(x1,x2,y1)

[Ax Xx] = findVelocity_A_P1toP2(x1*x1',x2*x2');
Vxy = findVelocity_A_P1toP2(x1*x1',y1*y1');

%tVx = Grassmann_ParallelTranslate(x1,Ax',Vxy',1);
tVx = Grassmann_ParallelTranslate_proj(x1*x1',Xx,y1*y1',1);

[u1 a1]= phi_inv(y1*y1');
tty2 = findP2_from_P1_A(y1*y1',tVx,u1,1);
[u2 a2]= phi_inv(tty2);
subplot(2,3,1),plot(x1(:,2),-x1(:,1));
subplot(2,3,2),plot(x2(:,2),-x2(:,1));
subplot(2,3,3),plot(y1(:,2),-y1(:,1));
subplot(2,3,5),plot(a1(:,2),-a2(:,1));
