From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Resource map sanity check fails after GRUB "keeps"
 the gfx mode
Date: Fri, 27 Sep 2013 10:33:26 +0100
Message-ID: <524550E6.6040909@gmail.com>
References: <20130925200706.2e6f5947@IRBT4585>
	<20130926183743.0d2420c4@IRBT4585>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20130926183743.0d2420c4@IRBT4585>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 26/09/13 23:37, Pavel Roskin wrote:
> Hello!
> 
> I have spent some time on the issue.  I'm not sure it's a nouveau bug.
> I have a fix that changes arch/x86/kernel/sysfb_simplefb.c only.
> 
> GRUB actually uses graphic mode on my card.  That mode is supported by
> simplefb.  However, the resource conflict happens regardless of whether
> simplefb is enabled.  It's sysfb_simplefb that causes it, a completely
> different driver.
> 
> If GRUB keeps the graphic mode, I have this entry in /proc/iomem:
> 
>       f1000000-f112bfff : BOOTFB
> 
> It is reserved by sysfb_simplefb.  Nouveau tries to map an area at
> 0xf0000000-0xf1ffffff, so it includes the existing resource without
> being equivalent to it.
> 
> Nouveau correctly calls remove_conflicting_framebuffers() before trying
> to map that resource.  However, sysfb_simplefb is not a real
> framebuffer, so it doesn't free its resources.
> 
> iomem_map_sanity_check() doesn't check regions with IORESOURCE_BUSY
> set.  That's the comment from the code:
> 
>     /*
>      * if a resource is "BUSY", it's not a hardware resource
>      * but a driver mapping of such a resource; we don't want
>      * to warn for those; some drivers legitimately map only
>      * partial hardware resources. (example: vesafb)
>      */
> 
> So I added IORESOURCE_BUSY to sysfb_simplefb.c and the problem is fixed
> now.  Actually, it prevents nvidiafb from claiming the device:
> 
> nvidiafb 0000:01:00.0: BAR 3: can't reserve [mem 0xf0000000-0xf1ffffff
> 64bit pref]
> 
> But maybe that's the point of sysfb_simplefb?  Anyway, here's the
> patch/hack, signed off in case it's correct :)
> 
> 
FWIW another nvc0 user is experiencing the same/similar issue and the
patch seems to resolve the problem in his case.

https://bugs.freedesktop.org/show_bug.cgi?id=69488

Thanks Pavel :)


Cheers
Emil
