clear all
% Component values
L=500e-6;
C=33e-6;
rC=260e-3;
rL=36.83e-3;
R=2.0833;
n2=40;
n1=25;
Vd=48;
s=tf('s');
w0=1/(sqrt(L*C));
Ksi=((1/(C*R))+((rC+rL)/L))/(2*w0);
wz=1/(rC*C);
n=n2/n1;
T=(n*Vd*w0^2/wz)*(s+wz)/(s^2+2*Ksi*w0*s+w0^2);
figure
bode(T);
title('Bode plot of the transfer function');
figure
pzmap(T);
title('Pole zero map of the transfer function');
fpole=1239;
fesr=18.651;
fs=40e3;
f0=5e3;
% Compensator Tf
Cc1=19.5e-6;
Cc2=1e-9;
Cf3=2.2e-9;
Rf1=54.5e3;
Rf2=7.45e3;
Rf3=3.88e3;
Rc1=8.8e3;
Tc=((1+Rc1*Cc1*s)*(1+s*Cf3*(Rf1+Rf3)))/(s*Rf1*Cc1*(Rc1*Cc2*s+1)*(s*Rf3*Cf3+1));
figure
bode(T*Tc);
title('Bode plot of the circuit plus compensator');