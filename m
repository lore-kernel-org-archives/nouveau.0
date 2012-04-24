From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] drm/nouveau: base fence timeout on time
 of emission
Date: Tue, 24 Apr 2012 20:34:45 +0200
Message-ID: <20120424183445.GA2857@joi.lan>
References: <1335133112-8008-2-git-send-email-marcin.slusarz@gmail.com>
	<1335235054.27664.2.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1335235054.27664.2.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Apr 24, 2012 at 12:37:34PM +1000, Ben Skeggs wrote:
> On Mon, 2012-04-23 at 00:18 +0200, Marcin Slusarz wrote:
> > Wait loop can be interrupted by signal, so if signals are raised
> > periodically (e.g. SIGALRM) this loop may never finish. Use
> > emission time as a base for fence timeout.
> Ah, thanks for tackling this issue.  It's been long on my list of things
> to do, but never quite made it to the top.
> 
> Rather than hardcoding the timeout in fence_wait(), I think perhaps
> storing "fence->timeout = jiffies + (whatever * HZ);" is a better plan.
> I can forsee us wanting longer timeouts for certain operations
> (particularly long compute operations) in the future.

Yeah, good idea. Later, we will probably need to add code which will keep extending
this timeout as long as gpu is progressing.

Marcin
