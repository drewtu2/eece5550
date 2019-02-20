function simulation(time)
    
    % Basic setup
    close all;
    axis([-5 45 -10 30]);
    axis equal;
    hold on;
    pause on;
    
    % Create Locations
    t = 0.05:0.5:2*pi;
    
    % Object
    objx = cos(t) + 20;
    objy = sin(t) + 10;
    obj = polyshape({objx},{objy});
    
    % Robot
    robx = .5*cos(t) + 5;
    roby = .5*sin(t) + 10;
    rob = polyshape({robx},{roby});
    
    room_outline = [0, 0, 40, 20];
    table_pos = [17, 7, 6, 6];
    obj_pos = [20 10 1 1];
        
    % Plot positions
    rectangle('Position', room_outline);
    rectangle('Position', table_pos, 'FaceColor','blue');
    %rectangle('Position', obj_pos,'Curvature', [1 1], 'FaceColor', 'green');
    plot(obj, 'FaceColor', 'green', 'FaceAlpha', 1);
    
    robot_pos = [5 10 1 1]';
    robot_v   = [3 1];
    transition = eye(4);
    
    function [ret_p, ret_t] = fix_bounds(tp, rp, t)
        if tp(1) > 40 || tp(1) < 0
            t(1, 4) = -t(1,4);
        end
%         if  17 < tp(1) < 23 && 7 < tp(2) < 13
%             t(1, 4) = -t(1,4);
%             t(2, 4) = -t(2,4);
%         end
        if tp(2) > 20 || tp(2) < 0
            t(2, 4) = -t(2,4);
        end
        
        ret_p = t*rp;
        ret_t = t;
    end
    
    for epoch=0:.5:time
        transition(1, 4) = cos(epoch/time * 2*pi)*robot_v(1);
        transition(2, 4) = sin(epoch/time * 2*pi)*robot_v(2);
        
        temp_pos = transition * robot_pos;
        
        [robot_pos, transition] = fix_bounds(temp_pos, robot_pos, transition);
        
        % Robot
        robx = .5*cos(t) + robot_pos(1);
        roby = .5*sin(t) + robot_pos(2);
        rob = polyshape({robx},{roby});
        plot(rob, 'FaceColor', 'red', 'FaceAlpha', 1)
        pause(.5);
    end
    
    

end