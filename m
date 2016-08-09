From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31122] Cannot control backlight intensity on
	Powerbook
Date: Tue, 09 Aug 2016 10:05:27 +0000
Message-ID: <bug-31122-8800-LS6Mk9wHl4@http.bugs.freedesktop.org/>
References: <bug-31122-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1556180799=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31122-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1556180799==
Content-Type: multipart/alternative; boundary="14707371280.Dd28F.24775";
 charset="UTF-8"


--14707371280.Dd28F.24775
Date: Tue, 9 Aug 2016 10:05:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D31122

--- Comment #14 from Karol Herbst <freedesktop-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org> ---
Comment on attachment 125562
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D125562
backlight control w/ gpio check

Review of attachment 125562:
-----------------------------------------------------------------

Please read the Linux kernel coding style:
https://www.kernel.org/doc/Documentation/CodingStyle
and adjust your Patch to that (especially the tabs except spaces part).

Also there are a few things I really dislike:

 1. way too coarse backlight level control.
    Please consider exposing the full range and remove all the curve handli=
ng
code.
    Userspace should handle this _not_ the kernel. It makes the code much
cleaner and easier to read.

 2. it only works for powerpc. Is there any reason to make it ppc only?

more things inline.

::: nouveau_backlight.c.orig
@@ +49,5 @@
> +        struct nvif_object *device =3D &drm->device.object;
> +        int val =3D (nvif_rd32(device, NV30_PMC_BACKLIGHT) &
> +                                   NV30_PMC_BACKLIGHT_MASK) >> 16;
> +        int i;
> +        for(i=3D0;i<sizeof(NV30_BL_CURVE)/sizeof(NV30_BL_CURVE[0]);i++)

spaces

@@ +54,5 @@
> +        {
> +                if(NV30_BL_CURVE[i] =3D=3D val) return i;
> +        }
> +
> +        return sizeof(NV30_BL_CURVE)/sizeof(NV30_BL_CURVE[0]);

spaces

@@ +66,5 @@
> +        struct nvif_object *device =3D &drm->device.object;
> +        int val =3D bd->props.brightness;
> +
> +        nvif_wr32(device, NV30_PMC_BACKLIGHT,
> +                 (NV30_BL_CURVE[val] << 16) + 0x80000535);

what does the 0x535 part stands for? Is it to protect against turning off t=
he
display by accident? In that case, remove it.

@@ +87,5 @@
> +        struct backlight_device *bd;
> +=09
> +	struct dcb_gpio_func func;
> +	struct nvkm_gpio *gpio =3D nvxx_gpio(&drm->device);
> +	int ret =3D nvkm_gpio_find(gpio, 0,0x00,0xff, &func);

spaces

@@ +97,5 @@
> +                return 0;
> +
> +        memset(&props, 0, sizeof(struct backlight_properties));
> +        props.type =3D BACKLIGHT_RAW;
> +        props.max_brightness =3D sizeof(NV30_BL_CURVE)/sizeof(NV30_BL_CU=
RVE[0])-1;

spaces

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14707371280.Dd28F.24775
Date: Tue, 9 Aug 2016 10:05:28 +0000
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
   title=3D"NEW - Cannot control backlight intensity on Powerbook"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D31122#c14">Commen=
t # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Cannot control backlight intensity on Powerbook"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D31122">bug 31122<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;karolherbst.de" title=3D"Karol Herbst &lt;freedesktop&#64;k=
arolherbst.de&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>Comment on <span class=3D""><a href=3D"attachment.cgi?id=3D125=
562" name=3D"attach_125562" title=3D"backlight control w/ gpio check">attac=
hment 125562</a> <a href=3D"attachment.cgi?id=3D125562&amp;action=3Dedit" t=
itle=3D"backlight control w/ gpio check">[details]</a></span> <a href=3D'pa=
ge.cgi?id=3Dsplinter.html&amp;bug=3D31122&amp;attachment=3D125562'>[review]=
</a>
backlight control w/ gpio check

Review of <span class=3D""><a href=3D"attachment.cgi?id=3D125562" name=3D"a=
ttach_125562" title=3D"backlight control w/ gpio check">attachment 125562</=
a> <a href=3D"attachment.cgi?id=3D125562&amp;action=3Dedit" title=3D"backli=
ght control w/ gpio check">[details]</a></span> <a href=3D'page.cgi?id=3Dsp=
linter.html&amp;bug=3D31122&amp;attachment=3D125562'>[review]</a>:
-----------------------------------------------------------------

Please read the Linux kernel coding style:
<a href=3D"https://www.kernel.org/doc/Documentation/CodingStyle">https://ww=
w.kernel.org/doc/Documentation/CodingStyle</a>
and adjust your Patch to that (especially the tabs except spaces part).

Also there are a few things I really dislike:

 1. way too coarse backlight level control.
    Please consider exposing the full range and remove all the curve handli=
ng
code.
    Userspace should handle this _not_ the kernel. It makes the code much
cleaner and easier to read.

 2. it only works for powerpc. Is there any reason to make it ppc only?

more things inline.

::: nouveau_backlight.c.orig
&#64;&#64; +49,5 &#64;&#64;
<span class=3D"quote">&gt; +        struct nvif_object *device =3D &amp;drm=
-&gt;device.object;
&gt; +        int val =3D (nvif_rd32(device, NV30_PMC_BACKLIGHT) &amp;
&gt; +                                   NV30_PMC_BACKLIGHT_MASK) &gt;&gt; =
16;
&gt; +        int i;
&gt; +        for(i=3D0;i&lt;sizeof(NV30_BL_CURVE)/sizeof(NV30_BL_CURVE[0])=
;i++)</span >

spaces

&#64;&#64; +54,5 &#64;&#64;
<span class=3D"quote">&gt; +        {
&gt; +                if(NV30_BL_CURVE[i] =3D=3D val) return i;
&gt; +        }
&gt; +
&gt; +        return sizeof(NV30_BL_CURVE)/sizeof(NV30_BL_CURVE[0]);</span >

spaces

&#64;&#64; +66,5 &#64;&#64;
<span class=3D"quote">&gt; +        struct nvif_object *device =3D &amp;drm=
-&gt;device.object;
&gt; +        int val =3D bd-&gt;props.brightness;
&gt; +
&gt; +        nvif_wr32(device, NV30_PMC_BACKLIGHT,
&gt; +                 (NV30_BL_CURVE[val] &lt;&lt; 16) + 0x80000535);</spa=
n >

what does the 0x535 part stands for? Is it to protect against turning off t=
he
display by accident? In that case, remove it.

&#64;&#64; +87,5 &#64;&#64;
<span class=3D"quote">&gt; +        struct backlight_device *bd;
&gt; +=09
&gt; +	struct dcb_gpio_func func;
&gt; +	struct nvkm_gpio *gpio =3D nvxx_gpio(&amp;drm-&gt;device);
&gt; +	int ret =3D nvkm_gpio_find(gpio, 0,0x00,0xff, &amp;func);</span >

spaces

&#64;&#64; +97,5 &#64;&#64;
<span class=3D"quote">&gt; +                return 0;
&gt; +
&gt; +        memset(&amp;props, 0, sizeof(struct backlight_properties));
&gt; +        props.type =3D BACKLIGHT_RAW;
&gt; +        props.max_brightness =3D sizeof(NV30_BL_CURVE)/sizeof(NV30_BL=
_CURVE[0])-1;</span >

spaces</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14707371280.Dd28F.24775--

--===============1556180799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1556180799==--
