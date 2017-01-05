From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93828] Xorg hangs randomly with nouveau driver
Date: Thu, 05 Jan 2017 18:13:12 +0000
Message-ID: <bug-93828-8800-QLMWg5pvv3@http.bugs.freedesktop.org/>
References: <bug-93828-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1212865141=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93828-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1212865141==
Content-Type: multipart/alternative; boundary="14836399923.70Cc675a.24208";
 charset="UTF-8"


--14836399923.70Cc675a.24208
Date: Thu, 5 Jan 2017 18:13:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93828

--- Comment #18 from Marek Gre=C5=A1ko <mgresko8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This workarounded this issue by using nvidia 340 drivers. But after upgrade=
 to
Fedora 25 these drivers were not available for rather long period. Since th=
ere
was nothing done in this bug for almost a yeat I tried to replace hardware.=
=20

Firstly I tried GT730. I ended up with the same behaviour. Intermittent GUI
lockups, only mouse cursor moved. Just logs were different. If I remember w=
ell
they were similar to bug 93629. It is opened also for almost a year. I susp=
ect
these bugs have something common. Just logs are different on different
hardware. So I returned the GT730, sold the GT210 and bought AMD Radeon 6450
and the desktop is rock solid now.

I am not closing the bug because of other guys having same problems, but af=
ter
solving, please, do not wait for my confirmation. I no longer have the nvid=
ia
hardware to test.

Thanks for interest and the hard work without specs from vendor.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14836399923.70Cc675a.24208
Date: Thu, 5 Jan 2017 18:13:12 +0000
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
   title=3D"NEW - Xorg hangs randomly with nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93828#c18">Commen=
t # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg hangs randomly with nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93828">bug 93828<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mgresko8&#64;gmail.com" title=3D"Marek Gre=C5=A1ko &lt;mgresko8&#64;gmail.c=
om&gt;"> <span class=3D"fn">Marek Gre=C5=A1ko</span></a>
</span></b>
        <pre>This workarounded this issue by using nvidia 340 drivers. But =
after upgrade to
Fedora 25 these drivers were not available for rather long period. Since th=
ere
was nothing done in this bug for almost a yeat I tried to replace hardware.=
=20

Firstly I tried GT730. I ended up with the same behaviour. Intermittent GUI
lockups, only mouse cursor moved. Just logs were different. If I remember w=
ell
they were similar to <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"show_bug.cgi?id=3D93629">bug 93629</a>. It is opened also for al=
most a year. I suspect
these bugs have something common. Just logs are different on different
hardware. So I returned the GT730, sold the GT210 and bought AMD Radeon 6450
and the desktop is rock solid now.

I am not closing the bug because of other guys having same problems, but af=
ter
solving, please, do not wait for my confirmation. I no longer have the nvid=
ia
hardware to test.

Thanks for interest and the hard work without specs from vendor.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14836399923.70Cc675a.24208--

--===============1212865141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1212865141==--
