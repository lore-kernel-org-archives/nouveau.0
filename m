From: trix@redhat.com
Subject: [PATCH] x86 mmiotrace: remove definition of DEBUG
Date: Thu, 14 Jan 2021 07:58:04 -0800
Message-ID: <20210114155804.17325-1-trix@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
To: rostedt@goodmis.org, mingo@kernel.org, karolherbst@gmail.com, ppaalanen@gmail.com, dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, tglx@linutronix.de, bp@alien8.de, hpa@zytor.com
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, Tom Rix <trix@redhat.com>
List-Id: nouveau.vger.kernel.org

From: Tom Rix <trix@redhat.com>

Defining DEBUG should only be done in development.
So remove DEBUG.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 arch/x86/mm/mmio-mod.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/mm/mmio-mod.c b/arch/x86/mm/mmio-mod.c
index bd7aff5c51f7..cd768dafca9e 100644
--- a/arch/x86/mm/mmio-mod.c
+++ b/arch/x86/mm/mmio-mod.c
@@ -10,8 +10,6 @@
 
 #define pr_fmt(fmt) "mmiotrace: " fmt
 
-#define DEBUG 1
-
 #include <linux/moduleparam.h>
 #include <linux/debugfs.h>
 #include <linux/slab.h>
-- 
2.27.0
