From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: POST the card before GPIO
	initialization
Date: Fri, 14 Sep 2012 16:44:59 +1000
Message-ID: <20120914064459.GE4289@nisroch.bne.redhat.com>
References: <20120913222133.GA8982@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120913222133.GA8982-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Sep 14, 2012 at 12:21:33AM +0200, Marcin Slusarz wrote:
> Otherwise my card (nv92) never resumes from suspend to ram, hanging on
> nv_mask in nv50_gpio_drive. Before rework, initialization was done only
> from POST, so this patch restores previous behaviour.
This patch would break the cold-boot behaviour (DEVINIT needs GPIO etc
to have been created so it can call out to them).

I've modified nouveau git so that it restores the behaviour of the first
version of the rework and has DEVINIT be the first in the init ordering,
but delays its init until all its dependencies have been created.

Can you confirm your issue is resolved now?

Ben.

> 
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> 
> Let me tell you little story about this patch...
> 
> It took me ~week to figure it out.
> 1) I bisected it to "drm/nouveau/gpio: port gpio to subdev interfaces", but
> looking at this commit I couldn't spot anything (who would...).
> 2) Netconsole hanged immediately on boot (I found the commit which broke
> netconsole and it turned out to be already known broken with patch fixing it
> waiting for pull).
> 3) Even with netconsole working, completely nothing reached netconsole across
> S/R - I had to add no_console_suspend on kernel command line to see anything.
> 4) I still couldn't see anything Nouveau related, because Nouveau tried to
> resume before network card... (so when network card finally resumed on another
> CPU, Nouveau's resume was already hanging)
> 5) With information from 1) I found hanging code by placing BUG()'s in various
> places and seeing if network card resumed...
> 6) Then I had the idea to add msleep(10000) at the beginning of
> nouveau_drm_resume and voila! I could see Nouveau resuming.
> 7) ... But I still couldn't see debugging messages (only KERN_INFO and above),
> so I patched nv_printk to emit all debugging messages on KERN_INFO level.
> 8) I checked all variables in nv50_gpio_reset to see if dcb entries are
> calculated correctly - they were.
> 9) At this point my S/R counter reached ~40, so I started to wonder how to
> debug it without actually doing S/R. So I came up with an idea of booting
> with NvForcePost=1. With all debugging messages reaching console I hit
> what turned out to be vgacon/Nouveau memory corruption bug... Facepalm.
> I fixed it 2 days later (patch posted yesterday), but... I still couldn't
> reproduce original issue without suspending.
> 10) And then... I noticed in resume log that GPIO init is the very first thing
> Nouveau does on resume. Moving GPIO init after POST fixed everything. Yeah!
> 
> PS: Yes, I know my English is awkward - sorry about it.
> 
> ---
>  drivers/gpu/drm/nouveau/core/include/core/device.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/core/include/core/device.h b/drivers/gpu/drm/nouveau/core/include/core/device.h
> index 588deb9..3a6482e 100644
> --- a/drivers/gpu/drm/nouveau/core/include/core/device.h
> +++ b/drivers/gpu/drm/nouveau/core/include/core/device.h
> @@ -8,11 +8,11 @@
>  enum nv_subdev_type {
>  	NVDEV_SUBDEV_DEVICE,
>  	NVDEV_SUBDEV_VBIOS,
> -	NVDEV_SUBDEV_GPIO,
>  	NVDEV_SUBDEV_I2C,
>  	NVDEV_SUBDEV_CLOCK,
>  	NVDEV_SUBDEV_MXM,
>  	NVDEV_SUBDEV_DEVINIT,
> +	NVDEV_SUBDEV_GPIO,
>  	NVDEV_SUBDEV_MC,
>  	NVDEV_SUBDEV_TIMER,
>  	NVDEV_SUBDEV_FB,
> -- 
> 1.7.12
> 
