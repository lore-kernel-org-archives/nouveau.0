From: Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2] x86 : remove definition of DEBUG
Date: Thu, 14 Jan 2021 16:43:32 -0500
Message-ID: <20210114164332.5e7ed5f5@gandalf.local.home>
References: <20210114212827.47584-1-trix@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20210114212827.47584-1-trix-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: trix-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alexandre.chartre-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dave.hansen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mchehab+huawei-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, luto-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, ying-tsun.huang-5C7GfCeVMHo@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, 14 Jan 2021 13:28:27 -0800
trix-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wrote:

> diff --git a/arch/x86/mm/mmio-mod.c b/arch/x86/mm/mmio-mod.c
> index bd7aff5c51f7..cd768dafca9e 100644
> --- a/arch/x86/mm/mmio-mod.c
> +++ b/arch/x86/mm/mmio-mod.c
> @@ -10,8 +10,6 @@
>  
>  #define pr_fmt(fmt) "mmiotrace: " fmt
>  
> -#define DEBUG 1

Seems to only be used for printing the pr_debug() functions.

> -
>  #include <linux/moduleparam.h>
>  #include <linux/debugfs.h>
>  #include <linux/slab.h>

Acked-by: Steven Rostedt (VMware) <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>

-- Steve
