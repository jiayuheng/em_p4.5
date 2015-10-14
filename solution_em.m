function [z,lambda,pai]=solution_em(data,K,numStep)
%% init, random selete data as the component mean; and 
% randi(length(data),1,K)
numSam=length(data);
r=randperm(numSam);

% for K=2
% d1=data(r(1:round(numSam/K))); 
% d2=data(r(round(numSam/K)+1:numSam));

for k=1:K
    if k<K
        b=(k-1)*round(numSam/K)+1;
        e=k*round(numSam/K);
        express=['=data(r(' num2str(b) ':' num2str(e) '))'];
        eval(['d' num2str(k) express]);
    end
    if k==K
        b=(k-1)*round(numSam/K)+1;
        e=numSam;
        express=['=data(r(' num2str(b) ':' num2str(e) '))'];
        eval(['d' num2str(k) express]);     
    end
    
end
% eval(['d' num2str(K) express])

% sum(d1)
% length(d1)
lambda=[];
pai=[];
for k=1:K
    la=eval(['sum(d' num2str(k) ')/length(' num2str(k) ')']);
    lambda=[lambda la];
    if k<K
        pai_temp=(1-sum(pai))*rand;
        pai=[pai pai_temp];
    end
    if k==K
        pai_temp=1-sum(pai);
        pai=[pai pai_temp];
    end
        
        
        
end

% lambda=[sum(d1)/length(d1),sum(d2)/length(d2)];% for K=2

% pai=[length(d1)/numSam+0.01,length(d2)/numSam-0.01];
% pai=ones(1,K)/K;
% pai=[];
% for k=1:K
%     la=eval(['sum(d' num2str(k) ')/length(' num2str(k) ')']);
%     lambda=[lambda la];
% end

% pai1=length(d1)/numSam;
% pai2=length(d2)/numSam;
z=zeros(K,numSam);
size(z)
for iter=1:numStep
%run E-step
    for i=1:numSam
        den=0;
        for j=1:K
            den=den+pai(j)*cal_possion(data(i),lambda(j));
%             pai(j)*cal_possion(data(i),lambda(j))
        end
%         den
        for j=1:K
            z(j,i)=pai(j)*cal_possion(data(i),lambda(j))/den;
        end
    end
%run M-step
    for j=1:K
        pai(j)=sum(z(j,:))/numSam;
        lambda(j)=sum(z(j,:).*data)/sum(z(j,:));
    end  
% pai
% lambda
end


