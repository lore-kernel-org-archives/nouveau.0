From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98240] Kernel module fails to load on HP Pavilion
 V3A33AV laptop.
Date: Fri, 14 Oct 2016 02:33:31 +0000
Message-ID: <bug-98240-8800-cmtPmFYhse@http.bugs.freedesktop.org/>
References: <bug-98240-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0835998224=="
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


--===============0835998224==
Content-Type: multipart/alternative; boundary="14764124112.Ba73a4E.29007";
 charset="UTF-8"


--14764124112.Ba73a4E.29007
Date: Fri, 14 Oct 2016 02:33:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98240

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #6)
> I'm looking over the fast logic and it seems like it should have worked.
> This debug patch should provide more info on what's going wrong. Mind
> reinstating the line in shadowacpi.c and applying the below?
>=20
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c
> b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> --- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> @@ -423,7 +423,9 @@ bool nouveau_acpi_rom_supported(struct device *dev)
>=20=20
>  int nouveau_acpi_get_bios_chunk(uint8_t *bios, int offset, int len)
>  {
> -       return nouveau_rom_call(nouveau_dsm_priv.rom_handle, bios, offset,
> len);
> +       int ret =3D nouveau_rom_call(nouveau_dsm_priv.rom_handle, bios,
> offset, len);
> +       printk(KERN_INFO "retrieving _ROM off: 0x%x, len: 0x%x, ret: 0x%x=
",
> offset, len, ret);

Er, that should probably have a \n at the end of the string. My bad.

> +       return ret;
>  }
>=20=20
>  void *

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14764124112.Ba73a4E.29007
Date: Fri, 14 Oct 2016 02:33:31 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98240#c10">Commen=
t # 10</a>
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
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D982=
40#c6">comment #6</a>)
<span class=3D"quote">&gt; I'm looking over the fast logic and it seems lik=
e it should have worked.
&gt; This debug patch should provide more info on what's going wrong. Mind
&gt; reinstating the line in shadowacpi.c and applying the below?
&gt;=20
&gt;=20
&gt; diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c
&gt; b/drivers/gpu/drm/nouveau/nouveau_acpi.c
&gt; --- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
&gt; +++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
&gt; &#64;&#64; -423,7 +423,9 &#64;&#64; bool nouveau_acpi_rom_supported(st=
ruct device *dev)
&gt;=20=20
&gt;  int nouveau_acpi_get_bios_chunk(uint8_t *bios, int offset, int len)
&gt;  {
&gt; -       return nouveau_rom_call(nouveau_dsm_priv.rom_handle, bios, off=
set,
&gt; len);
&gt; +       int ret =3D nouveau_rom_call(nouveau_dsm_priv.rom_handle, bios,
&gt; offset, len);
&gt; +       printk(KERN_INFO &quot;retrieving _ROM off: 0x%x, len: 0x%x, r=
et: 0x%x&quot;,
&gt; offset, len, ret);</span >

Er, that should probably have a \n at the end of the string. My bad.

<span class=3D"quote">&gt; +       return ret;
&gt;  }
&gt;=20=20
&gt;  void *</span ></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14764124112.Ba73a4E.29007--

--===============0835998224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0835998224==--
