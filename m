From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82527] xset dpms force {off, standby,
 suspend} returns after ~20 seconds (GeForce 8400 GS)
Date: Thu, 14 Aug 2014 00:12:03 +0000
Message-ID: <bug-82527-8800-rVLoAo74eS@http.bugs.freedesktop.org/>
References: <bug-82527-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1041640707=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82527-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1041640707==
Content-Type: multipart/alternative; boundary="1407975123.0df31.6098"; charset="us-ascii"


--1407975123.0df31.6098
Date: Thu, 14 Aug 2014 00:12:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D82527

--- Comment #4 from Martin V=C3=A4th <martin-hvkNLsi7f8w@public.gmane.org> ---
(In reply to comment #3)
> 1:10 slim[256]: (EE) module ABI major version (13) doesn't match the
> server's version (15)

This was the v4l driver. I recompiled, but unsurprisingly, it does not chan=
ge
anything concerning the reported problem.

> Did you try to do a "xset dpms force off" in that log

This produced no output in the log, also not with the following:

> Would you mind adding "drm.debug=3D0xe" to the kernel command line

This did not change the output, either. Still no output when calling
xset dpms force off

I will attach the new boot log, but it is practically the same.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1407975123.0df31.6098
Date: Thu, 14 Aug 2014 00:12:03 +0000
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
   title=3D"NEW --- - xset dpms force {off,standby,suspend} returns after ~=
20 seconds (GeForce 8400 GS)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D82527#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - xset dpms force {off,standby,suspend} returns after ~=
20 seconds (GeForce 8400 GS)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D82527">bug 82527<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
martin&#64;mvath.de" title=3D"Martin V=C3=A4th &lt;martin&#64;mvath.de&gt;"=
> <span class=3D"fn">Martin V=C3=A4th</span></a>
</span></b>
        <pre>(In reply to <a href=3D"show_bug.cgi?id=3D82527#c3">comment #3=
</a>)
<span class=3D"quote">&gt; 1:10 slim[256]: (EE) module ABI major version (1=
3) doesn't match the
&gt; server's version (15)</span >

This was the v4l driver. I recompiled, but unsurprisingly, it does not chan=
ge
anything concerning the reported problem.

<span class=3D"quote">&gt; Did you try to do a &quot;xset dpms force off&qu=
ot; in that log</span >

This produced no output in the log, also not with the following:

<span class=3D"quote">&gt; Would you mind adding &quot;drm.debug=3D0xe&quot=
; to the kernel command line</span >

This did not change the output, either. Still no output when calling
xset dpms force off

I will attach the new boot log, but it is practically the same.</pre>
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

--1407975123.0df31.6098--

--===============1041640707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1041640707==--
