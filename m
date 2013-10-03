From: David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Resource map sanity check fails after GRUB "keeps"
 the gfx mode
Date: Fri, 4 Oct 2013 01:08:34 +0200
Message-ID: <CANq1E4Sib6+Z4H3B-DnsB_Eqk4X7ni2Ttj6AgW9gBKcaBf=z6w@mail.gmail.com>
References: <20130925200706.2e6f5947@IRBT4585>
	<20130926183743.0d2420c4@IRBT4585> <524550E6.6040909@gmail.com>
	<20130927113743.1383f9b5@IRBT4585>
	<CANq1E4STGCp8X+i-OOd1KYCZQEoUeYuEw8=tkWuXY8_8wcieuw@mail.gmail.com>
	<20130927154031.khkhbl17s0ow4sgc-cebfxv@webmail.spamcop.net>
	<CANq1E4T6Wa5ReKqBd=-3fDKGs8frMCQ5RQxAOM19C4dnwL_sOA@mail.gmail.com>
	<20131002174652.5907a2d0@IRBT4585>
	<CANq1E4TxPg5ZM6WxDZiqi_ZFsY-qqhh8C56aBgSDVKzqt0m2pg@mail.gmail.com>
	<20131003181049.5cf83c9a@IRBT4585>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20131003181049.5cf83c9a@IRBT4585>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi Pavel

On Fri, Oct 4, 2013 at 12:10 AM, Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org> wrote:
> Hi David,
>
> On Thu, 3 Oct 2013 00:19:56 +0200
> David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> >> And your PCI-BAR adjustment doesn't change
>> >> anything either, sorry.
>> >
>> > I simply tried another approach to pacify the resource checker.
>> >
>> > However, there is some difference.  nvidiafb cannot access the
>> > resources if IORESOURCE_BUSY is used.
>>
>> Are you sure this is related to IORESOURCE_BUSY? Or is it related to
>> CONFIG_X86_SYSFB?
>
> CONFIG_X86_SYSFB is always defined.  I doubt an x86 kernel would
> compile without it.  create_simplefb() is used in
> arch/x86/kernel/sysfb.c that is compiled unconditionally and that
> function is defined in arch/x86/kernel/sysfb_simplefb.c that is only
> compiled if CONFIG_X86_SYSFB is defined.

You can set CONFIG_X86_SYSFB=n and everything works fine. It's the
default and is what pre-3.12 kernels always did.

> I tried four combinations: with and without IORESOURCE_BUSY and with
> and without the PCI resource adjustment.  The only combination when
> nvidiafb probes the hardware is when IORESOURCE_BUSY is not used and
> the BOOTFP resource is adjusted to match the PCI BAR.

A dmesg log would be nice, but I assume nvidiafb fails because it
cannot map its BAR regions?

> It means that your patch by itself won't prevent nvidiafb from getting
> the resource on my hardware (ThinkPad W530).  However, if the BOOTFP
> resource matches the PCI BAR for the video card, adding IORESOURCE_BUSY
> might prevent some framebuffer drivers from accessing the resource.

Meh! I now understand the problem:
The resource.c resource-management allows creating sub-regions of
existing regions. However, a sub-region must always be a real child of
its parent, it cannot span multiple parents. Therefore, if we create
the simplefb region before the pci BAR is mapped, we need your patches
to bump the simplefb region to at least the size of the respective PCI
region. Otherwise, nvidia tries allocating a sub-region that spans
wider than the simplefb region and thus failing.

On the other hand, sub-mappings of BUSY regions are _never_ allowed. A
BUSY region gives exclusive access to the holder of the region. But
dropping BUSY from the simplefb region is wrong. We have to mark the
system-framebuffer as BUSY, otherwise we might end up with a corrupted
framebuffer after loading other real hw drivers.

In other words: The fact that we used to not reserve
platform-framebuffer regions before 3.12 trips us now because it is
actually _wrong_ to load real hw drivers like nvidiafb while the
platform-framebuffer is still available. So the failure we get now
just tells us that nvidiafb and friends do horrible things.

TL;DR
To fix this, we want real hardware drivers to remove
platform-framebuffer devices and release their resources before
acquiring them again. I recommend CONFIG_X86_SYSFB=n for anyone seeing
these issues. For 3.13 I will try to fix the framebuffer-handover.
Fortunately, no real DRM drivers actually request pci regions (why
would they? pci-probing already guarantees exclusive access) and the
platform-FB drivers have already been converted. So this bug can only
be triggered with legacy hw-fbdev drivers (a simple search for
pci_request_regions in ./drivers/video/ shows them).

> This complexity doesn't seem right.  I think specific drivers should
> trump generic once and DRI drivers should trump non-DRI.  It shouldn't
> matter whether the BOOTFP area from screen_info coincides with the PCI
> BAR or occupies a part of it.

I will try to write a patch as part of the SimpleDRM series which
allows removing platform-framebuffer devices. We simply do this during
framebuffer probing and we should be fine.

Thanks
David
