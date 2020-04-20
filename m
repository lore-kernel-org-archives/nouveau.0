From: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 2/2] mm/thp: Rename pmd_mknotpresent() as pmd_mknotvalid()
Date: Mon, 20 Apr 2020 22:03:55 +0100
Message-ID: <20200420210354.GD29998@willie-the-truck>
References: <1584680057-13753-1-git-send-email-anshuman.khandual@arm.com>
 <1584680057-13753-3-git-send-email-anshuman.khandual@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1584680057-13753-3-git-send-email-anshuman.khandual@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, nouveau@lists.freedesktop.org, linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Fri, Mar 20, 2020 at 10:24:17AM +0530, Anshuman Khandual wrote:
> pmd_present() is expected to test positive after pmdp_mknotpresent() as the
> PMD entry still points to a valid huge page in memory. pmdp_mknotpresent()
> implies that given PMD entry is just invalidated from MMU perspective while
> still holding on to pmd_page() referred valid huge page thus also clearing
> pmd_present() test. This creates the following situation which is counter
> intuitive.
> 
> [pmd_present(pmd_mknotpresent(pmd)) = true]
> 
> This renames pmd_mknotpresent() as pmd_mknotvalid() reflecting the helper's
> functionality more accurately while changing the above mentioned situation
> as follows. This does not create any functional change.
> 
> [pmd_present(pmd_mknotvalid(pmd)) = true]
> 
> This is not applicable for platforms that define own pmdp_invalidate() via
> __HAVE_ARCH_PMDP_INVALIDATE. Suggestion for renaming came during a previous
> discussion here.

Bikeshed alert: maybe pmd_mkinvalid() would be better, given that this is
a one-trick pony for pmdp_invalidate()?

Will
