From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110660] GeForce GT 750M Mac Edition fullscreen issues
Date: Sat, 11 May 2019 16:20:31 +0000
Message-ID: <bug-110660-8800-g73a7hCTgB@http.bugs.freedesktop.org/>
References: <bug-110660-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1954499055=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110660-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1954499055==
Content-Type: multipart/alternative; boundary="15575916300.28bd70b.3430"
Content-Transfer-Encoding: 7bit


--15575916300.28bd70b.3430
Date: Sat, 11 May 2019 16:20:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110660

--- Comment #26 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Alexey Kuznetsov from comment #25)
> axet@axet-laptop:~/Downloads$ grep . /sys/class/drm/card*-*/modes
> /sys/class/drm/card0-eDP-1/modes:2880x1800
> /sys/class/drm/card0-eDP-1/modes:1920x1200
> /sys/class/drm/card0-eDP-1/modes:1920x1080
> /sys/class/drm/card0-eDP-1/modes:1600x1200
> /sys/class/drm/card0-eDP-1/modes:1680x1050
> /sys/class/drm/card0-eDP-1/modes:1400x1050
> /sys/class/drm/card0-eDP-1/modes:1280x1024
> /sys/class/drm/card0-eDP-1/modes:1280x960
> /sys/class/drm/card0-eDP-1/modes:1152x864
> /sys/class/drm/card0-eDP-1/modes:1024x768
> /sys/class/drm/card0-eDP-1/modes:800x600
> /sys/class/drm/card0-eDP-1/modes:640x480
> /sys/class/drm/card0-eDP-1/modes:720x400
> /sys/class/drm/card0-eDP-1/modes:640x400
> /sys/class/drm/card0-eDP-1/modes:640x350
> axet@axet-laptop:~/Downloads$=20

Thanks, that's useful. I'm going to study the code a bit to figure out where
these extra modes are coming from exactly. They're not in the EDID explicit=
ly,
but there's various logic to add various extra modes based on ... complex
conditions.

> Also, "Full aspect" cut display from left and right on following resoluti=
ons:
>=20
> 1920x1080
> 720x400
> 640x350

Hm, ideally they should have letterboxes on top/bottom in those cases. I'll
have a look at the logic that does the full aspect scaling, it may be
determining width/heights incorrectly.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15575916300.28bd70b.3430
Date: Sat, 11 May 2019 16:20:30 +0000
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
   title=3D"NEW - GeForce GT 750M Mac Edition fullscreen issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110660#c26">Comme=
nt # 26</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GeForce GT 750M Mac Edition fullscreen issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110660">bug 11066=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Alexey Kuznetsov from <a href=3D"show_bug.cgi?id=
=3D110660#c25">comment #25</a>)
<span class=3D"quote">&gt; axet&#64;axet-laptop:~/Downloads$ grep . /sys/cl=
ass/drm/card*-*/modes
&gt; /sys/class/drm/card0-eDP-1/modes:2880x1800
&gt; /sys/class/drm/card0-eDP-1/modes:1920x1200
&gt; /sys/class/drm/card0-eDP-1/modes:1920x1080
&gt; /sys/class/drm/card0-eDP-1/modes:1600x1200
&gt; /sys/class/drm/card0-eDP-1/modes:1680x1050
&gt; /sys/class/drm/card0-eDP-1/modes:1400x1050
&gt; /sys/class/drm/card0-eDP-1/modes:1280x1024
&gt; /sys/class/drm/card0-eDP-1/modes:1280x960
&gt; /sys/class/drm/card0-eDP-1/modes:1152x864
&gt; /sys/class/drm/card0-eDP-1/modes:1024x768
&gt; /sys/class/drm/card0-eDP-1/modes:800x600
&gt; /sys/class/drm/card0-eDP-1/modes:640x480
&gt; /sys/class/drm/card0-eDP-1/modes:720x400
&gt; /sys/class/drm/card0-eDP-1/modes:640x400
&gt; /sys/class/drm/card0-eDP-1/modes:640x350
&gt; axet&#64;axet-laptop:~/Downloads$ </span >

Thanks, that's useful. I'm going to study the code a bit to figure out where
these extra modes are coming from exactly. They're not in the EDID explicit=
ly,
but there's various logic to add various extra modes based on ... complex
conditions.

<span class=3D"quote">&gt; Also, &quot;Full aspect&quot; cut display from l=
eft and right on following resolutions:
&gt;=20
&gt; 1920x1080
&gt; 720x400
&gt; 640x350</span >

Hm, ideally they should have letterboxes on top/bottom in those cases. I'll
have a look at the logic that does the full aspect scaling, it may be
determining width/heights incorrectly.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15575916300.28bd70b.3430--

--===============1954499055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1954499055==--
