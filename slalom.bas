
10 nc=19:rem num cust chars
20 fori=0to8*nc-1:readv:poke7168+i,v:next:rem load cust chars
30 poke36869,255:rem cust turn chars on
40 poke36879,25:?chr$(147):rem wht bkg and cln scr
50 poke36878,15:poke36874,220:fort=1to500:next:poke36878,0:poke36874,0:rem start sound
60 w=5:gd=10:r=gd:sc=0:rem set gate width and dist
70 x=9:y=4:a=90:gosub700:rem set start pos and start
80 fori=1to22:?chr$(81):next:rem goto bottom page

100 geta$:ifa$<>""thena=asc(a$):rem get key
110 ifa=80thengosub500:rem p=right
120 ifa=79thengosub600:rem 0=left
130 ifa=90thengosub700:rem z=down
140 ifa=32then900:rem space=end

150 ifr<gdthen?chr$(81):rem empty rows between gates
160 ifr=gdthengosub200:rem every gd rows show gate
165 rem poke7680,49+sc:rem show score
170 r=r+1:goto100: rem increase row count and loop

200 rem show gate
210 s=2+rnd(1)*(15-w):rem rnd horiz pos
220 fori=0tos:?chr$(144)chr$(80);:next:?chr$(28)chr$(82);:rem left spc
230 fori=1tow:?chr$(144)chr$(81);:next:?chr$(31)chr$(82);:rem gate space
240 fori=0to17-w-s:?chr$(144)chr$(80);:next:?chr$(144)chr$(80): rem right spc
250 r=0:sc=sc+1:return:rem reset row count and loop

500 rem skier go right
510 x=x+1: m=x+22*y:ifpeek(7680+m+22+1)=16orpeek(7680+m+22+1)=18then800:rem detect hit/out gate
520 poke38400+m-1,1:poke38400+m+21,1:poke38400+m-22,1:poke38400+m-23,1:rem del prev char
530 poke7680+m,0:poke7680+m+1,1:poke7680+m+22,2:poke7680+m+23,3:rem draw new char
540 poke38400+m,0:poke38400+m+1,0:poke38400+m+22,0:poke38400+m+23,0:rem set char color
550 return

600 rem skier go left
610 x=x-1:m=x+22*y:ifpeek(7680+m+22)=16orpeek(7680+m+22)=18then800:rem detect hit/out gate
620 poke38400+m+2,1:poke38400+m+24,1:poke38400+m-20,1:poke38400+m-21,1:rem del prev old
630 poke7680+m,4:poke7680+m+1,5:poke7680+m+22,6:poke7680+m+23,7:rem draw new char
640 poke38400+m,0:poke38400+m+1,0:poke38400+m+22,0:poke38400+m+23,0:rem set char color
650 return

700 rem skier go down
710 m=x+22*y
720 ifpeek(7680+m+22)=16orpeek(7680+m+23)=16orpeek(7680+m+22)=18orpeek(7680+m+23)=18then800:rem detect hit/out gate
730 poke38400+m-21,1:poke38400+m-22,1:rem del old char
740 poke7680+m,8:poke7680+m+1,9:poke7680+m+22,10:poke7680+m+23,11:rem draw new char
750 poke38400+m,0:poke38400+m+1,0:poke38400+m+22,0:poke38400+m+23,0:rem set color
760 return

800 rem fallen skier
810 fori=20to23:poke38400+m-i,1:next:rem del old char over
820 poke38400+m-1,1:poke38400+m+2,1:rem del old char sides
830 poke7680+m,12:poke7680+m+1,13:poke7680+m+22,14:poke7680+m+23,15:rem draw new char
840 poke38400+m,0:poke38400+m+1,0:poke38400+m+22,0:poke38400+m+23,0:rem set char color
850 poke36878,15:poke36874,155:fort=1to1000:next:poke36878,0:poke36874,0:rem sound
860 fort=1to1000:nextt:?chr$(147):goto50:rem restart

900 ?chr$(147)chr$(31):poke36879,27:rem on exit reset std color and chars
910 poke36869,240:rem set std chars
920 end

1000 data 0,0,0,0,1,3,2,28
1010 data 56,56,56,112,240,248,252,230
1020 data 96,1,7,158,113,12,0,0
1030 data 243,182,104,208,224,56,0,0
1040 data 28,28,28,14,15,31,63,103
1050 data 0,0,0,0,128,192,64,56
1060 data 207,109,22,11,7,28,0,0
1070 data 6,128,224,121,142,48,0,0
1080 data 1,3,3,7,11,12,27,19
1090 data 128,192,192,224,208,48,216,200
1100 data 19,19,18,18,2,2,2,2
1110 data 200,200,72,72,64,64,64,64
1120 data 0,3,14,30,54,102,7,35
1130 data 64,96,48,24,28,54,240,232
1140 data 35,35,51,31,7,1,3,3
1150 data 136,136,132,196,228,60,132,128
1160 data 0,0,0,0,0,0,0,0
1170 data 0,0,0,0,0,0,0,0
1180 data 255,255,255,255,255,129,129,129
