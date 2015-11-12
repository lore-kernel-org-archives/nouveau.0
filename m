From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92922] [NVE6] Xorg random freeze
Date: Thu, 12 Nov 2015 18:45:55 +0000
Message-ID: <bug-92922-8800-IzyjI8SnQv@http.bugs.freedesktop.org/>
References: <bug-92922-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0798554506=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92922-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0798554506==
Content-Type: multipart/alternative; boundary="1447353954.8064FF2.23653"; charset="UTF-8"


--1447353954.8064FF2.23653
Date: Thu, 12 Nov 2015 18:45:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92922

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
You can try the patch below and see if it ever triggers. Make sure to build
with --enable-debug (otherwise you won't get the assert). You'll also probably
want --enable-texture-float (I'd check how your distro builds it and do the
same thing).

Of course note that if gnome-shell is hitting this... the assert will happen in
gnome-session and it will crash :) If you could run it in gdb and poke around
at things when it does crash that'd be useful.

diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
b/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
index 205e7dc..d7ee0763 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
@@ -150,6 +150,7 @@ nvc0_validate_fb(struct nvc0_context *nvc0)
         struct nv50_surface *sf = nv50_surface(fb->zsbuf);
         int unk = mt->base.base.target == PIPE_TEXTURE_2D;

+        assert(nouveau_bo_memtype(nv04_resource(fb->zsbuf->texture)->bo) <
0xd0);
         BEGIN_NVC0(push, NVC0_3D(ZETA_ADDRESS_HIGH), 5);
         PUSH_DATAh(push, mt->base.address + sf->offset);
         PUSH_DATA (push, mt->base.address + sf->offset);

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447353954.8064FF2.23653
Date: Thu, 12 Nov 2015 18:45:54 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] Xorg random freeze"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92922#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] Xorg random freeze"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92922">bug 92922</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>You can try the patch below and see if it ever triggers. Make sure to build
with --enable-debug (otherwise you won't get the assert). You'll also probably
want --enable-texture-float (I'd check how your distro builds it and do the
same thing).

Of course note that if gnome-shell is hitting this... the assert will happen in
gnome-session and it will crash :) If you could run it in gdb and poke around
at things when it does crash that'd be useful.

diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
b/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
index 205e7dc..d7ee0763 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
&#64;&#64; -150,6 +150,7 &#64;&#64; nvc0_validate_fb(struct nvc0_context *nvc0)
         struct nv50_surface *sf = nv50_surface(fb-&gt;zsbuf);
         int unk = mt-&gt;base.base.target == PIPE_TEXTURE_2D;

+        assert(nouveau_bo_memtype(nv04_resource(fb-&gt;zsbuf-&gt;texture)-&gt;bo) &lt;
0xd0);
         BEGIN_NVC0(push, NVC0_3D(ZETA_ADDRESS_HIGH), 5);
         PUSH_DATAh(push, mt-&gt;base.address + sf-&gt;offset);
         PUSH_DATA (push, mt-&gt;base.address + sf-&gt;offset);</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447353954.8064FF2.23653--

--===============0798554506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0798554506==--
