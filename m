From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109330] GL_ALPHA_BITS set to non-zero with
 EGL_PLATFORM_GBM_MESA
Date: Tue, 22 Jan 2019 13:15:46 +0000
Message-ID: <bug-109330-8800-OzE6kBlrYj@http.bugs.freedesktop.org/>
References: <bug-109330-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0520821033=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-109330-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0520821033==
Content-Type: multipart/alternative; boundary="15481629480.C79EF24f1.10277"
Content-Transfer-Encoding: 7bit


--15481629480.C79EF24f1.10277
Date: Tue, 22 Jan 2019 13:15:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109330

--- Comment #6 from Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org> ---
Yeah, I think it's reasonable. The render target is XRGB8888, and X really =
does
mean undefined, including 'throw content away on render' and 'invent fake
content on sample'.

I'd suggest allocating the gbm_surface as GBM_SURFACE_ARGB8888, then taking
those BOs and passing DRM_FORMAT_XRGB8888 to AddFB2. This is totally safe to
do, and will ensure that drivers preserve the alpha channel when you write =
out.

(I was going to say about matching EGL_NATIVE_VISUAL_ID as well given your
short example, but you already do that properly - nice!)

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15481629480.C79EF24f1.10277
Date: Tue, 22 Jan 2019 13:15:48 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - GL_ALPHA_BITS set to non-zero with EGL_PLA=
TFORM_GBM_MESA"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109330#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - GL_ALPHA_BITS set to non-zero with EGL_PLA=
TFORM_GBM_MESA"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109330">bug 10933=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
daniel&#64;fooishbar.org" title=3D"Daniel Stone &lt;daniel&#64;fooishbar.or=
g&gt;"> <span class=3D"fn">Daniel Stone</span></a>
</span></b>
        <pre>Yeah, I think it's reasonable. The render target is XRGB8888, =
and X really does
mean undefined, including 'throw content away on render' and 'invent fake
content on sample'.

I'd suggest allocating the gbm_surface as GBM_SURFACE_ARGB8888, then taking
those BOs and passing DRM_FORMAT_XRGB8888 to AddFB2. This is totally safe to
do, and will ensure that drivers preserve the alpha channel when you write =
out.

(I was going to say about matching EGL_NATIVE_VISUAL_ID as well given your
short example, but you already do that properly - nice!)</pre>
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

--15481629480.C79EF24f1.10277--

--===============0520821033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0520821033==--
