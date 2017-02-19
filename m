From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99858] [NVAC] disp: ERROR 4 [INVALID_VALUE] 84 []
 chid 0 mthd 0828 data 000099bb
Date: Sun, 19 Feb 2017 18:26:23 +0000
Message-ID: <bug-99858-8800-7JYpkkglgo@http.bugs.freedesktop.org/>
References: <bug-99858-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1530305363=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99858-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1530305363==
Content-Type: multipart/alternative; boundary="14875287831.3cB5.30613";
 charset="UTF-8"


--14875287831.3cB5.30613
Date: Sun, 19 Feb 2017 18:26:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99858

--- Comment #6 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

$ curl -s
https://cdn.kernel.org/pub/linux/kernel/v4.x/testing/patch-4.10-rc7.xz | xz=
grep
-B6 "case 0xa[ac]:"
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
@@ -433,8 +433,6 @@ nv50_disp_dptmds_war(struct nvkm_device *device)
        case 0x94:
        case 0x96:
        case 0x98:
-       case 0xaa:
-       case 0xac:

And just in case one more time for 4.10-rc8 :)

$ curl -s
https://cdn.kernel.org/pub/linux/kernel/v4.x/testing/patch-4.10-rc8.xz | xz=
grep
-B6 "case 0xa[ac]:"
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
@@ -433,8 +433,6 @@ nv50_disp_dptmds_war(struct nvkm_device *device)
        case 0x94:
        case 0x96:
        case 0x98:
-       case 0xaa:
-       case 0xac:

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14875287831.3cB5.30613
Date: Sun, 19 Feb 2017 18:26:23 +0000
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
   title=3D"NEW - [NVAC] disp: ERROR 4 [INVALID_VALUE] 84 [] chid 0 mthd 08=
28 data 000099bb"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99858#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVAC] disp: ERROR 4 [INVALID_VALUE] 84 [] chid 0 mthd 08=
28 data 000099bb"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99858">bug 99858<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pomidorabelisima&#64;gmail.com" title=3D"poma &lt;pomidorabelisima&#64;gmai=
l.com&gt;"> <span class=3D"fn">poma</span></a>
</span></b>
        <pre>
$ curl -s
<a href=3D"https://cdn.kernel.org/pub/linux/kernel/v4.x/testing/patch-4.10-=
rc7.xz">https://cdn.kernel.org/pub/linux/kernel/v4.x/testing/patch-4.10-rc7=
.xz</a> | xzgrep
-B6 &quot;case 0xa[ac]:&quot;
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
&#64;&#64; -433,8 +433,6 &#64;&#64; nv50_disp_dptmds_war(struct nvkm_device=
 *device)
        case 0x94:
        case 0x96:
        case 0x98:
-       case 0xaa:
-       case 0xac:

And just in case one more time for 4.10-rc8 :)

$ curl -s
<a href=3D"https://cdn.kernel.org/pub/linux/kernel/v4.x/testing/patch-4.10-=
rc8.xz">https://cdn.kernel.org/pub/linux/kernel/v4.x/testing/patch-4.10-rc8=
.xz</a> | xzgrep
-B6 &quot;case 0xa[ac]:&quot;
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
&#64;&#64; -433,8 +433,6 &#64;&#64; nv50_disp_dptmds_war(struct nvkm_device=
 *device)
        case 0x94:
        case 0x96:
        case 0x98:
-       case 0xaa:
-       case 0xac:</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14875287831.3cB5.30613--

--===============1530305363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1530305363==--
