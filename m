From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101764] [regression] eaa2c988033b breaks GTX1050TI
 (GP107 / NV137)
Date: Wed, 12 Jul 2017 15:44:42 +0000
Message-ID: <bug-101764-8800-lSTSlboUpE@http.bugs.freedesktop.org/>
References: <bug-101764-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1283917021=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101764-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1283917021==
Content-Type: multipart/alternative; boundary="14998742821.d635.15637";
 charset="UTF-8"


--14998742821.d635.15637
Date: Wed, 12 Jul 2017 15:44:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101764

--- Comment #5 from Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> ---
> So it's having trouble loading the firmware. Please confirm that you have=
 the=20
> latest firmware for gp107 (as there was a window of time when linux-firmw=
are=20
> contained bad firmware for gp107 -- some time ago now already, but you co=
uld=20
> have a bad snapshot).
The firmware is the latest one shipped in the linux-firmware git repo

>>> nouveau.noaccel=3D1 (see attachment)
In this case the nouveau module is correct probed and I do not get any WARN=
ING
in the journal (even though a bit noisy on the PM part).

>>> only pcie_port_pm=3Doff
The system hangs before reaching Xorg

>>> nouveau.runpm=3D0 (with or without pcie_port_pm=3Doff) (see attachment)
Interestingly I can still reach Xorg but in the journal I have a lot of
WARNINGs

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14998742821.d635.15637
Date: Wed, 12 Jul 2017 15:44:42 +0000
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
   title=3D"NEW - [regression] eaa2c988033b breaks GTX1050TI (GP107 / NV137=
)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101764#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [regression] eaa2c988033b breaks GTX1050TI (GP107 / NV137=
)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101764">bug 10176=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
carlo&#64;caione.org" title=3D"Carlo Caione &lt;carlo&#64;caione.org&gt;"> =
<span class=3D"fn">Carlo Caione</span></a>
</span></b>
        <pre><span class=3D"quote">&gt; So it's having trouble loading the =
firmware. Please confirm that you have the=20
&gt; latest firmware for gp107 (as there was a window of time when linux-fi=
rmware=20
&gt; contained bad firmware for gp107 -- some time ago now already, but you=
 could=20
&gt; have a bad snapshot).</span >
The firmware is the latest one shipped in the linux-firmware git repo

<span class=3D"quote">&gt;&gt;&gt; nouveau.noaccel=3D1 (see attachment)</sp=
an >
In this case the nouveau module is correct probed and I do not get any WARN=
ING
in the journal (even though a bit noisy on the PM part).

<span class=3D"quote">&gt;&gt;&gt; only pcie_port_pm=3Doff</span >
The system hangs before reaching Xorg

<span class=3D"quote">&gt;&gt;&gt; nouveau.runpm=3D0 (with or without pcie_=
port_pm=3Doff) (see attachment)</span >
Interestingly I can still reach Xorg but in the journal I have a lot of
WARNINGs</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14998742821.d635.15637--

--===============1283917021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1283917021==--
