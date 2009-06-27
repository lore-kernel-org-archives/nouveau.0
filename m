From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Out of tree nouveau.ko build.
Date: Sat, 27 Jun 2009 23:16:44 +0300
Message-ID: <20090627231644.0ffed94f@daedalus.pq.iki.fi>
References: <1245839531.5592.12.camel@Ed.Bebop.cooperteam.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1245839531.5592.12.camel-Ej038JCHlWh3+r/3hE3pHy1QWVtxyuQw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 24 Jun 2009 20:32:11 +1000
Christopher James Halse Rogers <chalserogers-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> As a part of updating Ubuntu's nouveau package, I've been figuring
> exactly how to build nouveau.ko from
> cgit.freedesktop.org/nouveau/linux-2.6
> 
> A first and trivial pass at this is attached.  It doesn't do any
> interesting kernel configuration checking; it just sets the right
> include paths and calls out to make.

I took the Makefile and improved it, it can be found in

http://cgit.freedesktop.org/nouveau/linux-2.6/tree/nouveau?h=newttm-devel-compat

along with important information on the kernel dependencies. The kernel
config is not any way checked AFAIK, so you need to take care of it
yourself. The Makefile should be good for any Nouveau kernel branch.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
