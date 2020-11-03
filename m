From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch V3 04/37] sh/highmem: Remove all traces of unused cruft
Date: Tue, 03 Nov 2020 10:27:16 +0100
Message-ID: <20201103095856.979798613@linutronix.de>
References: <20201103092712.714480842@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8-bit
Return-path: <linux-btrfs-owner@vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, Paul McKenney <paulmck@kernel.org>, Christoph Hellwig <hch@lst.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, Alexander Viro <viro@zeniv.linux.org.uk>, Benjamin LaHaise <bcrl@kvack.org>, linux-fsdevel@vger.kernel.org, linux-aio@kvack.org, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, x86@kernel.org, Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, Michal Simek <monstr@mon>
List-Id: nouveau.vger.kernel.org

For whatever reasons SH has highmem bits all over the place but does
not enable it via Kconfig. Remove the bitrot.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/sh/include/asm/fixmap.h     |    8 --------
 arch/sh/include/asm/kmap_types.h |   15 ---------------
 arch/sh/mm/init.c                |    8 --------
 3 files changed, 31 deletions(-)

--- a/arch/sh/include/asm/fixmap.h
+++ b/arch/sh/include/asm/fixmap.h
@@ -13,9 +13,6 @@
 #include <linux/kernel.h>
 #include <linux/threads.h>
 #include <asm/page.h>
-#ifdef CONFIG_HIGHMEM
-#include <asm/kmap_types.h>
-#endif
 
 /*
  * Here we define all the compile-time 'special' virtual
@@ -53,11 +50,6 @@ enum fixed_addresses {
 	FIX_CMAP_BEGIN,
 	FIX_CMAP_END = FIX_CMAP_BEGIN + (FIX_N_COLOURS * NR_CPUS) - 1,
 
-#ifdef CONFIG_HIGHMEM
-	FIX_KMAP_BEGIN,	/* reserved pte's for temporary kernel mappings */
-	FIX_KMAP_END = FIX_KMAP_BEGIN + (KM_TYPE_NR * NR_CPUS) - 1,
-#endif
-
 #ifdef CONFIG_IOREMAP_FIXED
 	/*
 	 * FIX_IOREMAP entries are useful for mapping physical address
--- a/arch/sh/include/asm/kmap_types.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __SH_KMAP_TYPES_H
-#define __SH_KMAP_TYPES_H
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
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -362,9 +362,6 @@ void __init mem_init(void)
 	mem_init_print_info(NULL);
 	pr_info("virtual kernel memory layout:\n"
 		"    fixmap  : 0x%08lx - 0x%08lx   (%4ld kB)\n"
-#ifdef CONFIG_HIGHMEM
-		"    pkmap   : 0x%08lx - 0x%08lx   (%4ld kB)\n"
-#endif
 		"    vmalloc : 0x%08lx - 0x%08lx   (%4ld MB)\n"
 		"    lowmem  : 0x%08lx - 0x%08lx   (%4ld MB) (cached)\n"
 #ifdef CONFIG_UNCACHED_MAPPING
@@ -376,11 +373,6 @@ void __init mem_init(void)
 		FIXADDR_START, FIXADDR_TOP,
 		(FIXADDR_TOP - FIXADDR_START) >> 10,
 
-#ifdef CONFIG_HIGHMEM
-		PKMAP_BASE, PKMAP_BASE+LAST_PKMAP*PAGE_SIZE,
-		(LAST_PKMAP*PAGE_SIZE) >> 10,
-#endif
-
 		(unsigned long)VMALLOC_START, VMALLOC_END,
 		(VMALLOC_END - VMALLOC_START) >> 20,
 
