From: Stephane Marchesin <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Subject: DRM changes
Date: Mon, 9 Mar 2009 22:49:32 +0100
Message-ID: <6a89f9d50903091449w47c8a79ak37124972b91a6fde@mail.gmail.com>
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
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi,

As part of aiming at upstreaming our code, I suppose we have to
discuss the DRM situation a little. In order to aim for merging, I
think we'd better be working on a linux kernel tree layout. And
considering we're technically the only ones still working in drm.git,
it doesn't really make sense to keep doing that for the sake of
sharing code with other drivers.

As we discussed on irc, there would be multiple changes related to this:
- we move to a linux kernel-like tree, that should make it easier when
upstreaming the code.
- this new tree is hosted in freedekstop.org in the nouveau/ git so we
don't need additional accounts for everyone all around and people can
keep pushing things (even better, all nouveau people can push to the
drm, which used to require mesa rights before)
- we keep a(some) branch(es) in the tree for backwards compat with
older kernels. Either in the form of separate kernel versions
including nouveau, or in the form of an out-of-tree-compilable
drm/nouveau module.

So, does that plan sound sane? Do you have better plans?

Stephane
