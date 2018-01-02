From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103780] Nouveau causes lockup - fifo: read fault at
 00005ac000 engine 00 [GR] client 02 [GPC1/PE_0] reason 02 [PTE] on channel
 24 [103b5b2000 Xwayland[1507]]
Date: Tue, 02 Jan 2018 09:27:57 +0000
Message-ID: <bug-103780-8800-gOEeQp9G8a@http.bugs.freedesktop.org/>
References: <bug-103780-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1777634010=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103780-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1777634010==
Content-Type: multipart/alternative; boundary="15148852773.d7f58d7e1.18766";
 charset="UTF-8"


--15148852773.d7f58d7e1.18766
Date: Tue, 2 Jan 2018 09:27:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103780

--- Comment #1 from Arnaud Lacombe <lacombar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Happened randomly 2 days after updating to Fedora 27.

Environment detail:

CPU: i3
GPU: GeForce GTX 750 + Intel Xeon E3-1200 v3/4th IGC


/% rpm -qa xorg-x11-drv-nouveau
xorg-x11-drv-nouveau-1.0.15-3.fc27.x86_64

~/% uname -a
Linux hanoli 4.14.8-300.fc27.x86_64 #1 SMP Wed Dec 20 19:00:18 UTC 2017 x86=
_64
x86_64 x86_64 GNU/Linux

dmesg:

[271587.979780] nouveau 0000:01:00.0: gr: TRAP ch 2 [007f955000 Xorg[1473]]
[271587.979789] nouveau 0000:01:00.0: gr: GPC0/TPC0/TEX: 80000041
[271587.979794] nouveau 0000:01:00.0: gr: GPC0/TPC1/TEX: 80000041
[271587.979797] nouveau 0000:01:00.0: gr: GPC0/TPC2/TEX: 80000041
[271587.979801] nouveau 0000:01:00.0: gr: GPC0/TPC3/TEX: 80000041
[271587.979804] nouveau 0000:01:00.0: gr: GPC0/TPC4/TEX: 80000041
[271587.979814] nouveau 0000:01:00.0: fifo: read fault at 0001af4000 engine=
 00
[GR] client 07 [GPC0/T1_2] reason 02 [PTE] on channel 2 [007f955000 Xorg[14=
73]]
[271587.979819] nouveau 0000:01:00.0: fifo: channel 2: killed
[271587.979821] nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recove=
ry
[271587.979824] nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
[271587.979830] nouveau 0000:01:00.0: fifo: engine 5: scheduled for recovery
[271587.979859] nouveau 0000:01:00.0: Xorg[1473]: channel 2 killed!
[271638.386491] asynchronous wait on fence nouveau:Xorg[1473]:284f8b timed =
out
[271688.050038] asynchronous wait on fence nouveau:Xorg[1473]:284f90 timed =
out
[271737.201617] asynchronous wait on fence nouveau:Xorg[1473]:284fa2 timed =
out
[271787.377169] asynchronous wait on fence nouveau:Xorg[1473]:284fa6 timed =
out

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15148852773.d7f58d7e1.18766
Date: Tue, 2 Jan 2018 09:27:57 +0000
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
   title=3D"NEW - Nouveau causes lockup - fifo: read fault at 00005ac000 en=
gine 00 [GR] client 02 [GPC1/PE_0] reason 02 [PTE] on channel 24 [103b5b200=
0 Xwayland[1507]]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103780#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau causes lockup - fifo: read fault at 00005ac000 en=
gine 00 [GR] client 02 [GPC1/PE_0] reason 02 [PTE] on channel 24 [103b5b200=
0 Xwayland[1507]]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103780">bug 10378=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lacombar&#64;gmail.com" title=3D"Arnaud Lacombe &lt;lacombar&#64;gmail.com&=
gt;"> <span class=3D"fn">Arnaud Lacombe</span></a>
</span></b>
        <pre>Happened randomly 2 days after updating to Fedora 27.

Environment detail:

CPU: i3
GPU: GeForce GTX 750 + Intel Xeon E3-1200 v3/4th IGC


/% rpm -qa xorg-x11-drv-nouveau
xorg-x11-drv-nouveau-1.0.15-3.fc27.x86_64

~/% uname -a
Linux hanoli 4.14.8-300.fc27.x86_64 #1 SMP Wed Dec 20 19:00:18 UTC 2017 x86=
_64
x86_64 x86_64 GNU/Linux

dmesg:

[271587.979780] nouveau 0000:01:00.0: gr: TRAP ch 2 [007f955000 Xorg[1473]]
[271587.979789] nouveau 0000:01:00.0: gr: GPC0/TPC0/TEX: 80000041
[271587.979794] nouveau 0000:01:00.0: gr: GPC0/TPC1/TEX: 80000041
[271587.979797] nouveau 0000:01:00.0: gr: GPC0/TPC2/TEX: 80000041
[271587.979801] nouveau 0000:01:00.0: gr: GPC0/TPC3/TEX: 80000041
[271587.979804] nouveau 0000:01:00.0: gr: GPC0/TPC4/TEX: 80000041
[271587.979814] nouveau 0000:01:00.0: fifo: read fault at 0001af4000 engine=
 00
[GR] client 07 [GPC0/T1_2] reason 02 [PTE] on channel 2 [007f955000 Xorg[14=
73]]
[271587.979819] nouveau 0000:01:00.0: fifo: channel 2: killed
[271587.979821] nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recove=
ry
[271587.979824] nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
[271587.979830] nouveau 0000:01:00.0: fifo: engine 5: scheduled for recovery
[271587.979859] nouveau 0000:01:00.0: Xorg[1473]: channel 2 killed!
[271638.386491] asynchronous wait on fence nouveau:Xorg[1473]:284f8b timed =
out
[271688.050038] asynchronous wait on fence nouveau:Xorg[1473]:284f90 timed =
out
[271737.201617] asynchronous wait on fence nouveau:Xorg[1473]:284fa2 timed =
out
[271787.377169] asynchronous wait on fence nouveau:Xorg[1473]:284fa6 timed =
out</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15148852773.d7f58d7e1.18766--

--===============1777634010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1777634010==--
