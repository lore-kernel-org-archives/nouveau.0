From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99400] [nouveau] garbled rendering with glamor on G71
Date: Tue, 31 Jan 2017 09:11:41 +0000
Message-ID: <bug-99400-8800-BPkmjHFQ1R@http.bugs.freedesktop.org/>
References: <bug-99400-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1608781731=="
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


--===============1608781731==
Content-Type: multipart/alternative; boundary="14858539010.EE7b12DaF.29585";
 charset="UTF-8"


--14858539010.EE7b12DaF.29585
Date: Tue, 31 Jan 2017 09:11:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99400

--- Comment #20 from Olivier Fourdan <fourdan-eaOCjQ5FDoY@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #19)
> Right, so you need to run this with
> MESA_EXTENSION_OVERRIDE=3D-GL_ARB_buffer_storage. Or find some way to for=
ce
> glamor to disable it. apitrace doesn't like it. I'm sure that's why the
> textures are garbage.

Haha! yes! I can see the content now, on intel.

I cannot load the file on nouveau where it was captured, it says

 | 2 @0 eglGetPlatformDisplayEXT(platform =3D EGL_PLATFORM_GBM_KHR,
native_display =3D 0x26926b0, attrib_list =3D {}) =3D 0x26d8250
 | 2: warning: unsupported eglGetPlatformDisplayEXT call
error: failed to create OpenGL 3.1 context.

Same links, updated files:

https://people.freedesktop.org/~ofourdan/bug99400/Xwayland.log
https://people.freedesktop.org/~ofourdan/bug99400/Xwayland.trace

For example frame 8932 (toward the end) is interesting imho, because it sho=
ws
the icon looks wrong (which is what led me to this issue in the first place=
).

But the rest of the window looks fine on intel, which is not what I see on
nouveau with the G71, it looks all garbled there (as in attachment  128933)

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14858539010.EE7b12DaF.29585
Date: Tue, 31 Jan 2017 09:11:41 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99400#c20">Commen=
t # 20</a>
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
00#c19">comment #19</a>)
<span class=3D"quote">&gt; Right, so you need to run this with
&gt; MESA_EXTENSION_OVERRIDE=3D-GL_ARB_buffer_storage. Or find some way to =
force
&gt; glamor to disable it. apitrace doesn't like it. I'm sure that's why the
&gt; textures are garbage.</span >

Haha! yes! I can see the content now, on intel.

I cannot load the file on nouveau where it was captured, it says

 | 2 &#64;0 eglGetPlatformDisplayEXT(platform =3D EGL_PLATFORM_GBM_KHR,
native_display =3D 0x26926b0, attrib_list =3D {}) =3D 0x26d8250
 | 2: warning: unsupported eglGetPlatformDisplayEXT call
error: failed to create OpenGL 3.1 context.

Same links, updated files:

<a href=3D"https://people.freedesktop.org/~ofourdan/bug99400/Xwayland.log">=
https://people.freedesktop.org/~ofourdan/bug99400/Xwayland.log</a>
<a href=3D"https://people.freedesktop.org/~ofourdan/bug99400/Xwayland.trace=
">https://people.freedesktop.org/~ofourdan/bug99400/Xwayland.trace</a>

For example frame 8932 (toward the end) is interesting imho, because it sho=
ws
the icon looks wrong (which is what led me to this issue in the first place=
).

But the rest of the window looks fine on intel, which is not what I see on
nouveau with the G71, it looks all garbled there (as in <span class=3D""><a=
 href=3D"attachment.cgi?id=3D128933" name=3D"attach_128933" title=3D"Screen=
shot of the issue">attachment  128933</a> <a href=3D"attachment.cgi?id=3D12=
8933&amp;action=3Dedit" title=3D"Screenshot of the issue">[details]</a></sp=
an>)</pre>
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

--14858539010.EE7b12DaF.29585--

--===============1608781731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1608781731==--
