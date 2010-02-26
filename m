From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] renouveau/nv10: remove duplicate vertex buffer
	registers
Date: Fri, 26 Feb 2010 20:12:54 +0100
Message-ID: <1267211574-2443-1-git-send-email-luca@luca-barbieri.com>
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

NV10TCL defines the vertex buffer registers both as arrays and as
individual named registers.

This causes duplicate register definitions and the individual registers
are not used either by the DDX or by the Mesa driver.

Francisco Jerez said to remove them all.

Signed-off-by: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
---
 renouveau.xml |   49 -------------------------------------------------
 1 files changed, 0 insertions(+), 49 deletions(-)

diff --git a/renouveau.xml b/renouveau.xml
index 8fb35a5..3fb9d9a 100644
--- a/renouveau.xml
+++ b/renouveau.xml
@@ -2498,55 +2498,6 @@
       <bitfield name="STRIDE" high="15" low="8" type="int"/>
       <bitfield name="POS_HOMOGENEOUS" high="24" low="24" type="boolean"/>
     </reg32>
-
-    <reg32 offset="0x0d00" name="VERTEX_ARRAY_OFFSET_POS" type="hexa"/>
-    <reg32 offset="0x0d04" name="VERTEX_ARRAY_FORMAT_POS" type="bitfield">
-      <bitfield name="TYPE" high="3" low="0" type="int"/>
-      <bitfield name="FIELDS" high="7" low="4" type="int"/>
-      <bitfield name="STRIDE" high="15" low="8" type="int"/>
-    </reg32>
-    <reg32 offset="0x0d08" name="VERTEX_ARRAY_OFFSET_COL" type="hexa"/>
-    <reg32 offset="0x0d0c" name="VERTEX_ARRAY_FORMAT_COL" type="bitfield">
-      <bitfield name="TYPE" high="3" low="0" type="int"/>
-      <bitfield name="FIELDS" high="7" low="4" type="int"/>
-      <bitfield name="STRIDE" high="15" low="8" type="int"/>
-    </reg32>
-    <reg32 offset="0x0d10" name="VERTEX_ARRAY_OFFSET_COL2" type="hexa"/>
-    <reg32 offset="0x0d14" name="VERTEX_ARRAY_FORMAT_COL2" type="bitfield">
-      <bitfield name="TYPE" high="3" low="0" type="int"/>
-      <bitfield name="FIELDS" high="7" low="4" type="int"/>
-      <bitfield name="STRIDE" high="15" low="8" type="int"/>
-    </reg32>
-    <reg32 offset="0x0d18" name="VERTEX_ARRAY_OFFSET_TX0" type="hexa"/>
-    <reg32 offset="0x0d1c" name="VERTEX_ARRAY_FORMAT_TX0" type="bitfield">
-      <bitfield name="TYPE" high="3" low="0" type="int"/>
-      <bitfield name="FIELDS" high="7" low="4" type="int"/>
-      <bitfield name="STRIDE" high="15" low="8" type="int"/>
-    </reg32>
-    <reg32 offset="0x0d20" name="VERTEX_ARRAY_OFFSET_TX1" type="hexa"/>
-    <reg32 offset="0x0d24" name="VERTEX_ARRAY_FORMAT_TX1" type="bitfield">
-      <bitfield name="TYPE" high="3" low="0" type="int"/>
-      <bitfield name="FIELDS" high="7" low="4" type="int"/>
-      <bitfield name="STRIDE" high="15" low="8" type="int"/>
-    </reg32>
-    <reg32 offset="0x0d28" name="VERTEX_ARRAY_OFFSET_NOR" type="hexa"/>
-    <reg32 offset="0x0d2c" name="VERTEX_ARRAY_FORMAT_NOR" type="bitfield">
-      <bitfield name="TYPE" high="3" low="0" type="int"/>
-      <bitfield name="FIELDS" high="7" low="4" type="int"/>
-      <bitfield name="STRIDE" high="15" low="8" type="int"/>
-    </reg32>
-    <reg32 offset="0x0d30" name="VERTEX_ARRAY_OFFSET_WGH" type="hexa"/>
-    <reg32 offset="0x0d34" name="VERTEX_ARRAY_FORMAT_WGH" type="bitfield">
-      <bitfield name="TYPE" high="3" low="0" type="int"/>
-      <bitfield name="FIELDS" high="7" low="4" type="int"/>
-      <bitfield name="STRIDE" high="15" low="8" type="int"/>
-    </reg32>
-    <reg32 offset="0x0d38" name="VERTEX_ARRAY_OFFSET_FOG" type="hexa"/>
-    <reg32 offset="0x0d3c" name="VERTEX_ARRAY_FORMAT_FOG" type="bitfield">
-      <bitfield name="TYPE" high="3" low="0" type="int"/>
-      <bitfield name="FIELDS" high="7" low="4" type="int"/>
-      <bitfield name="STRIDE" high="15" low="8" type="int"/>
-    </reg32>
     <reg32 offset="0x0dfc" name="VERTEX_BEGIN_END" type="enum" enum_name="nv10_begin_end"/>
     <reg32 offset="0x0e00" name="VB_ELEMENT_U16" type="bitfield">
       <bitfield name="I0" high="15" low="0" type="int"/>
-- 
1.6.6.1.476.g01ddb
