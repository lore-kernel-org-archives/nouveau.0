From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91523] [NVE7] driver cannot initialize gpu(failed to
 parse ramcfg data)
Date: Wed, 22 Nov 2017 20:43:43 +0000
Message-ID: <bug-91523-8800-dajm9bef6s@http.bugs.freedesktop.org/>
References: <bug-91523-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0196734827=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91523-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0196734827==
Content-Type: multipart/alternative; boundary="15113834221.D71F1.15994";
 charset="UTF-8"


--15113834221.D71F1.15994
Date: Wed, 22 Nov 2017 20:43:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D91523

--- Comment #5 from default_357-line-LWAfsSFWpa4@public.gmane.org ---
I still get this error in 4.14.1. Same laptop, same vbios.rom. If I comment=
 out
the "return ret" in
https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/nouveau/nvkm/=
subdev/fb/ramgk104.c#L1577,
it boots and runs 3d acceleration with xrandr offload, but cannot reclock
successfully.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15113834221.D71F1.15994
Date: Wed, 22 Nov 2017 20:43:42 +0000
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
   title=3D"NEW - [NVE7] driver cannot initialize gpu(failed to parse ramcf=
g data)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91523#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] driver cannot initialize gpu(failed to parse ramcf=
g data)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91523">bug 91523<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
default_357-line&#64;yahoo.de" title=3D"default_357-line&#64;yahoo.de">defa=
ult_357-line&#64;yahoo.de</a>
</span></b>
        <pre>I still get this error in 4.14.1. Same laptop, same vbios.rom.=
 If I comment out
the &quot;return ret&quot; in
<a href=3D"https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/no=
uveau/nvkm/subdev/fb/ramgk104.c#L1577">https://github.com/torvalds/linux/bl=
ob/master/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c#L1577</a>,
it boots and runs 3d acceleration with xrandr offload, but cannot reclock
successfully.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15113834221.D71F1.15994--

--===============0196734827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0196734827==--
