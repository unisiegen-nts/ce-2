%% Communications Engeneering II - Übung 1
clear;

f_1 = 1;
f_0 = 3*f_1
f = (-10:0.01:10)*f_1;
t = [-floor(length(f)/2):ceil(length(f)/2)-1]/(max(f)-min(f));

S = @(x) 2*rect(x/(2*f_1))

%% Teil 1
H_T = @(x) rect(x/f_1).*(2*x/f_1+1)+2*rect((x-3*f_1/4)/(f_1/2))

plot(f, H_T(f));
xlabel('Frequency f/f_1');
ylabel('Amplitude');
xlim([-4*f_1, 4*f_1]);
ylim([-0.25 3]);

%% Teil 2
h_T = ifft(ifftshift(H_T(f)));
if (any(real(h_T) > 0) && all(abs(imag(h_T)) < eps))
    disp('Spektrum ist reell!');
elseif (all(abs(real(h_T)) < eps) && any(imag(h_T) > 0))
    disp('Spektrum ist imaginär!');
elseif (any(real(h_T) > 0) && any(imag(h_T) > 0))
    disp('Spektrum ist komplex!');
end

%% Teil 3
H_BP = @(x) 1/2 *(H_T(x-f_0) + conj(H_T(-x-f_0)));

plot(f, H_BP(f));
xlabel('Frequency f/f_1');
ylabel('Amplitude');
xlim([-5*f_1, 5*f_1]);
ylim([-0.25 3]);

%% Teil 4

M = @(x) 1/2 *(S(x-f_0) + conj(S(-x-f_0)));

plot(f, M(f));
xlabel('Frequency f/f_1');
ylabel('Amplitude');
xlim([-5*f_1, 5*f_1]);
ylim([-0.25 3]);

%% Teil 5
ylim([-1 3]);

M_BP = @(x) M(x).*H_BP(x);

plot(f, M_BP(f));
xlabel('Frequency f/f_1');
ylabel('Amplitude');
xlim([-5*f_1, 5*f_1]);
ylim([-0.25 3]);

%% Teil 8

g1 = M_BP(f-f_0)+conj(M_BP(-f-f_0));
H_LP = rect(f/(2*f_1));
g2 = g1.*H_LP;

subplot(3,1,1);
plot(f, g1);
xlabel('Frequency f/f_1');
ylabel('Amplitude');
xlim([-10*f_1, 10*f_1]);
ylim([-0.25 1.5]);

subplot(3,1,2);
plot(f, H_LP);
xlabel('Frequency f/f_1');
ylabel('Amplitude');
xlim([-10*f_1, 10*f_1]);
ylim([-0.25 1.5]);

subplot(3,1,3);
plot(f, g2);
xlabel('Frequency f/f_1');
ylabel('Amplitude');
xlim([-10*f_1, 10*f_1]);
ylim([-0.25 1.5]);

%% Teil 11
f_g = 1; 
h = @(x) 2.5*f_g*sinc()