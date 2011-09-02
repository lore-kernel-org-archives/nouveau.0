From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: nouveau-ddx: Improvements to DRI2 kms pageflip and
	swapbuffers support.
Date: Fri,  2 Sep 2011 19:33:18 +0200
Message-ID: <1314984801-12029-1-git-send-email-mario.kleiner@tuebingen.mpg.de>
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
To: currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi. The following series of three patches provides some
improvements and bug fixes to DRI2 swap scheduling, kms pageflipping and
pageflip completion timestamping. And a fix for desktop corruption
when switching between redirected and unredirected fullscreen windows.

These are mostly direct translations of similar functionality and bug-fixes
from the intel ddx and ati ddx. All successfully tested on a GeForce-7800
GTX and QuadroFX-570 in single display mode and dual-display modes (xinerama
desktop spanning and clone mode).

I'll send another separate patch for the Linux nouveau-kms driver's pageflip
completion routine, so it reports back proper pageflip completion events
with correct timestamp and vblank count (according to OML_sync_control spec).

Lucas Stach has an almost finished patch for the nouveau-kms driver to implement
the drm high-precision vblank timestamping hook. All patches taken together
were tested on NV-47 with high precision measurement equipment. Results show
that the pageflip completion timestamps reported with these patches are accurate
with respect to reality, with a residual error of less than 40 microseconds.

Please review and apply as you see fit.

thanks,
-mario
