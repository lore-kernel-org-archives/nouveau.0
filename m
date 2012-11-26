From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Reproducible "PGRAPH TLB flush timeout" hang on NV96
Date: Mon, 26 Nov 2012 20:28:20 +0100
Message-ID: <20121126192820.GB3153@joi.lan>
References: <CAGZ4FETtxUpuFO+=rF8qFn22jXVNceN9NZSNzqWqrkooUg-QGQ@mail.gmail.com>
	<20121126180449.GA3153@joi.lan>
	<CAGZ4FET-k0+jZTBDPf+kJg8f23q6SN9mhn9E+X0rpY4NF0WdpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGZ4FET-k0+jZTBDPf+kJg8f23q6SN9mhn9E+X0rpY4NF0WdpA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Nov 26, 2012 at 08:16:17PM +0100, Maarten Maathuis wrote:
> On Mon, Nov 26, 2012 at 7:04 PM, Marcin Slusarz
> <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Sun, Nov 25, 2012 at 11:50:50PM +0100, Maarten Maathuis wrote:
> >> Hi everyone,
> >>
> >> I was wondering what to do to dig into this problem further.The kernel
> >> is several weeks old (nouveau tree), it's at commit
> >> 000463f13fba6b2f94a5bfcb0d615751ae9c34a0.
> >>
> >> As you can see from the mesages below the problem is reproducable to
> >> the point of getting exactly the same error.
> >
> > You missed the most important information - how do you reproduce it?
> > :)
> >
> > Marcin
> 
> A specific savegame for a game called freeorion which causes the
> problem within one turn typically, if you are interested in it i can
> dig it up.

Apitrace log could be useful - if you can reproduce hang with retrace.

Marcin
