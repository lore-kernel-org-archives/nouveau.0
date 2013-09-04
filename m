From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH] drm/nouveau: fix command submission to use vmalloc for
	big allocations
Date: Wed, 4 Sep 2013 13:31:59 +1000
Message-ID: <CACAvsv5Ok_3Mf6SQ=ZX4T3Ypy1rV__bRt_eWOLU=HhRJcJNrSw@mail.gmail.com>
References: <1378132291-19577-1-git-send-email-maarten.lankhorst@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1378132291-19577-1-git-send-email-maarten.lankhorst@canonical.com>
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

On Tue, Sep 3, 2013 at 12:31 AM, Maarten Lankhorst
<maarten.lankhorst@canonical.com> wrote:
> I was getting a order 4 allocation failure from kmalloc when testing some game
> after a few days uptime with some suspend/resumes. For big allocations vmalloc
> should be used instead.
I've picked up this patch with a minor modification (see below)

>
> Also limit size more aggressively to 256 KiB.
I dropped this, it's *completely* useless, the sizes are already
enforced right at the beginning of the ioctl (shockingly, the max size
is going to be 256KiB already)...

Thanks,
Ben.

>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_gem.c | 30 +++++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 177b86d5..779d702 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -584,18 +584,34 @@ nouveau_gem_pushbuf_validate(struct nouveau_channel *chan,
>         return 0;
>  }
>
> +static inline void
> +u_free(void *addr)
> +{
> +       if (!is_vmalloc_addr(addr))
> +               kfree(addr);
> +       else
> +               vfree(addr);
> +}
> +
>  static inline void *
>  u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
>  {
>         void *mem;
>         void __user *userptr = (void __force __user *)(uintptr_t)user;
>
> -       mem = kmalloc(nmemb * size, GFP_KERNEL);
> +       if (nmemb > 256 * 1024 / size)
> +               return ERR_PTR(-ENOMEM);
> +
> +       size *= nmemb;
> +
> +       mem = kmalloc(size, GFP_KERNEL | __GFP_NOWARN);
> +       if (!mem)
> +               mem = vmalloc(size);
>         if (!mem)
>                 return ERR_PTR(-ENOMEM);
>
> -       if (DRM_COPY_FROM_USER(mem, userptr, nmemb * size)) {
> -               kfree(mem);
> +       if (DRM_COPY_FROM_USER(mem, userptr, size)) {
> +               u_free(mem);
>                 return ERR_PTR(-EFAULT);
>         }
>
> @@ -681,7 +697,7 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
>                 nouveau_bo_wr32(nvbo, r->reloc_bo_offset >> 2, data);
>         }
>
> -       kfree(reloc);
> +       u_free(reloc);
>         return ret;
>  }
>
> @@ -743,7 +759,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
>
>         bo = u_memcpya(req->buffers, req->nr_buffers, sizeof(*bo));
>         if (IS_ERR(bo)) {
> -               kfree(push);
> +               u_free(push);
>                 return nouveau_abi16_put(abi16, PTR_ERR(bo));
>         }
>
> @@ -854,8 +870,8 @@ out:
>         nouveau_fence_unref(&fence);
>
>  out_prevalid:
> -       kfree(bo);
> -       kfree(push);
> +       u_free(bo);
> +       u_free(push);
>
>  out_next:
>         if (chan->dma.ib_max) {
> --
> 1.8.3.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
