function [] = debug_ransac_pos(plot_num)
global OB m n

FLAG_PART_PLOT = 0;
FLAG_LABEL_DATA = 0;

if FLAG_PART_PLOT
    m1 = 22;
    n1 = 97;
    m = 1026;
    n = 2562;
else
    m1 = 1;
    n1 = length(OB.DETEC_X_E);
    m = 1;
    n = length(OB.TIME);
end


% % 

figure(plot_num)
subplot(2,1,1)
hold on
plot(OB.TIME(m:n),OB.X_OT(m:n));
plot(OB.TIME(m:n),OB.FILTERED_X(m:n));
plot(OB.TIME(m:n),OB.PRE_X(m:n));
plot(OB.DETEC_TIME_E(m1:n1),OB.DETEC_X_E(m1:n1),'.');

if FLAG_LABEL_DATA
    for i = m1:n1
        label = num2str(OB.DETEC_STAMP(i));
        text(OB.DETEC_TIME_E(i),OB.DETEC_X_E(i),label);
    end
end

ylabel('x [m]')
legend('OT','filtered','prediction','measurement')
grid on
subplot(2,1,2)
hold on
plot(OB.TIME(m:n),OB.Y_OT(m:n));
plot(OB.TIME(m:n),OB.FILTERED_Y(m:n));
plot(OB.TIME(m:n),OB.PRE_Y(m:n));
plot(OB.DETEC_TIME_E(m1:n1),OB.DETEC_Y_E(m1:n1),'.');

if FLAG_LABEL_DATA
    for i = m1:n1
        label = num2str(OB.DETEC_STAMP(i));
        text(OB.DETEC_TIME_E(i),OB.DETEC_Y_E(i),label);
    end
end
xx = [OB.TIME(m) OB.TIME(n)];
yy = [0 0];
plot(xx,yy,'k');
ylabel('y [m]')
xlabel('time [s]')

% figure(plot_num+1)
% subplot(2,1,1)
% hold on
% plot(OB.TIME(m:n),OB.RANSAC_X(m:n))
% plot(OB.TIME(m:n),OB.RANSAC_VX(m:n))
% legend('ransac_x','ransac_vx')
% grid on
% subplot(2,1,2)
% hold on
% plot(OB.TIME(m:n),OB.RANSAC_Y(m:n))
% plot(OB.TIME(m:n),OB.RANSAC_VY(m:n))
% legend('ransac_y','ransac_vy')
% grid on
% 
% figure(plot_num+2)
% plot(OB.DETEC_TIME_E(m1:n1),OB.DETEC_STAMP(m1:n1),'.')
% xlabel('time [s]')
% ylabel('time stamp')
% grid on

end