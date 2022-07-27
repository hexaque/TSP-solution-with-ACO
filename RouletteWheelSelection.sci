function [j] = RouletteWheelSelection(P)


j = [];

r = rand(); 
C = cumsum(P);   //RouletteWheelSelection yapmak için gerekli tanımlamaları yapıp kümülatif toplam yaptırıyoruz.
j = find(r<C,1);    //RouletteWheelSelection feromon miktarına göre RouletteWheelSelection yapılıyor
endfunction 
