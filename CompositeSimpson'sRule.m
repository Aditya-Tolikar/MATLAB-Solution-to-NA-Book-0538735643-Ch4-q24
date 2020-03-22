%Function T(r) Temperatures measured at various r
% i         r       T(r)
% 1     0.308      640
% 2     0.325      794
% 3     0.342      885
% 4     0.359      943
% 5     0.376      1034
% 6     0.393      1064
% 7     0.410      1114
% 8     0.427      1152
% 9     0.444      1204
% 10    0.461      1222
% 11    0.478      1239
T = [0.308,0.325,0.342,0.359,0.376,0.393,0.410,0.427,0.444,0.461,0.478;
    640,794,885,943,1034,1064,1114,1152,1204,1222,1239];

a = 0.308;
b = 0.478;

phi = 0.7051; %Angle of brake pads

f(1,:) = T(1,:);
f(2,:) = T(2,:) .* T(1,:) .* phi;
%f = T(r) * r * phi

g(1,:) = T(1,:);
g(2,:) = T(1,:) .* phi;
%g = r * phi

n = 11;
h = (b-a)/n;

%Using Simpson's Rule for F
XI0 = f(2,1) + f(2,n); % = f(a) + f(b);
XI1 = 0;
XI2 = 0;
for i = 1:n-1
    X = a + i*h;
    if (mod(i,2) == 0)
        XI2 = XI2 + f(2,i);% XI2 = XI2 + f(X)
    else
        XI1 = XI1 + f(2,i);% XI1 = XI1 + f(X)
    end
end
XI = h * (XI0 + 2 * XI2 + 4 * XI1)/3;
F = XI;  % F = INTEGRAL(re,ro) {T(r) * r * phi * delta(r)}

%Using Simpson's Rule for G
XI0 = g(2,1) + g(2,n);
XI1 = 0;
XI2 = 0;
for i = 1:n-1
    X = a + i*h;
    if (mod(i,2) == 0)
        XI2 = XI2 + g(2,i);% XI2 = XI2 + f(X)
    else
        XI1 = XI1 + g(2,i);% XI1 = XI1 + f(X)
    end
end
XI = h * (XI0 + 2 * XI2 + 4 * XI1)/3;
G = XI; % G = INTEGRAL(re,ro) {r * phi * delta(r)}

intT = F/G;
format longG
display(intT)
