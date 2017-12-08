From: Vasyl Gomonovych <gomonovych@gmail.com>
Subject: [PATCH] x86/mm/kmmio: Fix returned errno code
Date: Fri,  8 Dec 2017 22:39:34 +0100
Message-ID: <1512769174-15792-1-git-send-email-gomonovych@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rostedt@goodmis.org, mingo@kernel.org, karolherbst@gmail.com, ppaalanen@gmail.com, tglx@linutronix.de, hpa@zytor.com, gomonovych@gmail.com
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

add_kmmio_fault_page using -1 instead of the -ENOMEM
defined macro to specify kmmio_fault_page allocation failed.

Smatch tool warning:
arch/x86/mm/kmmio.c:389 add_kmmio_fault_page()
warn: returning -1 instead of -ENOMEM is sloppy

Signed-off-by: Vasyl Gomonovych <gomonovych@gmail.com>
---
 arch/x86/mm/kmmio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/kmmio.c b/arch/x86/mm/kmmio.c
index c21c2ed..9b92086b 100644
--- a/arch/x86/mm/kmmio.c
+++ b/arch/x86/mm/kmmio.c
@@ -386,7 +386,7 @@ static int add_kmmio_fault_page(unsigned long addr)
 
 	f = kzalloc(sizeof(*f), GFP_ATOMIC);
 	if (!f)
-		return -1;
+		return -ENOMEM;
 
 	f->count = 1;
 	f->addr = addr;
-- 
1.9.1
