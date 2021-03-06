function [solutions, f_values, populace] = PSO_swarm_plot(Np, T, fitness, lb, ub, d, w, c1, c2)

    % Generate random population P within lb, ub
    % d = dimension of search space

    P = random(lb, ub, Np, d, 'real');
%     P = starter;
    v = random(lb, ub, Np, d, 'real');
    
    solutions = zeros(T+1,d);
    f_values = zeros(T+1,1); 
    populace = zeros(Np, d, T+1);
    populace(:,:,1) = P;
    
    f = zeros(Np,1);

    %f = fitness(P);
    for i = 1:Np
        f(i) = fitness(P(i,:));
    end
    
    
    pbest = P;
    f_pbest = f;

    [f_gbest, ind] = min(f_pbest);
    gbest = P(ind, :);

    f_values(1) = f_gbest;
    solutions(1,:) = gbest;

    for i = 1:T
        for j = 1:Np
            
            r1 = random(0,1,1,d,'real');
            r2 = random(0,1,1,d,'real');

            v(j,:) = w*v(j,:) + c1*r1.*(pbest(j,:) - P(j,:)) + c2*r2.*(gbest - P(j,:));

            P(j,:) = bound_it(P(j,:) + v(j,:), lb, ub);

            f(j) = fitness(P(j,:));

            if f(j) < f_pbest(j)
                f_pbest(j) = f(j);
                pbest(j,:) = P(j,:);

                if f_pbest(j) < f_gbest
                    f_gbest = f_pbest(j);
                    gbest = pbest(j,:);
                end
            end
        end
    
        f_values(i+1) = f_gbest;
        solutions(i+1,:) = gbest;
        populace(:,:,i+1) = P;
    end
end

function stuff = random(lb, ub, m, n, mode)
    % Generates a random matrix of size mxn containing
    % values in [lb, ub]
    % mode signifies integer or real
    if strcmp(mode,'real')
        stuff = lb + (ub - lb).*rand(m,n);
    elseif strcmp(mode,'int')
        stuff = randi([lb ub], m, n);
    end
end

function X_bound = bound_it(X, lb, ub)
    % bounds vector X to [lb, ub]
    X_bound = min(max(X,lb),ub);
end    