From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68075] nouveau inconsistent changing output
 connector names in xrandr
Date: Tue, 13 Aug 2013 21:05:55 +0000
Message-ID: <bug-68075-8800-LTPyQr6ZBN@http.bugs.freedesktop.org/>
References: <bug-68075-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1648927003=="
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


--===============1648927003==
Content-Type: multipart/alternative; boundary="1376427955.CCfd861.24823"; charset="us-ascii"


--1376427955.CCfd861.24823
Date: Tue, 13 Aug 2013 21:05:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D68075

--- Comment #3 from Pasi K=C3=A4rkk=C3=A4inen <pasik-X3B1VOXEql0@public.gmane.org> ---

Logs added for 3 different scenarios. Kernel booted with
"nouveau.debug=3DPDISP=3Ddebug" in all cases.=20

For each case there is:

- kernel dmesg.
- output of "xrandr" command in Xorg.
- output of "ls /sys/class/drm" command.
- output of "grep conn /sys/class/drm/card*/status" command.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1376427955.CCfd861.24823
Date: Tue, 13 Aug 2013 21:05:55 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D68075#c3">Comment=
 # 3</a>
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
Logs added for 3 different scenarios. Kernel booted with
&quot;nouveau.debug=3DPDISP=3Ddebug&quot; in all cases.=20

For each case there is:

- kernel dmesg.
- output of &quot;xrandr&quot; command in Xorg.
- output of &quot;ls /sys/class/drm&quot; command.
- output of &quot;grep conn /sys/class/drm/card*/status&quot; command.</pre>
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

--1376427955.CCfd861.24823--

--===============1648927003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1648927003==--
