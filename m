From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68075] nouveau inconsistent changing output
 connector names in xrandr
Date: Wed, 21 Aug 2013 19:00:58 +0000
Message-ID: <bug-68075-8800-b5Bd7R2A88@http.bugs.freedesktop.org/>
References: <bug-68075-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0498871359=="
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


--===============0498871359==
Content-Type: multipart/alternative; boundary="1377111658.BaEA301.24276"; charset="us-ascii"


--1377111658.BaEA301.24276
Date: Wed, 21 Aug 2013 19:00:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D68075

--- Comment #8 from Pasi K=C3=A4rkk=C3=A4inen <pasik-X3B1VOXEql0@public.gmane.org> ---
Xorg logs (also with dmesg and xrandr output) attached.

Summary about each test-case:

01-dvi-not-connected-at-boot-but-is-connected-later:
- DVI monitor is not connected to nouveau at boot time, but I connect the D=
VI
cable later while in Xorg session.
- xrandr shows nouveau outputs as DP-1, DP-2 and DP-3.
- I am able to successfully enable and disable DVI monitor connected to nou=
veau
adapter.
- xrandr shows correct connected/disconnected state for the DVI output.
- Graphics on the DVI monitor are corrupted, for example moving xterm around
the DVI display leaves trace of the xterm contents behind, but let's not fo=
cus
on that on this bug :) it kind of works.

02-dvi-connected-at-boot-no-nouveau-outputs-detected-in-xrandr:
- DVI cable is connected to nouveau at boot time.
- xrandr does *not* show any nouveau outputs, so it's not possible to
enable/disable DVI monitor.
- DVI monitor shows black/white corrupted pattern, even when it should be a=
ll
empty/black in this case because it's not in use.
- Screenshot of the DVI monitor included in the .tar.gz.

03-dvi-connected-at-boot-nouveau-outputs-detected-as-displayport-in-xrandr:
- DVI cable is connected to nouveau at boot time.
- xrandr shows nouveau outputs as DisplayPort-0, DisplayPort-1 and
DisplayPort-2.
- Trying to enable DVI monitor connected to nouveau results in hard kernel
crash (but we have the other bug open about the kernel crash issue).

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1377111658.BaEA301.24276
Date: Wed, 21 Aug 2013 19:00:58 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D68075#c8">Comment=
 # 8</a>
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
        <pre>Xorg logs (also with dmesg and xrandr output) attached.

Summary about each test-case:

01-dvi-not-connected-at-boot-but-is-connected-later:
- DVI monitor is not connected to nouveau at boot time, but I connect the D=
VI
cable later while in Xorg session.
- xrandr shows nouveau outputs as DP-1, DP-2 and DP-3.
- I am able to successfully enable and disable DVI monitor connected to nou=
veau
adapter.
- xrandr shows correct connected/disconnected state for the DVI output.
- Graphics on the DVI monitor are corrupted, for example moving xterm around
the DVI display leaves trace of the xterm contents behind, but let's not fo=
cus
on that on this bug :) it kind of works.

02-dvi-connected-at-boot-no-nouveau-outputs-detected-in-xrandr:
- DVI cable is connected to nouveau at boot time.
- xrandr does *not* show any nouveau outputs, so it's not possible to
enable/disable DVI monitor.
- DVI monitor shows black/white corrupted pattern, even when it should be a=
ll
empty/black in this case because it's not in use.
- Screenshot of the DVI monitor included in the .tar.gz.

03-dvi-connected-at-boot-nouveau-outputs-detected-as-displayport-in-xrandr:
- DVI cable is connected to nouveau at boot time.
- xrandr shows nouveau outputs as DisplayPort-0, DisplayPort-1 and
DisplayPort-2.
- Trying to enable DVI monitor connected to nouveau results in hard kernel
crash (but we have the other bug open about the kernel crash issue).</pre>
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

--1377111658.BaEA301.24276--

--===============0498871359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0498871359==--
