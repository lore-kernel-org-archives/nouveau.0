From: Mugilraj Dhavachelvan <dmugil2000@gmail.com>
Subject: [PATCH] x86/mm/kmmio: correctly handle kzalloc return
Date: Tue, 20 Oct 2020 14:13:44 +0530
Message-ID: <20201020084345.96823-1-dmugil2000@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Cc: dmugil2000@gmail.com, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@kernel.org>, Karol Herbst <karolherbst@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Replacing return value -1 to error code

Signed-off-by: Mugilraj Dhavachelvan <dmugil2000@gmail.com>
---
 arch/x86/mm/kmmio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/kmmio.c b/arch/x86/mm/kmmio.c
index be020a7bc414..15430520c232 100644
--- a/arch/x86/mm/kmmio.c
+++ b/arch/x86/mm/kmmio.c
@@ -386,7 +386,7 @@ static int add_kmmio_fault_page(unsigned long addr)
 
 	f = kzalloc(sizeof(*f), GFP_ATOMIC);
 	if (!f)
-		return -1;
+		return -ENOMEN;
 
 	f->count = 1;
 	f->addr = addr;
-- 
2.25.1
