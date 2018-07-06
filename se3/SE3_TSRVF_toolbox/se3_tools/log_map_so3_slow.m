function [direction] = log_map_so3(start_point, end_point)

%     axis_angle = vrrotmat2vec(start_point'*end_point);
%         
%     direction = axis_angle(1:3)*axis_angle(4);    
O1 = start_point;
O2 = end_point;
direction = O1*logm(O1'*O2);
end
