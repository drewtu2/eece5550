function sc = sliding_constraint(alpha, beta, l)
    sc = [cos(deg2rad(alpha + beta)), sin(deg2rad(alpha + beta)) l*sin(deg2rad(beta))];
end