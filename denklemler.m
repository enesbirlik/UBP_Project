%% Degiskenler
Rs=2;
Rr=1.7;
Lls=0.008;
Lm=0.46;
L1lr=0.012;
J=0.030;
P=2;
Bm=0.02;
%% Yazılacak Dif Denklemler
%Denklem (6-12) temel diferansiyel denklemlerde yerine yazılması gereken denklemler.
Lamqs = Ls*iqs + Lm*i1qr;
Lamds = Ls*ids + Lm*i1dr;
Lam1qr = L1r*i1qr + Lm*iqs;
Lam1dr = L1r*i1dr + Lm*ids;
Ls= Lls+Lm;
Lr1 = Llr1 + Lm;
Te = (3/2)*(P/2)*(Lm/Lr1)*(Lam1dr*iqs-Lam1qr*ids);
%% Hesaplanacak Dif Denklemler
%Sistemin temel diferansiyel denklemleri Denklem 1, 2, 3, 4 ve 5’te verilmiştir.
Vqs = (Rs*iqs) + (d/dt)*Lamqs + w*Lamds;
Vds = Rs*ids + (d/dt)*Lamds - w*Lamqs;
V1qr = R1r*i1qr + (d/dt)*Lam1qr + (w-wm)*Lam1dr;
V1dr = R1r*i1qr + (d/dt)*Lam1dr + (w-wm)*Lam1qr;
dJwm = J * (d/dt)*
dJwm = Te - Bm * wm - Tl;
%% dq eksenleri 3 fazlı abc gerilimleri Vq ve Vd gerilimlerine dönüştürür.
% Bu dönüşüme Clarke-Parkdönüşümü denir. Dönüşüm aşağıdaki denklemde verilmiştir.
% Akımlar için aynı dönüşüm uygulanabilir.
A = [cos(th), cos(th - (2*pi/3)), cos(th + (2*pi/3));
     sin(th), sin(th - (2*pi/3)), sin(th + (2*pi/3));
     1/2, 1/2, 1/2];

Equ = A * [Va; Vb; Vc];

Vd = Equ(1);
Vq = Equ(2);
V0 = Equ(3);
%% abc gerilimlerini dq eksenlerine dönüştüren 
% dönüşüme Ters Clarke-Park dönüşümü denir.
B = [cos(th) , sin(th) , 1;
    cos(th - (2*pi/3)) , sin(th - (2*pi/3)) , 1;
    cos(th + (2*pi/3)) , sin(th + (2*pi/3)) , 1];

V14 = B * [Vd; Vq; V0];

Va = V14(1);
Vb = V14(2);
Vc = V14(3);

