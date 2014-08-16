From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81136] [NV92] Regression in Linux 3.15: GPU lockup
 after suspend
Date: Sat, 16 Aug 2014 05:02:00 +0000
Message-ID: <bug-81136-8800-nKljfp4g9Y@http.bugs.freedesktop.org/>
References: <bug-81136-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1051896053=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81136-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1051896053==
Content-Type: multipart/alternative; boundary="1408165320.E32daf12.2296"; charset="us-ascii"


--1408165320.E32daf12.2296
Date: Sat, 16 Aug 2014 05:02:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D81136

--- Comment #7 from Agust=C3=ADn Dall'Alba <agustin-G80yVrlpk+aH0oMTQjrRWA@public.gmane.org> ---
Update: I got tired of reverting the ecf24de commit on every linux update, =
so I
tried booting with nouveau.nofbaccel=3D1 (instead of nofbaccel=3D1). It wor=
ks fine.
The system still does not resume properly without it on Linux v3.16.1, but =
that
boot option is a better workaround than reverting.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1408165320.E32daf12.2296
Date: Sat, 16 Aug 2014 05:02:00 +0000
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
   title=3D"NEW --- - [NV92] Regression in Linux 3.15: GPU lockup after sus=
pend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D81136#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV92] Regression in Linux 3.15: GPU lockup after sus=
pend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D81136">bug 81136<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
agustin&#64;dallalba.com.ar" title=3D"Agust=C3=ADn Dall'Alba &lt;agustin&#6=
4;dallalba.com.ar&gt;"> <span class=3D"fn">Agust=C3=ADn Dall'Alba</span></a>
</span></b>
        <pre>Update: I got tired of reverting the ecf24de commit on every l=
inux update, so I
tried booting with nouveau.nofbaccel=3D1 (instead of nofbaccel=3D1). It wor=
ks fine.
The system still does not resume properly without it on Linux v3.16.1, but =
that
boot option is a better workaround than reverting.</pre>
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

--1408165320.E32daf12.2296--

--===============1051896053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1051896053==--
