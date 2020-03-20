From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: [PATCH 0/2] mm/thp: Rename pmd_mknotpresent() as pmd_mknotvalid()
Date: Fri, 20 Mar 2020 10:24:15 +0530
Message-ID: <1584680057-13753-1-git-send-email-anshuman.khandual@arm.com>
Return-path: <linux-mips-owner@vger.kernel.org>
Sender: linux-mips-owner@vger.kernel.org
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, nouveau@lists.freedesktop.org, linuxppc-dev@lists.ozlabs.
List-Id: nouveau.vger.kernel.org

This series renames pmd_mknotpresent() as pmd_mknotvalid(). Before that it
drops an existing pmd_mknotpresent() definition from powerpc platform which
was never required as it defines it's pmdp_invalidate() through subscribing
__HAVE_ARCH_PMDP_INVALIDATE. This does not create any functional change.

This rename was suggested by Catalin during a previous discussion while we
were trying to change the THP helpers on arm64 platform for migration.

https://patchwork.kernel.org/patch/11019637/

This series is based on v5.6-rc6.

Boot tested on arm64 and x86 platforms.
Built tested on many other platforms including the ones changed here.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: nouveau@lists.freedesktop.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: x86@kernel.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org

Anshuman Khandual (2):
  powerpc/mm: Drop platform defined pmd_mknotpresent()
  mm/thp: Rename pmd_mknotpresent() as pmd_mknotvalid()

 arch/arc/include/asm/hugepage.h              | 2 +-
 arch/arm/include/asm/pgtable-3level.h        | 2 +-
 arch/arm64/include/asm/pgtable.h             | 2 +-
 arch/mips/include/asm/pgtable.h              | 2 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 4 ----
 arch/x86/include/asm/pgtable.h               | 2 +-
 arch/x86/mm/kmmio.c                          | 2 +-
 mm/pgtable-generic.c                         | 2 +-
 8 files changed, 7 insertions(+), 11 deletions(-)

-- 
2.20.1
