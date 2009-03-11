From: Stuart Bennett <stuart-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>
Subject: Re: DRM changes
Date: Wed, 11 Mar 2009 17:15:08 +0000
Message-ID: <49B7F19C.1080404@freedesktop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Stephane Marchesin wrote:
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
> 
> Stephane

(apologies for the crappy mailman archive->email forgery)

I have reservations about a full Linux kernel tree, if that's the proposal.

Assuming it is a relatively important goal that people should test 
Nouveau, then it makes sense to make it as easy as possible for them to 
do so.  Certainly as long as Nouveau has not merged to the Linux kernel, 
our repository is the only (non-packaged) source for those wishing to 
test.  Post merge, some repository other than Linus' kernel is still 
going to be the place to point people at for new development and fixes 
which are not in a kernel.org stable release.

I'd suggest that a) requiring 0.5 - 1 hour to git clone the half-gig or 
so of our new kernel-based tree (longer if the fd.o machinery is having 
a bad day), and b) needing people to then checkout some random branch in 
order for it to work with their kernel ( c) would be rebuild their 
kernel, if the out-of-tree compilable thing doesn't happen ), are all 
barriers to testers that are not currently there.  Although my usage may 
be atypical (or git outdated), the repository size issue also bites 
developers; cold-cache git diff and git status on the linux kernel takes 
a noticeable time, and gitk, even if regularly invoked, eats disk and 
processor for ages on each execution.

If the goal of these changes is to have a more Linux kernel-like layout, 
could we not just change drm/linux-core, or make a new repo, so that it 
mirrored everything necessary under drivers/drm?  I believe airlied 
suggested this ages ago, and it would make moving code from Linux to 
Nouveau or the other way round simpler.  Admittedly this doesn't work if 
for some reason your development demands changes elsewhere in the Linux 
tree, but in that case you may well have already failed the back-compat 
aspect.

As for branching and back-compat, I'd have thought it more useful to 
keep compat on the main branch (again, helping testers), and split 
specific kernel-merge-aimed branches off from that, as automating ifdef 
removal on a branch ought to be easier than manually adding compat to a 
bunch of branches, but I guess in some way the solutions here are all 
equivalent, and it's just which branch you bless as being called master.

Stuart
