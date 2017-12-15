%1
GeneA = [1.1 0.5 27 1.4 1.9 2.6 3.2 8.1 4.1 0.4 9.4 13 14.1 9.1 18.2 2.1 5.3 16.4 7 21.1 0.3 7.5 17.1 5.2 13.1];
GeneB = [0.2 0.6 11 0.9 1.2 0.9 1.8 4.4 2.5 0.3 5.9 7.9 5.9 6.1 7.2 1.8 1.6 6.1 5 10.1 0.2 4.0 8.8 1.5 4.2];
matrix = [GeneA; GeneB];

%2
X=matrix(1,:);
Y=matrix(2,:);
figure(1); scatter(X, Y);
axis ([-10 30, -10 30,]);
xlabel('GeneA expression level');
ylabel('GeneB expression level');


%3
X_centralized = X - mean(X);
Y_centralized = Y - mean(Y);
figure(2); scatter(X_centralized, Y_centralized);
axis ([-10 30, -10 30,]);
xlabel('Centered GeneA expression level');
ylabel('Centered GeneB expression level');

%4
variance_array = [];
for i = 0:0.02:pi/2;
	v = [1, tan(i)];
    v_norm = (1/sqrt(1+((tan(i))**2))) * v';
    product = matrix' * v_norm; 
    variance = var(product);    %calculate variance
    variance_array = [variance_array, variance]; %update the variance array
    i++;
endfor;



matrix_centralized = [X_centralized;Y_centralized];
matrix_centralized_t = matrix_centralized';
max_variance = max(variance_array);
index = find(variance_array == max_variance); %find the index of the max_variance in the variance array
gradient = tan(0.02*index);

%5
figure(3); scatter(X_centralized, Y_centralized);
axis ([-10 30, -10 30,]);
xlabel('Centered GeneA expression level');
ylabel('Centered GeneB expression level');
hold on                       
plot([-10, 30], [gradient * -10, gradient * 30], 'b');

gradient_of_perpendicular = -(1/gradient);

plot([-10, 30], [gradient_of_perpendicular * -10, gradient_of_perpendicular * 30], 'r');