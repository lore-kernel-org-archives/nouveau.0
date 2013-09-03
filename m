From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68075] nouveau inconsistent changing output
 connector names in xrandr
Date: Tue, 03 Sep 2013 17:47:21 +0000
Message-ID: <bug-68075-8800-deCbspJm2I@http.bugs.freedesktop.org/>
References: <bug-68075-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0364448665=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68075-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0364448665==
Content-Type: multipart/alternative; boundary="1378230441.45fdf01.1889"; charset="us-ascii"


--1378230441.45fdf01.1889
Date: Tue, 3 Sep 2013 17:47:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D68075

--- Comment #11 from Pasi K=C3=A4rkk=C3=A4inen <pasik-X3B1VOXEql0@public.gmane.org> ---

So I updated from Fedora 18 to Fedora 19, which has xorg-1.14.2, and now it
looks better. I haven't seen the "changing nouveau connector names" issue
anymore..=20

but I can't be completely certain yet, because there are other problems now
with xorg 1.14 that prevent proper testing (Xorg crashes with segfault when
running for example "xrandr --output DP-2 --off")..

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1378230441.45fdf01.1889
Date: Tue, 3 Sep 2013 17:47:21 +0000
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
   title=3D"NEW --- - nouveau inconsistent changing output connector names =
in xrandr"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D68075#c11">Commen=
t # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - nouveau inconsistent changing output connector names =
in xrandr"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D68075">bug 68075<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pasik&#64;iki.fi" title=3D"Pasi K=C3=A4rkk=C3=A4inen &lt;pasik&#64;iki.fi&g=
t;"> <span class=3D"fn">Pasi K=C3=A4rkk=C3=A4inen</span></a>
</span></b>
        <pre>
So I updated from Fedora 18 to Fedora 19, which has xorg-1.14.2, and now it
looks better. I haven't seen the &quot;changing nouveau connector names&quo=
t; issue
anymore..=20

but I can't be completely certain yet, because there are other problems now
with xorg 1.14 that prevent proper testing (Xorg crashes with segfault when
running for example &quot;xrandr --output DP-2 --off&quot;)..</pre>
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

--1378230441.45fdf01.1889--

--===============0364448665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0364448665==--
