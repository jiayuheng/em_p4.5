%% for data London
clear
clc
data=[zeros(1,229),ones(1,211),2*ones(1,93),3*ones(1,35),4*ones(1,7),5*ones(1,1)];

%% for K=1 we  can find lambda=sum(data)/n
n=length(data);
lambda=sum(data)/n;
%% for K=1:5 train model by EM and test LLH
clc
K=5 %% set K form 1:5

[Z,lambda,pai]=solution_em(data,K,100)%numStep=100
llh=llh_mixpoi(data,pai,lambda,K)






%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% for city Antwerp
clear
clc
data=[zeros(1,325),ones(1,115),2*ones(1,67),3*ones(1,30),4*ones(1,18),5*ones(1,21)];

%% for K=1 we  can find lambda=sum(data)/n
n=length(data);
lambda=sum(data)/n;
clc
K=5
[Z,lambda,pai]=solution_em(data,K,100)%numStep=100
llh=llh_mixpoi(data,pai,lambda,K)

% llh=llh_mixpoi(data,0.5*ones(2,576),[0.8958,0.8958],2)


