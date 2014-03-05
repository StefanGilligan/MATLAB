function [train, test] = load_files(training, test)

    train = load(training);
    
    test = load(test);
    
    hold off
    
    plotmatrix(train, train);