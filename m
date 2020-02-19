From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: remove checks for return value
 of debugfs functions
Date: Wed, 19 Feb 2020 15:39:20 +1000
Message-ID: <CACAvsv4fWZWqQozMFPnyk7nXVyGPvszhY33qEQ74D0eAHofp2Q@mail.gmail.com>
References: <20200218172821.18378-1-wambui.karugax@gmail.com>
 <20200218172821.18378-6-wambui.karugax@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200218172821.18378-6-wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Wambui Karuga <wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, 19 Feb 2020 at 03:28, Wambui Karuga <wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> As there is no need to check for the return value of debugfs_create_file
> and drm_debugfs_create_files, remove unnecessary checks and error
> handling in nouveau_drm_debugfs_init.
Thanks!

>
> Signed-off-by: Wambui Karuga <wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> index 7dfbbbc1beea..15a3d40edf02 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> @@ -222,22 +222,18 @@ nouveau_drm_debugfs_init(struct drm_minor *minor)
>  {
>         struct nouveau_drm *drm = nouveau_drm(minor->dev);
>         struct dentry *dentry;
> -       int i, ret;
> +       int i;
>
>         for (i = 0; i < ARRAY_SIZE(nouveau_debugfs_files); i++) {
> -               dentry = debugfs_create_file(nouveau_debugfs_files[i].name,
> -                                            S_IRUGO | S_IWUSR,
> -                                            minor->debugfs_root, minor->dev,
> -                                            nouveau_debugfs_files[i].fops);
> -               if (!dentry)
> -                       return -ENOMEM;
> +               debugfs_create_file(nouveau_debugfs_files[i].name,
> +                                   S_IRUGO | S_IWUSR,
> +                                   minor->debugfs_root, minor->dev,
> +                                   nouveau_debugfs_files[i].fops);
>         }
>
> -       ret = drm_debugfs_create_files(nouveau_debugfs_list,
> -                                      NOUVEAU_DEBUGFS_ENTRIES,
> -                                      minor->debugfs_root, minor);
> -       if (ret)
> -               return ret;
> +       drm_debugfs_create_files(nouveau_debugfs_list,
> +                                NOUVEAU_DEBUGFS_ENTRIES,
> +                                minor->debugfs_root, minor);
>
>         /* Set the size of the vbios since we know it, and it's confusing to
>          * userspace if it wants to seek() but the file has a length of 0
> --
> 2.25.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
