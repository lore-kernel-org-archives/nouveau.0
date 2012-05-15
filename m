From: rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org (Robert M. Riches Jr.)
Subject: Re: any way to recover card after cursor disappears
Date: Mon, 14 May 2012 17:52:44 -0700
Message-ID: <20120515005245.0145B2342F@one.localnet>
References: <mailman.63.1337022025.14120.nouveau@lists.freedesktop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <mailman.63.1337022025.14120.nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

> Date: Mon, 14 May 2012 08:23:17 +0200
> From: Vincent Pelletier <plr.vincent-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Subject: Re: [Nouveau] any way to recover card after cursor disappears
> 	or	card locks up
> To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Message-ID: <201205140823.18067.plr.vincent-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Content-Type: Text/Plain;  charset="iso-8859-1"
>
> Le lundi 14 mai 2012 06:11:10, Robert M. Riches Jr. a ?crit :
> > However, I'm able to ssh into the system, and everything other than the
> > display is fine.
> [...]
> > I understand there is functionality in the kernel to manually switch between
> > virtual consoles.  Can that be used to force the card to complete the
> > transition from X to a text console?
>
> "chvt" is probably what you are looking for.
>
> -- 
> Vincent Pelletier

Yes, that's it.  Thank you.

Robert Riches
