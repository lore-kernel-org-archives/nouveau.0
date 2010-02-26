From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH 2/5] renouveau/nv40: describe CLEAR_VALUE_COLOR
	bitfields
Date: Fri, 26 Feb 2010 14:38:21 +0100
Message-ID: <1267191504-24575-3-git-send-email-luca@luca-barbieri.com>
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

---
 renouveau.xml |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/renouveau.xml b/renouveau.xml
index 2bfa1d0..2b6e8d7 100644
--- a/renouveau.xml
+++ b/renouveau.xml
@@ -4253,7 +4253,12 @@
     <reg32 offset="0x1d84"/>
     <reg32 offset="0x1d88"/>
     <reg32 offset="0x1d8c" name="CLEAR_VALUE_DEPTH"/>
-    <reg32 offset="0x1d90" name="CLEAR_VALUE_COLOR"/>
+    <reg32 offset="0x1d90" name="CLEAR_VALUE_COLOR" type="bitfield">
+      <bitfield name="B" high="7" low="0" type="int" />
+      <bitfield name="G" high="15" low="8" type="int" />
+      <bitfield name="R" high="23" low="16" type="int" />
+      <bitfield name="A" high="31" low="24" type="int" />
+    </reg32>
     <reg32 offset="0x1d94" name="CLEAR_BUFFERS" type="bitfield">
       <bitfield name="COLOR_A" high="7" low="7" type="boolean"/>
       <bitfield name="COLOR_B" high="6" low="6" type="boolean"/>
-- 
1.6.6.1.476.g01ddb
