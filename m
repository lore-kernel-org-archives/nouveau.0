From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100567] Nouveau system freeze fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT]
Date: Fri, 29 Dec 2017 17:52:46 +0000
Message-ID: <bug-100567-8800-D6kDOI5C8J@http.bugs.freedesktop.org/>
References: <bug-100567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1260608589=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100567-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1260608589==
Content-Type: multipart/alternative; boundary="15145699664.d7444Fc.18551";
 charset="UTF-8"


--15145699664.d7444Fc.18551
Date: Fri, 29 Dec 2017 17:52:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

--- Comment #12 from Marc Burkhardt <libreoffice.org-5+OZ0iQkl5WoYr4blSSd5g@public.gmane.org> ---
On my Lenovo P50 this problem is newly introduced since I use a 4.14 kernel.
Kernels below that are stable/working in regard of that problem. This is wh=
at I
can aquire from the logs:

Dec 28 17:23:13 marc kernel: [ 5657.352825] nouveau 0000:01:00.0: fifo: cha=
nnel
2: killed
Dec 28 17:23:13 marc kernel: [ 5657.352827] nouveau 0000:01:00.0: fifo: run=
list
0: scheduled for recovery
Dec 28 17:23:13 marc kernel: [ 5657.352830] nouveau 0000:01:00.0: fifo: eng=
ine
0: scheduled for recovery
Dec 28 17:23:13 marc kernel: [ 5657.352833] nouveau 0000:01:00.0: X[5708]:
channel 2 killed!
Dec 28 17:23:13 local kernel: nouveau 0000:01:00.0: gr: TRAP ch 2 [00ffbd00=
00
X[5708]]
Dec 28 17:23:13 local kernel: nouveau 0000:01:00.0: gr: GPC0/TPC0/TEX: 8000=
0000
Dec 28 17:23:13 local kernel: nouveau 0000:01:00.0: gr: GPC0/TPC1/TEX: 8000=
0041
Dec 28 17:23:13 local kernel: nouveau 0000:01:00.0: fifo: read fault at
000ac40000 engine 00 [GR] client 07 [GPC0/T1_2] reason 02 [PTE] on channel 2
[00ffbd0000 X[5708]]
Dec 28 17:23:13 local kernel: nouveau 0000:01:00.0: fifo: channel 2: killed
Dec 28 17:23:13 local kernel: nouveau 0000:01:00.0: fifo: runlist 0: schedu=
led
for recovery
Dec 28 17:23:13 local kernel: nouveau 0000:01:00.0: fifo: engine 0: schedul=
ed
for recovery
Dec 28 17:23:13 local kernel: nouveau 0000:01:00.0: X[5708]: channel 2 kill=
ed!
Dec 28 17:24:03 marc kernel: [ 5706.891489] sysrq: SysRq : Keyboard mode se=
t to
system default
Dec 28 17:24:03 local kernel: sysrq: SysRq : Keyboard mode set to system
default
Dec 28 17:24:04 marc exiting on signal 15

I found this in my Xorg.0.log but I don't know if it's somehow related to t=
he
above:

[   155.535] (EE) libinput bug: timer event13 debounce short: offset negati=
ve
(-2229)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15145699664.d7444Fc.18551
Date: Fri, 29 Dec 2017 17:52:46 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
libreoffice.org&#64;marc.ngoe.de" title=3D"Marc Burkhardt &lt;libreoffice.o=
rg&#64;marc.ngoe.de&gt;"> <span class=3D"fn">Marc Burkhardt</span></a>
</span></b>
        <pre>On my Lenovo P50 this problem is newly introduced since I use =
a 4.14 kernel.
Kernels below that are stable/working in regard of that problem. This is wh=
at I
can aquire from the logs:

Dec 28 17:23:13 marc kernel: [ 5657.352825] nouveau 0000:01:00.0: fifo: cha=
nnel
2: killed
Dec 28 17:23:13 marc kernel: [ 5657.352827] nouveau 0000:01:00.0: fifo: run=
list
0: scheduled for recovery
Dec 28 17:23:13 marc kernel: [ 5657.352830] nouveau 0000:01:00.0: fifo: eng=
ine
0: scheduled for recovery
Dec 28 17:23:13 marc kernel: [ 5657.352833] nouveau 0000:01:00.0: X[5708]:
channel 2 killed!
Dec 28 17:23:13 local kernel: nouveau 0000:01:00.0: gr: TRAP ch 2 [00ffbd00=
00
X[5708]]
Dec 28 17:23:13 local kernel: nouveau 0000:01:00.0: gr: GPC0/TPC0/TEX: 8000=
0000
Dec 28 17:23:13 local kernel: nouveau 0000:01:00.0: gr: GPC0/TPC1/TEX: 8000=
0041
Dec 28 17:23:13 local kernel: nouveau 0000:01:00.0: fifo: read fault at
000ac40000 engine 00 [GR] client 07 [GPC0/T1_2] reason 02 [PTE] on channel 2
[00ffbd0000 X[5708]]
Dec 28 17:23:13 local kernel: nouveau 0000:01:00.0: fifo: channel 2: killed
Dec 28 17:23:13 local kernel: nouveau 0000:01:00.0: fifo: runlist 0: schedu=
led
for recovery
Dec 28 17:23:13 local kernel: nouveau 0000:01:00.0: fifo: engine 0: schedul=
ed
for recovery
Dec 28 17:23:13 local kernel: nouveau 0000:01:00.0: X[5708]: channel 2 kill=
ed!
Dec 28 17:24:03 marc kernel: [ 5706.891489] sysrq: SysRq : Keyboard mode se=
t to
system default
Dec 28 17:24:03 local kernel: sysrq: SysRq : Keyboard mode set to system
default
Dec 28 17:24:04 marc exiting on signal 15

I found this in my Xorg.0.log but I don't know if it's somehow related to t=
he
above:

[   155.535] (EE) libinput bug: timer event13 debounce short: offset negati=
ve
(-2229)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15145699664.d7444Fc.18551--

--===============1260608589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1260608589==--
