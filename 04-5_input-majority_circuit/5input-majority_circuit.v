module majority_ckt(input [5:1] x, output z);
wire [9:0] w;


//bunu tekrar yapmaya gerek duymadım, aynısını kopyaladım
//basitçe herhangi 3 (veya daha fazla)input 1 olduğunda output 1 olsun
//ring counterdaki gibi WIDTH parametre yapıp n-bit majority circuit yapabilir miyim diye düşündüm ama aklıma gelmedi

// instantiate with And Gates
and and1(w[0],x[3],x[4],x[5]);
and and2(w[1],x[2],x[4],x[5]);
and and3(w[2],x[2],x[3],x[5]);
and and4(w[3],x[2],x[4],x[3]);
and and5(w[4],x[1],x[4],x[5]);
and and6(w[5],x[1],x[3],x[5]);
and and7(w[6],x[1],x[4],x[3]);
and and8(w[7],x[2],x[1],x[5]);
and and9(w[8],x[2],x[4],x[1]);
and and10(w[9],x[2],x[1],x[3]);

//yukarıdaki 3 input kombinasyonlarından herhangi biri karşılandığında or ile outputu 1 yapıyor
or or1(z,w[0],w[1],w[2],w[3],w[4],w[5],w[6],w[7],w[8],w[9]);

endmodule
