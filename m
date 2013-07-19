From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64774] nouveau GF108 kernel crash in optimus mode
 when enabling external display output
Date: Fri, 19 Jul 2013 14:30:02 +0000
Message-ID: <bug-64774-8800-pwICfrQ7CF@http.bugs.freedesktop.org/>
References: <bug-64774-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0629895124=="
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


--===============0629895124==
Content-Type: multipart/alternative; boundary="1374244202.fC7e645F2.25790"; charset="us-ascii"


--1374244202.fC7e645F2.25790
Date: Fri, 19 Jul 2013 14:30:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D64774

--- Comment #17 from Pasi K=C3=A4rkk=C3=A4inen <pasik-X3B1VOXEql0@public.gmane.org> ---

Oh, one more interesting piece of information..=20

If I boot (power-on) the laptop *without* DVI cable connected, the nouveau
connectors will show up in 'xrandr' output as DP-1, DP-2 and DP-3.=20

Now If i boot (power-on) the laptop *with* DVI cable connected, the nouveau
connectors will *NOT* show up in 'xrandr' most of the times, but during that
maybe one time out of ten when they do show up in 'xrandr', they're actually
called DisplayPort-0, DisplayPort-1 and DisplayPort-2.=20

I wonder why that difference.. and if it's related to the issue I'm having =
or
not. I'm only able to hit the nouveau kernel crash when the connectors are
called DisplayPort-X, it seems. When the connectors are called DP-X, I'm not
able to crash the kernel.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1374244202.fC7e645F2.25790
Date: Fri, 19 Jul 2013 14:30:02 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D64774#c17">Commen=
t # 17</a>
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
Oh, one more interesting piece of information..=20

If I boot (power-on) the laptop *without* DVI cable connected, the nouveau
connectors will show up in 'xrandr' output as DP-1, DP-2 and DP-3.=20

Now If i boot (power-on) the laptop *with* DVI cable connected, the nouveau
connectors will *NOT* show up in 'xrandr' most of the times, but during that
maybe one time out of ten when they do show up in 'xrandr', they're actually
called DisplayPort-0, DisplayPort-1 and DisplayPort-2.=20

I wonder why that difference.. and if it's related to the issue I'm having =
or
not. I'm only able to hit the nouveau kernel crash when the connectors are
called DisplayPort-X, it seems. When the connectors are called DP-X, I'm not
able to crash the kernel.</pre>
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

--1374244202.fC7e645F2.25790--

--===============0629895124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0629895124==--
