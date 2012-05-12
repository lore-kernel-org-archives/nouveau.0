From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patches] mesa/nv30: Diverse set of patches that
 improve NV3x render quality V2
Date: Sat, 12 May 2012 12:44:26 +1000
Message-ID: <1336790666.22856.2.camel@nisroch>
References: <[Patches]mesa/nv30: Diverse set of patches that improve NV3x render
	quality>
	<1336786951-3325-1-git-send-email-r.spliet@student.tudelft.nl>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1336786951-3325-1-git-send-email-r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Cc: Nouveau mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Am Samstag, den 12.05.2012, 03:42 +0200 schrieb Roy Spliet:
> A reworked version of 3 out of 4 patches mentioned earlier.
> 
> [1/4]: Fixes nearly all piglit vertprog testcases, due to now being able to pass the results on to the fragment shader. V2: rename samplers to texcoords.
> [2/4]: Fixes shader compiler assertion errors, as some source registers do not exist for certain operations. Fixes several piglit tests when mesa is compiled with --enable-debug
> [3/4]: unchanged
2/3 pushed to mesa git!

Thanks again!
Ben.
> [4/4]: Dropped, requires a more substantial fix. As a quick-fix it's still useable though.
> 
> Testers welcome!
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
