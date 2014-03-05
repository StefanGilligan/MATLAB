function [one, two, three, sumd] = plot_clusters(x_train, x_test)

    hold off
    
    [k,cen,sumd] = kmeans(x_train, 3);
    
    % Each matrix contains the points for their cluster. 
    % e.g. one = all points for cluster 1
    one = [x_train((find(k==1)),1) x_train((find(k==1)),2)];
    two = [x_train((find(k==2)),1) x_train((find(k==2)),2)];
    three = [x_train((find(k==3)),1) x_train((find(k==3)),2)];
    
    hold on
    
    % Plot each cluster in a different colour
    scatter(one(:,1), one(:,2), 'r.')
    scatter(two(:,1), two(:,2), 'g.')
    scatter(three(:,1), three(:,2), 'b.')
    
    [n, m] = size(x_test);
    
    % Initialise matrices, otherwise matlab complains
    distances = zeros(n, 3);    
    nearest_neighbour = zeros(n, 1);
    
    % For each test point, calculate the distance between each centroid and
    % get the minimum. Plot the point in the correct colour. 
    for i=1:n
        distances(i, 1) = pdist2(x_test(i,:), cen(1,:));
        distances(i, 2) = pdist2(x_test(i,:), cen(2,:));
        distances(i, 3) = pdist2(x_test(i,:), cen(3,:));
        nearest_neighbour(i) = find(distances(i,:) == min(distances(i,:)));
        if nearest_neighbour(i) == 1
            plot(x_test(i,1), x_test(i,2), 'r+');
        elseif nearest_neighbour(i) == 2
            plot(x_test(i,1), x_test(i,2), 'g+');
        else
            plot(x_test(i,1), x_test(i,2), 'b+');
        end
    end

    voronoi(cen(:,1), cen(:,2), 'k*');
    
    hold on
    
    