From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: [Discussion] User controls for PowerManagement
Date: Sun, 10 Jan 2010 13:15:25 +0200
Message-ID: <20100110131525.56d0a892@daedalus.pq.iki.fi>
References: <1262900664.4b4655b8c25cc@netmail.leidenuniv.nl>
	<20100110123340.7840da75@daedalus.pq.iki.fi>
	<20100110104302.GB4769@x200>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100110104302.GB4769@x200>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: r.spliet-+WoPDYjVzZevezkx17PYy4RWq/SkRNHw@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, 10 Jan 2010 12:43:02 +0200
Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> > On Thu,  7 Jan 2010 22:44:24 +0100
> > r.spliet-+WoPDYjVzZevezkx17PYy4RWq/SkRNHw@public.gmane.org wrote:
> > 
> > > 1. joi pointed out that procfs is deprecated, and I should use
> > > sysfs instead.
> 
> /proc is not deprecated per se, you simply shouldn't expose
> everything you know to userspace, because it will be impossible
> to remove later.

I think adding "random crap" to procfs is frowned upon nowadays,
that's probably what he meant. Attributes should be in sysfs.
What to expose is another question, you are right.

If the interface is just temporary, it should probably go into
debugfs. That way one can have the code in the kernel proper,
not fear about freezing it, and prevent people from finding it
by accident. And it should be guarded by an "EXPERIMENTAL, DANGEROUS"
Kconfig option in any case.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
