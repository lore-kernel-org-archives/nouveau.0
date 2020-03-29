From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 0/2] mm/thp: Rename pmd_mknotpresent() as pmd_mknotvalid()
Date: Sun, 29 Mar 2020 19:12:35 +0530
Message-ID: <2e67f1b8-d196-89e4-aee1-f552db1433a0@arm.com>
References: <1584680057-13753-1-git-send-email-anshuman.khandual@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-owner@vger.kernel.org>
In-Reply-To: <1584680057-13753-1-git-send-email-anshuman.khandual@arm.com>
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
To: linux-mm@kvack.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, nouveau@lists.freedesktop.org, linuxppc-dev@lists.ozlabs.org, linux-snps-arc@lists.infradead.org
List-Id: nouveau.vger.kernel.org



On 03/20/2020 10:24 AM, Anshuman Khandual wrote:
> This series renames pmd_mknotpresent() as pmd_mknotvalid(). Before that it
> drops an existing pmd_mknotpresent() definition from powerpc platform which
> was never required as it defines it's pmdp_invalidate() through subscribing
> __HAVE_ARCH_PMDP_INVALIDATE. This does not create any functional change.
> 
> This rename was suggested by Catalin during a previous discussion while we
> were trying to change the THP helpers on arm64 platform for migration.
> 
> https://patchwork.kernel.org/patch/11019637/
> 
> This series is based on v5.6-rc6.
> 
> Boot tested on arm64 and x86 platforms.
> Built tested on many other platforms including the ones changed here.

Gentle ping, any updates regarding this ?
