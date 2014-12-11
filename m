From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] fb/nvaa: Enable non-isometric poller
	on NVAA/NVAC
Date: Thu, 11 Dec 2014 13:42:24 +1000
Message-ID: <CACAvsv4v3=g5Rhq7bnNzWkjcRgLPmMOwJbZ5bT36U3yxxtJrzw@mail.gmail.com>
References: <1418198023-14225-1-git-send-email-pierre.morrow@free.fr>
 <1418198023-14225-2-git-send-email-pierre.morrow@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001a11c2bc0674c31f0509e890b0
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1418198023-14225-2-git-send-email-pierre.morrow-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Cc: Nouveau List <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, DRI List <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--001a11c2bc0674c31f0509e890b0
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 10, 2014 at 5:53 PM, Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> wrote:
> (This is a v3 of patch "drm/nouveau/fb/nv50: Add PFB writes")
>
> This fix a GPU lockup on 9400M (NVAC) when using acceleration, see
> https://bugs.freedesktop.org/show_bug.cgi?id=27501
>
> v2:
> - Move code to subdev/fb/nv50.c as suggested by Roy Spliet;
> - Remove arbitrary writes to 100c18/100c24
> - Replace write to 100c1c of arbitrary value by the address of a scratch page
>   as proposed by Ilia Mirkin;
> - Remove enabling of bits 16 and 0 as they don't yield in any changes.
>
> v3:
> - Move code to subdev/fb/nvaa.c as suggested by Ilia Mirkin.
> The following changes were made thanks to information provided by Robert Morell
> from NVidia:
> - Allocate a dma page for use by the pollers;
> - Re-enable pollers at bits 16 and 0;
> - Set pollers address to a proper value.
Hey Pierre,

This patch is incorrect.  As Robert pointed out in an older thread,
the registers don't take the physical address of a page, but a
somewhat odd "negative offset from the end of carveout".

See this example (referring to Robert's last email):

220.926392    read32 #3 +0x00100e10 -> 0x00070000
220.926406    read32 #3 +0x00100e14 -> 0x00010000

carveout_base = 0x70000000
carveout_size = 0x10000000

-- snip --

223.300495    read32 #3 +0x00100c14 -> 0x00000000
223.300521    read32 #3 +0x00100c18 -> 0x00000000
223.300547   write32 #3 +0x00100c18 <- 0x000027ff

base = (0x70000000 + 0x10000000) - ((0x27ff + 1) << 5)
base = 0x7ffb0000 << in carveout

223.300573    read32 #3 +0x00100c14 -> 0x00000000
223.300599   write32 #3 +0x00100c14 <- 0x00000001
223.300625    read32 #3 +0x00100c1c -> 0x00000002
223.300651   write32 #3 +0x00100c1c <- 0x000027fe

base = (0x70000000 + 0x10000000) - ((0x27fe + 1) << 5)
base = 0x7ffb0020 << in carveout

223.300677    read32 #3 +0x00100c14 -> 0x00000001
223.300702   write32 #3 +0x00100c14 <- 0x00000003
223.300728    read32 #3 +0x00100c24 -> 0x00000004
223.300754   write32 #3 +0x00100c24 <- 0x000027fd

base = (0x70000000 + 0x10000000) - ((0x27ff + 1) << 5)
base = 0x7ffb0040 << in carveout

223.300780    read32 #3 +0x00100c14 -> 0x00000003
223.300806   write32 #3 +0x00100c14 <- 0x00010003

It's a bit tricky at that point in the nouveau init process to
allocate device memory, but, we already reserve 1MiB of memory at the
end of "VRAM" (carveout / stolen memory) so we can make use of that.

I've attached 3 patches.  The first two of them, I'll probably merge as-is.

The third patch is an example of how this should probably be done, in
case you want to continue tackling this some more :)

Cheers,
Ben.

>
> Signed-off-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
> ---
>  drm/core/subdev/fb/nvaa.h |  1 +
>  nvkm/subdev/fb/nv50.h     |  4 +++
>  nvkm/subdev/fb/nvaa.c     | 74 ++++++++++++++++++++++++++++++++++++++++++++---
>  nvkm/subdev/fb/nvaa.h     | 19 ++++++++++++
>  4 files changed, 94 insertions(+), 4 deletions(-)
>  create mode 120000 drm/core/subdev/fb/nvaa.h
>  create mode 100644 nvkm/subdev/fb/nvaa.h
>
> diff --git a/drm/core/subdev/fb/nvaa.h b/drm/core/subdev/fb/nvaa.h
> new file mode 120000
> index 0000000..b450e8c
> --- /dev/null
> +++ b/drm/core/subdev/fb/nvaa.h
> @@ -0,0 +1 @@
> +../../../../nvkm/subdev/fb/nvaa.h
> \ No newline at end of file
> diff --git a/nvkm/subdev/fb/nv50.h b/nvkm/subdev/fb/nv50.h
> index c5e5a88..0b20975 100644
> --- a/nvkm/subdev/fb/nv50.h
> +++ b/nvkm/subdev/fb/nv50.h
> @@ -9,6 +9,10 @@ struct nv50_fb_priv {
>         dma_addr_t r100c08;
>  };
>
> +#define nv50_fb_create(p,e,c,d,o)                                              \
> +       nv50_fb_ctor((p), (e), (c), (d), sizeof(**o),                          \
> +                       (struct nouveau_object **)o)
> +
>  int  nv50_fb_ctor(struct nouveau_object *, struct nouveau_object *,
>                   struct nouveau_oclass *, void *, u32,
>                   struct nouveau_object **);
> diff --git a/nvkm/subdev/fb/nvaa.c b/nvkm/subdev/fb/nvaa.c
> index cba8e68..b70ab2f 100644
> --- a/nvkm/subdev/fb/nvaa.c
> +++ b/nvkm/subdev/fb/nvaa.c
> @@ -22,15 +22,81 @@
>   * Authors: Ben Skeggs
>   */
>
> -#include "nv50.h"
> +#include "nvaa.h"
> +
> +int
> +nvaa_fb_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
> +            struct nouveau_oclass *oclass, void *data, u32 size,
> +            struct nouveau_object **pobject)
> +{
> +       struct nouveau_device *device = nv_device(parent);
> +       struct nvaa_fb_priv *priv;
> +       int ret;
> +
> +       ret = nv50_fb_create(parent, engine, oclass, data, &priv);
> +       *pobject = nv_object(priv);
> +       if (ret)
> +               return ret;
> +
> +       priv = (struct nvaa_fb_priv *)(*pobject);
> +
> +       priv->r100c18_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> +       if (priv->r100c18_page) {
> +               priv->r100c18 = dma_map_page(nv_device_base(device),
> +                                            priv->r100c18_page, 0, PAGE_SIZE,
> +                                            DMA_BIDIRECTIONAL);
> +               if (dma_mapping_error(nv_device_base(device), priv->r100c18))
> +                       return -EFAULT;
> +       } else {
> +               nv_warn(priv, "failed 0x100c18 page alloc\n");
> +       }
> +       return 0;
> +}
> +
> +void
> +nvaa_fb_dtor(struct nouveau_object *object)
> +{
> +       struct nouveau_device *device = nv_device(object);
> +       struct nvaa_fb_priv *priv = (void *)object;
> +
> +       if (priv->r100c18_page) {
> +               dma_unmap_page(nv_device_base(device), priv->r100c18, PAGE_SIZE,
> +                              DMA_BIDIRECTIONAL);
> +               __free_page(priv->r100c18_page);
> +       }
> +
> +       nv50_fb_dtor(object);
> +}
> +
> +int
> +nvaa_fb_init(struct nouveau_object *object)
> +{
> +       struct nvaa_fb_priv *priv = (void *)object;
> +       int ret;
> +
> +       ret = nv50_fb_init(object);
> +       if (ret)
> +               return ret;
> +
> +       /* Enable NISO poller for various clients and set their associated
> +        * read address, only for MCP77/78 and MCP79/7A. (fd#25701)
> +        */
> +       nv_wr32(priv, 0x100c18, priv->r100c18 >> 8);
> +       nv_mask(priv, 0x100c14, 0x00000000, 0x00000001);
> +       nv_wr32(priv, 0x100c1c, (priv->r100c18 >> 8) + 1);
> +       nv_mask(priv, 0x100c14, 0x00000000, 0x00000002);
> +       nv_wr32(priv, 0x100c24, (priv->r100c18 >> 8) + 2);
> +       nv_mask(priv, 0x100c14, 0x00000000, 0x00010000);
> +       return 0;
> +}
>
>  struct nouveau_oclass *
>  nvaa_fb_oclass = &(struct nv50_fb_impl) {
>         .base.base.handle = NV_SUBDEV(FB, 0xaa),
>         .base.base.ofuncs = &(struct nouveau_ofuncs) {
> -               .ctor = nv50_fb_ctor,
> -               .dtor = nv50_fb_dtor,
> -               .init = nv50_fb_init,
> +               .ctor = nvaa_fb_ctor,
> +               .dtor = nvaa_fb_dtor,
> +               .init = nvaa_fb_init,
>                 .fini = _nouveau_fb_fini,
>         },
>         .base.memtype = nv50_fb_memtype_valid,
> diff --git a/nvkm/subdev/fb/nvaa.h b/nvkm/subdev/fb/nvaa.h
> new file mode 100644
> index 0000000..84e1eca
> --- /dev/null
> +++ b/nvkm/subdev/fb/nvaa.h
> @@ -0,0 +1,19 @@
> +#ifndef __NVKM_FB_NVAA_H__
> +#define __NVKM_FB_NVAA_H__
> +
> +#include "nv50.h"
> +
> +struct nvaa_fb_priv {
> +       struct nv50_fb_priv base;
> +       struct page *r100c18_page;
> +       dma_addr_t r100c18;
> +};
> +
> +int  nvaa_fb_ctor(struct nouveau_object *, struct nouveau_object *,
> +                 struct nouveau_oclass *, void *, u32,
> +                 struct nouveau_object **);
> +void nvaa_fb_dtor(struct nouveau_object *);
> +int  nvaa_fb_init(struct nouveau_object *);
> +
> +
> +#endif
> --
> 2.1.3
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

--001a11c2bc0674c31f0509e890b0
Content-Type: text/x-patch; charset=US-ASCII;
	name="0001-fb-ram-mcp77-subclass-nouveau_ram.patch"
Content-Disposition: attachment;
	filename="0001-fb-ram-mcp77-subclass-nouveau_ram.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_i3jkxx4h0

RnJvbSAxMmIzYWQ1MDI4OGNlYWJhM2ZlYWU1YTExNzcyMDE0YTNhMzM0OTUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+CkRhdGU6
IFRodSwgMTEgRGVjIDIwMTQgMTM6MTk6MzEgKzEwMDAKU3ViamVjdDogW1BBVENIIDEvM10gZmIv
cmFtL21jcDc3OiBzdWJjbGFzcyBub3V2ZWF1X3JhbQoKU2lnbmVkLW9mZi1ieTogQmVuIFNrZWdn
cyA8YnNrZWdnc0ByZWRoYXQuY29tPgotLS0KIG52a20vc3ViZGV2L2ZiL3JhbW52YWEuYyB8IDI0
ICsrKysrKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMo
KyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL252a20vc3ViZGV2L2ZiL3JhbW52YWEu
YyBiL252a20vc3ViZGV2L2ZiL3JhbW52YWEuYwppbmRleCAwMGYyY2E3Li44ZWUzZDM3IDEwMDY0
NAotLS0gYS9udmttL3N1YmRldi9mYi9yYW1udmFhLmMKKysrIGIvbnZrbS9zdWJkZXYvZmIvcmFt
bnZhYS5jCkBAIC0yNCw2ICsyNCwxMCBAQAogCiAjaW5jbHVkZSAibnY1MC5oIgogCitzdHJ1Y3Qg
bnZhYV9yYW1fcHJpdiB7CisJc3RydWN0IG5vdXZlYXVfcmFtIGJhc2U7Cit9OworCiBzdGF0aWMg
aW50CiBudmFhX3JhbV9jdG9yKHN0cnVjdCBub3V2ZWF1X29iamVjdCAqcGFyZW50LCBzdHJ1Y3Qg
bm91dmVhdV9vYmplY3QgKmVuZ2luZSwKIAkgICAgICBzdHJ1Y3Qgbm91dmVhdV9vY2xhc3MgKm9j
bGFzcywgdm9pZCAqZGF0YSwgdTMyIGRhdGFzaXplLApAQCAtMzIsMjYgKzM2LDI2IEBAIG52YWFf
cmFtX2N0b3Ioc3RydWN0IG5vdXZlYXVfb2JqZWN0ICpwYXJlbnQsIHN0cnVjdCBub3V2ZWF1X29i
amVjdCAqZW5naW5lLAogCWNvbnN0IHUzMiByc3ZkX2hlYWQgPSAoIDI1NiAqIDEwMjQpID4+IDEy
OyAvKiB2Z2EgbWVtb3J5ICovCiAJY29uc3QgdTMyIHJzdmRfdGFpbCA9ICgxMDI0ICogMTAyNCkg
Pj4gMTI7IC8qIHZiaW9zIGV0YyAqLwogCXN0cnVjdCBub3V2ZWF1X2ZiICpwZmIgPSBub3V2ZWF1
X2ZiKHBhcmVudCk7Ci0Jc3RydWN0IG5vdXZlYXVfcmFtICpyYW07CisJc3RydWN0IG52YWFfcmFt
X3ByaXYgKnByaXY7CiAJaW50IHJldDsKIAotCXJldCA9IG5vdXZlYXVfcmFtX2NyZWF0ZShwYXJl
bnQsIGVuZ2luZSwgb2NsYXNzLCAmcmFtKTsKLQkqcG9iamVjdCA9IG52X29iamVjdChyYW0pOwor
CXJldCA9IG5vdXZlYXVfcmFtX2NyZWF0ZShwYXJlbnQsIGVuZ2luZSwgb2NsYXNzLCAmcHJpdik7
CisJKnBvYmplY3QgPSBudl9vYmplY3QocHJpdik7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsK
IAotCXJhbS0+c2l6ZSA9IG52X3JkMzIocGZiLCAweDEwMDIwYyk7Ci0JcmFtLT5zaXplID0gKHJh
bS0+c2l6ZSAmIDB4ZmZmZmZmMDApIHwgKChyYW0tPnNpemUgJiAweDAwMDAwMGZmKSA8PCAzMik7
CisJcHJpdi0+YmFzZS5zaXplID0gbnZfcmQzMihwZmIsIDB4MTAwMjBjKTsKKwlwcml2LT5iYXNl
LnNpemUgPSAocHJpdi0+YmFzZS5zaXplICYgMHhmZmZmZmYwMCkgfCAoKHByaXYtPmJhc2Uuc2l6
ZSAmIDB4MDAwMDAwZmYpIDw8IDMyKTsKIAotCXJldCA9IG5vdXZlYXVfbW1faW5pdCgmcGZiLT52
cmFtLCByc3ZkX2hlYWQsIChyYW0tPnNpemUgPj4gMTIpIC0KKwlyZXQgPSBub3V2ZWF1X21tX2lu
aXQoJnBmYi0+dnJhbSwgcnN2ZF9oZWFkLCAocHJpdi0+YmFzZS5zaXplID4+IDEyKSAtCiAJCQkg
ICAgICAocnN2ZF9oZWFkICsgcnN2ZF90YWlsKSwgMSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJl
dDsKIAotCXJhbS0+dHlwZSAgID0gTlZfTUVNX1RZUEVfU1RPTEVOOwotCXJhbS0+c3RvbGVuID0g
KHU2NCludl9yZDMyKHBmYiwgMHgxMDBlMTApIDw8IDEyOwotCXJhbS0+Z2V0ID0gbnY1MF9yYW1f
Z2V0OwotCXJhbS0+cHV0ID0gbnY1MF9yYW1fcHV0OworCXByaXYtPmJhc2UudHlwZSAgID0gTlZf
TUVNX1RZUEVfU1RPTEVOOworCXByaXYtPmJhc2Uuc3RvbGVuID0gKHU2NCludl9yZDMyKHBmYiwg
MHgxMDBlMTApIDw8IDEyOworCXByaXYtPmJhc2UuZ2V0ID0gbnY1MF9yYW1fZ2V0OworCXByaXYt
PmJhc2UucHV0ID0gbnY1MF9yYW1fcHV0OwogCXJldHVybiAwOwogfQogCi0tIAoyLjIuMAoK
--001a11c2bc0674c31f0509e890b0
Content-Type: text/x-patch; charset=US-ASCII;
	name="0002-fb-ram-mcp77-use-carveout-reg-to-determine-size.patch"
Content-Disposition: attachment;
	filename="0002-fb-ram-mcp77-use-carveout-reg-to-determine-size.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_i3jkxz631

RnJvbSA4NWNhNTA5OGQ2NWYzMTM2MjAyNGJmZDk2YzBiMDRiNTcxZDEwY2ZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+CkRhdGU6
IFRodSwgMTEgRGVjIDIwMTQgMTM6MjE6MjQgKzEwMDAKU3ViamVjdDogW1BBVENIIDIvM10gZmIv
cmFtL21jcDc3OiB1c2UgY2FydmVvdXQgcmVnIHRvIGRldGVybWluZSBzaXplCgpTaWduZWQtb2Zm
LWJ5OiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+Ci0tLQogbnZrbS9zdWJkZXYvZmIv
cmFtbnZhYS5jIHwgNyArKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL252a20vc3ViZGV2L2ZiL3JhbW52YWEuYyBiL252
a20vc3ViZGV2L2ZiL3JhbW52YWEuYwppbmRleCA4ZWUzZDM3Li5mNTZlZTU1IDEwMDY0NAotLS0g
YS9udmttL3N1YmRldi9mYi9yYW1udmFhLmMKKysrIGIvbnZrbS9zdWJkZXYvZmIvcmFtbnZhYS5j
CkBAIC00NCwxNiArNDQsMTUgQEAgbnZhYV9yYW1fY3RvcihzdHJ1Y3Qgbm91dmVhdV9vYmplY3Qg
KnBhcmVudCwgc3RydWN0IG5vdXZlYXVfb2JqZWN0ICplbmdpbmUsCiAJaWYgKHJldCkKIAkJcmV0
dXJuIHJldDsKIAotCXByaXYtPmJhc2Uuc2l6ZSA9IG52X3JkMzIocGZiLCAweDEwMDIwYyk7Ci0J
cHJpdi0+YmFzZS5zaXplID0gKHByaXYtPmJhc2Uuc2l6ZSAmIDB4ZmZmZmZmMDApIHwgKChwcml2
LT5iYXNlLnNpemUgJiAweDAwMDAwMGZmKSA8PCAzMik7CisJcHJpdi0+YmFzZS50eXBlICAgPSBO
Vl9NRU1fVFlQRV9TVE9MRU47CisJcHJpdi0+YmFzZS5zdG9sZW4gPSAodTY0KW52X3JkMzIocGZi
LCAweDEwMGUxMCkgPDwgMTI7CisJcHJpdi0+YmFzZS5zaXplICAgPSAodTY0KW52X3JkMzIocGZi
LCAweDEwMGUxNCkgPDwgMTI7CiAKIAlyZXQgPSBub3V2ZWF1X21tX2luaXQoJnBmYi0+dnJhbSwg
cnN2ZF9oZWFkLCAocHJpdi0+YmFzZS5zaXplID4+IDEyKSAtCiAJCQkgICAgICAocnN2ZF9oZWFk
ICsgcnN2ZF90YWlsKSwgMSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCXByaXYtPmJh
c2UudHlwZSAgID0gTlZfTUVNX1RZUEVfU1RPTEVOOwotCXByaXYtPmJhc2Uuc3RvbGVuID0gKHU2
NCludl9yZDMyKHBmYiwgMHgxMDBlMTApIDw8IDEyOwogCXByaXYtPmJhc2UuZ2V0ID0gbnY1MF9y
YW1fZ2V0OwogCXByaXYtPmJhc2UucHV0ID0gbnY1MF9yYW1fcHV0OwogCXJldHVybiAwOwotLSAK
Mi4yLjAKCg==
--001a11c2bc0674c31f0509e890b0
Content-Type: text/x-patch; charset=US-ASCII;
	name="0003-EXAMPLEfb-ram-mcp77-niso-poller-setup.patch"
Content-Disposition: attachment;
	filename="0003-EXAMPLEfb-ram-mcp77-niso-poller-setup.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_i3jky0vw2

RnJvbSAzYjJhOTFlYjU5ZDMwOGJlZDk4NjM3ZDRiY2RmZTI5YTJjOTQzNGFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+CkRhdGU6
IFRodSwgMTEgRGVjIDIwMTQgMTM6Mzk6MTggKzEwMDAKU3ViamVjdDogW1BBVENIIDMvM10gRVhB
TVBMRWZiL3JhbS9tY3A3NzogbmlzbyBwb2xsZXIgc2V0dXAKCi0tLQogbnZrbS9zdWJkZXYvZmIv
cmFtbnZhYS5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9udmttL3N1YmRldi9mYi9yYW1udmFhLmMgYi9udmttL3N1YmRldi9mYi9yYW1udmFhLmMKaW5k
ZXggZjU2ZWU1NS4uOWNhYzc0NyAxMDA2NDQKLS0tIGEvbnZrbS9zdWJkZXYvZmIvcmFtbnZhYS5j
CisrKyBiL252a20vc3ViZGV2L2ZiL3JhbW52YWEuYwpAQCAtMjYsNiArMjYsNyBAQAogCiBzdHJ1
Y3QgbnZhYV9yYW1fcHJpdiB7CiAJc3RydWN0IG5vdXZlYXVfcmFtIGJhc2U7CisJdTY0IHBvbGxl
cl9iYXNlOwogfTsKIAogc3RhdGljIGludApAQCAtMzMsOCArMzQsOCBAQCBudmFhX3JhbV9jdG9y
KHN0cnVjdCBub3V2ZWF1X29iamVjdCAqcGFyZW50LCBzdHJ1Y3Qgbm91dmVhdV9vYmplY3QgKmVu
Z2luZSwKIAkgICAgICBzdHJ1Y3Qgbm91dmVhdV9vY2xhc3MgKm9jbGFzcywgdm9pZCAqZGF0YSwg
dTMyIGRhdGFzaXplLAogCSAgICAgIHN0cnVjdCBub3V2ZWF1X29iamVjdCAqKnBvYmplY3QpCiB7
Ci0JY29uc3QgdTMyIHJzdmRfaGVhZCA9ICggMjU2ICogMTAyNCkgPj4gMTI7IC8qIHZnYSBtZW1v
cnkgKi8KLQljb25zdCB1MzIgcnN2ZF90YWlsID0gKDEwMjQgKiAxMDI0KSA+PiAxMjsgLyogdmJp
b3MgZXRjICovCisJdTMyIHJzdmRfaGVhZCA9ICggMjU2ICogMTAyNCk7IC8qIHZnYSBtZW1vcnkg
Ki8KKwl1MzIgcnN2ZF90YWlsID0gKDEwMjQgKiAxMDI0KTsgLyogdmJpb3MgZXRjICovCiAJc3Ry
dWN0IG5vdXZlYXVfZmIgKnBmYiA9IG5vdXZlYXVfZmIocGFyZW50KTsKIAlzdHJ1Y3QgbnZhYV9y
YW1fcHJpdiAqcHJpdjsKIAlpbnQgcmV0OwpAQCAtNDcsOSArNDgsMTYgQEAgbnZhYV9yYW1fY3Rv
cihzdHJ1Y3Qgbm91dmVhdV9vYmplY3QgKnBhcmVudCwgc3RydWN0IG5vdXZlYXVfb2JqZWN0ICpl
bmdpbmUsCiAJcHJpdi0+YmFzZS50eXBlICAgPSBOVl9NRU1fVFlQRV9TVE9MRU47CiAJcHJpdi0+
YmFzZS5zdG9sZW4gPSAodTY0KW52X3JkMzIocGZiLCAweDEwMGUxMCkgPDwgMTI7CiAJcHJpdi0+
YmFzZS5zaXplICAgPSAodTY0KW52X3JkMzIocGZiLCAweDEwMGUxNCkgPDwgMTI7CisJLy8gMHgx
MDAwMDAwMAogCi0JcmV0ID0gbm91dmVhdV9tbV9pbml0KCZwZmItPnZyYW0sIHJzdmRfaGVhZCwg
KHByaXYtPmJhc2Uuc2l6ZSA+PiAxMikgLQotCQkJICAgICAgKHJzdmRfaGVhZCArIHJzdmRfdGFp
bCksIDEpOworCXJzdmRfdGFpbCArPSAweDEwMDA7CisJcHJpdi0+cG9sbGVyX2Jhc2UgPSBwcml2
LT5iYXNlLnNpemUgLSByc3ZkX3RhaWw7CisJLy8gMHgxMDAwMDAwMCAtIDB4MTAxMDAwCisJLy8g
MHgwZmVmZjAwMCA8PCBvZmZzZXQgZnJvbSBzdGFydCBvZiBjYXJ2ZW91dAorCisJcmV0ID0gbm91
dmVhdV9tbV9pbml0KCZwZmItPnZyYW0sIHJzdmRfaGVhZCA+PiAxMiwKKwkJCSAgICAgIChwcml2
LT5iYXNlLnNpemUgPj4gMTIpIC0KKwkJCSAgICAgIChyc3ZkX2hlYWQgKyByc3ZkX3RhaWwpID4+
IDEyLCAxKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCkBAIC01OCw2ICs2NiwyNiBAQCBu
dmFhX3JhbV9jdG9yKHN0cnVjdCBub3V2ZWF1X29iamVjdCAqcGFyZW50LCBzdHJ1Y3Qgbm91dmVh
dV9vYmplY3QgKmVuZ2luZSwKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludAorbnZhYV9yYW1f
aW5pdChzdHJ1Y3Qgbm91dmVhdV9vYmplY3QgKm9iamVjdCkKK3sKKwlzdHJ1Y3QgbnZhYV9yYW1f
cHJpdiAqcHJpdiA9ICh2b2lkICopb2JqZWN0OworCWludCByZXQ7CisKKwlyZXQgPSBub3V2ZWF1
X3JhbV9pbml0KCZwcml2LT5iYXNlKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJZG5p
c28gID0gKChwcml2LT5iYXNlLnNpemUgLSAocHJpdi0+cG9sbGVyX2Jhc2UgKyAweDAwKSkgPj4g
NSkgLSAxOworCS8vIDB4ODA3ZgorCWhvc3RuYiA9ICgocHJpdi0+YmFzZS5zaXplIC0gKHByaXYt
PnBvbGxlcl9iYXNlICsgMHgyMCkpID4+IDUpIC0gMTsKKwkvLyAweDgwN2UKKwlmbHVzaCAgPSAo
KHByaXYtPmJhc2Uuc2l6ZSAtIChwcml2LT5wb2xsZXJfYmFzZSArIDB4NDApKSA+PiA1KSAtIDE7
CisJLy8gMHg4MDdkCisKKwlyZXR1cm4gMDsKK30KKwogc3RydWN0IG5vdXZlYXVfb2NsYXNzCiBu
dmFhX3JhbV9vY2xhc3MgPSB7CiAJLm9mdW5jcyA9ICYoc3RydWN0IG5vdXZlYXVfb2Z1bmNzKSB7
Ci0tIAoyLjIuMAoK
--001a11c2bc0674c31f0509e890b0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--001a11c2bc0674c31f0509e890b0--
