From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92504] [NVA5] Corruption in Plasma 5 on resume after
 changing screen configuration
Date: Mon, 19 Oct 2015 15:37:32 +0000
Message-ID: <bug-92504-8800-vkV96UfKqd@http.bugs.freedesktop.org/>
References: <bug-92504-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1495822365=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92504-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1495822365==
Content-Type: multipart/alternative; boundary="1445269051.F4cF2.8335"; charset="UTF-8"


--1445269051.F4cF2.8335
Date: Mon, 19 Oct 2015 15:37:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92504

--- Comment #20 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
[  210.490188] nouveau 0000:01:00.0: plasmashell[3176]: bo valid domains: 2
[  210.490193] nouveau 0000:01:00.0: plasmashell[3176]: valid domains: 4
[  210.490195] nouveau 0000:01:00.0: plasmashell[3176]: read domains: 0
[  210.490197] nouveau 0000:01:00.0: plasmashell[3176]: write domains: 4
[  210.490199] nouveau 0000:01:00.0: plasmashell[3176]: buf offset: 0040950000
[  210.490202] nouveau 0000:01:00.0: plasmashell[3176]: buf size: 800000
[  210.490204] nouveau 0000:01:00.0: plasmashell[3176]: fail set_domain
[  210.490206] nouveau 0000:01:00.0: plasmashell[3176]: validating bo list
[  210.490210] nouveau 0000:01:00.0: plasmashell[3176]: validate: -22

nouveau:     0x00146200
nouveau:     0x00000000
nouveau:     0x40950000
nouveau:     0x000000cf
nouveau:     0x00000040
nouveau:     0x00000000

Which happens to be

      BEGIN_NV04(push, NV50_3D(RT_ADDRESS_HIGH(i)), 5);
      PUSH_DATAh(push, mt->base.address + sf->offset);
      PUSH_DATA (push, mt->base.address + sf->offset);
      PUSH_DATA (push, nv50_format_table[sf->base.format].rt);
         PUSH_DATA (push, mt->level[sf->base.u.tex.level].tile_mode);
         PUSH_DATA (push, mt->layer_stride >> 2);

And above it inits the fb size to 1920x1080 with one RT. The surface format is
BGRA8_UNORM. So somehow the nouveau code thinks that the RT is in GART whereas
it's really in VRAM. Very weird.

I think that it's an imported buffer (via nv50_miptree_from_handle) and somehow
the GEM_INFO tells us that it's in GART and not VRAM. Which means that the
VRAM-allocated buffer somehow ends up in TTM_PL_TT.

Can you try the following patch and see if it fixes everything? (Keep the other
patch in place in case it doesn't.)

diff --git a/drm/nouveau/nouveau_gem.c b/drm/nouveau/nouveau_gem.c
index ce74ab1..b4cbc86 100644
--- a/drm/nouveau/nouveau_gem.c
+++ b/drm/nouveau/nouveau_gem.c
@@ -229,11 +229,7 @@ nouveau_gem_info(struct drm_file *file_priv, struct
drm_gem_object *gem,
     struct nouveau_bo *nvbo = nouveau_gem_object(gem);
     struct nvkm_vma *vma;

-    if (nvbo->bo.mem.mem_type == TTM_PL_TT)
-        rep->domain = NOUVEAU_GEM_DOMAIN_GART;
-    else
-        rep->domain = NOUVEAU_GEM_DOMAIN_VRAM;
-
+    rep->domain = nvbo->valid_domains;
     rep->offset = nvbo->bo.offset;
     if (cli->vm) {
         vma = nouveau_bo_vma_find(nvbo, cli->vm);

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1445269051.F4cF2.8335
Date: Mon, 19 Oct 2015 15:37:31 +0000
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
   title="NEW - [NVA5] Corruption in Plasma 5 on resume after changing screen configuration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92504#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA5] Corruption in Plasma 5 on resume after changing screen configuration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92504">bug 92504</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>[  210.490188] nouveau 0000:01:00.0: plasmashell[3176]: bo valid domains: 2
[  210.490193] nouveau 0000:01:00.0: plasmashell[3176]: valid domains: 4
[  210.490195] nouveau 0000:01:00.0: plasmashell[3176]: read domains: 0
[  210.490197] nouveau 0000:01:00.0: plasmashell[3176]: write domains: 4
[  210.490199] nouveau 0000:01:00.0: plasmashell[3176]: buf offset: 0040950000
[  210.490202] nouveau 0000:01:00.0: plasmashell[3176]: buf size: 800000
[  210.490204] nouveau 0000:01:00.0: plasmashell[3176]: fail set_domain
[  210.490206] nouveau 0000:01:00.0: plasmashell[3176]: validating bo list
[  210.490210] nouveau 0000:01:00.0: plasmashell[3176]: validate: -22

nouveau:     0x00146200
nouveau:     0x00000000
nouveau:     0x40950000
nouveau:     0x000000cf
nouveau:     0x00000040
nouveau:     0x00000000

Which happens to be

      BEGIN_NV04(push, NV50_3D(RT_ADDRESS_HIGH(i)), 5);
      PUSH_DATAh(push, mt-&gt;base.address + sf-&gt;offset);
      PUSH_DATA (push, mt-&gt;base.address + sf-&gt;offset);
      PUSH_DATA (push, nv50_format_table[sf-&gt;base.format].rt);
         PUSH_DATA (push, mt-&gt;level[sf-&gt;base.u.tex.level].tile_mode);
         PUSH_DATA (push, mt-&gt;layer_stride &gt;&gt; 2);

And above it inits the fb size to 1920x1080 with one RT. The surface format is
BGRA8_UNORM. So somehow the nouveau code thinks that the RT is in GART whereas
it's really in VRAM. Very weird.

I think that it's an imported buffer (via nv50_miptree_from_handle) and somehow
the GEM_INFO tells us that it's in GART and not VRAM. Which means that the
VRAM-allocated buffer somehow ends up in TTM_PL_TT.

Can you try the following patch and see if it fixes everything? (Keep the other
patch in place in case it doesn't.)

diff --git a/drm/nouveau/nouveau_gem.c b/drm/nouveau/nouveau_gem.c
index ce74ab1..b4cbc86 100644
--- a/drm/nouveau/nouveau_gem.c
+++ b/drm/nouveau/nouveau_gem.c
&#64;&#64; -229,11 +229,7 &#64;&#64; nouveau_gem_info(struct drm_file *file_priv, struct
drm_gem_object *gem,
     struct nouveau_bo *nvbo = nouveau_gem_object(gem);
     struct nvkm_vma *vma;

-    if (nvbo-&gt;bo.mem.mem_type == TTM_PL_TT)
-        rep-&gt;domain = NOUVEAU_GEM_DOMAIN_GART;
-    else
-        rep-&gt;domain = NOUVEAU_GEM_DOMAIN_VRAM;
-
+    rep-&gt;domain = nvbo-&gt;valid_domains;
     rep-&gt;offset = nvbo-&gt;bo.offset;
     if (cli-&gt;vm) {
         vma = nouveau_bo_vma_find(nvbo, cli-&gt;vm);</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445269051.F4cF2.8335--

--===============1495822365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1495822365==--
