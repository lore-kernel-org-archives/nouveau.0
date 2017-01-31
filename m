From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99400] [nouveau] garbled rendering with glamor on G71
Date: Tue, 31 Jan 2017 12:37:26 +0000
Message-ID: <bug-99400-8800-jhj5iur4JD@http.bugs.freedesktop.org/>
References: <bug-99400-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0213900131=="
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


--===============0213900131==
Content-Type: multipart/alternative; boundary="14858662460.e7EdDfdc9.12936";
 charset="UTF-8"


--14858662460.e7EdDfdc9.12936
Date: Tue, 31 Jan 2017 12:37:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99400

--- Comment #21 from Olivier Fourdan <fourdan-eaOCjQ5FDoY@public.gmane.org> ---
(In reply to Olivier Fourdan from comment #20)
>=20
> I cannot load the file on nouveau where it was captured, it says
>=20
>  | 2 @0 eglGetPlatformDisplayEXT(platform =3D EGL_PLATFORM_GBM_KHR,
> native_display =3D 0x26926b0, attrib_list =3D {}) =3D 0x26d8250
>  | 2: warning: unsupported eglGetPlatformDisplayEXT call
> error: failed to create OpenGL 3.1 context.

Quick follow up on this, this is because of the way glamor works, it first
creates an EGL context with some config attributes (which include the OpenGL
version 3.1) and if it fails, it retries with no config attributes:

https://cgit.freedesktop.org/xorg/xserver/tree/glamor/glamor_egl.c#n819

or for Xwayland:

https://cgit.freedesktop.org/xorg/xserver/tree/hw/xwayland/xwayland-glamor.=
c#n310

So back to apitrace, as the config attributes specifies OpenGL 3.1, it fails
and apitrace just stops there. So I changed Xwayland to not do the first ca=
ll
(which on this HW returns NULL anyway) and now apitrace is a happy buddy, I=
 can
replay the trace on nouveau as well.

Same links, updated files:

https://people.freedesktop.org/~ofourdan/bug99400/Xwayland.log
https://people.freedesktop.org/~ofourdan/bug99400/Xwayland.trace

> For example frame 8932 (toward the end) is interesting imho, [...]

Let's forget about this, now that the new trace can replay on both intel and
nouveau.

The problem I see is rather that I see no problem in apitrace, the frames l=
ook
fine, AFAICT.

And yet the rendering was wrong on screen when I captured the trace...

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14858662460.e7EdDfdc9.12936
Date: Tue, 31 Jan 2017 12:37:26 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99400#c21">Commen=
t # 21</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] garbled rendering with glamor on G71"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99400">bug 99400<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fourdan&#64;xfce.org" title=3D"Olivier Fourdan &lt;fourdan&#64;xfce.org&gt;=
"> <span class=3D"fn">Olivier Fourdan</span></a>
</span></b>
        <pre>(In reply to Olivier Fourdan from <a href=3D"show_bug.cgi?id=
=3D99400#c20">comment #20</a>)
<span class=3D"quote">&gt;=20
&gt; I cannot load the file on nouveau where it was captured, it says
&gt;=20
&gt;  | 2 &#64;0 eglGetPlatformDisplayEXT(platform =3D EGL_PLATFORM_GBM_KHR,
&gt; native_display =3D 0x26926b0, attrib_list =3D {}) =3D 0x26d8250
&gt;  | 2: warning: unsupported eglGetPlatformDisplayEXT call
&gt; error: failed to create OpenGL 3.1 context.</span >

Quick follow up on this, this is because of the way glamor works, it first
creates an EGL context with some config attributes (which include the OpenGL
version 3.1) and if it fails, it retries with no config attributes:

<a href=3D"https://cgit.freedesktop.org/xorg/xserver/tree/glamor/glamor_egl=
.c#n819">https://cgit.freedesktop.org/xorg/xserver/tree/glamor/glamor_egl.c=
#n819</a>

or for Xwayland:

<a href=3D"https://cgit.freedesktop.org/xorg/xserver/tree/hw/xwayland/xwayl=
and-glamor.c#n310">https://cgit.freedesktop.org/xorg/xserver/tree/hw/xwayla=
nd/xwayland-glamor.c#n310</a>

So back to apitrace, as the config attributes specifies OpenGL 3.1, it fails
and apitrace just stops there. So I changed Xwayland to not do the first ca=
ll
(which on this HW returns NULL anyway) and now apitrace is a happy buddy, I=
 can
replay the trace on nouveau as well.

Same links, updated files:

<a href=3D"https://people.freedesktop.org/~ofourdan/bug99400/Xwayland.log">=
https://people.freedesktop.org/~ofourdan/bug99400/Xwayland.log</a>
<a href=3D"https://people.freedesktop.org/~ofourdan/bug99400/Xwayland.trace=
">https://people.freedesktop.org/~ofourdan/bug99400/Xwayland.trace</a>

<span class=3D"quote">&gt; For example frame 8932 (toward the end) is inter=
esting imho, [...]</span >

Let's forget about this, now that the new trace can replay on both intel and
nouveau.

The problem I see is rather that I see no problem in apitrace, the frames l=
ook
fine, AFAICT.

And yet the rendering was wrong on screen when I captured the trace...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14858662460.e7EdDfdc9.12936--

--===============0213900131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0213900131==--
