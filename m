From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH 3/5] renouveau/nv40: set
	NV40TCL_LINE_STIPPLE_PATTERN to hexa like nv30
Date: Fri, 26 Feb 2010 14:38:22 +0100
Message-ID: <1267191504-24575-4-git-send-email-luca@luca-barbieri.com>
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
 renouveau.xml |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/renouveau.xml b/renouveau.xml
index 2b6e8d7..d305a8e 100644
--- a/renouveau.xml
+++ b/renouveau.xml
@@ -4271,7 +4271,7 @@
     <reg32 offset="0x1db4" name="LINE_STIPPLE_ENABLE" type="boolean"/>
     <reg32 offset="0x1db8" name="LINE_STIPPLE_PATTERN" type="bitfield">
       <bitfield name="FACTOR" high="15" low="0" type="int"/>
-      <bitfield name="PATTERN" high="31" low="16" type="int"/>
+      <bitfield name="PATTERN" high="31" low="16" type="hexa"/>
     </reg32>
     <reg32 offset="0x1e40" name="VTX_ATTR_1F" size="16" type="float"/>
     <reg32 offset="0x1e94"/>
-- 
1.6.6.1.476.g01ddb
