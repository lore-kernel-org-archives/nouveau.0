From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH] drm/noveau: fix reference count leak in nouveau_debugfs_strap_peek
Date: Tue, 16 Jun 2020 16:11:47 +1000
Message-ID: <CACAvsv7FMUMpZToCQK4QtnaB5muyjk1MW5KOpyrGVtatM-gmsA@mail.gmail.com>
References: <20200614014838.123171-1-pakki001@umn.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200614014838.123171-1-pakki001@umn.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: Aditya Pakki <pakki001@umn.edu>
Cc: wu000273@umn.edu, David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>, kjlu@umn.edu, LKML <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

Thanks,

I've grabbed this, and the others of the same sort you sent out at the
same time.

Ben.

On Mon, 15 Jun 2020 at 17:29, Aditya Pakki <pakki001@umn.edu> wrote:
>
> nouveau_debugfs_strap_peek() calls pm_runtime_get_sync() that
> increments the reference count. In case of failure, decrement the
> ref count before returning the error.
>
> Signed-off-by: Aditya Pakki <pakki001@umn.edu>
> ---
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> index 63b5c8cf9ae4..8f63cda3db17 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> @@ -54,8 +54,10 @@ nouveau_debugfs_strap_peek(struct seq_file *m, void *data)
>         int ret;
>
>         ret = pm_runtime_get_sync(drm->dev->dev);
> -       if (ret < 0 && ret != -EACCES)
> +       if (ret < 0 && ret != -EACCES) {
> +               pm_runtime_put_autosuspend(drm->dev->dev);
>                 return ret;
> +       }
>
>         seq_printf(m, "0x%08x\n",
>                    nvif_rd32(&drm->client.device.object, 0x101000));
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
