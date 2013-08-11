From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: Fixing nouveau for >4k PAGE_SIZE
Date: Sun, 11 Aug 2013 17:06:30 +1000
Message-ID: <1376204790.32100.109.camel@pasglop>
References: <1372740099.4820.24.camel@pasglop>
	<CAPM=9txvRW5MM849FVqOoSL28g=+hTDiLWaMtn5Kj-X3h1kJ8g@mail.gmail.com>
	<1376175111.32100.53.camel@pasglop> <1376179046.32100.60.camel@pasglop>
	<1376181670.32100.77.camel@pasglop>
	<1376199396.32100.106.camel@pasglop>
	<52072C7C.8040104@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <52072C7C.8040104@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>
List-Id: nouveau.vger.kernel.org

On Sun, 2013-08-11 at 08:17 +0200, Maarten Lankhorst wrote:
> > So I'm still a bit confused :-)
> >
> The fun has been doubled because TTM expects PAGE units, so some of
> the PAGE_SHIFT's are
> genuine. Some may be a result of PAGE_SHIFT == 12, so honestly I don't
> know the specific ones.

Right, and the other way around too :-)

I think I found at least two cases where "12" was used where it should
have been PAGE_SHIFT (basically ttm_mem_reg->num_pages). This
is only the tip of the iceberg, so this isn't a formal patch submission,
but I would appreciate your thought as to whether the below is correct
(and thus I'm on the right track) :

--- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
@@ -31,7 +31,7 @@ nv04_sgdma_bind(struct ttm_tt *ttm, struct ttm_mem_reg *mem)
 {
        struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)ttm;
        struct nouveau_mem *node = mem->mm_node;
-       u64 size = mem->num_pages << 12;
+       u64 size = mem->num_pages << PAGE_SHIFT;
 
        if (ttm->sg) {
                node->sg = ttm->sg;
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nou
index 19e3757..f0629de 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -252,8 +252,8 @@ nv04_gart_manager_new(struct ttm_mem_type_manager *man,
 
        node->page_shift = 12;
 
-       ret = nouveau_vm_get(man->priv, mem->num_pages << 12, node->page_shift,
-                            NV_MEM_ACCESS_RW, &node->vma[0]);
+       ret = nouveau_vm_get(man->priv, mem->num_pages << PAGE_SHIFT,
+                            node->page_shift, NV_MEM_ACCESS_RW, &node->vma[0]);
        if (ret) {
                kfree(node);

Thanks !

Cheers,
Ben.
