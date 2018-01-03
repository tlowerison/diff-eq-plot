function timeEvolvePlot(Q, DE, Ti, Tf, dt, varLabels)
    R = timeEvolve(Q, DE, Ti, Tf, dt);
    t = R{1};
    Qt = R{2};
    legendText = {};
    count = 1;
    hold on;
    for i = 1:size(Qt,1)
        for j = 1:size(Qt,2)
            if varLabels(i,j) ~= "0"
                plot(t, squeeze(Qt(i,j,:)), 'DisplayName', varLabels(i,j));
                legendText{count} = varLabels(i, j);
                legend(legendText);
                count = count + 1;
            end
        end
    end
    hold off;
end