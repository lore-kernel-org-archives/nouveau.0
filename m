From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH 4/5] renouveau/nv30: remove clip planes #6 and #7
Date: Fri, 26 Feb 2010 14:38:23 +0100
Message-ID: <1267191504-24575-5-git-send-email-luca@luca-barbieri.com>
References: <1267191504-24575-1-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1267191504-24575-1-git-send-email-luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
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

These are defined for nv30 and not nv40, and they probably don't
exist in the hardware.

Both DirectX and OpenGL nVidia drivers support only 6 clip planes on
pre-nv50 hardware.

Neither the DDX nor the Gallium driver support user clip planes at all
on nv30.

This makes the definition the same as nv40, so they can be unified.
---
 renouveau.xml |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/renouveau.xml b/renouveau.xml
index d305a8e..f73ef04 100644
--- a/renouveau.xml
+++ b/renouveau.xml
@@ -3681,8 +3681,6 @@
       <bitfield name="PLANE3" high="13" low="13" type="boolean"/>
       <bitfield name="PLANE4" high="17" low="17" type="boolean"/>
       <bitfield name="PLANE5" high="21" low="21" type="boolean"/>
-      <bitfield name="PLANE6" high="25" low="25" type="boolean"/>
-      <bitfield name="PLANE7" high="29" low="29" type="boolean"/>
     </reg32>
     <reg32 offset="0x147c" name="POLYGON_STIPPLE_ENABLE" type="boolean"/>
     <reg32 offset="0x1480" name="POLYGON_STIPPLE_PATTERN" size="32" type="hexa"/>
-- 
1.6.6.1.476.g01ddb
