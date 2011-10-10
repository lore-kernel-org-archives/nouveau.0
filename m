From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/10]: nouveau: assorted fixes
Date: Mon, 10 Oct 2011 10:53:46 +1000
Message-ID: <1318208026.2533.23.camel@nisroch>
References: <1318193920-27461-1-git-send-email-maximlevitsky@gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1318193920-27461-1-git-send-email-maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Sun, 2011-10-09 at 22:58 +0200, Maxim Levitsky wrote:
> Hi,
Hey,

I pushed patches 1-5, fixing up the log messages to be "drm/nouveau"
instead of just "nouveau".

Patch 6: needs a rebase on top of nouveau git, it conflicts with the
overscan compensation patches I pushed a short while ago.

Patch 7: not 100% set on this idea, but, maybe use the same variable
names as nvd0_display.c does?  They're much shorter :)

Patch 8: i'd send this one to dri-devel, so it gets review from all the
driver maintainers

Patch 9: i pushed a tool to envytools which'll get you the same
functionality.

Thanks!
Ben.
 
> 
> Here is my patch queue I accumulated over quite a long time.
> Patches 1-6 are bugfixes, and rest is mostly RFC.
> 
> Comments are welcome.
> 
> Best regards,
> 	Maxim Levitsky
> 
