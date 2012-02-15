From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: [Patches][nouveau/kms]: Precise Vblank and pageflip
	timestamping
Date: Wed, 15 Feb 2012 23:55:09 +0100
Message-ID: <1329346511-27433-1-git-send-email-mario.kleiner@tuebingen.mpg.de>
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
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

these are two patches against the nouveau kms driver. The first patch
makes sure that pageflip completion events get their vblank count and
timestamp from the drm. The second patch from Lucas Stach, here included
with his permission, makes sure that the timestamps of vblanks are
calculated with high precision and robustness. Both patches together
make sure that all timestamps returned by the kms driver are consistent
with each other and conform to the OML_sync_control specification.

With Lucas permission i've already integrated my feedback from
reviewing his patch into the patch. The patches have been applied
against Linux 3.2 and tested with special measurement equipment on
a GeForce 7800, a GeForce 8800 and some QuadroFX 570 and 370. The
timestamps are accurate to less than 30 usecs deviation from the
ground truth measured with the external equipment.

I'll send out a couple of nouveau ddx patches that make use of
these timestamps.

It would be great if these could be reviewed and possibly included
for the Linux 3.4 merge window.

Thanks,
-mario
