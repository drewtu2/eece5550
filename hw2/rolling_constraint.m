function rc = rolling_constraint(alpha, beta, l)
    rc = [sin(deg2rad(alpha + beta)), -cos(deg2rad(alpha + beta)), -l*cos(deg2rad(beta))];

end