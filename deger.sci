function ilmesafe1 = deger()
    ds = readxls('ilmesafe.xls')
    ds2 = ds(2)                         // uzaklık matrisimizi çekmek için xls dosyasından değer okuyoruz ve sonrasında gerekli atamaları yapıyoruz.
    ilmesafe1 = ds2(2 : 82 , 4 : 84)
endfunction
