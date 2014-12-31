From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87885] [NV94] Fan speed of Nvidia GeForce 9600GT
 (G94) constantly too high
Date: Wed, 31 Dec 2014 17:52:29 +0000
Message-ID: <bug-87885-8800-39LEG1StJT@http.bugs.freedesktop.org/>
References: <bug-87885-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0847276457=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87885-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0847276457==
Content-Type: multipart/alternative; boundary="1420048349.147BFceD1.22665"; charset="UTF-8"


--1420048349.147BFceD1.22665
Date: Wed, 31 Dec 2014 17:52:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87885

--- Comment #4 from TM <asiasuppenesser-Mmb7MZpHnFY@public.gmane.org> ---
Dear Martin, thanks for your reply.

I tried to set the pwm state manually yesterday, which didn't work. I simply
forgot to add that info here as well - sorry.

Doing the following has no effect on the fan speed (sound):
# cat pwm1{,_enable}
35
2
# echo 1 > pwm1_enable 
# echo 50 > pwm1
# cat pwm1{,_enable}   # just to prove that the changes have been applied and
not overwritten by some crazy application
50
1

About your other suggestions: here's the output of nvapeek:
# ./nvapeek 20000 1000
00020000: 0a2003ff 00000000 c00836f7 00009c40
00020010: 00000000 fe4c038d 9e9c9a9a fe0202ee
00020020: 02080e07 07000a09 000a0802 00050601
00020030: 02020801 00091006 15020805 1a056000
00020040: 07000201 00ff019a 000000ff 44072a0b
00020050: 00000a07 ffffffff ffffffff 00000000
00020060: 00040000 40400000 ffff8480 ffffffff
00020070: ffffffff 00000000 00000000 00000000
00020080: 100c0736 00000000 00000000 00000000
...
000200a0: 01000000 00000003 c10910de 00000004
...
00020100: 00000000 1a114c99 082a0000 00000000
00020110: 00000000 00000000 00000000 00876530
00020120: 00000241 00000200 00000000 00000000
...
00020400: 00000032 00000000 00000000 00000001
00020410: 00000000 0000005c 00000000 00000000
...
00020440: 00000000 00000080 00000000 00000000
...
00020480: 00000087 00000002 00000000 00000000
...
000204c0: 00000064 00000057 00000080 0000005d
...
000207f0: 00000000 00000000 000010de 00000001
...



And:
# ./nvapeek e114 20
0000e114: 00000001 00000000 0000021c 0000010e
0000e124: 10000000 00000000 0001010e 00000000

Happy new year :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1420048349.147BFceD1.22665
Date: Wed, 31 Dec 2014 17:52:29 +0000
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
   title="NEW - [NV94] Fan speed of Nvidia GeForce 9600GT (G94) constantly too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87885#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] Fan speed of Nvidia GeForce 9600GT (G94) constantly too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87885">bug 87885</a>
              from <span class="vcard"><a class="email" href="mailto:asiasuppenesser&#64;gmx.de" title="TM &lt;asiasuppenesser&#64;gmx.de&gt;"> <span class="fn">TM</span></a>
</span></b>
        <pre>Dear Martin, thanks for your reply.

I tried to set the pwm state manually yesterday, which didn't work. I simply
forgot to add that info here as well - sorry.

Doing the following has no effect on the fan speed (sound):
# cat pwm1{,_enable}
35
2
# echo 1 &gt; pwm1_enable 
# echo 50 &gt; pwm1
# cat pwm1{,_enable}   # just to prove that the changes have been applied and
not overwritten by some crazy application
50
1

About your other suggestions: here's the output of nvapeek:
# ./nvapeek 20000 1000
00020000: 0a2003ff 00000000 c00836f7 00009c40
00020010: 00000000 fe4c038d 9e9c9a9a fe0202ee
00020020: 02080e07 07000a09 000a0802 00050601
00020030: 02020801 00091006 15020805 1a056000
00020040: 07000201 00ff019a 000000ff 44072a0b
00020050: 00000a07 ffffffff ffffffff 00000000
00020060: 00040000 40400000 ffff8480 ffffffff
00020070: ffffffff 00000000 00000000 00000000
00020080: 100c0736 00000000 00000000 00000000
...
000200a0: 01000000 00000003 c10910de 00000004
...
00020100: 00000000 1a114c99 082a0000 00000000
00020110: 00000000 00000000 00000000 00876530
00020120: 00000241 00000200 00000000 00000000
...
00020400: 00000032 00000000 00000000 00000001
00020410: 00000000 0000005c 00000000 00000000
...
00020440: 00000000 00000080 00000000 00000000
...
00020480: 00000087 00000002 00000000 00000000
...
000204c0: 00000064 00000057 00000080 0000005d
...
000207f0: 00000000 00000000 000010de 00000001
...



And:
# ./nvapeek e114 20
0000e114: 00000001 00000000 0000021c 0000010e
0000e124: 10000000 00000000 0001010e 00000000

Happy new year :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420048349.147BFceD1.22665--

--===============0847276457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0847276457==--
