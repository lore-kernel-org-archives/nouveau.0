From: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] tracing: remove definition of DEBUG
Date: Mon, 18 Jan 2021 11:33:57 +0100
Message-ID: <CACO55tskaWz07cNdvpUE6wQw-7K2qwS8U1sokAeCtAF5naKuSA@mail.gmail.com>
References: <20210115153348.131791-1-trix@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20210115153348.131791-1-trix-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Tom Rix <trix-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Reviewed-by: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

On Fri, Jan 15, 2021 at 11:51 PM <trix-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> From: Tom Rix <trix-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> Defining DEBUG should only be done in development.
> So remove DEBUG.
>
> Signed-off-by: Tom Rix <trix-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  kernel/trace/trace_mmiotrace.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/kernel/trace/trace_mmiotrace.c b/kernel/trace/trace_mmiotrace.c
> index 84582bf1ed5f..2c3c31791497 100644
> --- a/kernel/trace/trace_mmiotrace.c
> +++ b/kernel/trace/trace_mmiotrace.c
> @@ -5,8 +5,6 @@
>   * Copyright (C) 2008 Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
>   */
>
> -#define DEBUG 1
> -
>  #include <linux/kernel.h>
>  #include <linux/mmiotrace.h>
>  #include <linux/pci.h>
> --
> 2.27.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>
