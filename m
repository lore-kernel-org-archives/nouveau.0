From: David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Resource map sanity check fails after GRUB "keeps"
 the gfx mode
Date: Wed, 18 Dec 2013 15:14:33 +0100
Message-ID: <CANq1E4Sh7_+REtafq-=D8qhdh7ToQAJBxK97r7boXLWQTDx6Zg@mail.gmail.com>
References: <20130925200706.2e6f5947@IRBT4585>
	<20130926183743.0d2420c4@IRBT4585> <524550E6.6040909@gmail.com>
	<20130927113743.1383f9b5@IRBT4585>
	<CANq1E4STGCp8X+i-OOd1KYCZQEoUeYuEw8=tkWuXY8_8wcieuw@mail.gmail.com>
	<20130927154031.khkhbl17s0ow4sgc-cebfxv@webmail.spamcop.net>
	<CANq1E4T6Wa5ReKqBd=-3fDKGs8frMCQ5RQxAOM19C4dnwL_sOA@mail.gmail.com>
	<20131002174652.5907a2d0@IRBT4585>
	<CANq1E4TxPg5ZM6WxDZiqi_ZFsY-qqhh8C56aBgSDVKzqt0m2pg@mail.gmail.com>
	<20131003181049.5cf83c9a@IRBT4585>
	<CANq1E4Sib6+Z4H3B-DnsB_Eqk4X7ni2Ttj6AgW9gBKcaBf=z6w@mail.gmail.com>
	<20131004181154.67e5d9c2@IRBT4585>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20131004181154.67e5d9c2@IRBT4585>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi Pavel

On Sat, Oct 5, 2013 at 12:11 AM, Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org> wrote:
> On Fri, 4 Oct 2013 01:08:34 +0200
> David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> > CONFIG_X86_SYSFB is always defined.  I doubt an x86 kernel would
>> > compile without it.  create_simplefb() is used in
>> > arch/x86/kernel/sysfb.c that is compiled unconditionally and that
>> > function is defined in arch/x86/kernel/sysfb_simplefb.c that is only
>> > compiled if CONFIG_X86_SYSFB is defined.
>>
>> You can set CONFIG_X86_SYSFB=n and everything works fine. It's the
>> default and is what pre-3.12 kernels always did.
>
> Of course, you are right, I missed sysfb.h.
>
>> > I tried four combinations: with and without IORESOURCE_BUSY and with
>> > and without the PCI resource adjustment.  The only combination when
>> > nvidiafb probes the hardware is when IORESOURCE_BUSY is not used and
>> > the BOOTFP resource is adjusted to match the PCI BAR.
>>
>> A dmesg log would be nice, but I assume nvidiafb fails because it
>> cannot map its BAR regions?
>
> The logs are adjusted and so it the kernel config file.
>
> $ grep nvidiafb *
> dm-busy-adjust:nvidiafb_setup START
> dm-busy-adjust:nvidiafb_probe START
> dm-busy-adjust:nvidiafb 0000:01:00.0: BAR 3: can't reserve [mem
> 0xf0000000-0xf1ffffff 64bit pref] dm-busy-adjust:nvidiafb: cannot
> request PCI regions dm-busy-noadjust:nvidiafb_setup START
> dm-busy-noadjust:nvidiafb_probe START
> dm-busy-noadjust:nvidiafb 0000:01:00.0: BAR 3: can't reserve [mem
> 0xf0000000-0xf1ffffff 64bit pref] dm-busy-noadjust:nvidiafb: cannot
> request PCI regions dm-nobusy-adjust:nvidiafb_setup START
> dm-nobusy-adjust:nvidiafb_probe START
> dm-nobusy-adjust:nvidiafb: Device ID: 10de0ffc
> dm-nobusy-adjust:nvidiafb: unknown NV_ARCH
> dm-nobusy-noadjust:nvidiafb_setup START
> dm-nobusy-noadjust:nvidiafb_probe START
> dm-nobusy-noadjust:nvidiafb 0000:01:00.0: BAR 3: can't reserve [mem
> 0xf0000000-0xf1ffffff 64bit pref] dm-nobusy-noadjust:nvidiafb: cannot
> request PCI regions
>
> The error comes from pci_request_regions() called in
> drivers/video/nvidia/nvidia.c
>
>> > It means that your patch by itself won't prevent nvidiafb from
>> > getting the resource on my hardware (ThinkPad W530).  However, if
>> > the BOOTFP resource matches the PCI BAR for the video card, adding
>> > IORESOURCE_BUSY might prevent some framebuffer drivers from
>> > accessing the resource.
>>
>> Meh! I now understand the problem:
>
> Great!
>
>> In other words: The fact that we used to not reserve
>> platform-framebuffer regions before 3.12 trips us now because it is
>> actually _wrong_ to load real hw drivers like nvidiafb while the
>> platform-framebuffer is still available. So the failure we get now
>> just tells us that nvidiafb and friends do horrible things.
>
> I actually hoped to hear from you something like that.  It's good to
> have limitations if they are well understood and not arbitrary.
>
>> Fortunately, no real DRM drivers actually request pci regions (why
>> would they? pci-probing already guarantees exclusive access) and the
>> platform-FB drivers have already been converted. So this bug can only
>> be triggered with legacy hw-fbdev drivers (a simple search for
>> pci_request_regions in ./drivers/video/ shows them).
>
> It's very reassuring.  Your work is greatly appreciated!

2 months late, but there's a patch pending on LKML:
http://thread.gmane.org/gmane.linux.kernel/1616367/focus=1616583

This should fix your issues as it removes simple-framebuffer devices
on remove_conflicting_framebuffers() now.

Thanks
David
