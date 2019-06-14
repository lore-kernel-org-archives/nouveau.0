From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110830] [nouveau] GeForce GTX 1660 Ti (mobile) not
 supported (NV168/TU116)
Date: Fri, 14 Jun 2019 21:19:41 +0000
Message-ID: <bug-110830-8800-KKYpamPkN3@http.bugs.freedesktop.org/>
References: <bug-110830-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0650763090=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110830-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0650763090==
Content-Type: multipart/alternative; boundary="15605471813.3B6A.6557"
Content-Transfer-Encoding: 7bit


--15605471813.3B6A.6557
Date: Fri, 14 Jun 2019 21:19:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110830

--- Comment #12 from Marcin Zajaczkowski <mszpak-5tc4TXWwyLM@public.gmane.org> ---
Thanks for your explanations.

In the meantime, I've tried (recommended) KWin with LXQT (both XRender nad
OpenGL), but with no effects. I will try to explore it at the Xorg/Window
Manager side (or stick to Wayland for awhile)...

However, I have one more question about the nouveau driver itself. I tried =
to
switch from the "modesetting" driver to intel/nouveau in the xorg
configuration. However, trying to define 'Driver "nouveau"' I end up with t=
he
error that device 167 is not known. I've seen you commit from January [1]. =
Is
it just needed to add a new entry for my GTX 1660 in nv_driver.c? Anyway, do
you think using nouveau_drv.so instead of "modesetting" can change anything?

[1] -
https://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=3D2376d1=
ebf2d9a96bc2ebf21d53a9f9841ce5c15b

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15605471813.3B6A.6557
Date: Fri, 14 Jun 2019 21:19:41 +0000
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
   title=3D"NEW - [nouveau] GeForce GTX 1660 Ti (mobile) not supported (NV1=
68/TU116)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110830#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] GeForce GTX 1660 Ti (mobile) not supported (NV1=
68/TU116)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110830">bug 11083=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mszpak&#64;wp.pl" title=3D"Marcin Zajaczkowski &lt;mszpak&#64;wp.pl&gt;"> <=
span class=3D"fn">Marcin Zajaczkowski</span></a>
</span></b>
        <pre>Thanks for your explanations.

In the meantime, I've tried (recommended) KWin with LXQT (both XRender nad
OpenGL), but with no effects. I will try to explore it at the Xorg/Window
Manager side (or stick to Wayland for awhile)...

However, I have one more question about the nouveau driver itself. I tried =
to
switch from the &quot;modesetting&quot; driver to intel/nouveau in the xorg
configuration. However, trying to define 'Driver &quot;nouveau&quot;' I end=
 up with the
error that device 167 is not known. I've seen you commit from January [1]. =
Is
it just needed to add a new entry for my GTX 1660 in nv_driver.c? Anyway, do
you think using nouveau_drv.so instead of &quot;modesetting&quot; can chang=
e anything?

[1] -
<a href=3D"https://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?=
id=3D2376d1ebf2d9a96bc2ebf21d53a9f9841ce5c15b">https://cgit.freedesktop.org=
/nouveau/xf86-video-nouveau/commit/?id=3D2376d1ebf2d9a96bc2ebf21d53a9f9841c=
e5c15b</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15605471813.3B6A.6557--

--===============0650763090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0650763090==--
