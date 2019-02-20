function xdot = pend(t, x)
x

    g = 32;
    L = 2;
    xdot = [0; 0];
    xdot(1) = x(2)
    xdot(2) = -g/L * sin(x(1))
end