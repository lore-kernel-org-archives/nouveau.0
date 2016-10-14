From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98240] Kernel module fails to load on HP Pavilion
 V3A33AV laptop.
Date: Fri, 14 Oct 2016 02:27:55 +0000
Message-ID: <bug-98240-8800-czX9ymUFZV@http.bugs.freedesktop.org/>
References: <bug-98240-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1928903005=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98240-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1928903005==
Content-Type: multipart/alternative; boundary="14764120751.F43eA.28254";
 charset="UTF-8"


--14764120751.F43eA.28254
Date: Fri, 14 Oct 2016 02:27:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98240

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I'm looking over the fast logic and it seems like it should have worked. Th=
is
debug patch should provide more info on what's going wrong. Mind reinstating
the line in shadowacpi.c and applying the below?


diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c
b/drivers/gpu/drm/nouveau/nouveau_acpi.c
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -423,7 +423,9 @@ bool nouveau_acpi_rom_supported(struct device *dev)

 int nouveau_acpi_get_bios_chunk(uint8_t *bios, int offset, int len)
 {
-       return nouveau_rom_call(nouveau_dsm_priv.rom_handle, bios, offset,
len);
+       int ret =3D nouveau_rom_call(nouveau_dsm_priv.rom_handle, bios, off=
set,
len);
+       printk(KERN_INFO "retrieving _ROM off: 0x%x, len: 0x%x, ret: 0x%x",
offset, len, ret);
+       return ret;
 }

 void *

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14764120751.F43eA.28254
Date: Fri, 14 Oct 2016 02:27:55 +0000
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
   title=3D"NEW - Kernel module fails to load on HP Pavilion V3A33AV laptop=
."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98240#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel module fails to load on HP Pavilion V3A33AV laptop=
."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98240">bug 98240<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I'm looking over the fast logic and it seems like it should ha=
ve worked. This
debug patch should provide more info on what's going wrong. Mind reinstating
the line in shadowacpi.c and applying the below?


diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c
b/drivers/gpu/drm/nouveau/nouveau_acpi.c
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
&#64;&#64; -423,7 +423,9 &#64;&#64; bool nouveau_acpi_rom_supported(struct =
device *dev)

 int nouveau_acpi_get_bios_chunk(uint8_t *bios, int offset, int len)
 {
-       return nouveau_rom_call(nouveau_dsm_priv.rom_handle, bios, offset,
len);
+       int ret =3D nouveau_rom_call(nouveau_dsm_priv.rom_handle, bios, off=
set,
len);
+       printk(KERN_INFO &quot;retrieving _ROM off: 0x%x, len: 0x%x, ret: 0=
x%x&quot;,
offset, len, ret);
+       return ret;
 }

 void *</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14764120751.F43eA.28254--

--===============1928903005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1928903005==--
