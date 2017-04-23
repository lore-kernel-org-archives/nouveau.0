From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100760] Rapid flickering when an app is placed on
 the second Nouveau ZaphodHeads display
Date: Sun, 23 Apr 2017 05:22:21 +0000
Message-ID: <bug-100760-8800-K56hSl1GUD@http.bugs.freedesktop.org/>
References: <bug-100760-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1900196280=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100760-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1900196280==
Content-Type: multipart/alternative; boundary="14929249411.eC6ABE1E.2337";
 charset="UTF-8"


--14929249411.eC6ABE1E.2337
Date: Sun, 23 Apr 2017 05:22:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100760

--- Comment #3 from mrj-ejQy8aU/RJumpXlQD71PVDSf8X3wrgjD@public.gmane.org ---
Many thanks Ilia for those helpful suggestions.

The results of the experiments are, that in ZaphodHeads mode:

1. Running "DISPLAY=3D:0.1 gnome-terminal" under all window managers makes =
the
terminal display correctly, but on display :0.0.

2. Running "DISPLAY=3D:0.1 mate-terminal" or "DISPLAY=3D:0.1 xterm" under G=
nome 3,
Gnome Classic, or Gnome on X (rather than Wayland) makes the terminal appea=
r on
display :0.1 without flickering, but there's no window border, and any typi=
ng
goes to the original terminal.

3. Running "DISPLAY=3D:0.1 mate-terminal" or "DISPLAY=3D:0.1 xterm" under M=
ATE
causes the same as above plus the intense flickering.

So the flickering is a MATE problem, but the inability to use the second
display is an X problem. This matches my experience with the problems start=
ing
under the proprietary driver, with the background image and menus going fir=
st,
and later requiring the explicit setting of DISPLAY.

I've found independent virtual desktops such a productive feature, I'm
disappointed it's going away.

I suppose other than the fix-it-myself option you suggest, I could:

1. Try to install an X (and maybe also a MATE) downgrade, such as the one t=
hat
was working on F23,

2. Get a new graphics card to see whether that works with twin X-displays on
either Nouveau or the proprietary driver (again the hardware will have
outlasted the software). Is anyone successfully using Zaphod on a current
distro?, or

3. Wait for an X update that fixes this.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14929249411.eC6ABE1E.2337
Date: Sun, 23 Apr 2017 05:22:21 +0000
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
   title=3D"NEW - Rapid flickering when an app is placed on the second Nouv=
eau ZaphodHeads display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100760#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Rapid flickering when an app is placed on the second Nouv=
eau ZaphodHeads display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100760">bug 10076=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mrj&#64;advancedcontrols.com.au" title=3D"mrj&#64;advancedcontrols.com.au">=
mrj&#64;advancedcontrols.com.au</a>
</span></b>
        <pre>Many thanks Ilia for those helpful suggestions.

The results of the experiments are, that in ZaphodHeads mode:

1. Running &quot;DISPLAY=3D:0.1 gnome-terminal&quot; under all window manag=
ers makes the
terminal display correctly, but on display :0.0.

2. Running &quot;DISPLAY=3D:0.1 mate-terminal&quot; or &quot;DISPLAY=3D:0.1=
 xterm&quot; under Gnome 3,
Gnome Classic, or Gnome on X (rather than Wayland) makes the terminal appea=
r on
display :0.1 without flickering, but there's no window border, and any typi=
ng
goes to the original terminal.

3. Running &quot;DISPLAY=3D:0.1 mate-terminal&quot; or &quot;DISPLAY=3D:0.1=
 xterm&quot; under MATE
causes the same as above plus the intense flickering.

So the flickering is a MATE problem, but the inability to use the second
display is an X problem. This matches my experience with the problems start=
ing
under the proprietary driver, with the background image and menus going fir=
st,
and later requiring the explicit setting of DISPLAY.

I've found independent virtual desktops such a productive feature, I'm
disappointed it's going away.

I suppose other than the fix-it-myself option you suggest, I could:

1. Try to install an X (and maybe also a MATE) downgrade, such as the one t=
hat
was working on F23,

2. Get a new graphics card to see whether that works with twin X-displays on
either Nouveau or the proprietary driver (again the hardware will have
outlasted the software). Is anyone successfully using Zaphod on a current
distro?, or

3. Wait for an X update that fixes this.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14929249411.eC6ABE1E.2337--

--===============1900196280==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1900196280==--
