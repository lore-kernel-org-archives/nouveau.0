From: Petri Latvala <petri.latvala-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] lib/igt_core: Add
 igt_require_fd()
Date: Wed, 18 Mar 2020 10:12:18 +0200
Message-ID: <20200318081218.GI9497@platvala-desk.ger.corp.intel.com>
References: <20200318010047.237024-1-lyude@redhat.com>
 <20200318010047.237024-2-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200318010047.237024-2-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lyude <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: igt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Mar 17, 2020 at 09:00:44PM -0400, Lyude wrote:
> From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> 
> Like igt_assert_fd(), but using igt_require() instead
> 
> Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  lib/igt_core.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index fae5f59e..b66336cf 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1008,6 +1008,18 @@ void igt_describe_f(const char *fmt, ...);
>  	else igt_debug("Test requirement passed: %s\n", #expr); \
>  } while (0)
>  
> +/**
> + * igt_require_fd:
> + * @fd: file descriptor
> + *
> + * Skips (sub-) test if the given file descriptor is invalid.
> + *
> + * Like igt_require(), but displays the values being compared on failure instead
> + * of simply printing the stringified expression..

igt_assert_fd has this documentation comment, but that's mistakenly
copypasted from igt_assert_eq and pals. Let's not propagate the
copypaste error further.


-- 
Petri Latvala


> + */
> +#define igt_require_fd(fd) \
> +	igt_require_f(fd >= 0, "file descriptor " #fd " failed\n");
> +
>  /**
>   * igt_skip_on_f:
>   * @expr: condition to test
> -- 
> 2.24.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
