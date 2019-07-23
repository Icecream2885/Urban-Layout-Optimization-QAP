$title Traffic Assignment with System Optimal Based on Link
*by Jialu Fu, Lu (Carol) Tong, Xuesong Zhou
*OPTIONS  ITERLIM=100000, RESLIM = 1000000, SYSOUT = OFF, SOLPRINT = OFF, NLP = MINOS5, LIMROW = 0, LIMCOL = 0 ;
*option optcr=0,optca=0.99;

set i node /101, 102, 103, 104, 105, 1*24, 401, 402, 403, 404, 405/;

alias (i,j);
alias (i,k);

parameter current(i);
current(i)=0;

parameter flag(k)/
101  101
102  102
103  103
104  104
105  105
401  401
402  402
403  403
404  404
405  405
/;

parameter demand(i) /
101  3000
102  2000
103  1000
104  750
105  500
401  2500
402  2500
403  1500
404  500
405  250
/;

parameter origin_node(i) /
101  1
102  1
103  1
104  1
105  1
/;

parameter destination_node(i) /
401  1
402  1
403  1
404  1
405  1
/;

parameter fft(i,j) /
101. 1   0.01
101. 3   0.01
101. 12  0.01
101. 13  0.01
101. 24  0.01
102. 1   0.01
102. 3   0.01
102. 12  0.01
102. 13  0.01
102. 24  0.01
103. 1   0.01
103. 3   0.01
103. 12  0.01
103. 13  0.01
103. 24  0.01
104. 1   0.01
104. 3   0.01
104. 12  0.01
104. 13  0.01
104. 24  0.01
105. 1   0.01
105. 3   0.01
105. 12  0.01
105. 13  0.01
105. 24  0.01
6. 401   0.01
7. 401   0.01
18. 401  0.01
19. 401  0.01
20. 401  0.01
6. 402   0.01
7. 402   0.01
18. 402  0.01
19. 402  0.01
20. 402  0.01
6. 403   0.01
7. 403   0.01
18. 403  0.01
19. 403  0.01
20. 403  0.01
6. 404   0.01
7. 404   0.01
18. 404  0.01
19. 404  0.01
20. 404  0.01
6. 405   0.01
7. 405   0.01
18. 405  0.01
19. 405  0.01
20. 405  0.01
1. 2    6
1. 3    4
2. 1    6
2. 6    5
3. 1    4
3. 4    4
3. 12   4
4. 3    4
4. 5    2
4. 11   6
5. 4    2
5. 6    4
5. 9    5
6. 2    5
6. 5    4
6. 8    2
7. 8    3
7. 18   2
8. 6    2
8. 7    3
8. 9    10
8. 16   5
9. 5    5
9. 8    10
9. 10   3
10. 9   3
10. 11  5
10. 15  6
10. 16  4
10. 17  8
11. 4   6
11. 10  5
11. 12  6
11. 14  4
12. 3   4
12. 11  6
12. 13  3
13. 12  3
13. 24  4
14. 11  4
14. 15  5
14. 23  4
15. 10  6
15. 14  5
15. 19  3
15. 22  3
16. 8   5
16. 10  4
16. 17  2
16. 18  3
17. 10  8
17. 16  2
17. 19  2
18. 7   2
18. 16  3
18. 20  4
19. 15  3
19. 17  2
19. 20  4
20. 18  4
20. 19  4
20. 21  6
20. 22  5
21. 20  6
21. 22  2
21. 24  3
22. 15  3
22. 20  5
22. 21  2
22. 23  4
23. 14  4
23. 22  4
23. 24  2
24. 13  4
24. 21  3
24. 23  2
/;

parameter capacity(i,j) /
101. 1   999999
101. 3   999999
101. 12  999999
101. 13  999999
101. 24  999999
102. 1   999999
102. 3   999999
102. 12  999999
102. 13  999999
102. 24  999999
103. 1   999999
103. 3   999999
103. 12  999999
103. 13  999999
103. 24  999999
104. 1   999999
104. 3   999999
104. 12  999999
104. 13  999999
104. 24  999999
105. 1   999999
105. 3   999999
105. 12  999999
105. 13  999999
105. 24  999999
6. 401   999999
7. 401   999999
18. 401  999999
19. 401  999999
20. 401  999999
6. 402   999999
7. 402   999999
18. 402  999999
19. 402  999999
20. 402  999999
6. 403   999999
7. 403   999999
18. 403  999999
19. 403  999999
20. 403  999999
6. 404   999999
7. 404   999999
18. 404  999999
19. 404  999999
20. 404  999999
6. 405   999999
7. 405   999999
18. 405  999999
19. 405  999999
20. 405  999999
1. 2   12950.10032
1. 3   11701.7366
2. 1   12950.10032
2. 6   2479.090464
3. 1   11701.7366
3. 4   8555.26186
3. 12   11701.7366
4. 3   8555.26186
4. 5   8891.39705
4. 11   2454.413365
5. 4   8891.39705
5. 6   2473.997735
5. 9   5000
6. 2   2479.090464
6. 5   2473.997735
6. 8   2449.293823
7. 8   3920.905655
7. 18   11701.7366
8. 6   2449.293823
8. 7   3920.905655
8. 9   2525.096578
8. 16   2522.911292
9. 5   5000
9. 8   2525.096578
9. 10   6957.89421
10. 9   6957.89421
10. 11   5000
10. 15   6756.000775
10. 16   2427.458859
10. 17   2496.755347
11. 4   2454.413365
11. 10   5000
11. 12   2454.413365
11. 14   2438.254144
12. 3   11701.7366
12. 11   2454.413365
12. 13   12950.10032
13. 12   12950.10032
13. 24   2545.628076
14. 11   2438.254144
14. 15   2563.76306
14. 23   2462.395303
15. 10   6756.000775
15. 14   2563.76306
15. 19   7282.376575
15. 22   4799.590283
16. 8   2522.911292
16. 10   2427.458859
16. 17   2614.955032
16. 18   9839.948355
17. 10   2496.755347
17. 16   2614.955032
17. 19   2411.975416
18. 7   11701.7366
18. 16   9839.948355
18. 20   11701.7366
19. 15   7282.376575
19. 17   2411.975416
19. 20   2501.303782
20. 18   11701.7366
20. 19   2501.303782
20. 21   2529.95617
20. 22   2537.848596
21. 20   2529.95617
21. 22   2614.955032
21. 24   2442.678782
22. 15   4799.590283
22. 20   2537.848596
22. 21   2614.955032
22. 23   2500
23. 14   2462.395303
23. 22   2500
23. 24   2539.254218
24. 13   2545.628076
24. 21   2442.678782
24. 23   2539.254218
/;

parameter intermediate_node(i);
intermediate_node(i)=(1-origin_node(i))*(1-destination_node(i));

positive variable x(i,j) traffic flow between node i and node j;
positive variable t(i,j) travel time between node i and node j;
variable z  total cost;

equations
cost
flow_on_node_origin(i)
flow_on_node_intermediate(i)
flow_on_node_destination(i)
calculate_travel_time(i,j)
;

cost..  z=e=sum((i,j),x(i,j)*t(i,j));
flow_on_node_origin(i)$(origin_node(i)).. sum((j)$(capacity(i,j)>0.1), x(i,j)) =e= demand(i);
flow_on_node_destination(i)$(destination_node(i))..  sum((j)$(capacity(j,i)>0.1), x(j,i))=e= demand(i);
flow_on_node_intermediate(i)$(intermediate_node(i)).. sum((j)$(capacity(i,j)>0.1), x(i,j))-sum((j)$(capacity(j,i)>0.1),x(j,i))=e= 0;
calculate_travel_time(i,j)$(capacity(i,j)>0)..   fft(i,j)*(1+0.15*(x(i,j)/capacity(i,j))**4)=e=t(i,j);

model traffic_assignment_with_system_optimal_based_on_link /all/;
solve traffic_assignment_with_system_optimal_based_on_link using NLP minimizing z;
display x.l, t.l, z.l;

File TA_SO_SF_V2/TA_SO_SF_V2.dat/;
Put TA_SO_SF_V2;

loop((i,j)$(x.l(i,j)), put @1, i.tl, @6, j.tl, @11, x.l(i,j)/);
loop((i,j)$(t.l(i,j)), put @1, i.tl, @6, j.tl, @11, t.l(i,j)/);
put @1, z.l;

File TA_SO_SF_2/TA_SO_SF_2.dat/;
Put TA_SO_SF_2;
loop(k$(origin_node(k)),
    if (flag(k)=101,
   solve traffic_assignment_with_system_optimal_based_on_link using NLP minimizing z;
   current(k)= max(x.l(k,'1'),x.l(k,'3'),x.l(k,'12'),x.l(k,'13'),x.l(k,'24'));
   loop(j,
      if (x.l(k,j)<current(k),
     fft(k,j)=10000);
        ) ;
     loop((i)$(current(i)), put @1, i.tl,@11, current(i)/);
     loop((i,j)$(x.l(i,j)), put @1, i.tl, @6, j.tl, @11, x.l(i,j)/);
     loop((i,j)$(t.l(i,j)), put @1, i.tl, @6, j.tl, @11, t.l(i,j)/);
     put @1, z.l;

     else
    loop(j,
    if (x.l(k-1,j)=current(k-1),
        loop(i$(origin_node(k) and flag(i)>=flag(k)),
        fft(i,j)=10000);)
    );
    solve traffic_assignment_with_system_optimal_based_on_link using NLP minimizing z;
    current(k)= max(x.l(k,'1'),x.l(k,'3'),x.l(k,'12'),x.l(k,'13'),x.l(k,'24'));
    loop(j,
      if (x.l(k,j)<current(k),
     fft(k,j)=10000);
        ) ;
    loop((i)$(current(i)), put @1, i.tl,@11, current(i)/);
    loop((i,j)$(x.l(i,j)), put @1, i.tl, @6, j.tl, @11, x.l(i,j)/);
    loop((i,j)$(t.l(i,j)), put @1, i.tl, @6, j.tl, @11, t.l(i,j)/);
    put @1, z.l;
);

)

loop(k$(destination_node(k)),
    if (flag(k)=401,
   solve traffic_assignment_with_system_optimal_based_on_link using NLP minimizing z;
   current(k)= max(x.l('6',k),x.l('7',k),x.l('18',k),x.l('19',k),x.l('20',k));
   loop(i,
      if (x.l(i,k)<current(k),
     fft(i,k)=10000);
        ) ;
     loop((i)$(current(i)), put @1, i.tl,@11, current(i)/);
     loop((i,j)$(x.l(i,j)), put @1, i.tl, @6, j.tl, @11, x.l(i,j)/);
     loop((i,j)$(t.l(i,j)), put @1, i.tl, @6, j.tl, @11, t.l(i,j)/);
     put @1, z.l;

     else
    loop(j,
    if (x.l(j,k-1)=current(k-1),
        loop(i$(destination_node(k) and flag(i)>=flag(k)),
       fft(j,i)=10000);)
    );
     solve traffic_assignment_with_system_optimal_based_on_link using NLP minimizing z;
     current(k)= max(x.l('6',k),x.l('7',k),x.l('18',k),x.l('19',k),x.l('20',k));
    loop(j,
      if (x.l(j,k)<current(k),
     fft(j,k)=10000);
        ) ;
    loop((i)$(current(i)), put @1, i.tl,@11, current(i)/);
    loop((i,j)$(x.l(i,j)), put @1, i.tl, @6, j.tl, @11, x.l(i,j)/);
    loop((i,j)$(t.l(i,j)), put @1, i.tl, @6, j.tl, @11, t.l(i,j)/);
     put @1, z.l;
);

)

