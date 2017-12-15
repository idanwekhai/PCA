GeneA = [1.1 0.5 27 1.4 1.9 2.6 3.2 8.1 4.1 0.4 9.4 13 14.1 9.1 18.2 2.1 5.3 16.4 7 21.1 0.3 7.5 17.1 5.2 13.1];
GeneB = [11.4 2.7 3.2 4.4 1.4 6.8 2.2 23.6 21.9 10.2 14.7 9.1 3.3 6.1 10.2 4.8 6.6 2.8 8 5.7 0.2 8.0 8.8 11.5 4.1];
GeneC = [0.7 0.1 13.4 0.9 1.4 1.1 1.5 3.1 1.4 0.4 3.7 8.5 9.1 2.9 7.8 0.9 3.6 6.4 3.1 9.4 0.01 3.2 10.1 3.2 5.4];
GeneD = [21.5 14.3 1.1 9 13.6 12.3 12.8 11.1 2.6 2.1 2.9 4.6 7.1 2.4 3.6 11.7 18.3 25.3 15.2 2.6 6.2 6.1 3.3 15.0 7.1];
GeneE = [0.7 0.1 12.7 0.7 1.1 1.1 1.2 6.2 3.0 0.2 4.1 7.3 7.2 5.1 9.0 0.8 2.2 6.9 3.1 10.9 0.2 5.4 9.1 3.0 6.0];

%1
matrix = [GeneA; GeneB; GeneD; GeneD; GeneE];

%2
GeneA_centralized = GeneA - mean(GeneA);
GeneB_centralized = GeneB - mean(GeneB);
GeneC_centralized = GeneC - mean(GeneC);
GeneD_centralized = GeneD - mean(GeneD);
GeneE_centralized = GeneE - mean(GeneE);

matrix_centralized = [GeneA_centralized; GeneB_centralized; GeneC_centralized; GeneD_centralized; GeneE_centralized];

%3
[m n] = size(matrix);
cov = ( matrix_centralized * matrix_centralized' ) / m;

%4
[V, D] = eig(cov);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The two basis vector belonging to axes with the 
% greatest variance are vectors in the 4th and 5th 
% columns and their corresponding eigenvalues are
% 192.6301 and 433.3582 respectively.


%5
basis_vector = V(:,4:5);

coordinates = matrix_centralized' * basis_vector;

X=coordinates(:,2);
Y=coordinates(:,1);

figure(4); scatter(X, Y);
axis ([-20 30, -20 20,]);
xlabel('Principal component 1 coordinate');
ylabel('Principal component 2 coordinate');
