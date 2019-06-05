From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110679] va-api scaling with nv50-class cards
 incomplete?
Date: Wed, 05 Jun 2019 15:01:09 +0000
Message-ID: <bug-110679-8800-NE3gcHLCLg@http.bugs.freedesktop.org/>
References: <bug-110679-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1764690608=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110679-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1764690608==
Content-Type: multipart/alternative; boundary="15597468690.eddf69E.30329"
Content-Transfer-Encoding: 7bit


--15597468690.eddf69E.30329
Date: Wed, 5 Jun 2019 15:01:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110679

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Andrew Randrianasulu from comment #1)
> After adding XVMC_VL=3D1 variable ffmpeg command above started to work ?!

I believe XVMC_VL uses shaders to do the mpeg decoding. It's not the built-=
in
vp2 (or vpe) processor doing the decoding.

I *have* seen some weird stuff with vdpau where it looks like surfaces are
sized weird and everything breaks (like something is off by 8px in width or
height). I have never tried to really track it down.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15597468690.eddf69E.30329
Date: Wed, 5 Jun 2019 15:01:09 +0000
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
   title=3D"NEW - va-api scaling with nv50-class cards incomplete?"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110679#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - va-api scaling with nv50-class cards incomplete?"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110679">bug 11067=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Andrew Randrianasulu from <a href=3D"show_bug.cgi=
?id=3D110679#c1">comment #1</a>)
<span class=3D"quote">&gt; After adding XVMC_VL=3D1 variable ffmpeg command=
 above started to work ?!</span >

I believe XVMC_VL uses shaders to do the mpeg decoding. It's not the built-=
in
vp2 (or vpe) processor doing the decoding.

I *have* seen some weird stuff with vdpau where it looks like surfaces are
sized weird and everything breaks (like something is off by 8px in width or
height). I have never tried to really track it down.</pre>
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

--15597468690.eddf69E.30329--

--===============1764690608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1764690608==--
