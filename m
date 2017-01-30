From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99400] [nouveau] garbled rendering with glamor on G71
Date: Mon, 30 Jan 2017 09:41:42 +0000
Message-ID: <bug-99400-8800-qpnLkNZsCk@http.bugs.freedesktop.org/>
References: <bug-99400-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0891517031=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99400-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0891517031==
Content-Type: multipart/alternative; boundary="14857693010.5b919f9.29526";
 charset="UTF-8"


--14857693010.5b919f9.29526
Date: Mon, 30 Jan 2017 09:41:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99400

--- Comment #15 from Olivier Fourdan <fourdan-eaOCjQ5FDoY@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #13)
> I'd like to help you, but I'm just not sure how

I know, and very much appreciate your help!

I'm sorry I can't be of more help, I spent like the past 5 days or so on th=
is
and all I could come up with is pretty much summarized in comment 12, ie not
much.

> [...] I've never seen that before. But they don't create contexts.
> Compare your Xephyr trace, which has glXChooseFBConfig, glXCreateContext,
> glXMakeCurrent

I think this is normal, this is Wayland not X so it doesn't need/use GLX.

Xwayland is an X server for the X11 clients and a Wayland client to the Way=
land
compositor, so that X11 application can still work on Wayland.

> While the Xwayland trace has none of those. Paradoxically, it starts at c=
all
> 31. Perhaps you have a non-egl-enabled apitrace? Also note that there's n=
ot
> a single instance of UseProgram or any other shader-related items in the
> XWayland trace.

Yes, that's puzzling... I rebuilt apitrace current from github (instead of
using the one from Fedora) and it's the same.

> Does the Xephyr trace exhibit the problems for you when replayed? If so, I
> can investigate that. However on my GK208 (or with llvmpipe), when replay=
ed,
> it doesn't appear to render anything.

Unfortunately I could never make apitrace replay anything here either.

(In reply to Ilia Mirkin from comment #14)
> nv30_vbo_validate - force it to take the vertex->need_conversion path (li=
ke
> we do on BE). No clue if that'll help, but it's a start.
>=20
> Also did you check whether NV30_SWTNL=3D1 fixes things?

Neither forcing conversion in nv30_vbo_validate() nor using NV30_SWTNL=3D1 =
change
anything.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14857693010.5b919f9.29526
Date: Mon, 30 Jan 2017 09:41:41 +0000
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
   title=3D"NEW - [nouveau] garbled rendering with glamor on G71"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99400#c15">Commen=
t # 15</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] garbled rendering with glamor on G71"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99400">bug 99400<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fourdan&#64;xfce.org" title=3D"Olivier Fourdan &lt;fourdan&#64;xfce.org&gt;=
"> <span class=3D"fn">Olivier Fourdan</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D994=
00#c13">comment #13</a>)
<span class=3D"quote">&gt; I'd like to help you, but I'm just not sure how<=
/span >

I know, and very much appreciate your help!

I'm sorry I can't be of more help, I spent like the past 5 days or so on th=
is
and all I could come up with is pretty much summarized in <a href=3D"show_b=
ug.cgi?id=3D99400#c12">comment 12</a>, ie not
much.

<span class=3D"quote">&gt; [...] I've never seen that before. But they don'=
t create contexts.
&gt; Compare your Xephyr trace, which has glXChooseFBConfig, glXCreateConte=
xt,
&gt; glXMakeCurrent</span >

I think this is normal, this is Wayland not X so it doesn't need/use GLX.

Xwayland is an X server for the X11 clients and a Wayland client to the Way=
land
compositor, so that X11 application can still work on Wayland.

<span class=3D"quote">&gt; While the Xwayland trace has none of those. Para=
doxically, it starts at call
&gt; 31. Perhaps you have a non-egl-enabled apitrace? Also note that there'=
s not
&gt; a single instance of UseProgram or any other shader-related items in t=
he
&gt; XWayland trace.</span >

Yes, that's puzzling... I rebuilt apitrace current from github (instead of
using the one from Fedora) and it's the same.

<span class=3D"quote">&gt; Does the Xephyr trace exhibit the problems for y=
ou when replayed? If so, I
&gt; can investigate that. However on my GK208 (or with llvmpipe), when rep=
layed,
&gt; it doesn't appear to render anything.</span >

Unfortunately I could never make apitrace replay anything here either.

(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D99400#c14">comme=
nt #14</a>)
<span class=3D"quote">&gt; nv30_vbo_validate - force it to take the vertex-=
&gt;need_conversion path (like
&gt; we do on BE). No clue if that'll help, but it's a start.
&gt;=20
&gt; Also did you check whether NV30_SWTNL=3D1 fixes things?</span >

Neither forcing conversion in nv30_vbo_validate() nor using NV30_SWTNL=3D1 =
change
anything.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14857693010.5b919f9.29526--

--===============0891517031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0891517031==--
