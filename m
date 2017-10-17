From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101778] Kernel Error on Lenovo P51 when setting
 graphics to hybrid (Nvidia Optimus with intel+nvidia)
Date: Tue, 17 Oct 2017 11:22:10 +0000
Message-ID: <bug-101778-8800-FyK8nh9u4i@http.bugs.freedesktop.org/>
References: <bug-101778-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1913419364=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101778-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1913419364==
Content-Type: multipart/alternative; boundary="15082393291.CB5E.4610";
 charset="UTF-8"


--15082393291.CB5E.4610
Date: Tue, 17 Oct 2017 11:22:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101778

--- Comment #6 from Josef Larsson <josef.lar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Same problem here with my Thinkpad P51 with docking station.

If I add a check for assignment of drm->fbcon in nv50_mstm_register_connect=
or,
the system hangs instead upon start of Xorg, so since my line of code has t=
his
effect, I guess drm->fbcon =3D=3D 0?

if (drm->fbcon)
    drm_fb_helper_add_one_connector(&drm->fbcon->helper, connector);

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15082393291.CB5E.4610
Date: Tue, 17 Oct 2017 11:22:09 +0000
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
   title=3D"NEW - Kernel Error on Lenovo P51 when setting graphics to hybri=
d (Nvidia Optimus with intel+nvidia)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101778#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel Error on Lenovo P51 when setting graphics to hybri=
d (Nvidia Optimus with intel+nvidia)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101778">bug 10177=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
josef.lar&#64;gmail.com" title=3D"Josef Larsson &lt;josef.lar&#64;gmail.com=
&gt;"> <span class=3D"fn">Josef Larsson</span></a>
</span></b>
        <pre>Same problem here with my Thinkpad P51 with docking station.

If I add a check for assignment of drm-&gt;fbcon in nv50_mstm_register_conn=
ector,
the system hangs instead upon start of Xorg, so since my line of code has t=
his
effect, I guess drm-&gt;fbcon =3D=3D 0?

if (drm-&gt;fbcon)
    drm_fb_helper_add_one_connector(&amp;drm-&gt;fbcon-&gt;helper, connecto=
r);</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15082393291.CB5E.4610--

--===============1913419364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1913419364==--
