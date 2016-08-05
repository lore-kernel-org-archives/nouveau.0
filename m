From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31122] Cannot control backlight intensity on
	Powerbook
Date: Fri, 05 Aug 2016 16:47:33 +0000
Message-ID: <bug-31122-8800-TOrq2JuTuh@http.bugs.freedesktop.org/>
References: <bug-31122-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1089519334=="
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


--===============1089519334==
Content-Type: multipart/alternative; boundary="14704156534.d2fd8Ed.18578";
 charset="UTF-8"


--14704156534.d2fd8Ed.18578
Date: Fri, 5 Aug 2016 16:47:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D31122

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
You can get vbios once nouveau is loaded from debugfs. It should correspond
1:1 to the of blob as well.

On Aug 5, 2016 11:37, <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> wrote:

> *Comment # 11 <https://bugs.freedesktop.org/show_bug.cgi?id=3D31122#c11> =
on
> bug 31122 <https://bugs.freedesktop.org/show_bug.cgi?id=3D31122> from A.
> Chaud <nvbugz-ZdXa/xnzD07wXD0AkxfrAg@public.gmane.org> *
>
> nvagetbios wasn't able to extract the bios.  From what I gathered after
> searching, openfirmware handles vbios differently (ie: no checksums, smal=
ler
> vbios, etc).  I found a nv34 openfirmware bios someone else dumped and nv=
bios
> is unable to decode the GPIO section.
>
> However, if the aim is ensuring the device has a backlight, I believe it's
> already done.  In nouveau_backlight_init, it first checks to ensure there=
's a
> display on either LVDS or eDP.  Can we not reasonably assume that if the =
gpu
> has a LVDS or eDP panel attached that it also has a backlight?  My init
> function is a slightly altered version of the existing nv40_backlight_init
> function which doesn't have a backlight check either.
>
> ------------------------------
> You are receiving this mail because:
>
>    - You are the assignee for the bug.
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>
>

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14704156534.d2fd8Ed.18578
Date: Fri, 5 Aug 2016 16:47:33 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D31122#c12">Commen=
t # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Cannot control backlight intensity on Powerbook"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D31122">bug 31122<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>You can get vbios once nouveau is loaded from debugfs. It shou=
ld correspond
1:1 to the of blob as well.

On Aug 5, 2016 11:37, &lt;<a href=3D"mailto:bugzilla-daemon&#64;freedesktop=
.org">bugzilla-daemon&#64;freedesktop.org</a>&gt; wrote:

<span class=3D"quote">&gt; *<a href=3D"show_bug.cgi?id=3D31122#c11">Comment=
 # 11</a> &lt;<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Cannot control backlight intensity on Powerbook"
   href=3D"show_bug.cgi?id=3D31122#c11">https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D31122#c11</a>&gt; on
&gt; <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Cannot control backlight intensity on Powerbook"
   href=3D"show_bug.cgi?id=3D31122">bug 31122</a> &lt;<a class=3D"bz_bug_li=
nk=20
          bz_status_NEW "
   title=3D"NEW - Cannot control backlight intensity on Powerbook"
   href=3D"show_bug.cgi?id=3D31122">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D31122</a>&gt; from A.
&gt; Chaud &lt;<a href=3D"mailto:nvbugz&#64;sparklabs.me">nvbugz&#64;sparkl=
abs.me</a>&gt; *</span >
&gt;
<span class=3D"quote">&gt; nvagetbios wasn't able to extract the bios.  Fro=
m what I gathered after
&gt; searching, openfirmware handles vbios differently (ie: no checksums, s=
maller
&gt; vbios, etc).  I found a nv34 openfirmware bios someone else dumped and=
 nvbios
&gt; is unable to decode the GPIO section.</span >
&gt;
<span class=3D"quote">&gt; However, if the aim is ensuring the device has a=
 backlight, I believe it's
&gt; already done.  In nouveau_backlight_init, it first checks to ensure th=
ere's a
&gt; display on either LVDS or eDP.  Can we not reasonably assume that if t=
he gpu
&gt; has a LVDS or eDP panel attached that it also has a backlight?  My init
&gt; function is a slightly altered version of the existing nv40_backlight_=
init
&gt; function which doesn't have a backlight check either.</span >
&gt;
<span class=3D"quote">&gt; ------------------------------
&gt; You are receiving this mail because:</span >
&gt;
<span class=3D"quote">&gt;    - You are the assignee for the bug.</span >
&gt;
&gt;
<span class=3D"quote">&gt; _______________________________________________
&gt; Nouveau mailing list
&gt; <a href=3D"mailto:Nouveau&#64;lists.freedesktop.org">Nouveau&#64;lists=
.freedesktop.org</a>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau">htt=
ps://lists.freedesktop.org/mailman/listinfo/nouveau</a></span >
&gt;
&gt;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14704156534.d2fd8Ed.18578--

--===============1089519334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1089519334==--
