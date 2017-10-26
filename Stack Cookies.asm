00401030 _main  proc near
00401030
00401030 arg_0 =dword ptr 8
00401030 arg_4 =dword ptr 0Ch
00401030 
00401030   push ebp
00401031   mov ebp,esp
00401033   cmp [ebp+arg_0],2
00401037   jge short loc_40103E
00401039   or eax,0FFFFFFFFh
0040103C   jmp short loc_40104C
0040103E
0040103E short_loc:
0040103E   mov eax,[ebp+arg_4]
00401041   mov ecx,[eax+4]
00401044   push ecx
00401045   call _make_bo@4
0040104A   xor eax,eax
0040104C   
0040104C loc_40104C:
0040104C   pop ebp
004014D    retn
0040104D _main endp   



.text:00401000; int_stdcall
.text:00401000 _make_bo@4  proc near
.text:00401000 var_14=byte ptr -14h
.text:00401000 var_4 =dword ptr -4
.text:00401000 arg_0=dword ptr 8
.text:00401000
.text:00401000   push ebp
.text:00401001   mov ebp,esp
.text:00401003   sub esp,14h
.text:00401006   mov eax,dword_40C004 ;save cookie's value in eax 
.text:0040100B   xor eax,ebp ;modulo 2 between curent cookie's value and stack_ pointer
                             ;this value is very imporant beceause will be used to check 
                             ;if cookie is correct ( if not close application beceause 
                             ;hacker can modify sth)
.text:0040100D   mov[ebp+var_4],eax
.text:00401010   mov eax,[eabp_arg_0]
.text:00401013   push eax
.text:00401014   lea ecx,[ebp_var_14]
.text:00401017   push ecx
.text:00401018   call _strcpy
.text:0040101D   add esp,8
.text:00401020   lea edx,[ebp+var_14]
.text:00401023   push edx

.text:00401024   push offset aLoadedS;
.text:00401029   call _printf
.text:0040102E   add esp,8
.text:00401031   mov ecx,[ebp+var_4]
.text:00401034   xor ecx,ebp ; if everything goes  correctly  we will get here
                             ;the same value like in xor eax,ebp ( orginal cookie's value)

.text:00401036  call @_security_check_cookie(x); this function chekcs if cookire is correct or not 
.text:0040103B  mov esp,ebp
.text:0040103D  pop ebp
.text:0040103E  retn 4
.text:0040103E _make_bo@4 endp



.text:0040106E ;_security_check_cookie(x)
.text:0040106E @_security_check_cookie@4 proc near
.text:0040106E
.text:0040106E  cmp ecx,dword_40C004
.text:00401074  jnz short loc_401078
.text:00401076  rep retn
.text:00401078
.text:00401078
.text:00401078 short loc_401078:
.text:00401078  jmp _report_gsfailure
.text:00401078 @_security_check_cookie@4 endp


