From: Christian Costa <titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH envytools] demmio: Add decoding of some
	MEM_TIMINGS registers for NVC0.
Date: Mon, 25 Aug 2014 20:58:10 +0200
Message-ID: <1408993096-18883-1-git-send-email-titan.costa@gmail.com>
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
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

---
 rnndb/memory/nvc0_pbfb.xml | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/rnndb/memory/nvc0_pbfb.xml b/rnndb/memory/nvc0_pbfb.xml
index 500cea9..e006dbe 100644
--- a/rnndb/memory/nvc0_pbfb.xml
+++ b/rnndb/memory/nvc0_pbfb.xml
@@ -49,23 +49,54 @@
 			Most bitfields are unknown.
 			</doc>
 		<bitfield high="7" low="0" name="RP">
-			<doc> RAS# precharge. </doc>
+			<doc> RAS# Precharge. </doc>
 		</bitfield>
 		<bitfield high="15" low="8" name="RAS">
-			<doc>Activate to precharge delay. </doc>
+			<doc> Activate to precharge delay. </doc>
 		</bitfield>
 		<bitfield high="23" low="16" name="RFC">
 			<doc> Refresh to activate delay. </doc>
 		</bitfield>
 		<bitfield high="31" low="24" name="RC">
-			<doc> Row cycle time. </doc>
+			<doc> Row Cycle time. </doc>
+		</bitfield>
+	</reg32>
+
+	<reg32 offset="0x290" name="MEM_TIMINGS_0" variants="NVC0-">
+		<doc> This, and the next 6 regs, are all related to memtimings.
+			A good place to read might be http://www.tweakers.fr/timings.html .
+			Most bitfields are unknown.
+			</doc>
+		<bitfield high="7" low="0" name="tRC">
+			<doc> Row Cycle time. </doc>
+		</bitfield>
+		<bitfield high="15" low="8" name="tRFC">
+			<doc> Refresh to activate delay. </doc>
+		</bitfield>
+		<bitfield high="23" low="17" name="tRAS">
+			<doc> Activate to precharge delay. </doc>
+		</bitfield>
+		<bitfield high="31" low="24" name="tRCD">
+			<doc> RAS# to CAS# Delay. </doc>
 		</bitfield>
 	</reg32>
 
 	<reg32 offset="0x294" name="MEM_TIMINGS_1" variants="NVC0-">
+		<bitfield high="3" low="0" name="tCL">
+			<doc> Row Cycle time. </doc>
+		</bitfield>
+		<bitfield high="13" low="7" name="tCWL">
+			<doc> CAS# Write Latency. </doc>
+		</bitfield>
 	</reg32>
 
 	<reg32 offset="0x298" name="MEM_TIMINGS_2" variants="NVC0-">
+		<bitfield high="15" low="8" name="tWTR">
+			<doc> Write To Read delay. </doc>
+		</bitfield>
+		<bitfield high="23" low="15" name="tWR">
+			<doc> Write Recovery time. </doc>
+		</bitfield>
 	</reg32>
 
 	<reg32 offset="0x29c" name="MEM_TIMINGS_3" variants="NVC0-">
-- 
1.9.1
