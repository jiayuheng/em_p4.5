function po=cal_possion(x,lambda)
po=exp(-1*lambda)*lambda^x/gamma(x+1);