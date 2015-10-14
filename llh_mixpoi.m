function llh=llh_mixpoi(data,pai,lambda,K)
llh=0;
for i=1:length(data)
    p=0;
    for j=1:K
        p=p+pai(j)*cal_possion(data(i),lambda(j));
    end
    llh=llh+log(p);
end

end
