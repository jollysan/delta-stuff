`timescale 1ns / 1ps

module par_gen(x,y,z,result);
input x,y,z;
output result;

//şansımıza xor gate tam da istediğimizi yapıyor
//1 için even parity, yani çift sayıda 1 olursa sonuç 0	(tek sayıda 0)
//0 için odd parity,  yani çift sayıda 0 olursa sonuç 1 (tek sayıda 1)
//ikisi de aynı şey demek
xor (result,x,y,z); 
//daha fazla sayıda inputu test etmek istersek yine hepsini xordan geçirebiliriz
//2 input xordan 2 defa geçirsek yine aynı sonucu alıyoruz
endmodule 
