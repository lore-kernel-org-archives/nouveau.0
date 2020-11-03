From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch V3 18/37] highmem: Get rid of kmap_types.h
Date: Tue, 03 Nov 2020 10:27:30 +0100
Message-ID: <20201103095858.422094352@linutronix.de>
References: <20201103092712.714480842@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8-bit
Return-path: <linux-btrfs-owner@vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, Paul McKenney <paulmck@kernel.org>, Christoph Hellwig <hch@lst.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, Alexander Viro <viro@zeniv.linux.org.uk>, Benjamin LaHaise <bcrl@kvack.org>, linux-fsdevel@vger.kernel.org, linux-aio@kvack.org, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, x86@kernel.org, Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, Michal Simek <monstr@mon>
List-Id: nouveau.vger.kernel.org

The header is not longer used and on alpha, ia64, openrisc, parisc and um
it was completely unused anyway as these architectures have no highmem
support.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V3: New patch
---
 arch/alpha/include/asm/kmap_types.h  |   15 ---------------
 arch/ia64/include/asm/kmap_types.h   |   13 -------------
 arch/openrisc/mm/init.c              |    1 -
 arch/openrisc/mm/ioremap.c           |    1 -
 arch/parisc/include/asm/kmap_types.h |   13 -------------
 arch/um/include/asm/fixmap.h         |    1 -
 arch/um/include/asm/kmap_types.h     |   13 -------------
 include/asm-generic/Kbuild           |    1 -
 include/asm-generic/kmap_types.h     |   11 -----------
 include/linux/highmem.h              |    2 --
 10 files changed, 71 deletions(-)

--- a/arch/alpha/include/asm/kmap_types.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_KMAP_TYPES_H
-#define _ASM_KMAP_TYPES_H
-
-/* Dummy header just to define km_type. */
-
-#ifdef CONFIG_DEBUG_HIGHMEM
-#define  __WITH_KM_FENCE
-#endif
-
-#include <asm-generic/kmap_types.h>
-
-#undef __WITH_KM_FENCE
-
-#endif
--- a/arch/ia64/include/asm/kmap_types.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_IA64_KMAP_TYPES_H
-#define _ASM_IA64_KMAP_TYPES_H
-
-#ifdef CONFIG_DEBUG_HIGHMEM
-#define  __WITH_KM_FENCE
-#endif
-
-#include <asm-generic/kmap_types.h>
-
-#undef __WITH_KM_FENCE
-
-#endif /* _ASM_IA64_KMAP_TYPES_H */
--- a/arch/openrisc/mm/init.c
+++ b/arch/openrisc/mm/init.c
@@ -33,7 +33,6 @@
 #include <asm/io.h>
 #include <asm/tlb.h>
 #include <asm/mmu_context.h>
-#include <asm/kmap_types.h>
 #include <asm/fixmap.h>
 #include <asm/tlbflush.h>
 #include <asm/sections.h>
--- a/arch/openrisc/mm/ioremap.c
+++ b/arch/openrisc/mm/ioremap.c
@@ -15,7 +15,6 @@
 #include <linux/io.h>
 #include <linux/pgtable.h>
 #include <asm/pgalloc.h>
-#include <asm/kmap_types.h>
 #include <asm/fixmap.h>
 #include <asm/bug.h>
 #include <linux/sched.h>
--- a/arch/parisc/include/asm/kmap_types.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_KMAP_TYPES_H
-#define _ASM_KMAP_TYPES_H
-
-#ifdef CONFIG_DEBUG_HIGHMEM
-#define  __WITH_KM_FENCE
-#endif
-
-#include <asm-generic/kmap_types.h>
-
-#undef __WITH_KM_FENCE
-
-#endif
--- a/arch/um/include/asm/fixmap.h
+++ b/arch/um/include/asm/fixmap.h
@@ -3,7 +3,6 @@
 #define __UM_FIXMAP_H
 
 #include <asm/processor.h>
-#include <asm/kmap_types.h>
 #include <asm/archparam.h>
 #include <asm/page.h>
 #include <linux/threads.h>
--- a/arch/um/include/asm/kmap_types.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* 
- * Copyright (C) 2002 Jeff Dike (jdike@karaya.com)
- */
-
-#ifndef __UM_KMAP_TYPES_H
-#define __UM_KMAP_TYPES_H
-
-/* No more #include "asm/arch/kmap_types.h" ! */
-
-#define KM_TYPE_NR 14
-
-#endif
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -30,7 +30,6 @@ mandatory-y += irq.h
 mandatory-y += irq_regs.h
 mandatory-y += irq_work.h
 mandatory-y += kdebug.h
-mandatory-y += kmap_types.h
 mandatory-y += kmap_size.h
 mandatory-y += kprobes.h
 mandatory-y += linkage.h
--- a/include/asm-generic/kmap_types.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_GENERIC_KMAP_TYPES_H
-#define _ASM_GENERIC_KMAP_TYPES_H
-
-#ifdef __WITH_KM_FENCE
-# define KM_TYPE_NR 41
-#else
-# define KM_TYPE_NR 20
-#endif
-
-#endif
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -29,8 +29,6 @@ static inline void invalidate_kernel_vma
 }
 #endif
 
-#include <asm/kmap_types.h>
-
 /*
  * Outside of CONFIG_HIGHMEM to support X86 32bit iomap_atomic() cruft.
  */
