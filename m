From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH 0/5] renouveau: nv30/nv40 unification
Date: Fri, 26 Feb 2010 14:38:19 +0100
Message-ID: <1267191504-24575-1-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This patchset applies some minor fixes to renouveau.xml and then unifies
the nv30 and nv40 register definitions.

nv30 and nv40 are very similar and have the same offsets for the registers
they share.

The major differences are:
1. Texture setup is different due to full NPOT support on nv40
2. More advanced blending/render targets on nv40
3. NV30 has fixed function registers, which NV40 lacks

The vertex shader instruction format also differs, but this does not
affect renouveau.xml.

This is in preparation for unifying the Gallium drivers.

Unification is carried out by creating a new artificial "NVFXTCL" object.

This results in most of the old NV34TCL_ and NV40TCL_ definitions being
replaced by NVFXTCL_. A sed script is provided to fix the Gallium driver
and DDX.

This provides the following advantages:
1. Registers are defined only once in renouveau.xml
2. grep NV34TCL_ yields all usages of NV30-only functionality
3. grep NV40TCL_ yields all usages of NV40-only functionality

The "FX" name comes from CineFX, which nVidia uses to refers to, and
only to, nv30 and nv40 hardware.
There are some mentions on the web of CineFX referring to nv50 too, but
I could not find any official uses of it from nVidia.

This approach has been criticized due to the fact that other registers are
either named for the first card having them, or duplicated for every card.

However, I believe the additional clarity of the NVFXTCL_ approach is
worthwhile.

If consensus develops against this notion, it is easy to change the Python
script that generated the unification patch and rerun it.

Luca Barbieri (5):
  renouveau: completely describe POINT_SPRITE on nv30 and nv40
  renouveau/nv40: describe CLEAR_VALUE_COLOR bitfields
  renouveau/nv40: set NV40TCL_LINE_STIPPLE_PATTERN to hexa like nv30
  renouveau/nv30: remove clip planes #6 and #7
  renouveau: unify nv30 and nv40 as NVFXTCL

 nvfx.py       |  207 +++++++++++++
 nvfx.sed      |  340 ++++++++++++++++++++++
 renouveau.xml |  891 ++++++++++++++++++++++-----------------------------------
 3 files changed, 889 insertions(+), 549 deletions(-)
 create mode 100755 nvfx.py
 create mode 100644 nvfx.sed
