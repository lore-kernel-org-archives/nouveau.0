From: Petri Latvala <petri.latvala-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [igt-dev] [PATCH i-g-t v5 1/5] lib/igt_core: Fix
 igt_assert_fd() documentation
Date: Thu, 1 Oct 2020 09:49:26 +0300
Message-ID: <20201001064926.GA7444@platvala-desk.ger.corp.intel.com>
References: <20200930173150.431995-1-lyude@redhat.com>
 <20200930173150.431995-2-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200930173150.431995-2-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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

On Wed, Sep 30, 2020 at 01:31:46PM -0400, Lyude wrote:
> From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> 
> As Petri Latvala pointed out, some of the documentation in this macro is
> mistakenly copied from the other igt_assert*() macros. Let's fix that.
> 
> Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Reviewed-by: Petri Latvala <petri.latvala-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>


> ---
>  lib/igt_core.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index c5871520..e74ede8b 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -966,8 +966,8 @@ void igt_describe_f(const char *fmt, ...);
>   *
>   * Fails (sub-) test if the given file descriptor is invalid.
>   *
> - * Like igt_assert(), but displays the values being compared on failure instead
> - * of simply printing the stringified expression.
> + * Like igt_assert(), but displays the stringified identifier that was supposed
> + * to contain a valid fd on failure.
>   */
>  #define igt_assert_fd(fd) \
>  	igt_assert_f(fd >= 0, "file descriptor " #fd " failed\n");
> -- 
> 2.26.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
