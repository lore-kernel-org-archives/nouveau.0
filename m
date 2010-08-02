From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 12/12] x86,mmiotrace: Add support for tracing STOS instruction
Date: Mon,  2 Aug 2010 02:13:13 +0200
Message-ID: <1280707993-6599-13-git-send-regression-fweisbec@gmail.com>
References: <1280707993-6599-1-git-send-regression-fweisbec@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1280707993-6599-1-git-send-regression-fweisbec@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Marcin Slusarz <marcin.slusarz@gmail.com>, Nouveau <nouveau@lists.freedesktop.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Steven Rostedt <rostedt@goodmis.org>, Frederic Weisbecker <fweisbec@gmail.com>
List-Id: nouveau.vger.kernel.org

From: Marcin Slusarz <marcin.slusarz@gmail.com>

Add support for stos access tracing with mmiotrace.

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
Acked-by: Pekka Paalanen <pq@iki.fi>
Cc: Nouveau <nouveau@lists.freedesktop.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Ingo Molnar <mingo@elte.hu>
Cc: Steven Rostedt <rostedt@goodmis.org>
LKML-Reference: <20100731205101.GA5860@joi.lan>
Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
---
 arch/x86/mm/pf_in.c |   30 +++++++++++++++++-------------
 1 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/arch/x86/mm/pf_in.c b/arch/x86/mm/pf_in.c
index 308e325..38e6d17 100644
--- a/arch/x86/mm/pf_in.c
+++ b/arch/x86/mm/pf_in.c
@@ -40,16 +40,16 @@ static unsigned char prefix_codes[] = {
 static unsigned int reg_rop[] = {
 	0x8A, 0x8B, 0xB60F, 0xB70F, 0xBE0F, 0xBF0F
 };
-static unsigned int reg_wop[] = { 0x88, 0x89 };
+static unsigned int reg_wop[] = { 0x88, 0x89, 0xAA, 0xAB };
 static unsigned int imm_wop[] = { 0xC6, 0xC7 };
 /* IA32 Manual 3, 3-432*/
-static unsigned int rw8[] = { 0x88, 0x8A, 0xC6 };
+static unsigned int rw8[] = { 0x88, 0x8A, 0xC6, 0xAA };
 static unsigned int rw32[] = {
-	0x89, 0x8B, 0xC7, 0xB60F, 0xB70F, 0xBE0F, 0xBF0F
+	0x89, 0x8B, 0xC7, 0xB60F, 0xB70F, 0xBE0F, 0xBF0F, 0xAB
 };
-static unsigned int mw8[] = { 0x88, 0x8A, 0xC6, 0xB60F, 0xBE0F };
+static unsigned int mw8[] = { 0x88, 0x8A, 0xC6, 0xB60F, 0xBE0F, 0xAA };
 static unsigned int mw16[] = { 0xB70F, 0xBF0F };
-static unsigned int mw32[] = { 0x89, 0x8B, 0xC7 };
+static unsigned int mw32[] = { 0x89, 0x8B, 0xC7, 0xAB };
 static unsigned int mw64[] = {};
 #else /* not __i386__ */
 static unsigned char prefix_codes[] = {
@@ -63,20 +63,20 @@ static unsigned char prefix_codes[] = {
 static unsigned int reg_rop[] = {
 	0x8A, 0x8B, 0xB60F, 0xB70F, 0xBE0F, 0xBF0F
 };
-static unsigned int reg_wop[] = { 0x88, 0x89 };
+static unsigned int reg_wop[] = { 0x88, 0x89, 0xAA, 0xAB };
 static unsigned int imm_wop[] = { 0xC6, 0xC7 };
-static unsigned int rw8[] = { 0xC6, 0x88, 0x8A };
+static unsigned int rw8[] = { 0xC6, 0x88, 0x8A, 0xAA };
 static unsigned int rw32[] = {
-	0xC7, 0x89, 0x8B, 0xB60F, 0xB70F, 0xBE0F, 0xBF0F
+	0xC7, 0x89, 0x8B, 0xB60F, 0xB70F, 0xBE0F, 0xBF0F, 0xAB
 };
 /* 8 bit only */
-static unsigned int mw8[] = { 0xC6, 0x88, 0x8A, 0xB60F, 0xBE0F };
+static unsigned int mw8[] = { 0xC6, 0x88, 0x8A, 0xB60F, 0xBE0F, 0xAA };
 /* 16 bit only */
 static unsigned int mw16[] = { 0xB70F, 0xBF0F };
 /* 16 or 32 bit */
 static unsigned int mw32[] = { 0xC7 };
 /* 16, 32 or 64 bit */
-static unsigned int mw64[] = { 0x89, 0x8B };
+static unsigned int mw64[] = { 0x89, 0x8B, 0xAB };
 #endif /* not __i386__ */
 
 struct prefix_bits {
@@ -410,7 +410,6 @@ static unsigned long *get_reg_w32(int no, struct pt_regs *regs)
 unsigned long get_ins_reg_val(unsigned long ins_addr, struct pt_regs *regs)
 {
 	unsigned int opcode;
-	unsigned char mod_rm;
 	int reg;
 	unsigned char *p;
 	struct prefix_bits prf;
@@ -437,8 +436,13 @@ unsigned long get_ins_reg_val(unsigned long ins_addr, struct pt_regs *regs)
 	goto err;
 
 do_work:
-	mod_rm = *p;
-	reg = ((mod_rm >> 3) & 0x7) | (prf.rexr << 3);
+	/* for STOS, source register is fixed */
+	if (opcode == 0xAA || opcode == 0xAB) {
+		reg = arg_AX;
+	} else {
+		unsigned char mod_rm = *p;
+		reg = ((mod_rm >> 3) & 0x7) | (prf.rexr << 3);
+	}
 	switch (get_ins_reg_width(ins_addr)) {
 	case 1:
 		return *get_reg_w8(reg, prf.rex, regs);
-- 
1.6.2.3
