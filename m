From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110660] GeForce GT 750M Mac Edition fullscreen issues
Date: Tue, 28 May 2019 17:19:25 +0000
Message-ID: <bug-110660-8800-FQ9iTN5VfD@http.bugs.freedesktop.org/>
References: <bug-110660-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0047051158=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110660-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0047051158==
Content-Type: multipart/alternative; boundary="15590639653.a4BA9F.10656"
Content-Transfer-Encoding: 7bit


--15590639653.a4BA9F.10656
Date: Tue, 28 May 2019 17:19:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110660

--- Comment #34 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Alexey Kuznetsov from comment #33)
> Thanks! In Ubuntu kernel has no drivers/gpu/drm/nouveau/dispnv50/disp.c a=
nd
> drivers/gpu/drm/nouveau/dispnv50/head.c but instead those files merged in=
to
> one drivers/gpu/drm/nouveau/nv50_display.c for some heck reason.

The code was refactored. The ubuntu kernel is older.

>=20
> Patching this file makes one problem disappear, only "fix center and aspe=
ct
> scaling" work properly (which confirms I build a kernel properly) but

Yay!

> scaling modes without calling 'xrandr --output eDP-1 --set "scaling mode"
> "Full aspect"' still produces broken 8 displays.

Hmmmm... adjusted_mode is the wrong thing to look at maybe? What if you swi=
tch
adjusted_mode -> mode in that conditional? I always get so confused with
that...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15590639653.a4BA9F.10656
Date: Tue, 28 May 2019 17:19:25 +0000
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
   title=3D"NEW - GeForce GT 750M Mac Edition fullscreen issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110660#c34">Comme=
nt # 34</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GeForce GT 750M Mac Edition fullscreen issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110660">bug 11066=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Alexey Kuznetsov from <a href=3D"show_bug.cgi?id=
=3D110660#c33">comment #33</a>)
<span class=3D"quote">&gt; Thanks! In Ubuntu kernel has no drivers/gpu/drm/=
nouveau/dispnv50/disp.c and
&gt; drivers/gpu/drm/nouveau/dispnv50/head.c but instead those files merged=
 into
&gt; one drivers/gpu/drm/nouveau/nv50_display.c for some heck reason.</span=
 >

The code was refactored. The ubuntu kernel is older.

<span class=3D"quote">&gt;=20
&gt; Patching this file makes one problem disappear, only &quot;fix center =
and aspect
&gt; scaling&quot; work properly (which confirms I build a kernel properly)=
 but</span >

Yay!

<span class=3D"quote">&gt; scaling modes without calling 'xrandr --output e=
DP-1 --set &quot;scaling mode&quot;
&gt; &quot;Full aspect&quot;' still produces broken 8 displays.</span >

Hmmmm... adjusted_mode is the wrong thing to look at maybe? What if you swi=
tch
adjusted_mode -&gt; mode in that conditional? I always get so confused with
that...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15590639653.a4BA9F.10656--

--===============0047051158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0047051158==--
