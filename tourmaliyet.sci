function [L] = tourmaliyet(model,tour)

L = [];
n = length(tour);               
tour = [tour (tour(1))]; 
L = 0; 
for i =1:n
    L=L+model.D(tour(i),tour(i+1));             //Her bir turun değerini bulmak için L değişkeni üzerine gezilen ve sıradaki
                                                //  şehirler arasındaki fark alınıyor ve döngü içerisinde toplanıyor
   
end




endfunction
