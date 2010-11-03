From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nouveau: Don't expose backlight control in
 presence of ACPI
Date: Thu, 04 Nov 2010 09:59:53 +1000
Message-ID: <1288828793.22971.0.camel@nisroch>
References: <20101103101229.GA4523@aeneby.se>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20101103101229.GA4523-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Aaron Sowry <aaron-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 2010-11-03 at 11:12 +0100, Aaron Sowry wrote:
> From: Aaron Sowry <aaron-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org>
> 
> Avoid confusing userspace by not publishing backlight controls if ACPI equivalents are available.
> Signed-off-by: Aaron Sowry <aaron-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org>
Thanks,

I've pushed an equivalent change into nouveau git.

Ben.
> ---
> --- linux-2.6/drivers/gpu/drm/nouveau/nouveau_state.c.orig      2010-11-03 09:56:29.502828966 +0100
> +++ linux-2.6/drivers/gpu/drm/nouveau/nouveau_state.c   2010-11-03 10:46:27.765829000 +0100
> @@ -23,6 +23,7 @@
>   * DEALINGS IN THE SOFTWARE.
>   */
> 
> +#include <linux/acpi.h>
>  #include <linux/swab.h>
>  #include <linux/slab.h>
>  #include "drmP.h"
> @@ -648,9 +649,14 @@ nouveau_card_init(struct drm_device *dev
>                         goto out_fence;
>         }
> 
> -       ret = nouveau_backlight_init(dev);
> -       if (ret)
> -               NV_ERROR(dev, "Error %d registering backlight\n", ret);
> +       if (acpi_video_backlight_support())
> +               NV_INFO(dev, "Detected ACPI backlight support, "
> +                               "not registering interface\n");
> +       else {
> +               ret = nouveau_backlight_init(dev);
> +               if (ret)
> +                       NV_ERROR(dev, "Error %d registering backlight\n", ret);
> +       }
> 
>         nouveau_fbcon_init(dev);
>         drm_kms_helper_poll_init(dev);
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
