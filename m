From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72315] Fedora 19 64-bit X crash
Date: Sat, 21 Mar 2015 01:25:55 +0000
Message-ID: <bug-72315-8800-MGBWJlrK64@http.bugs.freedesktop.org/>
References: <bug-72315-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0559474091=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72315-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0559474091==
Content-Type: multipart/alternative; boundary="1426901155.f73C1.12823"; charset="UTF-8"


--1426901155.f73C1.12823
Date: Sat, 21 Mar 2015 01:25:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72315

--- Comment #5 from Mario Barrera <mbarrera-KK0ffGbhmjU@public.gmane.org> ---
I experience crashes like this two, normally every two or three days of
continuous functioning, last time I got repeatedly this:

Mar 20 19:06:53 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 5
[0x00bf6d0000 compiz[1282]]
Mar 20 19:06:53 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP0
0x80000000 0x80000001
Mar 20 19:06:53 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP1
0x80000000 0x80000001
Mar 20 19:06:53 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP2
0x80000000 0x80000001
Mar 20 19:07:06 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 5
[0x00bf6d0000 compiz[1282]]
Mar 20 19:07:06 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP0
0x80000000 0x80000001
Mar 20 19:07:06 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP1
0x80000000 0x80000001
Mar 20 19:07:06 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP2
0x80000000 0x80000001
Mar 20 19:07:19 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 5
[0x00bf6d0000 compiz[1282]]
Mar 20 19:07:19 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP0
0x80000000 0x80000001
Mar 20 19:07:19 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP1
0x80000000 0x80000001
Mar 20 19:07:19 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP2
0x80000000 0x80000001
Mar 20 19:07:33 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 5
[0x00bf6d0000 compiz[1282]]
Mar 20 19:07:33 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP0
0x80000000 0x80000001
Mar 20 19:07:33 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP1
0x80000000 0x80000001
Mar 20 19:07:33 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP2
0x80000000 0x80000001
Mar 20 19:07:46 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 5
[0x00bf6d0000 compiz[1282]]

I have a VGA compatible controller: NVIDIA Corporation GK104M [GeForce GTX
670MX] (rev a1).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1426901155.f73C1.12823
Date: Sat, 21 Mar 2015 01:25:55 +0000
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
   title="NEW - Fedora 19 64-bit X crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72315#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Fedora 19 64-bit X crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72315">bug 72315</a>
              from <span class="vcard"><a class="email" href="mailto:mbarrera&#64;gmx.com" title="Mario Barrera &lt;mbarrera&#64;gmx.com&gt;"> <span class="fn">Mario Barrera</span></a>
</span></b>
        <pre>I experience crashes like this two, normally every two or three days of
continuous functioning, last time I got repeatedly this:

Mar 20 19:06:53 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 5
[0x00bf6d0000 compiz[1282]]
Mar 20 19:06:53 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP0
0x80000000 0x80000001
Mar 20 19:06:53 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP1
0x80000000 0x80000001
Mar 20 19:06:53 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP2
0x80000000 0x80000001
Mar 20 19:07:06 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 5
[0x00bf6d0000 compiz[1282]]
Mar 20 19:07:06 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP0
0x80000000 0x80000001
Mar 20 19:07:06 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP1
0x80000000 0x80000001
Mar 20 19:07:06 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP2
0x80000000 0x80000001
Mar 20 19:07:19 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 5
[0x00bf6d0000 compiz[1282]]
Mar 20 19:07:19 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP0
0x80000000 0x80000001
Mar 20 19:07:19 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP1
0x80000000 0x80000001
Mar 20 19:07:19 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP2
0x80000000 0x80000001
Mar 20 19:07:33 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 5
[0x00bf6d0000 compiz[1282]]
Mar 20 19:07:33 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP0
0x80000000 0x80000001
Mar 20 19:07:33 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP1
0x80000000 0x80000001
Mar 20 19:07:33 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP2
0x80000000 0x80000001
Mar 20 19:07:46 localhost kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 5
[0x00bf6d0000 compiz[1282]]

I have a VGA compatible controller: NVIDIA Corporation GK104M [GeForce GTX
670MX] (rev a1).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426901155.f73C1.12823--

--===============0559474091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0559474091==--
