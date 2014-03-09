From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33165] [NVA3, NVA8] gpu lockup during driver probe
Date: Sun, 09 Mar 2014 16:34:36 +0000
Message-ID: <bug-33165-8800-AWHsrZi7lj@http.bugs.freedesktop.org/>
References: <bug-33165-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1108205228=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-33165-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1108205228==
Content-Type: multipart/alternative; boundary="1394382876.d27fB61B6.29529"; charset="us-ascii"


--1394382876.d27fB61B6.29529
Date: Sun, 9 Mar 2014 16:34:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D33165

--- Comment #30 from Oleg Bulatov <oleg-BA2faJl1U0oSAix4rjypdw@public.gmane.org> ---
Comment on attachment 95408
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D95408
initialize stuff for gddr5 ram

Review of attachment 95408:
-----------------------------------------------------------------

::: drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
@@ +365,5 @@
> +		/* XXX this algorithm is insane, find some sanity to it. */
> +		/* [1] MMIO32 R 0x100268 0x30030200 PFB.SUBPART_CONFIG =3D> { SELECT_M=
ASK =3D 0x2 | UNK16 =3D 0x3 | ENABLE_MASK =3D 0x3 } */
> +		nv_wr32(pfb, 0x10fcac, 0x00001f01);
> +		for (o =3D 0; o < 4; o++) {
> +			int off =3D offsets[i];

maybe int off =3D offsets[o]; ?

@@ +387,5 @@
> +			for (i =3D 0x20, idx =3D 0; i < 0x30; i++, idx++) {
> +				int pat =3D pattern[2 + (idx % 2)];
> +				if (i =3D=3D 0x26)
> +					pat =3D 0;
> +				if (i =3D=3D 0x1f)

looks like this condition is always false in this for-loop

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1394382876.d27fB61B6.29529
Date: Sun, 9 Mar 2014 16:34:36 +0000
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
          bz_status_NEW "
   title=3D"NEW --- - [NVA3, NVA8] gpu lockup during driver probe"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D33165#c30">Commen=
t # 30</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVA3, NVA8] gpu lockup during driver probe"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D33165">bug 33165<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
oleg&#64;bulatov.mobi" title=3D"Oleg Bulatov &lt;oleg&#64;bulatov.mobi&gt;"=
> <span class=3D"fn">Oleg Bulatov</span></a>
</span></b>
        <pre>Comment on <span class=3D""><a href=3D"attachment.cgi?id=3D954=
08" name=3D"attach_95408" title=3D"initialize stuff for gddr5 ram">attachme=
nt 95408</a> <a href=3D"attachment.cgi?id=3D95408&amp;action=3Dedit" title=
=3D"initialize stuff for gddr5 ram">[details]</a></span> <a href=3D'page.cg=
i?id=3Dsplinter.html&amp;bug=3D33165&amp;attachment=3D95408'>[review]</a>
initialize stuff for gddr5 ram

Review of <span class=3D""><a href=3D"attachment.cgi?id=3D95408" name=3D"at=
tach_95408" title=3D"initialize stuff for gddr5 ram">attachment 95408</a> <=
a href=3D"attachment.cgi?id=3D95408&amp;action=3Dedit" title=3D"initialize =
stuff for gddr5 ram">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter=
.html&amp;bug=3D33165&amp;attachment=3D95408'>[review]</a>:
-----------------------------------------------------------------

::: drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
&#64;&#64; +365,5 &#64;&#64;
<span class=3D"quote">&gt; +		/* XXX this algorithm is insane, find some sa=
nity to it. */
&gt; +		/* [1] MMIO32 R 0x100268 0x30030200 PFB.SUBPART_CONFIG =3D&gt; { SE=
LECT_MASK =3D 0x2 | UNK16 =3D 0x3 | ENABLE_MASK =3D 0x3 } */
&gt; +		nv_wr32(pfb, 0x10fcac, 0x00001f01);
&gt; +		for (o =3D 0; o &lt; 4; o++) {
&gt; +			int off =3D offsets[i];</span >

maybe int off =3D offsets[o]; ?

&#64;&#64; +387,5 &#64;&#64;
<span class=3D"quote">&gt; +			for (i =3D 0x20, idx =3D 0; i &lt; 0x30; i++=
, idx++) {
&gt; +				int pat =3D pattern[2 + (idx % 2)];
&gt; +				if (i =3D=3D 0x26)
&gt; +					pat =3D 0;
&gt; +				if (i =3D=3D 0x1f)</span >

looks like this condition is always false in this for-loop</pre>
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

--1394382876.d27fB61B6.29529--

--===============1108205228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1108205228==--
