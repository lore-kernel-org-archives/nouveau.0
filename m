From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: mark last megabyte as usable
Date: Mon, 12 Aug 2013 10:01:41 +1000
Message-ID: <CACAvsv60r0LYRRFt7LBxMYHpegNFQEant0NUJWqKJ614Khs4TA@mail.gmail.com>
References: <52026699.1010004@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <52026699.1010004@canonical.com>
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Thu, Aug 8, 2013 at 1:24 AM, Maarten Lankhorst
<maarten.lankhorst@canonical.com> wrote:
> It's my megabyte, I want to use it! At this point in init
> vbios is copied over already, so there's no reason it cannot
> used to hold other data now.
I believe there's areas in here where the SBIOS/VBIOS can communicate
to the driver on various events actually, at least in some situations.
 I'd rather leave it reserved for the moment.  Also, if/when we do do
this, we'll want to stick the vbios image back on module unload so
it's there for reload too.

Ben.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
> ---
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnvc0.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnvc0.c
> index cf97c4d..507d35d 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnvc0.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnvc0.c
> @@ -119,7 +119,6 @@ nvc0_ram_create(struct nouveau_object *parent, struct nouveau_object *engine,
>         struct nouveau_bios *bios = nouveau_bios(pfb);
>         struct nouveau_ram *ram;
>         const u32 rsvd_head = ( 256 * 1024) >> 12; /* vga memory */
> -       const u32 rsvd_tail = (1024 * 1024) >> 12; /* vbios etc */
>         u32 parts = nv_rd32(pfb, 0x022438);
>         u32 pmask = nv_rd32(pfb, 0x022554);
>         u32 bsize = nv_rd32(pfb, 0x10f20c);
> @@ -156,7 +155,7 @@ nvc0_ram_create(struct nouveau_object *parent, struct nouveau_object *engine,
>         /* if all controllers have the same amount attached, there's no holes */
>         if (uniform) {
>                 offset = rsvd_head;
> -               length = (ram->size >> 12) - rsvd_head - rsvd_tail;
> +               length = (ram->size >> 12) - rsvd_head;
>                 ret = nouveau_mm_init(&pfb->vram, offset, length, 1);
>         } else {
>                 /* otherwise, address lowest common amount from 0GiB */
> @@ -167,7 +166,7 @@ nvc0_ram_create(struct nouveau_object *parent, struct nouveau_object *engine,
>
>                 /* and the rest starting from (8GiB + common_size) */
>                 offset = (0x0200000000ULL >> 12) + (bsize << 8);
> -               length = (ram->size >> 12) - (bsize << 8) - rsvd_tail;
> +               length = (ram->size >> 12) - (bsize << 8);
>
>                 ret = nouveau_mm_init(&pfb->vram, offset, length, 0);
>                 if (ret)
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
