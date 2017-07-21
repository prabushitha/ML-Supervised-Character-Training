p = 0.2 * rand(1, 200) + 0.6;
q = 0.2 * rand(1, 200) + 0.9;
r = 0.2 * rand(1, 200) + 1.3;
s = 0.2 * rand(1, 200) + 1.7;

row1 = [p, q, r, s, s];
row2 = [q, r, s, p, r];
row3 = [r, s, p, q, q];
row4 = [s, p, q, r, p];

X = [row1; row2; row3; row4];
X_Train = [];
X_Test = [];

for i = 1:1000
    if mod(i, 4) == 0
        X_Test = [X_Test, X(:, i)];
        continue
    end
    X_Train = [X_Train, X(:, i)];
end
    
sMap = selforgmap([5, 1]);
sMap.trainParam.epochs = 1000;

[sMap, tr] = train(sMap, X_Train);

plotsomhits(sMap, X_Train);
plotsomplanes(sMap);
plotsomnd(sMap);

weights = sMap.iw{:,:};
disp(weights);
view(sMap);

test = vec2ind(sMap(X_Test))

