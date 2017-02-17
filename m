From: Robert Richter <rric@kernel.org>
Subject: Re: [PATCH 09/35] x86: Convert remaining uses of pr_warning to
 pr_warn
Date: Fri, 17 Feb 2017 15:07:23 +0100
Message-ID: <20170217140723.GJ4906@rric.localdomain>
References: <cover.1487314666.git.joe@perches.com>
 <be5fd9c52a11473a52e317b28cc32d2845def094.1487314667.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <be5fd9c52a11473a52e317b28cc32d2845def094.1487314667.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Ning Sun <ning.sun@intel.com>, Steven Rostedt <rostedt@goodmis.org>, Karol Herbst <karolherbst@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>, Len Brown <lenb@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, tboot-devel@lists.sourceforge.net, nouveau@lists.freedesktop.org, oprofile-list@lists.sf.net, sfi-devel@simplefirmware.org, xen-devel@lists.xenproject.org
List-Id: nouveau.vger.kernel.org

On 16.02.17 23:11:22, Joe Perches wrote:
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
> ---
>  arch/x86/kernel/amd_gart_64.c          | 12 +++------
>  arch/x86/kernel/apic/apic.c            | 46 ++++++++++++++++------------------
>  arch/x86/kernel/apic/apic_noop.c       |  2 +-
>  arch/x86/kernel/setup_percpu.c         |  4 +--
>  arch/x86/kernel/tboot.c                | 15 ++++++-----
>  arch/x86/kernel/tsc_sync.c             |  8 +++---
>  arch/x86/mm/kmmio.c                    |  8 +++---
>  arch/x86/mm/mmio-mod.c                 |  5 ++--
>  arch/x86/mm/numa.c                     | 12 ++++-----
>  arch/x86/mm/numa_emulation.c           |  6 ++---
>  arch/x86/mm/testmmiotrace.c            |  5 ++--
>  arch/x86/oprofile/op_x86_model.h       |  6 ++---

For oprofile:

Acked-by: Robert Richter <rric@kernel.org>

>  arch/x86/platform/olpc/olpc-xo15-sci.c |  2 +-
>  arch/x86/platform/sfi/sfi.c            |  3 +--
>  arch/x86/xen/debugfs.c                 |  2 +-
>  arch/x86/xen/setup.c                   |  2 +-
>  16 files changed, 63 insertions(+), 75 deletions(-)
