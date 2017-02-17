From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 09/35] x86: Convert remaining uses of pr_warning to
 pr_warn
Date: Fri, 17 Feb 2017 12:17:48 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1702171216040.3536@nanos>
References: <cover.1487314666.git.joe@perches.com> <be5fd9c52a11473a52e317b28cc32d2845def094.1487314667.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <be5fd9c52a11473a52e317b28cc32d2845def094.1487314667.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Ning Sun <ning.sun@intel.com>, Steven Rostedt <rostedt@goodmis.org>, Karol Herbst <karolherbst@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>, Robert Richter <rric@kernel.org>, Len Brown <lenb@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, tboot-devel@lists.sourceforge.net, nouveau@lists.freedesktop.org, oprofile-list@lists.sf.net, sfi-devel@simplefirmware.org, xen-devel@lists.xenproject.org
List-Id: nouveau.vger.kernel.org

On Thu, 16 Feb 2017, Joe Perches wrote:

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

Acked-by: Thomas Gleixner <tglx@linutronix.de>
