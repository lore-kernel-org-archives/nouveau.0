From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64774] nouveau GF108 kernel crash in optimus mode
 when enabling external display output
Date: Thu, 18 Jul 2013 21:04:49 +0000
Message-ID: <bug-64774-8800-0iSsW3tQYY@http.bugs.freedesktop.org/>
References: <bug-64774-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0139100474=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64774-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0139100474==
Content-Type: multipart/alternative; boundary="1374181489.7c5FAfbD2.22281"; charset="us-ascii"


--1374181489.7c5FAfbD2.22281
Date: Thu, 18 Jul 2013 21:04:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D64774

--- Comment #12 from Pasi K=C3=A4rkk=C3=A4inen <pasik-X3B1VOXEql0@public.gmane.org> ---

Ok, sorry for not explaining properly.=20

With the stock fedora 3.9.9-201 kernel the nouveau dvi outputs are detected=
 OK,
so in the Mate desktop display properties application I can see the external
monitor that is connected with DVI, and I can choose to enable it, which ca=
uses
the kernel crash.=20

Now with the custom 3.9.9-201.dbg01 kernel that I built, which only has the
warn_on patch added on top of the stock kernel, the nouveau outputs are *no=
t*
detected at all, so I can't see the DVI monitor on the display properties
application, and I can't enable the DVI monitor..=20

I tried rebooting the laptop multiple times, and the behaviour stays the sa=
me.=20

Maybe I should play with xrandr aswell. And probably rebuild a new kernel, =
with
that patch removed and see if it really causes the issue..=20

Thanks for your reply!

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1374181489.7c5FAfbD2.22281
Date: Thu, 18 Jul 2013 21:04:49 +0000
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
   title=3D"NEW --- - nouveau GF108 kernel crash in optimus mode when enabl=
ing external display output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D64774#c12">Commen=
t # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - nouveau GF108 kernel crash in optimus mode when enabl=
ing external display output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D64774">bug 64774<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pasik&#64;iki.fi" title=3D"Pasi K=C3=A4rkk=C3=A4inen &lt;pasik&#64;iki.fi&g=
t;"> <span class=3D"fn">Pasi K=C3=A4rkk=C3=A4inen</span></a>
</span></b>
        <pre>
Ok, sorry for not explaining properly.=20

With the stock fedora 3.9.9-201 kernel the nouveau dvi outputs are detected=
 OK,
so in the Mate desktop display properties application I can see the external
monitor that is connected with DVI, and I can choose to enable it, which ca=
uses
the kernel crash.=20

Now with the custom 3.9.9-201.dbg01 kernel that I built, which only has the
warn_on patch added on top of the stock kernel, the nouveau outputs are *no=
t*
detected at all, so I can't see the DVI monitor on the display properties
application, and I can't enable the DVI monitor..=20

I tried rebooting the laptop multiple times, and the behaviour stays the sa=
me.=20

Maybe I should play with xrandr aswell. And probably rebuild a new kernel, =
with
that patch removed and see if it really causes the issue..=20

Thanks for your reply!</pre>
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

--1374181489.7c5FAfbD2.22281--

--===============0139100474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0139100474==--
