From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108873] nouveau/Quadro P2000 Mobile: runpm causing
 ACPI errors, lockups
Date: Mon, 18 Nov 2019 01:14:08 +0000
Message-ID: <bug-108873-8800-xrzdYWfYE1@http.bugs.freedesktop.org/>
References: <bug-108873-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1247586766=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108873-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1247586766==
Content-Type: multipart/alternative; boundary="15740396480.1a3Aa7e.11989"
Content-Transfer-Encoding: 7bit


--15740396480.1a3Aa7e.11989
Date: Mon, 18 Nov 2019 01:14:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108873

--- Comment #4 from mst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org ---
just to clarify, without noaccel=3D1,
I see lots of timeout warnings, all around this line:
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c:224
gf100_vmm_invalidate+0x1c9/0x1e0 [nouveau]

and then things like xrandr seem to hang.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15740396480.1a3Aa7e.11989
Date: Mon, 18 Nov 2019 01:14:08 +0000
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
   title=3D"NEW - nouveau/Quadro P2000 Mobile: runpm causing ACPI errors, l=
ockups"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108873#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau/Quadro P2000 Mobile: runpm causing ACPI errors, l=
ockups"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108873">bug 10887=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mst&#64;redhat.com" title=3D"mst&#64;redhat.com">mst&#64;redhat.com</a>
</span></b>
        <pre>just to clarify, without noaccel=3D1,
I see lots of timeout warnings, all around this line:
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c:224
gf100_vmm_invalidate+0x1c9/0x1e0 [nouveau]

and then things like xrandr seem to hang.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15740396480.1a3Aa7e.11989--

--===============1247586766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1247586766==--
