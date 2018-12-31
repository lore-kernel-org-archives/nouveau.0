From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105319] DRM: EVO timeout with kernel 4.15.x
Date: Mon, 31 Dec 2018 02:42:59 +0000
Message-ID: <bug-105319-8800-5XhVqGt1aC@http.bugs.freedesktop.org/>
References: <bug-105319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1716740631=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105319-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1716740631==
Content-Type: multipart/alternative; boundary="15462241780.a9cB1.26517"
Content-Transfer-Encoding: 7bit


--15462241780.a9cB1.26517
Date: Mon, 31 Dec 2018 02:42:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105319

--- Comment #32 from Mitch Humpherys <mitch.special-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I'm also affected by this bug on Fedora 29.

I hopped on the kernel mainline and started poking around and noticed that I
see this bug on 4.19 but not on 4.20.  So I bisected to find the commit in =
the
4.20 series that fixes the bug.  The fix appears to be:

commit 970a5ee41c72df46e3b0f307528c7d8ef7734a2e
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Wed Dec 12 16:51:17 2018 +1000

    drm/nouveau/kms/nv50-: also flush fb writes when rewinding push buffer

    Should hopefully fix a regression some people have been seeing since EVO
    push buffers were moved to VRAM by default on Pascal GPUs.

    Fixes: d00ddd9da ("drm/nouveau/kms/nv50-: allocate push buffers in vidm=
em
on pascal")
    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
    Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 4.19+


I can cherry pick just this commit on top of 4.19 and I get a stable system.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15462241780.a9cB1.26517
Date: Mon, 31 Dec 2018 02:42:58 +0000
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
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319#c32">Comme=
nt # 32</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319">bug 10531=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mitch.special&#64;gmail.com" title=3D"Mitch Humpherys &lt;mitch.special&#64=
;gmail.com&gt;"> <span class=3D"fn">Mitch Humpherys</span></a>
</span></b>
        <pre>I'm also affected by this bug on Fedora 29.

I hopped on the kernel mainline and started poking around and noticed that I
see this bug on 4.19 but not on 4.20.  So I bisected to find the commit in =
the
4.20 series that fixes the bug.  The fix appears to be:

commit 970a5ee41c72df46e3b0f307528c7d8ef7734a2e
Author: Ben Skeggs &lt;<a href=3D"mailto:bskeggs&#64;redhat.com">bskeggs&#6=
4;redhat.com</a>&gt;
Date:   Wed Dec 12 16:51:17 2018 +1000

    drm/nouveau/kms/nv50-: also flush fb writes when rewinding push buffer

    Should hopefully fix a regression some people have been seeing since EVO
    push buffers were moved to VRAM by default on Pascal GPUs.

    Fixes: d00ddd9da (&quot;drm/nouveau/kms/nv50-: allocate push buffers in=
 vidmem
on pascal&quot;)
    Signed-off-by: Ben Skeggs &lt;<a href=3D"mailto:bskeggs&#64;redhat.com"=
>bskeggs&#64;redhat.com</a>&gt;
    Cc: &lt;<a href=3D"mailto:stable&#64;vger.kernel.org">stable&#64;vger.k=
ernel.org</a>&gt; # 4.19+


I can cherry pick just this commit on top of 4.19 and I get a stable system=
.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15462241780.a9cB1.26517--

--===============1716740631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1716740631==--
