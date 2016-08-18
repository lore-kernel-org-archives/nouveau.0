From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31122] Cannot control backlight intensity on
	Powerbook
Date: Thu, 18 Aug 2016 11:59:37 +0000
Message-ID: <bug-31122-8800-Sj55HKo7Vm@http.bugs.freedesktop.org/>
References: <bug-31122-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1865588469=="
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


--===============1865588469==
Content-Type: multipart/alternative; boundary="14715215771.7b193.4484";
 charset="UTF-8"


--14715215771.7b193.4484
Date: Thu, 18 Aug 2016 11:59:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D31122

--- Comment #21 from Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Comment on attachment 125817
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D125817
backlight control w/ gpio check

Review of attachment 125817:
-----------------------------------------------------------------

yeah, it is much better now, just a few lines are oddish, comments inlined.

With everything fixed you can add this to your patch:

Reviewed-by: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Also please send it to the ML after you are done with the stuff:
https://lists.freedesktop.org/mailman/listinfo/nouveau

::: /root/nouveau_backlight.c.orig
@@ +47,5 @@
> +	struct nouveau_drm *drm =3D bl_get_data(bd);
> +	struct nvif_object *device =3D &drm->device.object;
> +	int val =3D (nvif_rd32(device,
> +			     NV30_PMC_BACKLIGHT) &
> +                             NV30_PMC_BACKLIGHT_MASK) >> 16;

this line is a bit odd (also contains spaces).
Maybe it would be cleaner if you move the rd out of the calculation and do
something like that (which looks much cleaner imho):

int val =3D nvif_rd32(device, NV30_PMC_BACKLIGHT);
val =3D (val & NV30_PMC_BACKLIGHT_MASK) >> 16;

@@ +68,5 @@
> +		level =3D val + NV30_BL_MIN_LEVEL - 1;
> +	nvif_wr32(device,
> +		  NV30_PMC_BACKLIGHT,
> +		  ((level << 16) + 0x535) | 0x80000000);
> +	/* workaround for disabled backlight after waking from suspend */

please move the comment before the code it refers to

@@ +99,5 @@
> +
> +	memset(&props, 0, sizeof(struct backlight_properties));
> +	props.type =3D BACKLIGHT_RAW;
> +	props.max_brightness =3D NV30_BL_MAX_LEVEL - NV30_BL_MIN_LEVEL;=20=20
> +	/* includes an additional 0x00 level (backlight off) */

please move the comment before the code it refers to

@@ +104,5 @@
> +
> +	bd =3D backlight_device_register("nv_backlight",
> +				       connector->kdev,
> +				       drm,
> +                                       &nv30_bl_ops,

spaces in this line

@@ +307,5 @@
>  			continue;
>=20=20
>  		switch (device->info.family) {
> +                case NV_DEVICE_INFO_V0_RANKINE:
> +                        return nv30_backlight_init(connector);

both lines have spaces

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14715215771.7b193.4484
Date: Thu, 18 Aug 2016 11:59:37 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D31122#c21">Commen=
t # 21</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Cannot control backlight intensity on Powerbook"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D31122">bug 31122<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
karolherbst&#64;gmail.com" title=3D"Karol Herbst &lt;karolherbst&#64;gmail.=
com&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>Comment on <span class=3D""><a href=3D"attachment.cgi?id=3D125=
817" name=3D"attach_125817" title=3D"backlight control w/ gpio check">attac=
hment 125817</a> <a href=3D"attachment.cgi?id=3D125817&amp;action=3Dedit" t=
itle=3D"backlight control w/ gpio check">[details]</a></span> <a href=3D'pa=
ge.cgi?id=3Dsplinter.html&amp;bug=3D31122&amp;attachment=3D125817'>[review]=
</a>
backlight control w/ gpio check

Review of <span class=3D""><a href=3D"attachment.cgi?id=3D125817" name=3D"a=
ttach_125817" title=3D"backlight control w/ gpio check">attachment 125817</=
a> <a href=3D"attachment.cgi?id=3D125817&amp;action=3Dedit" title=3D"backli=
ght control w/ gpio check">[details]</a></span> <a href=3D'page.cgi?id=3Dsp=
linter.html&amp;bug=3D31122&amp;attachment=3D125817'>[review]</a>:
-----------------------------------------------------------------

yeah, it is much better now, just a few lines are oddish, comments inlined.

With everything fixed you can add this to your patch:

Reviewed-by: Karol Herbst &lt;<a href=3D"mailto:karolherbst&#64;gmail.com">=
karolherbst&#64;gmail.com</a>&gt;

Also please send it to the ML after you are done with the stuff:
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau">https://=
lists.freedesktop.org/mailman/listinfo/nouveau</a>

::: /root/nouveau_backlight.c.orig
&#64;&#64; +47,5 &#64;&#64;
<span class=3D"quote">&gt; +	struct nouveau_drm *drm =3D bl_get_data(bd);
&gt; +	struct nvif_object *device =3D &amp;drm-&gt;device.object;
&gt; +	int val =3D (nvif_rd32(device,
&gt; +			     NV30_PMC_BACKLIGHT) &amp;
&gt; +                             NV30_PMC_BACKLIGHT_MASK) &gt;&gt; 16;</s=
pan >

this line is a bit odd (also contains spaces).
Maybe it would be cleaner if you move the rd out of the calculation and do
something like that (which looks much cleaner imho):

int val =3D nvif_rd32(device, NV30_PMC_BACKLIGHT);
val =3D (val &amp; NV30_PMC_BACKLIGHT_MASK) &gt;&gt; 16;

&#64;&#64; +68,5 &#64;&#64;
<span class=3D"quote">&gt; +		level =3D val + NV30_BL_MIN_LEVEL - 1;
&gt; +	nvif_wr32(device,
&gt; +		  NV30_PMC_BACKLIGHT,
&gt; +		  ((level &lt;&lt; 16) + 0x535) | 0x80000000);
&gt; +	/* workaround for disabled backlight after waking from suspend */</s=
pan >

please move the comment before the code it refers to

&#64;&#64; +99,5 &#64;&#64;
<span class=3D"quote">&gt; +
&gt; +	memset(&amp;props, 0, sizeof(struct backlight_properties));
&gt; +	props.type =3D BACKLIGHT_RAW;
&gt; +	props.max_brightness =3D NV30_BL_MAX_LEVEL - NV30_BL_MIN_LEVEL;=20=20
&gt; +	/* includes an additional 0x00 level (backlight off) */</span >

please move the comment before the code it refers to

&#64;&#64; +104,5 &#64;&#64;
<span class=3D"quote">&gt; +
&gt; +	bd =3D backlight_device_register(&quot;nv_backlight&quot;,
&gt; +				       connector-&gt;kdev,
&gt; +				       drm,
&gt; +                                       &amp;nv30_bl_ops,</span >

spaces in this line

&#64;&#64; +307,5 &#64;&#64;
<span class=3D"quote">&gt;  			continue;
&gt;=20=20
&gt;  		switch (device-&gt;info.family) {
&gt; +                case NV_DEVICE_INFO_V0_RANKINE:
&gt; +                        return nv30_backlight_init(connector);</span >

both lines have spaces</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14715215771.7b193.4484--

--===============1865588469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1865588469==--
