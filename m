From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 2/2] mm/thp: Rename pmd_mknotpresent() as pmd_mknotvalid()
Date: Tue, 21 Apr 2020 04:57:26 +0530
Message-ID: <78fee884-78fc-6102-1a37-12106dc21336@arm.com>
References: <1584680057-13753-1-git-send-email-anshuman.khandual@arm.com>
 <1584680057-13753-3-git-send-email-anshuman.khandual@arm.com>
 <20200420210354.GD29998@willie-the-truck>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-owner@vger.kernel.org>
In-Reply-To: <20200420210354.GD29998@willie-the-truck>
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
To: Will Deacon <will@kernel.org>
Cc: linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, nouveau@lists.freedesktop.org, linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org



On 04/21/2020 02:33 AM, Will Deacon wrote:
> On Fri, Mar 20, 2020 at 10:24:17AM +0530, Anshuman Khandual wrote:
>> pmd_present() is expected to test positive after pmdp_mknotpresent() as the
>> PMD entry still points to a valid huge page in memory. pmdp_mknotpresent()
>> implies that given PMD entry is just invalidated from MMU perspective while
>> still holding on to pmd_page() referred valid huge page thus also clearing
>> pmd_present() test. This creates the following situation which is counter
>> intuitive.
>>
>> [pmd_present(pmd_mknotpresent(pmd)) = true]
>>
>> This renames pmd_mknotpresent() as pmd_mknotvalid() reflecting the helper's
>> functionality more accurately while changing the above mentioned situation
>> as follows. This does not create any functional change.
>>
>> [pmd_present(pmd_mknotvalid(pmd)) = true]
>>
>> This is not applicable for platforms that define own pmdp_invalidate() via
>> __HAVE_ARCH_PMDP_INVALIDATE. Suggestion for renaming came during a previous
>> discussion here.
> 
> Bikeshed alert: maybe pmd_mkinvalid() would be better, given that this is
> a one-trick pony for pmdp_invalidate()?

I had thought about making it pmd_mkinvalid() earlier. But as we were replacing
pmd_mknotpresent(), hence went with similar pattern pmd_mknotvalid() which was
originally suggested by Catalin. There is an existing pte_mknotpresent() in arc
platform as well. I dont have a very strong opinion either way, will be happy
to rename. But then still wondering if we really need to.

> 
> Will
> 
