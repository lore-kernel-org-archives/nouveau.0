From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31122] Cannot control backlight intensity on
	Powerbook
Date: Tue, 09 Aug 2016 19:26:48 +0000
Message-ID: <bug-31122-8800-LPjr4ZFPpC@http.bugs.freedesktop.org/>
References: <bug-31122-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0945904018=="
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


--===============0945904018==
Content-Type: multipart/alternative; boundary="14707708084.8fF1b6c8e.12517";
 charset="UTF-8"


--14707708084.8fF1b6c8e.12517
Date: Tue, 9 Aug 2016 19:26:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D31122

--- Comment #17 from Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Comment on attachment 125642
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D125642
backlight control w/ gpio check

Review of attachment 125642:
-----------------------------------------------------------------

This looks much better already. There are still a few things:

the kernel uses tabs 8 character big. Don't use whitespaces. Other remaining
issues inlined.

With everything taking care off, you get my rb-by karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

::: nouveau_backlight.c.orig
@@ +46,5 @@
> +{
> +        struct nouveau_drm *drm =3D bl_get_data(bd);
> +        struct nvif_object *device =3D &drm->device.object;
> +        int val =3D (nvif_rd32(device, NV30_PMC_BACKLIGHT) &
> +                                   NV30_PMC_BACKLIGHT_MASK) >> 16;

indentation, either try to fit it in one line or break the nvif_rd32 command
like this:

nvif_rd32(arg1,
          arg2);

@@ +64,5 @@
> +        int level;
> +
> +        if (val =3D=3D 0)
> +                level =3D 0x00;
> +

remove empty line here

@@ +69,5 @@
> +        else
> +                level =3D val + NV30_BL_MIN_LEVEL - 1;
> +
> +        nvif_wr32(device, NV30_PMC_BACKLIGHT,
> +                 (level << 16) + 0x80000535);  /* workaround for disable=
d backlight after waking from suspend */

indentation same as above. Also beware the 80 character limit.

@@ +101,5 @@
> +                return 0;
> +
> +        memset(&props, 0, sizeof(struct backlight_properties));
> +        props.type =3D BACKLIGHT_RAW;
> +        props.max_brightness =3D NV30_BL_MAX_LEVEL - NV30_BL_MIN_LEVEL; =
 /* includes an additional 0x00 level (backlight off) */

80 character limit

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14707708084.8fF1b6c8e.12517
Date: Tue, 9 Aug 2016 19:26:48 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D31122#c17">Commen=
t # 17</a>
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
642" name=3D"attach_125642" title=3D"backlight control w/ gpio check">attac=
hment 125642</a> <a href=3D"attachment.cgi?id=3D125642&amp;action=3Dedit" t=
itle=3D"backlight control w/ gpio check">[details]</a></span> <a href=3D'pa=
ge.cgi?id=3Dsplinter.html&amp;bug=3D31122&amp;attachment=3D125642'>[review]=
</a>
backlight control w/ gpio check

Review of <span class=3D""><a href=3D"attachment.cgi?id=3D125642" name=3D"a=
ttach_125642" title=3D"backlight control w/ gpio check">attachment 125642</=
a> <a href=3D"attachment.cgi?id=3D125642&amp;action=3Dedit" title=3D"backli=
ght control w/ gpio check">[details]</a></span> <a href=3D'page.cgi?id=3Dsp=
linter.html&amp;bug=3D31122&amp;attachment=3D125642'>[review]</a>:
-----------------------------------------------------------------

This looks much better already. There are still a few things:

the kernel uses tabs 8 character big. Don't use whitespaces. Other remaining
issues inlined.

With everything taking care off, you get my rb-by <a href=3D"mailto:karolhe=
rbst&#64;gmail.com">karolherbst&#64;gmail.com</a>

::: nouveau_backlight.c.orig
&#64;&#64; +46,5 &#64;&#64;
<span class=3D"quote">&gt; +{
&gt; +        struct nouveau_drm *drm =3D bl_get_data(bd);
&gt; +        struct nvif_object *device =3D &amp;drm-&gt;device.object;
&gt; +        int val =3D (nvif_rd32(device, NV30_PMC_BACKLIGHT) &amp;
&gt; +                                   NV30_PMC_BACKLIGHT_MASK) &gt;&gt; =
16;</span >

indentation, either try to fit it in one line or break the nvif_rd32 command
like this:

nvif_rd32(arg1,
          arg2);

&#64;&#64; +64,5 &#64;&#64;
<span class=3D"quote">&gt; +        int level;
&gt; +
&gt; +        if (val =3D=3D 0)
&gt; +                level =3D 0x00;
&gt; +</span >

remove empty line here

&#64;&#64; +69,5 &#64;&#64;
<span class=3D"quote">&gt; +        else
&gt; +                level =3D val + NV30_BL_MIN_LEVEL - 1;
&gt; +
&gt; +        nvif_wr32(device, NV30_PMC_BACKLIGHT,
&gt; +                 (level &lt;&lt; 16) + 0x80000535);  /* workaround fo=
r disabled backlight after waking from suspend */</span >

indentation same as above. Also beware the 80 character limit.

&#64;&#64; +101,5 &#64;&#64;
<span class=3D"quote">&gt; +                return 0;
&gt; +
&gt; +        memset(&amp;props, 0, sizeof(struct backlight_properties));
&gt; +        props.type =3D BACKLIGHT_RAW;
&gt; +        props.max_brightness =3D NV30_BL_MAX_LEVEL - NV30_BL_MIN_LEVE=
L;  /* includes an additional 0x00 level (backlight off) */</span >

80 character limit</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14707708084.8fF1b6c8e.12517--

--===============0945904018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0945904018==--
