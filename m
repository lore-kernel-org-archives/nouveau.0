From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: CCACHE and VFETCH FAULTs causing lockups
Date: Tue, 08 Mar 2011 12:22:36 +0100
Message-ID: <1299583356.2199.1.camel@workstation>
References: <AANLkTik0CkbQz=PoXNG7bQEn_5ssAfp7cr=Z=3qJz6h2@mail.gmail.com>
	<1299016269.1822.3.camel@nisroch>
	<AANLkTimiy=U04vfiXRAqDj_eT+zxSN2_3NvmF4jRQWxc@mail.gmail.com>
	<65DF9FD4-DDE0-4BA3-950A-422A3F1EF9DA@gmail.com>
	<AANLkTi=7YDLL8N=15ktHE3oYB2LMkm2WQ6y20+-gfmT_@mail.gmail.com>
	<62F49887-5C29-4DFD-9166-3BB6AD0E23F1@gmail.com>
	<AANLkTi=jNcm+868ppNTGA+6ufqi7muctHxMnpzj9J-k8@mail.gmail.com>
	<1299536569.29441.1.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1299536569.29441.1.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Am Dienstag, den 08.03.2011, 08:22 +1000 schrieb Ben Skeggs:
> > >
> > > The *other* possible thing is that the ttm delayed delete queue is causing multiple tlb flushes to happen at the same time.  I'll add locking for that in the morning, that was a complete oversight.
> > 
> > I've had no lockups since you added the spinlocks, so maybe that was
> > it. Time will tell.
> *crosses fingers*
> 

Confirming that nouveau seems pretty stable again on my NVA8 after the
locking commit. No lockups so far.

-- Lucas

> Ben.
