function [] = plot_real_time_trajectory(plot_num)
global OB m n

figure(plot_num)
 xlim([-1 6])
 ylim([-1 7])
time = OB.TIME(m:n);
x_OT = OB.X_OT(m:n);
y_OT = OB.Y_OT(m:n);
z_OT = -OB.Z_OT(m:n);
a1 = animatedline();
t0 = clock();
step = 50;
pointer = 100;
while(1)
    if abs(etime(clock,t0) - time(pointer)) < 0.5
        tk = time(pointer);
        xk = x_OT(pointer);
        yk = y_OT(pointer);
        zk = z_OT(pointer);
        addpoints(a1,xk,yk,zk);   
        drawnow
        if pointer + step < length(OB.TIME)
            pointer = pointer + step;
        else
            break;
        end
        
    end
end

end
