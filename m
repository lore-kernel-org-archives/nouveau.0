From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: DRM changes
Date: Tue, 31 Mar 2009 21:17:33 +0300
Message-ID: <20090331211733.67aeb682@daedalus.pq.iki.fi>
References: <6a89f9d50903091449w47c8a79ak37124972b91a6fde@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6a89f9d50903091449w47c8a79ak37124972b91a6fde-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Stephane Marchesin <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, 9 Mar 2009 22:49:32 +0100
Stephane Marchesin <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org> wrote:

> Hi,
> 
> As part of aiming at upstreaming our code, I suppose we have to
> discuss the DRM situation a little. In order to aim for merging, I
> think we'd better be working on a linux kernel tree layout. And
> considering we're technically the only ones still working in drm.git,
> it doesn't really make sense to keep doing that for the sake of
> sharing code with other drivers.
> 
> As we discussed on irc, there would be multiple changes related to this:
> - we move to a linux kernel-like tree, that should make it easier when
> upstreaming the code.
> - this new tree is hosted in freedekstop.org in the nouveau/ git so we
> don't need additional accounts for everyone all around and people can
> keep pushing things (even better, all nouveau people can push to the
> drm, which used to require mesa rights before)
> - we keep a(some) branch(es) in the tree for backwards compat with
> older kernels. Either in the form of separate kernel versions
> including nouveau, or in the form of an out-of-tree-compilable
> drm/nouveau module.
> 
> So, does that plan sound sane? Do you have better plans?

I had a discussion with darktama (Ben) about this.
Dave, there are questions specifically for you.
Marcheu, we need your verdict after Dave's comments.

Using a kernel tree would free Ben and others from backporting
things to drm.git. My "Building rawhide+darktama on 2.6.24"
experiment shows, that it is possible to reach practically the
same level of ease as drm.git offers to users. More on this later.
One major point here is to keep the Nouveau DRM development in
one place.

The downside is that BSD devels will probably get hurt. The
backporting work Ben and others are doing now will fall onto them.
Yet we cannot really stick to drm.git if we want upstream, since
de facto upstream is Linux. Someone has to do the porting and it's
pretty much a trade-off between helping BSDs or concentrating on
core development.

Why have a full kernel tree, and not just drivers/gpu/?
Because then it is easy to merge from upstream back to our tree.

My proposition follows:

Step 1: Nouveau development tree

This will be a complete kernel tree hosted at freedesktop.org.
Ben is ready to request it from fd.o. This tree will be free for all
developers to commit, adhering to kernel coding style. This is
NOT a tree that will be sent upstream, but all (future) patches
must be as upstream-quality as possible. This tree will
completely replace drm.git's shared-core and linux-core directories.

This tree is never rebased. Ever. Period. Upstream kernel
development will be marged back here, but we do not rebase.
Whatever gets pushed into the repo, stays there. This offers
a solid ground for devels to base their private work on.
Somewhat related, read also this:
http://sourceforge.net/mailarchive/message.php?msg_name=alpine.LFD.2.00.0903291409030.3994%40localhost.localdomain

The $1M question: which kernel tree will this be based on?
Ben tells me Dave's drm-next[1] gets rebased sometimes.

Dave, what are your plans on drm-next now after Linus'
comments? Are you able to offer a DRM kernel tree that will
not be rebased, and that we could use as the base?

Since this is not an upstreaming tree, it should not matter
too much when we pull updates from upstream, but we probably
need a policy for it.

Compatibility for older kernels can be implemented as a
branch in this tree, let's call it compat. Compat starts as a
fork of master, gets the basic compatibility patches from me,
and then we periodically just merge master into compat to keep
it up-to-date. If compatibility needs some fixes, they are just
committed into the branch. This keeps the main development and
backwards compat separate. I can maintain the compat stuff for
now, and I will also have personal interest as long as I use
2.6.24. The single compat branch will serve "all" old kernels
using #ifdefs. The compat branch is used with out-of-tree compiling.

There are several ways to offer the branches to users:
- cgit.fd.o can produce tar-balls of the complete tree, i.e. snapshots
- someone could set up an automatic snapshot service, that packages
only the drivers/gpu/ directory and other relevant files instead of
the full kernel tree
- users can clone the kernel tree without history, and still later
use git-fetch or git-pull to stay up-to-date. (See git-clone --depth)

It is possible to build drm.ko and nouveau.ko out-of-tree. This means
the modules are built from the Nouveau kernel tree sources, but
for (with) whatever kernel the user is already running (provided the
configuration supports Nouveau, and we have compat stuff for the
kernel version). The commands are a bit long,
but we can offer a script that nicely automates it, and also checks
the kernel config. I think we can get pretty close to how easy
drm.git is for building kernel modules. Currently there is one
nasty obstacle: some older kernels are missing
EXPORT_SYMBOL_GPL(shmem_file_setup), which means the user needs to
patch that in. Ben says we should be able to work around that in near
future.


Step 2: Nouveau upstreaming tree

Because the development tree is a development tree, and from the
kernel's perspective is a private tree, it will not be used for
upstreaming. As you know, accidents happen in development trees, and
the patches do not get reviewed before being pushed. A separate tree
is made for upstreaming.

This tree will live in kernel.org and have a dedicated maintainer,
who will cherry-pick patches from the Nouveau development tree for
upstreaming. The upstreaming tree is based on whatever Dave wants,
as the patches (or maybe pull-requests, when the practices have
stabilized) will be sent to Dave.

There is no need to create the upstreaming tree until Nouveau is
in the shape that it could start pushing for upstream. Hopefully
by then we have also found the maintainer (or two). Personally
I cannot promise to take this task, since I am not convinced I
have the time to do it well.

In the meanwhile, we should rehearse making upstream-quality
patches in the development tree.


Marcheu, what do you think about this? Let's give Ben the green light?
Dave, do you think the git use policy I described is feasible?

Comments, objections?
I have read the earlier comments on this thread and hope to have
answered all concerns.

A hint for kernel git trees: gitk -n 1000


Thanks.


[1] http://git.kernel.org/?p=linux/kernel/git/airlied/drm-2.6.git;a=summary

-- 
Pekka Paalanen
http://www.iki.fi/pq/
