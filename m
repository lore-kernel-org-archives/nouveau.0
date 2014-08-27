From: Christian Costa <titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH envytools] nva: Clean up nva tools doc
Date: Wed, 27 Aug 2014 08:24:21 +0200
Message-ID: <1409120662-6412-1-git-send-email-titan.costa@gmail.com>
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

- Sort commands by name for easier update
- Make more readable
- Remove no more existing commands
---
 nva/README | 81 +++++++++++++++++++++++++++++++++-----------------------------
 1 file changed, 43 insertions(+), 38 deletions(-)

diff --git a/nva/README b/nva/README
index 625ea7c..cbe6ae3 100644
--- a/nva/README
+++ b/nva/README
@@ -13,43 +13,48 @@ by the nvalist program.
 
 The programs are:
 
-nvalist: prints a list of cards
-
-nvapeek <address> [<byte count>]: reads 32-bit MMIO register at <address>.
-If byte count is also given, reads all registers in range [address, address
-+ byte count).
-
-nvapeek8 <address> [<byte count>]: like nvapeek, but does 8-bit MMIO accesses
-
-nvapoke <address> <value>: writes a 32-bit <value> to the MMIO register at
-<address>.
-
-nvapoke8 <address> <value>: like nvapoke, but does 8-bit MMIO access
-
-nvawatch [-t] <address>: reads MMIO register at <address> in a loop, prints
-the value every time it changes. If -t is specified, prints a timestamp
-and diff from the previous timestamp before the value. Never quits, needs
-to be manually aborted.
-
-nvahammer <address> <value>: like nvapoke, but repeats the write in
-an infinite loop. Needs to be manually aborted.
-
-nvagetbios [-s <extraction method>]: extracts the card's VBIOS using the
-method given as parameter and writes it to stdout. Method can be PROM or
-PRAMIN. If method is not given, defaults to something sensible.
-
-nvafuzz <address> [<byte count>]: writes random values to a register or
-a register range in an infinite loop. Needs to be manually aborted.
-
-nvascan [-as] <address> [<byte count>]: for each register in a range:
-read it, write 0xffffffff, read it, write 0, read it, write back the
-original value. Helpful to see the valid values for registers. If -s option
-is passed, does a slow scan - waits and reads PMC.ID register between scans
-to recover from errors caused by invalid register accesses. If -a option
-is passed, does a cross-test on all registers in the range to detect aliased
-addresses [not particularly reliable].
-
-nvatiming: attempts to measure what frequency various units of the card are
-running at by using misc tricks.
+nvafuzz <address> [<byte count>]
+    Writes random values to a register or
+    a register range in an infinite loop. Needs to be manually aborted.
+
+nvagetbios [-s <extraction method>]
+    Extracts the card's VBIOS using the
+    method given as parameter and writes it to stdout. Method can be PROM or
+    PRAMIN. If method is not given, defaults to something sensible.
+
+nvahammer <address> <value>
+    Like nvapoke, but repeats the write in
+    an infinite loop. Needs to be manually aborted.
+
+nvalist
+    Prints a list of cards
+
+nvapeek <address> [<byte count>]
+    Reads 32-bit MMIO register at <address>.
+    If byte count is also given, reads all registers in range [address, address
+    + byte count).
+
+nvapoke <address> <value>
+    Writes a 32-bit <value> to the MMIO register at
+    <address>.
+
+nvascan [-as] <address> [<byte count>]
+    For each register in a range:
+    read it, write 0xffffffff, read it, write 0, read it, write back the
+    original value. Helpful to see the valid values for registers. If -s option
+    is passed, does a slow scan - waits and reads PMC.ID register between scans
+    to recover from errors caused by invalid register accesses. If -a option
+    is passed, does a cross-test on all registers in the range to detect aliased
+    addresses [not particularly reliable].
+
+nvatiming
+    Attempts to measure what frequency various units of the card are
+    running at by using misc tricks.
+
+nvawatch [-t] <address>
+    Reads MMIO register at <address> in a loop, prints
+    the value every time it changes. If -t is specified, prints a timestamp
+    and diff from the previous timestamp before the value. Never quits, needs
+    to be manually aborted.
 
 [XXX: document the remaining tools]
-- 
1.9.1
