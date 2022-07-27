
clc

model = createmodel(); 
tic();
NVar = 81; // şehir sayısı

MaxIT = 100;  // iterasyon sayısı
NAnt = 20; //karınca sayısı
eta = 1./model.D; 
alpha = 1;                      // gerekli parametre tanımlamalarını yapıyoruz
beta = 1; 
rho = 0.5;          //buharlaşma oranı 
tau0 = 1; 
Q=1;
tau = tau0*ones(NVar,NVar);  //başlangıçta tüm yollara eşit feromon bırakıyor


empty_ant.tour = [];
empty_ant.maliyet = []; 
bestant.maliyet = %inf;  // en iyi çözümü sonsuz değer ataması yapıyoruz

ant= repmat(empty_ant,NAnt,1);

for it = 1:MaxIT
  for k = 1:NAnt
 
    ant(k).tour = grand(1,1,"uin",1,NVar);  // her karınca rastgele bir şehirden başlıyor
  
  
    for l = 2:NVar
      
      i=ant(k).tour($);
      P = tau(i,:).^alpha.*eta(i,:).^beta; 
      P(ant(k).tour)=0; 
      P = P/sum(P); 
     
      j = RouletteWheelSelection(P); 
      ant(k).tour=[ant(k).tour j];
    end
  
    
     ant(k).maliyet= costfunction(ant(k).tour);
    if ant(k).maliyet< bestant.maliyet then  // her bir karınca için toplam maliyetin en az olup olmadığı kontrolü yapılıyor
                                                    // eğer koşul sağlanırsa en iyi karınca ve en iyi tur atamaları yapılıyor
      bestant = ant(k); 
      bestant.tour=ant(k).tour; // istenildiği durumda en iyi tur için bestant.tour çağırılabilir.
    end
  end



  //%eromon güncelleme işlemi
    for k = 1:NAnt
    
    tour = ant(k).tour; 
    tour = [tour tour(1)]; 
    
        for l =1:NVar
            i = tour(l);
            j= tour(l+1);
            tau(i,j) = tau(i,j)+Q/ant(k).maliyet; 
        end
    end

  //feromon buharlaştırma işlemi
  tau = (1-rho)*tau; 
  //%en iyi değeri kaydet
   BestCost(it)=bestant.maliyet; 
  
// ekrana iterasyon sayısı ve her iterasyon için en iyi çözüm yazdırılıyor
 disp("iterasyon:" + string(it) + "  BestCost= " + string(BestCost(it)))
time=toc();
disp(time) // zamanı tutmak için kullanılan fonksiyon

end
