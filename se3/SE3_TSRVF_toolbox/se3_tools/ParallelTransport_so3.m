function Bt = ParallelTransport_so3(O1,B,O2)
A = log_map_so3(O1,O2)';
tmp = exp_map_so3(O1,0.5*A);
Bt = O1*tmp*(O1'*B)*tmp;
end