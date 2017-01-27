From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99400] [nouveau] garbled rendering with glamor on G71
Date: Fri, 27 Jan 2017 15:13:44 +0000
Message-ID: <bug-99400-8800-ziApYOftD9@http.bugs.freedesktop.org/>
References: <bug-99400-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0616858004=="
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


--===============0616858004==
Content-Type: multipart/alternative; boundary="14855300230.6Ecd9Fd9b.4285";
 charset="UTF-8"


--14855300230.6Ecd9Fd9b.4285
Date: Fri, 27 Jan 2017 15:13:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99400

--- Comment #12 from Olivier Fourdan <fourdan-eaOCjQ5FDoY@public.gmane.org> ---
I traced it down to the use of the text input field in gtk-demo's assistant.

The issue seems to be with one particular call to glamor_poly_fill_rect_gl()
with more than one prect (nrect > 1).

https://cgit.freedesktop.org/xorg/xserver/tree/glamor/glamor_rects.c#n42

Considering that the GLSL version is < 130 with this hardware, we are in the
else case:

https://cgit.freedesktop.org/xorg/xserver/tree/glamor/glamor_rects.c#n83

If, in that case, with nrect > 1, we bail (to SW) then rendering is fine.

But that same code gives the correct result in may other cases, with multip=
le
rects, so it does not seem to be a bug in the glamor code though... Besides,
the same code as used in Xephyr works fine.

I captured the apitrace of both Xehpyr -glamor and Xwayland along with the =
mesa
debug and glamor debug messages with:

  WAYLAND_DISPLAY=3Dwayland-0 MESA_DEBUG=3D1,incomplete_tex,incomplete_fbo,=
context
apitrace trace ~/local/bin/Xwayland -noreset :1 |& tee Xwayland.log &
  DISPLAY=3D:1 GDK_BACKEND=3Dx11 gtk-demo

Then same with Xephyr:

  DISPLAY=3D:0 MESA_DEBUG=3D1,incomplete_tex,incomplete_fbo,context  apitra=
ce trace
~/local/bin/Xephyr -glamor -noreset :1 |& tee Xephyr.log &
  DISPLAY=3D:1 GDK_BACKEND=3Dx11 gtk-demo

Mesa complains that "Texture Obj xxx incomplete because: TexImage[1] is
missing" but that occurs with both Xephyr and Xwayland so I guess it should=
 not
be the problem.

By logging the prect coordinates, we can match if with the apitrace dump in
both cases. But again, I don't see much difference between the two (Xephyr
-glamor vs. Xwayland)=20

Logs and traces are available here:

   https://people.freedesktop.org/~ofourdan/bug99400/

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14855300230.6Ecd9Fd9b.4285
Date: Fri, 27 Jan 2017 15:13:43 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99400#c12">Commen=
t # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] garbled rendering with glamor on G71"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99400">bug 99400<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fourdan&#64;xfce.org" title=3D"Olivier Fourdan &lt;fourdan&#64;xfce.org&gt;=
"> <span class=3D"fn">Olivier Fourdan</span></a>
</span></b>
        <pre>I traced it down to the use of the text input field in gtk-dem=
o's assistant.

The issue seems to be with one particular call to glamor_poly_fill_rect_gl()
with more than one prect (nrect &gt; 1).

<a href=3D"https://cgit.freedesktop.org/xorg/xserver/tree/glamor/glamor_rec=
ts.c#n42">https://cgit.freedesktop.org/xorg/xserver/tree/glamor/glamor_rect=
s.c#n42</a>

Considering that the GLSL version is &lt; 130 with this hardware, we are in=
 the
else case:

<a href=3D"https://cgit.freedesktop.org/xorg/xserver/tree/glamor/glamor_rec=
ts.c#n83">https://cgit.freedesktop.org/xorg/xserver/tree/glamor/glamor_rect=
s.c#n83</a>

If, in that case, with nrect &gt; 1, we bail (to SW) then rendering is fine.

But that same code gives the correct result in may other cases, with multip=
le
rects, so it does not seem to be a bug in the glamor code though... Besides,
the same code as used in Xephyr works fine.

I captured the apitrace of both Xehpyr -glamor and Xwayland along with the =
mesa
debug and glamor debug messages with:

  WAYLAND_DISPLAY=3Dwayland-0 MESA_DEBUG=3D1,incomplete_tex,incomplete_fbo,=
context
apitrace trace ~/local/bin/Xwayland -noreset :1 |&amp; tee Xwayland.log &am=
p;
  DISPLAY=3D:1 GDK_BACKEND=3Dx11 gtk-demo

Then same with Xephyr:

  DISPLAY=3D:0 MESA_DEBUG=3D1,incomplete_tex,incomplete_fbo,context  apitra=
ce trace
~/local/bin/Xephyr -glamor -noreset :1 |&amp; tee Xephyr.log &amp;
  DISPLAY=3D:1 GDK_BACKEND=3Dx11 gtk-demo

Mesa complains that &quot;Texture Obj xxx incomplete because: TexImage[1] is
missing&quot; but that occurs with both Xephyr and Xwayland so I guess it s=
hould not
be the problem.

By logging the prect coordinates, we can match if with the apitrace dump in
both cases. But again, I don't see much difference between the two (Xephyr
-glamor vs. Xwayland)=20

Logs and traces are available here:

   <a href=3D"https://people.freedesktop.org/~ofourdan/bug99400/">https://p=
eople.freedesktop.org/~ofourdan/bug99400/</a></pre>
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

--14855300230.6Ecd9Fd9b.4285--

--===============0616858004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0616858004==--
