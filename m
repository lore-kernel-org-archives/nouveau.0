From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH 1/5] renouveau: completely describe POINT_SPRITE
	on nv30 and nv40
Date: Fri, 26 Feb 2010 14:38:20 +0100
Message-ID: <1267191504-24575-2-git-send-email-luca@luca-barbieri.com>
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

This matches the behavior of the Gallium drivers.

On nv20, only texture unit 3 is accelerated (according to the
NV_point_sprite spec, and that is probably why only bitfield 11 was
defined on nv30).
---
 renouveau.xml |   26 ++++++++++++++++++++++----
 1 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/renouveau.xml b/renouveau.xml
index 81e996b..2bfa1d0 100644
--- a/renouveau.xml
+++ b/renouveau.xml
@@ -3884,9 +3884,16 @@
     <reg32 offset="0x1ee0" name="POINT_SIZE" type="float"/>
     <reg32 offset="0x1ee4" name="POINT_PARAMETERS_ENABLE" type="boolean"/>
     <reg32 offset="0x1ee8" name="POINT_SPRITE" type="bitfield">
-      <bitfield name="ENABLE" high="0" low="0" type="boolean"/>
-      <bitfield name="R_MODE" high="2" low="1" type="enum" enum_name="nv20_point_sprite_r_mode"/>
-      <bitfield name="COORD_REPLACE" high="11" low="11" type="boolean"/>
+      <bitfield high="0" low="0" name="ENABLE" type="boolean" />
+      <bitfield enum_name="nv20_point_sprite_r_mode" high="2" low="1" name="R_MODE" type="enum" />
+      <bitfield high="8" low="8" name="COORD_REPLACE_0" type="boolean" />
+      <bitfield high="9" low="9" name="COORD_REPLACE_1" type="boolean" />
+      <bitfield high="10" low="10" name="COORD_REPLACE_2" type="boolean" />
+      <bitfield high="11" low="11" name="COORD_REPLACE_3" type="boolean" />
+      <bitfield high="12" low="12" name="COORD_REPLACE_4" type="boolean" />
+      <bitfield high="13" low="13" name="COORD_REPLACE_5" type="boolean" />
+      <bitfield high="14" low="14" name="COORD_REPLACE_6" type="boolean" />
+      <bitfield high="15" low="15" name="COORD_REPLACE_7" type="boolean" />
     </reg32>
     <reg32 offset="0x1efc" name="VP_UPLOAD_CONST_ID" type="hexa"/>
     <reg32 offset="0x1f00" name="VP_UPLOAD_CONST_X" size="4" stride="16" type="float"/>
@@ -4270,7 +4277,18 @@
     <reg32 offset="0x1ea8"/>
     <reg32 offset="0x1eac"/>
     <reg32 offset="0x1ee0" name="POINT_SIZE" type="float"/>
-    <reg32 offset="0x1ee8" name="POINT_SPRITE"/>
+    <reg32 offset="0x1ee8" name="POINT_SPRITE" type="bitfield">
+      <bitfield high="0" low="0" name="ENABLE" type="boolean" />
+      <bitfield enum_name="nv20_point_sprite_r_mode" high="2" low="1" name="R_MODE" type="enum" />
+      <bitfield high="8" low="8" name="COORD_REPLACE_0" type="boolean" />
+      <bitfield high="9" low="9" name="COORD_REPLACE_1" type="boolean" />
+      <bitfield high="10" low="10" name="COORD_REPLACE_2" type="boolean" />
+      <bitfield high="11" low="11" name="COORD_REPLACE_3" type="boolean" />
+      <bitfield high="12" low="12" name="COORD_REPLACE_4" type="boolean" />
+      <bitfield high="13" low="13" name="COORD_REPLACE_5" type="boolean" />
+      <bitfield high="14" low="14" name="COORD_REPLACE_6" type="boolean" />
+      <bitfield high="15" low="15" name="COORD_REPLACE_7" type="boolean" />
+    </reg32>
     <reg32 offset="0x1ef8"/>
     <reg32 offset="0x1efc" name="VP_UPLOAD_CONST_ID" type="hexa"/>
     <reg32 offset="0x1f00" name="VP_UPLOAD_CONST_X" size="4" stride="16" type="float"/>
-- 
1.6.6.1.476.g01ddb
