pkg load nnet

#creating the network
Pr = min_max(P);
# 2 hidden layer with 6,4 hidden nodes, output layer with 3 output nodes
net = newff(Pr,[6,4,3]);

# train network
net.trainParam.epochs = 50;
net = train(net, P, T, [], [], VV);

save trained_network.mat net;

disp("Training completed");

