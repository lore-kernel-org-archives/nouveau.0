From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81136] [NV92] Regression in Linux 3.15: GPU lockup
 after suspend
Date: Thu, 10 Jul 2014 00:36:16 +0000
Message-ID: <bug-81136-8800-7GSN4ZX0th@http.bugs.freedesktop.org/>
References: <bug-81136-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1711471440=="
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


--===============1711471440==
Content-Type: multipart/alternative; boundary="1404952576.3525010E1.20022"; charset="us-ascii"


--1404952576.3525010E1.20022
Date: Thu, 10 Jul 2014 00:36:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D81136

--- Comment #2 from Agust=C3=ADn Dall'Alba <agustin-G80yVrlpk+aH0oMTQjrRWA@public.gmane.org> ---
Created attachment 102510
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D102510&action=3Dedit
Logs for Linux 3.15.4 with commit ecf24de reverted

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1404952576.3525010E1.20022
Date: Thu, 10 Jul 2014 00:36:16 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D81136#c2">Comment=
 # 2</a>
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D102510=
" name=3D"attach_102510" title=3D"Logs for Linux 3.15.4 with commit ecf24de=
 reverted">attachment 102510</a> <a href=3D"attachment.cgi?id=3D102510&amp;=
action=3Dedit" title=3D"Logs for Linux 3.15.4 with commit ecf24de reverted"=
>[details]</a></span>
Logs for Linux 3.15.4 with commit ecf24de reverted</pre>
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

--1404952576.3525010E1.20022--

--===============1711471440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1711471440==--
