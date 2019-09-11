From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111642] NV43 GeForce 6600 Nouveau is not stable on
 legacy hardware
Date: Wed, 11 Sep 2019 12:06:26 +0000
Message-ID: <bug-111642-8800-I9WByNQpOU@http.bugs.freedesktop.org/>
References: <bug-111642-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0992701614=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111642-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0992701614==
Content-Type: multipart/alternative; boundary="15682035861.E86cfbbd0.28208"
Content-Transfer-Encoding: 7bit


--15682035861.E86cfbbd0.28208
Date: Wed, 11 Sep 2019 12:06:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111642

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Vasili Pupkin from comment #2)
> Ubuntu 16.04 works just fine with nvidia-304 drivers. If the lack of ram =
is
> the problem it would be helpful to have better diagnostic messages.

We have them.

[  199.658774] nouveau 0000:04:00.0: systemd-logind[1352]: validate: -22
[  199.658902] nouveau 0000:04:00.0: systemd-logind[1352]: fail set_domain
[  199.658905] nouveau 0000:04:00.0: systemd-logind[1352]: validating bo li=
st

This indicates a lack of ability to place all the buffers needed into vram/=
gart
as requested by the submitter.

The NVIDIA drivers will work much better for you if you're trying to make h=
eavy
use of GL, like modern systems like to do.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15682035861.E86cfbbd0.28208
Date: Wed, 11 Sep 2019 12:06:26 +0000
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
   title=3D"NEW - NV43 GeForce 6600 Nouveau is not stable on legacy hardwar=
e"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111642#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - NV43 GeForce 6600 Nouveau is not stable on legacy hardwar=
e"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111642">bug 11164=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Vasili Pupkin from <a href=3D"show_bug.cgi?id=3D1=
11642#c2">comment #2</a>)
<span class=3D"quote">&gt; Ubuntu 16.04 works just fine with nvidia-304 dri=
vers. If the lack of ram is
&gt; the problem it would be helpful to have better diagnostic messages.</s=
pan >

We have them.

[  199.658774] nouveau 0000:04:00.0: systemd-logind[1352]: validate: -22
[  199.658902] nouveau 0000:04:00.0: systemd-logind[1352]: fail set_domain
[  199.658905] nouveau 0000:04:00.0: systemd-logind[1352]: validating bo li=
st

This indicates a lack of ability to place all the buffers needed into vram/=
gart
as requested by the submitter.

The NVIDIA drivers will work much better for you if you're trying to make h=
eavy
use of GL, like modern systems like to do.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15682035861.E86cfbbd0.28208--

--===============0992701614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0992701614==--
