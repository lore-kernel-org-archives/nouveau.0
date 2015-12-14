From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93373] GLAMOR triggers visual artifacts with nouveau
	GL backend
Date: Mon, 14 Dec 2015 17:08:40 +0000
Message-ID: <bug-93373-8800-ILr2SXTMpb@http.bugs.freedesktop.org/>
References: <bug-93373-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1017823113=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93373-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1017823113==
Content-Type: multipart/alternative; boundary="1450112920.f1dEaf2B1.7845"; charset="UTF-8"


--1450112920.f1dEaf2B1.7845
Date: Mon, 14 Dec 2015 17:08:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93373

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|sometimes hickup with       |GLAMOR triggers visual
                   |persistent garbaby          |artifacts with nouveau GL
                   |                            |backend

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, you're using a GM107, which means that you're *not* using
xf86-video-nouveau 1.0.12 since we dropped our GLAMOR integration (since it was
buggy). You're now using xf86-video-modesetting, which has a functioning GLAMOR
integration.

Unfortunately GLAMOR does something which makes nouveau very sad. I've found a
solution, but it's roughly equivalent to pouring cement into the piping. If
you'd like, you can patch your mesa build with

diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
b/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
index c464904..b3b6627 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
@@ -976,6 +976,7 @@ nvc0_draw_vbo(struct pipe_context *pipe, const struct
pipe_draw_info *info)
    nvc0_update_prim_restart(nvc0, info->primitive_restart,
info->restart_index);

    if (nvc0->base.vbo_dirty) {
+      IMMED_NVC0(push, SUBC_3D(NV10_SUBCHAN_REF_CNT), 0);
       if (nvc0->screen->eng3d->oclass < GM107_3D_CLASS)
          IMMED_NVC0(push, NVC0_3D(VERTEX_ARRAY_FLUSH), 0);
       nvc0->base.vbo_dirty = false;

But I haven't the faintest clue why this helps. (I actually haven't tested on
Maxwell, but it helped on Kepler.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1450112920.f1dEaf2B1.7845
Date: Mon, 14 Dec 2015 17:08:40 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - GLAMOR triggers visual artifacts with nouveau GL backend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93373">bug 93373</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>sometimes hickup with persistent garbaby
           </td>
           <td>GLAMOR triggers visual artifacts with nouveau GL backend
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - GLAMOR triggers visual artifacts with nouveau GL backend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93373#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - GLAMOR triggers visual artifacts with nouveau GL backend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93373">bug 93373</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, you're using a GM107, which means that you're *not* using
xf86-video-nouveau 1.0.12 since we dropped our GLAMOR integration (since it was
buggy). You're now using xf86-video-modesetting, which has a functioning GLAMOR
integration.

Unfortunately GLAMOR does something which makes nouveau very sad. I've found a
solution, but it's roughly equivalent to pouring cement into the piping. If
you'd like, you can patch your mesa build with

diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
b/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
index c464904..b3b6627 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
&#64;&#64; -976,6 +976,7 &#64;&#64; nvc0_draw_vbo(struct pipe_context *pipe, const struct
pipe_draw_info *info)
    nvc0_update_prim_restart(nvc0, info-&gt;primitive_restart,
info-&gt;restart_index);

    if (nvc0-&gt;base.vbo_dirty) {
+      IMMED_NVC0(push, SUBC_3D(NV10_SUBCHAN_REF_CNT), 0);
       if (nvc0-&gt;screen-&gt;eng3d-&gt;oclass &lt; GM107_3D_CLASS)
          IMMED_NVC0(push, NVC0_3D(VERTEX_ARRAY_FLUSH), 0);
       nvc0-&gt;base.vbo_dirty = false;

But I haven't the faintest clue why this helps. (I actually haven't tested on
Maxwell, but it helped on Kepler.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1450112920.f1dEaf2B1.7845--

--===============1017823113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1017823113==--
