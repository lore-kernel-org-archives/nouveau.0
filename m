From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: add default debug level override
Date: Thu, 13 Sep 2012 12:09:20 +1000
Message-ID: <20120913020920.GA11828@nisroch.bne.redhat.com>
References: <20120912225006.GC8067@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120912225006.GC8067-OI9uyE9O0yo@public.gmane.org>
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

On Thu, Sep 13, 2012 at 12:50:06AM +0200, Marcin Slusarz wrote:
> Useful when we don't know which subsystem is failing.
This is really unnecessary unless I'm missing something.  You can pass nouveau.debug=LEVEL (without specifying a subdev name) to set the default already.

> 
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/core/core/option.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/core/core/option.c b/drivers/gpu/drm/nouveau/core/core/option.c
> index 62a432e..fde06b0 100644
> --- a/drivers/gpu/drm/nouveau/core/core/option.c
> +++ b/drivers/gpu/drm/nouveau/core/core/option.c
> @@ -22,9 +22,16 @@
>   * Authors: Ben Skeggs
>   */
>  
> +#include <linux/module.h>
>  #include <core/option.h>
>  #include <core/debug.h>
>  
> +MODULE_PARM_DESC(debug_level, "nv_printk level (0-"
> +		__stringify(CONFIG_NOUVEAU_DEBUG) ", default "
> +		__stringify(CONFIG_NOUVEAU_DEBUG_DEFAULT) ")");
> +static int nouveau_debug_level = CONFIG_NOUVEAU_DEBUG_DEFAULT;
> +module_param_named(debug_level, nouveau_debug_level, int, 0400);
> +
>  /* compares unterminated string 'str' with zero-terminated string 'cmp' */
>  static inline int
>  strncasecmpz(const char *str, const char *cmp, size_t len)
> @@ -86,7 +93,7 @@ nouveau_boolopt(const char *optstr, const char *opt, bool value)
>  int
>  nouveau_dbgopt(const char *optstr, const char *sub)
>  {
> -	int mode = 1, level = CONFIG_NOUVEAU_DEBUG_DEFAULT;
> +	int mode = 1, level = nouveau_debug_level;
>  
>  	while (optstr) {
>  		int len = strcspn(optstr, ",=");
> -- 
> 1.7.12
> 
