From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99033] [NV67] Incomplete implementation of OpenGL 2.1
Date: Mon, 12 Dec 2016 20:59:43 +0000
Message-ID: <bug-99033-8800-R1Bm29TNlc@http.bugs.freedesktop.org/>
References: <bug-99033-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0854950761=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99033-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0854950761==
Content-Type: multipart/alternative; boundary="14815763830.e4AF65FB.16375";
 charset="UTF-8"


--14815763830.e4AF65FB.16375
Date: Mon, 12 Dec 2016 20:59:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99033

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Ilya Indigo from comment #4)
> And determined the expansion are absent in nouveau, but there is nvidia.
>=20
> GL_EXT_texture_format_BGRA8888
> GL_OES_mapbuffer
> GL_OES_texture_3D

These are ES extensions and not available in a desktop GL profile, on nvidi=
a or
nouveau. They should, however, be present on a mesa ES profile. See
https://people.freedesktop.org/~imirkin/glxinfo/#p=3Des&v=3DMesa%2010.6.0

> GL_ARB_framebuffer_object

Yeah, we don't support that one while NVIDIA does. It requires a lot of
work-arounding to handle all the cases not supported by the HW. Tripping th=
ose
up gets you off the fastpath in the blob driver and it slows down bigtime. =
We
have no such fallbacks in nouveau.

However GL_EXT_framebuffer_object is supported, and doesn't allow the
unsupportable conditions (like attachments of different sizes).

> Problem effect is "Taskbar thumbnail"
> ./kwin/effects/taskbarthumbnail/*
>=20
> When you mouse hover over a tab on the taskbar instead of the window show=
s a
> blank thumbnail translucent rectangle of the appropriate size.
> When you switch on the OpenGL 1.2 kwin thumbnail is displayed.

That sounds like you're hitting a situation where you have a depth buffer
that's incompatible with the color buffer. We're supposed to fall back in t=
hat
situation, but don't. As a result, there's no depth, which can lead to no
rendering. Once this is supported, we could probably look at supporting
ARB_framebuffer_object, as similar mechanisms would be required.

Is there a link to the code I could glance at to see if that's likely the
issue?

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14815763830.e4AF65FB.16375
Date: Mon, 12 Dec 2016 20:59:43 +0000
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
   title=3D"NEW - [NV67] Incomplete implementation of OpenGL 2.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99033#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV67] Incomplete implementation of OpenGL 2.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99033">bug 99033<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Ilya Indigo from <a href=3D"show_bug.cgi?id=3D990=
33#c4">comment #4</a>)
<span class=3D"quote">&gt; And determined the expansion are absent in nouve=
au, but there is nvidia.
&gt;=20
&gt; GL_EXT_texture_format_BGRA8888
&gt; GL_OES_mapbuffer
&gt; GL_OES_texture_3D</span >

These are ES extensions and not available in a desktop GL profile, on nvidi=
a or
nouveau. They should, however, be present on a mesa ES profile. See
<a href=3D"https://people.freedesktop.org/~imirkin/glxinfo/#p=3Des&amp;v=3D=
Mesa%2010.6.0">https://people.freedesktop.org/~imirkin/glxinfo/#p=3Des&amp;=
v=3DMesa%2010.6.0</a>

<span class=3D"quote">&gt; GL_ARB_framebuffer_object</span >

Yeah, we don't support that one while NVIDIA does. It requires a lot of
work-arounding to handle all the cases not supported by the HW. Tripping th=
ose
up gets you off the fastpath in the blob driver and it slows down bigtime. =
We
have no such fallbacks in nouveau.

However GL_EXT_framebuffer_object is supported, and doesn't allow the
unsupportable conditions (like attachments of different sizes).

<span class=3D"quote">&gt; Problem effect is &quot;Taskbar thumbnail&quot;
&gt; ./kwin/effects/taskbarthumbnail/*
&gt;=20
&gt; When you mouse hover over a tab on the taskbar instead of the window s=
hows a
&gt; blank thumbnail translucent rectangle of the appropriate size.
&gt; When you switch on the OpenGL 1.2 kwin thumbnail is displayed.</span >

That sounds like you're hitting a situation where you have a depth buffer
that's incompatible with the color buffer. We're supposed to fall back in t=
hat
situation, but don't. As a result, there's no depth, which can lead to no
rendering. Once this is supported, we could probably look at supporting
ARB_framebuffer_object, as similar mechanisms would be required.

Is there a link to the code I could glance at to see if that's likely the
issue?</pre>
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

--14815763830.e4AF65FB.16375--

--===============0854950761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0854950761==--
