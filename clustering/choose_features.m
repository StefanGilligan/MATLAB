function [x_train, x_test] = choose_features(train, test, x,y)

    x_train = [train(:,x) train(:,y)];
    x_test = [test(:,x) test(:,y)];