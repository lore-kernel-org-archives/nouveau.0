From: Adan Hawthorn <adanhawthorn@gmail.com>
Subject: Re: [PATCH 09/35] x86: Convert remaining uses of pr_warning to pr_warn
Date: Mon, 20 Feb 2017 20:12:38 -0500
Message-ID: <CADRb1HaywV+O0nM7g1b35xo=89jWj7z0AO-mAg3fU24WPmpz+A@mail.gmail.com>
References: <cover.1487314666.git.joe@perches.com> <be5fd9c52a11473a52e317b28cc32d2845def094.1487314667.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <be5fd9c52a11473a52e317b28cc32d2845def094.1487314667.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Ning Sun <ning.sun@intel.com>, Steven Rostedt <rostedt@goodmis.org>, Karol Herbst <karolherbst@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>, Robert Richter <rric@kernel.org>, Len Brown <lenb@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, tboot-devel@lists.sourceforge.net, nouveau@lists.freedesktop.org, oprofile-list@lists.sf.net, sfi-devel@simplefirmware.org, xen-devel@lists.xenproject.org
List-Id: nouveau.vger.kernel.org

On Fri, Feb 17, 2017 at 2:11 AM, Joe Perches <joe@perches.com> wrote:
> To enable eventual removal of pr_warning
>
> This makes pr_warn use consistent for arch/x86
>
> Prior to this patch, there were 46 uses of pr_warning and
> 122 uses of pr_warn in arch/x86
>
> Miscellanea:
>
> o Coalesce a few formats and realign arguments
> o Convert a couple of multiple line printks to single line
>
> Signed-off-by: Joe Perches <joe@perches.com>

...

> diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
> index 4261b3282ad9..37e9129da8b3 100644
> --- a/arch/x86/kernel/apic/apic.c
> +++ b/arch/x86/kernel/apic/apic.c

...

> @@ -1503,11 +1503,11 @@ static int __init setup_nox2apic(char *str)
>                 int apicid = native_apic_msr_read(APIC_ID);
>
>                 if (apicid >= 255) {
> -                       pr_warning("Apicid: %08x, cannot enforce nox2apic\n",
> -                                  apicid);
> +                       pr_warn("Apicid: %08x, cannot enforce nox2apic\n",
> +                               apicid);
>                         return 0;
>                 }
> -               pr_warning("x2apic already enabled.\n");
> +               pr_warn("x2apic already enabled\n");
>                 __x2apic_disable();
>         }
>         setup_clear_cpu_cap(X86_FEATURE_X2APIC);

...

> diff --git a/arch/x86/mm/kmmio.c b/arch/x86/mm/kmmio.c
> index afc47f5c9531..ad70518cdcc7 100644
> --- a/arch/x86/mm/kmmio.c
> +++ b/arch/x86/mm/kmmio.c
>         WARN_ONCE(ret < 0, KERN_ERR pr_fmt("arming at 0x%08lx failed.\n"),
> @@ -335,8 +335,8 @@ static int post_kmmio_handler(unsigned long condition, struct pt_regs *regs)
>                  * something external causing them (f.e. using a debugger while
>                  * mmio tracing enabled), or erroneous behaviour
>                  */
> -               pr_warning("unexpected debug trap on CPU %d.\n",
> -                          smp_processor_id());
> +               pr_warn("unexpected debug trap on CPU %d\n",
> +                       smp_processor_id());
>                 goto out;
>         }
>

As just a few examples from the full diff: would not the double line
pr_warn's (above) read better if coalesced each on one line?
