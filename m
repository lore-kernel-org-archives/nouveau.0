From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86792] [NVC0] Portal 2 Crashes in Wine
Date: Sat, 09 May 2015 19:44:29 +0000
Message-ID: <bug-86792-8800-Dt8vwuFbkT@http.bugs.freedesktop.org/>
References: <bug-86792-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1134717190=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86792-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1134717190==
Content-Type: multipart/alternative; boundary="1431200669.Bab1de1.15126"; charset="UTF-8"


--1431200669.Bab1de1.15126
Date: Sat, 9 May 2015 19:44:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86792

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |NEW

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Looks like I got one pretty similar to yours:

Unhandled exception: page fault on read access to 0x00000108 in 32-bit code
(0xf6623734).
Register dump:
 CS:0023 SS:002b DS:002b ES:002b FS:0063 GS:006b
 EIP:f6623734 ESP:14bbd650 EBP:7cf2df98 EFLAGS:00010202(  R- --  I   - - - )
 EAX:00000104 EBX:f686f000 ECX:f242b178 EDX:f135fc10
 ESI:f154ae60 EDI:f039eb18
Stack dump:
0x14bbd650:  00000000 edb22728 f6623659 f686f000
0x14bbd660:  f6623717 f686f000 f154ae60 f6705e09
0x14bbd670:  f135fc10 00000ac0 f039eb18 f039edf8
0x14bbd680:  00000de1 00000001 f656c92e 7cf196a0
0x14bbd690:  00000ac0 00157abc 000ffd00 f039edf8
0x14bbd6a0:  f3122d98 f31f2280 f6705d19 f686f000
000c: sel=0067 base=00000000 limit=00000000 32-bit r-x
Backtrace:
=>0 0xf6623734 nouveau_heap_free+0x24() in nouveau_dri.so (0x7cf2df98)
  1 0xf6705e09 nvc0_program_upload_code+0xf8() in nouveau_dri.so (0x7cf2df98)
  2 0xf670bfc3 nvc0_vertprog_validate+0x162() in nouveau_dri.so (0xf039eb18)
  3 0xf6712985 nvc0_state_validate+0x134() in nouveau_dri.so (0xf3100598)
  4 0xf671d0dc nvc0_draw_vbo+0xbb() in nouveau_dri.so (0xf3100598)
  5 0xf656f4d0 cso_draw_vbo+0x3f() in nouveau_dri.so (0x00000003)
  6 0xf644ce9a st_draw_vbo+0x279() in nouveau_dri.so (0x00000003)
  7 0xf641a445 vbo_validated_drawrangeelements+0xf4() in nouveau_dri.so
(0xf3102590)
  8 0xf641a9b4 vbo_exec_DrawElementsBaseVertex+0x93() in nouveau_dri.so
(0x00000000)
  9 0xf6b00298 shared_dispatch_stub_702+0x47() in libglapi.so.0 (0x14bbdbd8)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431200669.Bab1de1.15126
Date: Sat, 9 May 2015 19:44:29 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC0] Portal 2 Crashes in Wine"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86792">bug 86792</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEEDINFO
           </td>
           <td>NEW
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC0] Portal 2 Crashes in Wine"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86792#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC0] Portal 2 Crashes in Wine"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86792">bug 86792</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Looks like I got one pretty similar to yours:

Unhandled exception: page fault on read access to 0x00000108 in 32-bit code
(0xf6623734).
Register dump:
 CS:0023 SS:002b DS:002b ES:002b FS:0063 GS:006b
 EIP:f6623734 ESP:14bbd650 EBP:7cf2df98 EFLAGS:00010202(  R- --  I   - - - )
 EAX:00000104 EBX:f686f000 ECX:f242b178 EDX:f135fc10
 ESI:f154ae60 EDI:f039eb18
Stack dump:
0x14bbd650:  00000000 edb22728 f6623659 f686f000
0x14bbd660:  f6623717 f686f000 f154ae60 f6705e09
0x14bbd670:  f135fc10 00000ac0 f039eb18 f039edf8
0x14bbd680:  00000de1 00000001 f656c92e 7cf196a0
0x14bbd690:  00000ac0 00157abc 000ffd00 f039edf8
0x14bbd6a0:  f3122d98 f31f2280 f6705d19 f686f000
000c: sel=0067 base=00000000 limit=00000000 32-bit r-x
Backtrace:
=&gt;0 0xf6623734 nouveau_heap_free+0x24() in nouveau_dri.so (0x7cf2df98)
  1 0xf6705e09 nvc0_program_upload_code+0xf8() in nouveau_dri.so (0x7cf2df98)
  2 0xf670bfc3 nvc0_vertprog_validate+0x162() in nouveau_dri.so (0xf039eb18)
  3 0xf6712985 nvc0_state_validate+0x134() in nouveau_dri.so (0xf3100598)
  4 0xf671d0dc nvc0_draw_vbo+0xbb() in nouveau_dri.so (0xf3100598)
  5 0xf656f4d0 cso_draw_vbo+0x3f() in nouveau_dri.so (0x00000003)
  6 0xf644ce9a st_draw_vbo+0x279() in nouveau_dri.so (0x00000003)
  7 0xf641a445 vbo_validated_drawrangeelements+0xf4() in nouveau_dri.so
(0xf3102590)
  8 0xf641a9b4 vbo_exec_DrawElementsBaseVertex+0x93() in nouveau_dri.so
(0x00000000)
  9 0xf6b00298 shared_dispatch_stub_702+0x47() in libglapi.so.0 (0x14bbdbd8)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431200669.Bab1de1.15126--

--===============1134717190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1134717190==--
