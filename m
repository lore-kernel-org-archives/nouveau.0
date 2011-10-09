From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 09/10] nouveau: EVO debug iface
Date: Sun, 9 Oct 2011 23:23:02 +0200
Message-ID: <20111009212302.GD3323@joi.lan>
References: <1318193920-27461-1-git-send-email-maximlevitsky@gmail.com>
	<1318193920-27461-10-git-send-email-maximlevitsky@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1318193920-27461-10-git-send-email-maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Oct 09, 2011 at 10:58:39PM +0200, Maxim Levitsky wrote:
> This code adds new debugfs file that allows to send evo commands from userspace.
> Its usefull for RE.
> 
> Signed-off-by: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Just a minor nit below.

> ---
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c |  101 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/nouveau/nv50_crtc.c       |    2 +-
>  drivers/gpu/drm/nouveau/nv50_display.h    |    1 +
>  3 files changed, 103 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> index 8e15923..c79bf56 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> @@ -30,11 +30,16 @@
>  
>  #include <linux/debugfs.h>
>  
> +#define NOUVEAU_DMA_DEBUG 1
>  #include "drmP.h"
>  #include "nouveau_drv.h"
> +#include "nouveau_dma.h"
> +#include "nv50_display.h"
> +#include "nouveau_crtc.h"
>  
>  #include <ttm/ttm_page_alloc.h>
>  
> +
>  static int
>  nouveau_debugfs_channel_info(struct seq_file *m, void *data)
>  {
> @@ -181,11 +186,107 @@ static struct drm_info_list nouveau_debugfs_list[] = {
>  };
>  #define NOUVEAU_DEBUGFS_ENTRIES ARRAY_SIZE(nouveau_debugfs_list)
>  
> +static int nouveau_evo_debugfs_open(struct inode *inode, struct file *file)
> +{
> +	file->private_data = inode->i_private;
> +	return 0;
> +}
> +
> +static int nouveau_evo_debugfs_release (struct inode *inode, struct file *file)
> +{
> +	return 0;
> +}
> +
> +int
> +nv50_crtc_wait_complete(struct drm_crtc *crtc);
> +
> +
> +static ssize_t nouveau_evo_debugfs_write(struct file *file, const char __user * user_buf,
> +			size_t count, loff_t *ppos)
> +{
> +	struct drm_minor *minor = (struct drm_minor *)file->private_data;
> +	struct drm_device* dev = minor->dev;
> +	struct nouveau_channel *evo;
> +	struct drm_crtc *crtc;
> +	struct nv50_display *display;
> +	u32 method, value;
> +	unsigned char *cmd;
> +	int ret;
> +
> +	if (count > 100 || *ppos)
> +		return -EINVAL;
> +
> +	cmd = kmalloc(count + 1, GFP_KERNEL);
> +	if (!cmd)
> +		return -ENOMEM;
> +
> +	if (copy_from_user(cmd, user_buf, count)) {
> +		kfree(cmd);
> +		return -EINVAL;
> +	}

The convention is to return -EFAULT when copy_from_user fails.

> +
> +	cmd[count] = '\0';
> +
> +	mutex_lock(&dev->mode_config.mutex);
> +
> +	display = nv50_display(dev);
> +	evo = display->master;
> +
> +	if (sscanf(cmd, "%x %x", &method, &value) == 2) {
> +
> +		ret = RING_SPACE(evo, 2);
> +		if (ret)
> +			goto out;
> +
> +		BEGIN_RING(evo, 0, method, 1);
> +		OUT_RING(evo, value);
> +		FIRE_RING(evo);
> +
> +	} else if (!strncmp(cmd, "flush", 5)) {
> +
> +		ret = RING_SPACE(evo, 6);
> +		if (ret)
> +			goto out;
> +
> +		BEGIN_RING(evo, 0, 0x84, 1);
> +		OUT_RING(evo, 0x80000004);
> +		BEGIN_RING(evo, 0, 0x84, 1);
> +		OUT_RING(evo, 0x80000008);
> +		BEGIN_RING(evo, 0, 0x80, 1);
> +		OUT_RING(evo, 0x00000000);
> +		FIRE_RING(evo);
> +
> +		list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
> +			if (crtc->fb) {
> +				nv50_display_flip_stop(crtc);
> +				nv50_crtc_wait_complete(crtc);
> +				nv50_display_flip_next(crtc, crtc->fb, NULL);
> +			}
> +		}
> +	} else
> +		NV_ERROR(dev, "evodbg: malformated input %s\n", cmd);
> +
> +	ret =  count;
> +out:
> +	kfree(cmd);
> +	mutex_unlock(&dev->mode_config.mutex);
> +	return ret;
> +}
> +
> +static const struct file_operations evo_debugfs_ops = {
> +	.open = nouveau_evo_debugfs_open,
> +	.release = nouveau_evo_debugfs_release,
> +	.write = nouveau_evo_debugfs_write,
> +	.llseek = default_llseek,
> +};
> +
>  int
>  nouveau_debugfs_init(struct drm_minor *minor)
>  {
>  	drm_debugfs_create_files(nouveau_debugfs_list, NOUVEAU_DEBUGFS_ENTRIES,
>  				 minor->debugfs_root, minor);
> +	debugfs_create_file("evo",
> +		S_IWUSR, minor->debugfs_root, minor, &evo_debugfs_ops);
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/nouveau/nv50_crtc.c b/drivers/gpu/drm/nouveau/nv50_crtc.c
> index cb8943f..4b2d9ec 100644
> --- a/drivers/gpu/drm/nouveau/nv50_crtc.c
> +++ b/drivers/gpu/drm/nouveau/nv50_crtc.c
> @@ -443,7 +443,7 @@ nv50_crtc_dpms(struct drm_crtc *crtc, int mode)
>  {
>  }
>  
> -static int
> +int
>  nv50_crtc_wait_complete(struct drm_crtc *crtc)
>  {
>  	struct drm_device *dev = crtc->dev;
> diff --git a/drivers/gpu/drm/nouveau/nv50_display.h b/drivers/gpu/drm/nouveau/nv50_display.h
> index c2da503..44c0157 100644
> --- a/drivers/gpu/drm/nouveau/nv50_display.h
> +++ b/drivers/gpu/drm/nouveau/nv50_display.h
> @@ -72,6 +72,7 @@ int nv50_display_init(struct drm_device *dev);
>  void nv50_display_destroy(struct drm_device *dev);
>  int nv50_crtc_blank(struct nouveau_crtc *, bool blank);
>  int nv50_crtc_set_clock(struct drm_device *, int head, int pclk);
> +int nv50_crtc_wait_complete(struct drm_crtc *crtc);
>  
>  int  nv50_display_flip_next(struct drm_crtc *, struct drm_framebuffer *,
>  			    struct nouveau_channel *chan);
> -- 
