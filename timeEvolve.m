function q = timeEvolve(Q, DE, Ti, Tf, dt)
    % Returns a cell array consisting of:
    % Element 1: A time array from Ti to Tf with step of dt.
    % Element 2: The time evolution of all variables in Q.
    n = (Tf - Ti) / dt;
    Q = [Q, zeros(size(Q, 1), 1)];
    N = size(Q, 2);
    
    function h = timeEvolveHelper(Q0, dt)
        Qn = Q0;
        for j = 1:N-1
            Qn(:,N-j) = Qn(:,N-j+1) * dt + Qn(:,N-j);
        end
        h = Qn;
    end

    Q(:,:,1) = Q;
    for i = 2:n+1
        t = Ti + (i - 2) * dt;
        Q(:,N,i-1) = DE(Q(:,1:N-1,i-1), t);
        Q(:,:,i) = timeEvolveHelper(Q(:,:,i-1), dt);
    end
    
    q = {Ti:dt:Tf, Q};
end