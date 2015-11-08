From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69882] [NVE6] GPU lockups
Date: Sun, 08 Nov 2015 17:35:21 +0000
Message-ID: <bug-69882-8800-h8abPQvlWQ@http.bugs.freedesktop.org/>
References: <bug-69882-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0792948302=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69882-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0792948302==
Content-Type: multipart/alternative; boundary="1447004121.48AC4c12.20047"; charset="UTF-8"


--1447004121.48AC4c12.20047
Date: Sun, 8 Nov 2015 17:35:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D69882

--- Comment #16 from Dainius Masili=C5=ABnas <pastas4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Right. I retested now with both kernel 4.3 and Mesa 11.0.4, and... well, it
locks up, but with the kernel warning "../include/drm/drm_crtc.h:1577
drm_helper_choose_encoder_dpms" which seems to point to
http://lists.freedesktop.org/archives/dri-devel/2015-September/091091.html =
and
isn't actually a nouveau issue.

This prevents me from testing for the nouveau issue until the kernel gets
fixed...

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1447004121.48AC4c12.20047
Date: Sun, 8 Nov 2015 17:35:21 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE6] GPU lockups"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D69882#c16">Commen=
t # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE6] GPU lockups"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D69882">bug 69882<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pastas4&#64;gmail.com" title=3D"Dainius Masili=C5=ABnas &lt;pastas4&#64;gma=
il.com&gt;"> <span class=3D"fn">Dainius Masili=C5=ABnas</span></a>
</span></b>
        <pre>Right. I retested now with both kernel 4.3 and Mesa 11.0.4, an=
d... well, it
locks up, but with the kernel warning &quot;../include/drm/drm_crtc.h:1577
drm_helper_choose_encoder_dpms&quot; which seems to point to
<a href=3D"http://lists.freedesktop.org/archives/dri-devel/2015-September/0=
91091.html">http://lists.freedesktop.org/archives/dri-devel/2015-September/=
091091.html</a> and
isn't actually a nouveau issue.

This prevents me from testing for the nouveau issue until the kernel gets
fixed...</pre>
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

--1447004121.48AC4c12.20047--

--===============0792948302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0792948302==--
