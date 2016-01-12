From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71659] [NVD9] Hangs under load with ![
 PFIFO][0000:01:00.0] unhandled status 0x00800000
Date: Tue, 12 Jan 2016 21:27:57 +0000
Message-ID: <bug-71659-8800-JtcfBVhekN@http.bugs.freedesktop.org/>
References: <bug-71659-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0907332848=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71659-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0907332848==
Content-Type: multipart/alternative; boundary="1452634078.D8780F741.8780"; charset="UTF-8"


--1452634078.D8780F741.8780
Date: Tue, 12 Jan 2016 21:27:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D71659

--- Comment #32 from Viorel-C=C4=83t=C4=83lin R=C4=83pi=C8=9Beanu <rapitean=
u.catalin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 120994
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D120994&action=3Dedit
Added a more a dmesg debug log for the problem.

The freeze occurs after this error:
[  409.260043] nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOU=
T ]

As it can be seen imediately after the freeze, this error is spammed on dme=
sg
every 5 seconds.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1452634078.D8780F741.8780
Date: Tue, 12 Jan 2016 21:27:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unha=
ndled status 0x00800000"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D71659#c32">Commen=
t # 32</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unha=
ndled status 0x00800000"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D71659">bug 71659<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rapiteanu.catalin&#64;gmail.com" title=3D"Viorel-C=C4=83t=C4=83lin R=C4=83p=
i=C8=9Beanu &lt;rapiteanu.catalin&#64;gmail.com&gt;"> <span class=3D"fn">Vi=
orel-C=C4=83t=C4=83lin R=C4=83pi=C8=9Beanu</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D120994=
" name=3D"attach_120994" title=3D"Added a more a dmesg debug log for the pr=
oblem.">attachment 120994</a> <a href=3D"attachment.cgi?id=3D120994&amp;act=
ion=3Dedit" title=3D"Added a more a dmesg debug log for the problem.">[deta=
ils]</a></span>
Added a more a dmesg debug log for the problem.

The freeze occurs after this error:
[  409.260043] nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOU=
T ]

As it can be seen imediately after the freeze, this error is spammed on dme=
sg
every 5 seconds.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1452634078.D8780F741.8780--

--===============0907332848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0907332848==--
