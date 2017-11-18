From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93629] [NVE6] complete system freeze,
 PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
Date: Sat, 18 Nov 2017 18:53:09 +0000
Message-ID: <bug-93629-8800-tSAfh1xSZA@http.bugs.freedesktop.org/>
References: <bug-93629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0035770814=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93629-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0035770814==
Content-Type: multipart/alternative; boundary="15110311897.BC10Bb16.4175";
 charset="UTF-8"


--15110311897.BC10Bb16.4175
Date: Sat, 18 Nov 2017 18:53:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93629

--- Comment #39 from Dustin Spicuzza <dustin-Jt2G5/S7rSkR8nHjUUpU8EEOCMrvLtNR@public.gmane.org> ---
I'm on Fedora 27, and I get the freeze with the following messages in dmesg:

[    0.000000] Linux version 4.13.12-300.fc27.x86_64
(mockbuild-IQyTzKUysSGsoVxi7xNpEsNrQ1sYaAMk1rGf20DD4Tc@public.gmane.org) (gcc version 7.
2.1 20170915 (Red Hat 7.2.1-2) (GCC)) #1 SMP Wed Nov 8 16:38:01 UTC 2017

[ 3571.488551] nouveau 0000:01:00.0: gr: TRAP ch 14 [003f543000 Xwayland[30=
20]]
[ 3571.488560] nouveau 0000:01:00.0: gr: GPC0/TPC0/TEX: 80000049
[ 3571.488564] nouveau 0000:01:00.0: gr: GPC0/TPC1/TEX: 80000049
[ 3571.488568] nouveau 0000:01:00.0: gr: GPC0/TPC2/TEX: 80000049
[ 3571.488572] nouveau 0000:01:00.0: gr: GPC0/TPC3/TEX: 80000049
[ 3571.488581] nouveau 0000:01:00.0: fifo: read fault at 0004bbc000 engine =
00
[PGRAPH] client 0a [GPC0/] reason 02 [PAGE_NOT_PRESENT] on channel 14
[003f543000 Xwayland[3020]]
[ 3571.488583] nouveau 0000:01:00.0: fifo: gr engine fault on channel 14,
recovering...
[ 3571.488779] nouveau 0000:01:00.0: Xwayland[3020]: channel 14 killed!

lspci:

01:00.0 VGA compatible controller: NVIDIA Corporation GF106 [GeForce GTS 45=
0]
(rev a1)

packages:

xorg-x11-drv-nouveau-1.0.15-3.fc27

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15110311897.BC10Bb16.4175
Date: Sat, 18 Nov 2017 18:53:09 +0000
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
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629#c39">Commen=
t # 39</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629">bug 93629<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dustin&#64;virtualroadside.com" title=3D"Dustin Spicuzza &lt;dustin&#64;vir=
tualroadside.com&gt;"> <span class=3D"fn">Dustin Spicuzza</span></a>
</span></b>
        <pre>I'm on Fedora 27, and I get the freeze with the following mess=
ages in dmesg:

[    0.000000] Linux version 4.13.12-300.fc27.x86_64
(<a href=3D"mailto:mockbuild&#64;bkernel01.phx2.fedoraproject.org">mockbuil=
d&#64;bkernel01.phx2.fedoraproject.org</a>) (gcc version 7.
2.1 20170915 (Red Hat 7.2.1-2) (GCC)) #1 SMP Wed Nov 8 16:38:01 UTC 2017

[ 3571.488551] nouveau 0000:01:00.0: gr: TRAP ch 14 [003f543000 Xwayland[30=
20]]
[ 3571.488560] nouveau 0000:01:00.0: gr: GPC0/TPC0/TEX: 80000049
[ 3571.488564] nouveau 0000:01:00.0: gr: GPC0/TPC1/TEX: 80000049
[ 3571.488568] nouveau 0000:01:00.0: gr: GPC0/TPC2/TEX: 80000049
[ 3571.488572] nouveau 0000:01:00.0: gr: GPC0/TPC3/TEX: 80000049
[ 3571.488581] nouveau 0000:01:00.0: fifo: read fault at 0004bbc000 engine =
00
[PGRAPH] client 0a [GPC0/] reason 02 [PAGE_NOT_PRESENT] on channel 14
[003f543000 Xwayland[3020]]
[ 3571.488583] nouveau 0000:01:00.0: fifo: gr engine fault on channel 14,
recovering...
[ 3571.488779] nouveau 0000:01:00.0: Xwayland[3020]: channel 14 killed!

lspci:

01:00.0 VGA compatible controller: NVIDIA Corporation GF106 [GeForce GTS 45=
0]
(rev a1)

packages:

xorg-x11-drv-nouveau-1.0.15-3.fc27</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15110311897.BC10Bb16.4175--

--===============0035770814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0035770814==--
