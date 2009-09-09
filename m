From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Dropping compat from master-compat
Date: Thu, 10 Sep 2009 00:38:35 +0300
Message-ID: <20090910003835.33465a5b@daedalus.pq.iki.fi>
References: <20090909205136.76d6d351@daedalus.pq.iki.fi>
	<20090909220213.1d5c0378@laptop64.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090909220213.1d5c0378-7YwZxiNxsDIJmsy6czSMtA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Andreas Radke <a.radke-KvP5wT2u2U0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 9 Sep 2009 22:02:13 +0200
Andreas Radke <a.radke-KvP5wT2u2U0@public.gmane.org> wrote:

> Am Wed, 9 Sep 2009 20:51:36 +0300
> schrieb Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>:
> 
> > Therefore, I will drop compatibility code from master-compat branch,
> > and I will add a compile time check for the kernel version. The
> > master-compat branch will be just like the master branch, except it
> > contains the out-of-tree build scripts. This will force users to
> > follow very closely the official RC and release kernels.
> > 
> > If you want to use the latest Nouveau DRM with an older kernel,
> > you get to do the backporting and kernel bug tracking yourself.
> > This is the distributions' responsibility in general.
> 
> My distribution does not allow any backports to the main packages
> (e.g libdrm and kernel) . We ship almost everything in the latest stable
> released version plain vanilla. If you want us to keep shipping nouveau
> driver please make sure we can always build against the latest stable
> released kernel and libdrm.

But you were already using a backport. What is the difference here?
Because up to now master-compat was just that, a backport.

The kernel bugs I referred to made using Nouveau with 2.6.30.x, x < 5
kernels quite dangerous, and 2.6.31 is not out yet. How did you manage
that before 2.6.30.5 came out?

And with libdrm, you were just lucky. There have been times when no
released libdrm contained the required Nouveau code, and no libdrm
releases will be made due to Nouveau until the DRM driver has been
officially released in a Linux kernel. It may still bite you one
day. Nouveau code should not even be a part of libdrm releases yet,
that is why the --enable-nouveau-experimental-api switch exists,
so that libdrm packagers would not need to delete the files while
packaging.

It is not in any way friendly to those who want to distribute
Nouveau, but that can't be helped, really.

> I know there's no released nouveau driver out so far but if you want a
> wide user range make sure it can be build on top of the latest stable
> stuff distributions have in their repos.

That requires a dedicated person for watching kernel bugs. To my
understanding distributions have to do this routinely. Nouveau
developers certainly do not have the time to do that. And it
wasn't really done for master-compat. Other people had to come in
and poke me and say I suck.

It would be nice, if you shipped nouveau, because it means more
testing. But if you are testing with "bad" kernels, it is not
really that useful.

All that this change of master-compat really means, is that *I*
will not maintain backwards compatibility anymore. I have other
plans. If someone else wants to step up, he or she can. But
developers will always be prejudiced against bug reports
from backported modules, since that is not supported.

Sorry, but I do not see an easy solution. Sometimes I wonder
myself how testing needs distribution which depends on a release
which depends on testing it first. Apparently we just have to
settle with less testing before a release. A universal problem.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
