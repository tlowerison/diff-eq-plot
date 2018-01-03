function f = diffEqGen(F)
    function q = lambda(Q, t)
        d = size(Q, 1);
        q = 1:d;
        for i = 1:d
            tempF = F{i};
            q(i) = tempF(Q, t);
        end
    end
    f = @lambda;
end