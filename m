From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91025] nouveau fails to run with NV5 [Riva TNT2 /
	TNT2 Pro]
Date: Fri, 19 Jun 2015 03:04:15 +0000
Message-ID: <bug-91025-8800-4J6GE6cOsr@http.bugs.freedesktop.org/>
References: <bug-91025-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0690105221=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91025-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0690105221==
Content-Type: multipart/alternative; boundary="1434683055.dFE4aB0e2.25651"; charset="UTF-8"


--1434683055.dFE4aB0e2.25651
Date: Fri, 19 Jun 2015 03:04:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91025

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, looks like they're real opcodes, and not identical to other ones (at least
not obviously so):

udcli -16 -s 2032 vbios.rom

The relevant code is:

000000000000015c 3c5a             cmp al, 0x5a            
000000000000015e 745b             jz 0x1bb                

000000000000016a 3c59             cmp al, 0x59            
000000000000016c 0f84a700         jz word 0x217           

00000000000001bb 53               push bx                 
00000000000001bc 662e8b37         mov esi, [cs:bx]        
00000000000001c0 2e8b5f04         mov bx, [cs:bx+0x4]     
00000000000001c4 662e8b07         mov eax, [cs:bx]        
00000000000001c8 0bff             or di, di               
00000000000001ca 7503             jnz 0x1cf               
00000000000001cc e8113e           call 0x3fe0             
00000000000001cf 5b               pop bx                  
00000000000001d0 83c306           add bx, 0x6             
00000000000001d3 e978ff           jmp 0x14e               

0000000000000217 662e8b37         mov esi, [cs:bx]        
000000000000021b 83c304           add bx, 0x4             
000000000000021e 53               push bx                 
000000000000021f 2e8b1f           mov bx, [cs:bx]         
0000000000000222 2e8b07           mov ax, [cs:bx]         
0000000000000225 bb6400           mov bx, 0x64            
0000000000000228 f7e3             mul bx                  
000000000000022a 5b               pop bx                  
000000000000022b 0bff             or di, di               
000000000000022d 7513             jnz 0x242               
000000000000022f 53               push bx                 
0000000000000230 e80842           call 0x443b             
0000000000000233 5b               pop bx                  
0000000000000234 32f6             xor dh, dh              
0000000000000236 66c1e210         shl edx, 0x10           
000000000000023a 8bd0             mov dx, ax              
000000000000023c 668bc2           mov eax, edx            
000000000000023f e89e3d           call 0x3fe0             
0000000000000242 83c302           add bx, 0x2             

Where 0x3fe0 is a write of eax to mmio reg esi. Not sure what the function at
0x443b does. Nothing simple though... something PLL-related, I think.

So looks like 0x5a is R[0..3] = VBIOS[4..5]. And 0x59 is... R[0..3] = who
knows.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1434683055.dFE4aB0e2.25651
Date: Fri, 19 Jun 2015 03:04:15 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau fails to run with NV5 [Riva TNT2 / TNT2 Pro]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91025#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau fails to run with NV5 [Riva TNT2 / TNT2 Pro]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91025">bug 91025</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, looks like they're real opcodes, and not identical to other ones (at least
not obviously so):

udcli -16 -s 2032 vbios.rom

The relevant code is:

000000000000015c 3c5a             cmp al, 0x5a            
000000000000015e 745b             jz 0x1bb                

000000000000016a 3c59             cmp al, 0x59            
000000000000016c 0f84a700         jz word 0x217           

00000000000001bb 53               push bx                 
00000000000001bc 662e8b37         mov esi, [cs:bx]        
00000000000001c0 2e8b5f04         mov bx, [cs:bx+0x4]     
00000000000001c4 662e8b07         mov eax, [cs:bx]        
00000000000001c8 0bff             or di, di               
00000000000001ca 7503             jnz 0x1cf               
00000000000001cc e8113e           call 0x3fe0             
00000000000001cf 5b               pop bx                  
00000000000001d0 83c306           add bx, 0x6             
00000000000001d3 e978ff           jmp 0x14e               

0000000000000217 662e8b37         mov esi, [cs:bx]        
000000000000021b 83c304           add bx, 0x4             
000000000000021e 53               push bx                 
000000000000021f 2e8b1f           mov bx, [cs:bx]         
0000000000000222 2e8b07           mov ax, [cs:bx]         
0000000000000225 bb6400           mov bx, 0x64            
0000000000000228 f7e3             mul bx                  
000000000000022a 5b               pop bx                  
000000000000022b 0bff             or di, di               
000000000000022d 7513             jnz 0x242               
000000000000022f 53               push bx                 
0000000000000230 e80842           call 0x443b             
0000000000000233 5b               pop bx                  
0000000000000234 32f6             xor dh, dh              
0000000000000236 66c1e210         shl edx, 0x10           
000000000000023a 8bd0             mov dx, ax              
000000000000023c 668bc2           mov eax, edx            
000000000000023f e89e3d           call 0x3fe0             
0000000000000242 83c302           add bx, 0x2             

Where 0x3fe0 is a write of eax to mmio reg esi. Not sure what the function at
0x443b does. Nothing simple though... something PLL-related, I think.

So looks like 0x5a is R[0..3] = VBIOS[4..5]. And 0x59 is... R[0..3] = who
knows.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1434683055.dFE4aB0e2.25651--

--===============0690105221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0690105221==--
