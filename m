From: Jessica Yu <jeyu@kernel.org>
Subject: Re: suspend to ram -> BOOM: exception RIP:
 drm_calc_vbltimestamp_from_scanoutpos+335
Date: Mon, 17 Jul 2017 19:20:43 +0200
Message-ID: <20170717172043.xk52z73qrz7wx7xw@redbean>
References: <CAKb7Uvgh-gj+4dHhDfptLD1Ggz5rwxsG3jBOqQ3h6yxV6_woqg@mail.gmail.com>
 <1499796510.5315.27.camel@gmx.de>
 <CAKb7UvgOOzVj=tygh4-BDRXGFUr2Y8U0pkV+-oYjy6EVYsQ+hg@mail.gmail.com>
 <1499853345.23742.8.camel@gmx.de>
 <1499858703.23742.25.camel@gmx.de>
 <CAKb7UvhMzbMKFMFP1UvbrTC0Un4F2u5_mv5VWrkizRxo_AbN4g@mail.gmail.com>
 <1500039368.5763.12.camel@gmx.de>
 <20170714155047.2zs3ps7cmnyvvwgb@hirez.programming.kicks-ass.net>
 <1500047898.5763.25.camel@gmx.de>
 <20170714161027.5htn5jlswvfgphzw@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170714161027.5htn5jlswvfgphzw@hirez.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mike Galbraith <efault@gmx.de>, Ilia Mirkin <imirkin@alum.mit.edu>, LKML <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

+++ Peter Zijlstra [14/07/17 18:10 +0200]:
>On Fri, Jul 14, 2017 at 05:58:18PM +0200, Mike Galbraith wrote:
>> On Fri, 2017-07-14 at 17:50 +0200, Peter Zijlstra wrote:
>
>> > Urgh, is for some mysterious reason the __bug_table section of modules
>> > ending up in RO memory?
>> >
>> > I forever get lost in that link magic :/
>>
>> +1
>>
>> drm.ko
>>  20 __bug_table   00000630  0000000000000000  0000000000000000  0004bff3  2**0
>>                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, DATA
>> vmlinux
>>  15 __bug_table   0000ba84  ffffffff81af26c0  0000000001af26c0  00cf26c0  2**0
>>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>>
>> Danged if I know... um um RELOC business mucks things up?
>
>Argh, it shouldn't be READONLY for vmlinux either, but apparently that
>is working for mysterious reasons.

If I'm not mistaken, this works because __bug_table falls outside of
the RO range as specified in the vmlinux linker script (using x86_64
as the example, that means _text - __end_rodata_hpage_align).
mark_rodata_ro() only sets ro memory protections for pages within this
range, so __bug_table remains rw in memory despite its Elf section
flags. Interestingly enough, my .rodata section is set 'WA' (rw) in
vmlinux on my f25 system, so that leads me to think that Elf section
flags in vmlinux don't seem to matter much when it comes to setting
ro/nx protections..

However, in the module loader it's a different story; we do set page
protections strictly according to the section flags, so since
__bug_table only has SHF_ALLOC set, it assumes it's a readonly section
and gets treated as such. So I would think that Josh's patch would fix
this issue.

Jessica
