close all; clear;

g = 9.81;

volt_strava=[4, 3.5,3,2.5,2, 1,-1, -2, -2.5, -3, -3.5, -4];
mass_no_curr=[262.62, 262.72, 263.42,263.65, 262.75, 261.33,260.97, 261.49, 261.88, 260.97, 261.19, 261.88]/1000;
mass_yes_curr=[262.85, 262.90, 263.58,263.79,262.87, 261.39, 260.92, 261.38, 261.71, 260.76, 260.97, 261.62]/1000;
diff_err = ones(1, 12) * 0.02e-3 * g;
V=[-2.13, -1.861, -1.595,-1.333, -1.063,-0.53, 0.538, 1.072, 1.34, 1.605, 1.87, 2.178];
V_err=[1e-3,5.157e-4,5.2e-4,5.356e-4 ,4.876e-4,6.397e-4,5.43e-4, 5.713e-4, 1e-3, 8.539e-4, 4.674e-4, 1e-3];

figure; hold on;
diff = (mass_yes_curr - mass_no_curr) * 9.81;
f = fit(volt_strava', diff', 'a*x');
errorbar(volt_strava, diff, diff_err, '.', 'MarkerSize', 25);
plot(f);
xlabel('Input voltage [volt]', 'FontSize', 16);
ylabel('Force [N]', 'FontSize', 16);
title('Force by input voltage', 'FontSize', 16);
legend('Data', 'Fit', 'FontSize', 16);
ax = gca;
ax.FontSize = 14;

xhisquare = sum(((diff - f(volt_strava)') / (diff_err(1))).^2) / 11;
