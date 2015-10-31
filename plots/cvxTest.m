cvx_begin
    variable x(2)
    minimize( norm(A*x - y) )
    subject to
        abs(x(1)) <= 3 %#ok<NOPTS>
cvx_end