From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: [Patches][nouveau/ddx]: Improvements to bufferswap
	implementation and timestamping
Date: Thu, 16 Feb 2012 00:45:15 +0100
Message-ID: <1329349524-11650-1-git-send-email-mario.kleiner@tuebingen.mpg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
Cc: xorg-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

here a set of patches against the nouveau-ddx. This is an extended and
revised set, based on Francisco Jerez feedback from autumn last year.

[1/9] Makes pageflipping work again on X-Server 1.12rc. It apparently stopped
working somewhere around Xorg 1.11+.

[2/9] Implements handling of pageflip completion events from the kernel.
Francisco Jerez argument against including it was that the x-server didn't
have a swaplimit api, so this couldn't be applied at the same time as the
pseudo triple-buffering hack which is in place in the current ddx.
Now we have the swaplimit api in 1.12, so this problem should be solved.

[3/9] Makes use of the swaplimit api. A new xorg.conf option "SwapLimit"
allows to select a swaplimit of 1 or 2 for double-buffering or
triple-buffering. It defaults to 2 for Xorg 1.12+ and 1 for older servers.
This way, on 1.12+ nouveau retains the kind of triple buffering behaviour it
currently has, but swap completion timestamping (OML_sync_control,
INTEL_swap_events, and client swap throttling) works conforming to
the specs. On older servers it removes triple-buffering but makes
nouveau conform to the specs. This is important for apps that need
precise and reliable swap scheduling and timestamping.

[4/9] A bug fix against corrupted desktop when switching from redirected
to non-redirected fullscreen windows under a desktop compositor.
Fixes FDO bug #35452.

[5/9] Some fixes to swap scheduling, revised according to Francisco's
review.

[6/9] Fixes swap throttling for non-fullscreen windows under a desktop
compositor. Split into a separate patch according to Francisco's
feedback.

[7/9] An attempt to provide more sane swap completion events for non-
fullscreen windows. This is a bit of cheating, as it delivers the
events for the earliest point in time one would expect the swap
to complete, assuming only a lightly loaded gpu. Real completion
could be later. I think this is an "improvement" because the current
implementation delivers swap complete events with timestamps and
counts that signal swap completion before the client even requested
the swap.

[8/9] This one adds Francisco's original triple-buffering hack back
for Xorg 1.11 and earlier servers if the xorg.conf option requests
a swaplimit > 1. Users can choose between "triple-buffering" but
broken timestamping or double-buffering with sane timestamping.

[9/9] Fixes a corner case which could cause the ddx to segfault
with its current triple-buffering implementation.

I've tested these on single-display and dual-display setups,
with/without compositor, with/without redirection and checked
the robustness and precision of the timestamps with special
measurement equipment, on XOrg 1.12-rc2 and 1.10. They work
pretty well for me and finally make nouveau very useable for
the kind of scientific applications that require precise
swap scheduling and timestamping, so i'd love to see them
reviewed and hopefully included into the ddx soon.

A couple of things are a bit of hacks:

[3/9] I think the setup of a default swap limit would be
better done in the x-server itself instead of the ddx. The
setup code is a bit awkward, hijacking the ddx->CreateBuffer
function to apply the swaplimit. A DRI2GetSwapLimit() function
is also missing from the server, which could help in the
future to track swaplimit changes by other clients than the ddx
itself. Unfortunately it is too late for the 1.12 release to do
this.

[8/9] Don't know if this is still wanted/needed or not?

[9/9] It fixes the problem and doesn't affect performance, but is
somewhat of a hack. I don't know how to do better, maybe somebody
else has a better solution?

Thanks,
-mario
