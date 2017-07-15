From: Mike Galbraith <efault@gmx.de>
Subject: Re: [regression drm/noveau] suspend to ram -> BOOM: exception RIP:
 drm_calc_vbltimestamp_from_scanoutpos+335
Date: Sat, 15 Jul 2017 04:45:55 +0200
Message-ID: <1500086755.5129.10.camel@gmx.de>
References: <1499796510.5315.27.camel@gmx.de>
         <CAKb7UvgOOzVj=tygh4-BDRXGFUr2Y8U0pkV+-oYjy6EVYsQ+hg@mail.gmail.com>
         <1499853345.23742.8.camel@gmx.de> <1499858703.23742.25.camel@gmx.de>
         <CAKb7UvhMzbMKFMFP1UvbrTC0Un4F2u5_mv5VWrkizRxo_AbN4g@mail.gmail.com>
         <1500039368.5763.12.camel@gmx.de>
         <20170714155047.2zs3ps7cmnyvvwgb@hirez.programming.kicks-ass.net>
         <1500047898.5763.25.camel@gmx.de>
         <20170714161027.5htn5jlswvfgphzw@hirez.programming.kicks-ass.net>
         <1500049981.5248.2.camel@gmx.de> <20170714194248.6n7rw5ln6luhnz3l@treble>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170714194248.6n7rw5ln6luhnz3l@treble>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ilia Mirkin <imirkin@alum.mit.edu>, LKML <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, jeyu@kernel.org
List-Id: nouveau.vger.kernel.org

On Fri, 2017-07-14 at 14:42 -0500, Josh Poimboeuf wrote:
> 
> Does this fix it?

Yup, both READONLY __bug_table and "extra stern" warning are gone.

> diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
> index 39e702d..aa6b202 100644
> --- a/arch/x86/include/asm/bug.h
> +++ b/arch/x86/include/asm/bug.h
> @@ -35,7 +35,7 @@
>  #define _BUG_FLAGS(ins, flags)						\
>  do {									\
>  	asm volatile("1:\t" ins "\n"					\
> -		     ".pushsection __bug_table,\"a\"\n"			\
> +		     ".pushsection __bug_table,\"aw\"\n"		\
>  		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
>  		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
>  		     "\t.word %c1"        "\t# bug_entry::line\n"	\
> @@ -52,7 +52,7 @@ do {									\
>  #define _BUG_FLAGS(ins, flags)						\
>  do {									\
>  	asm volatile("1:\t" ins "\n"					\
> -		     ".pushsection __bug_table,\"a\"\n"			\
> +		     ".pushsection __bug_table,\"aw\"\n"		\
>  		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
>  		     "\t.word %c0"        "\t# bug_entry::flags\n"	\
>  		     "\t.org 2b+%c1\n"					\
