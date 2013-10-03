From: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>
Subject: Re: Resource map sanity check fails after GRUB "keeps"
 the gfx mode
Date: Thu, 3 Oct 2013 18:10:49 -0400
Message-ID: <20131003181049.5cf83c9a@IRBT4585>
References: <20130925200706.2e6f5947@IRBT4585>
	<20130926183743.0d2420c4@IRBT4585> <524550E6.6040909@gmail.com>
	<20130927113743.1383f9b5@IRBT4585>
	<CANq1E4STGCp8X+i-OOd1KYCZQEoUeYuEw8=tkWuXY8_8wcieuw@mail.gmail.com>
	<20130927154031.khkhbl17s0ow4sgc-cebfxv@webmail.spamcop.net>
	<CANq1E4T6Wa5ReKqBd=-3fDKGs8frMCQ5RQxAOM19C4dnwL_sOA@mail.gmail.com>
	<20131002174652.5907a2d0@IRBT4585>
	<CANq1E4TxPg5ZM6WxDZiqi_ZFsY-qqhh8C56aBgSDVKzqt0m2pg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CANq1E4TxPg5ZM6WxDZiqi_ZFsY-qqhh8C56aBgSDVKzqt0m2pg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi David,

On Thu, 3 Oct 2013 00:19:56 +0200
David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> >> And your PCI-BAR adjustment doesn't change
> >> anything either, sorry.
> >
> > I simply tried another approach to pacify the resource checker.
> >
> > However, there is some difference.  nvidiafb cannot access the
> > resources if IORESOURCE_BUSY is used.
> 
> Are you sure this is related to IORESOURCE_BUSY? Or is it related to
> CONFIG_X86_SYSFB?

CONFIG_X86_SYSFB is always defined.  I doubt an x86 kernel would
compile without it.  create_simplefb() is used in
arch/x86/kernel/sysfb.c that is compiled unconditionally and that
function is defined in arch/x86/kernel/sysfb_simplefb.c that is only
compiled if CONFIG_X86_SYSFB is defined.

I tried four combinations: with and without IORESOURCE_BUSY and with
and without the PCI resource adjustment.  The only combination when
nvidiafb probes the hardware is when IORESOURCE_BUSY is not used and
the BOOTFP resource is adjusted to match the PCI BAR.

It means that your patch by itself won't prevent nvidiafb from getting
the resource on my hardware (ThinkPad W530).  However, if the BOOTFP
resource matches the PCI BAR for the video card, adding IORESOURCE_BUSY
might prevent some framebuffer drivers from accessing the resource.

This complexity doesn't seem right.  I think specific drivers should
trump generic once and DRI drivers should trump non-DRI.  It shouldn't
matter whether the BOOTFP area from screen_info coincides with the PCI
BAR or occupies a part of it.

-- 
Regards,
Pavel Roskin
