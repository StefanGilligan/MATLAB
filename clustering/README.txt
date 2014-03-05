Done up to and including part 3 of CW1a. 

Call the functions like this:

[train, test] = load_files('sg12464.train', 'sg12464.test')

See which of the graphs has 3 clusters. In my case it's (1,3).

[x_train, x_test] = choose_features(train, test, 1, 3)

[one, two, three, sumd] = plot_clusters(x_train, x_test)