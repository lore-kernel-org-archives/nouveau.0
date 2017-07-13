From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101778] Kernel Error on Lenovo P51 when setting
 graphics to hybrid (Nvidia Optimus with intel+nvidia)
Date: Thu, 13 Jul 2017 12:36:37 +0000
Message-ID: <bug-101778-8800-JL0tPSPoG0@http.bugs.freedesktop.org/>
References: <bug-101778-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1710822210=="
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


--===============1710822210==
Content-Type: multipart/alternative; boundary="14999493970.14AaA0.26767";
 charset="UTF-8"


--14999493970.14AaA0.26767
Date: Thu, 13 Jul 2017 12:36:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101778

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Well, on the up side, MST is getting properly detected now. On the down sid=
e,
it oopses.

Ignoring the WARNING for a minute, the oops is in

nv50_mstm_register_connector calling drm_fb_helper_add_one_connector.

The Quadro M1200 appears to be a GM107 based on pci.ids. Can you double-che=
ck?=20

$ lspci -nn -d 10de:

Also can you supply the full dmesg from boot up to the oops, having booted =
with
nouveau.debug=3Ddebug drm.debug=3D0x1e ?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14999493970.14AaA0.26767
Date: Thu, 13 Jul 2017 12:36:36 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101778#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel Error on Lenovo P51 when setting graphics to hybri=
d (Nvidia Optimus with intel+nvidia)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101778">bug 10177=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Well, on the up side, MST is getting properly detected now. On=
 the down side,
it oopses.

Ignoring the WARNING for a minute, the oops is in

nv50_mstm_register_connector calling drm_fb_helper_add_one_connector.

The Quadro M1200 appears to be a GM107 based on pci.ids. Can you double-che=
ck?=20

$ lspci -nn -d 10de:

Also can you supply the full dmesg from boot up to the oops, having booted =
with
nouveau.debug=3Ddebug drm.debug=3D0x1e ?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14999493970.14AaA0.26767--

--===============1710822210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1710822210==--
