From: David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Resource map sanity check fails after GRUB "keeps"
 the gfx mode
Date: Thu, 3 Oct 2013 00:19:56 +0200
Message-ID: <CANq1E4TxPg5ZM6WxDZiqi_ZFsY-qqhh8C56aBgSDVKzqt0m2pg@mail.gmail.com>
References: <20130925200706.2e6f5947@IRBT4585>
	<20130926183743.0d2420c4@IRBT4585> <524550E6.6040909@gmail.com>
	<20130927113743.1383f9b5@IRBT4585>
	<CANq1E4STGCp8X+i-OOd1KYCZQEoUeYuEw8=tkWuXY8_8wcieuw@mail.gmail.com>
	<20130927154031.khkhbl17s0ow4sgc-cebfxv@webmail.spamcop.net>
	<CANq1E4T6Wa5ReKqBd=-3fDKGs8frMCQ5RQxAOM19C4dnwL_sOA@mail.gmail.com>
	<20131002174652.5907a2d0@IRBT4585>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20131002174652.5907a2d0@IRBT4585>
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

On Wed, Oct 2, 2013 at 11:46 PM, Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org> wrote:
> On Wed, 2 Oct 2013 16:47:29 +0200
> David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> Thanks for your investigations. I finally sent my patch and put you on
>> CC. Sorry for the delay, but I have mostly catched up with all emails
>> now.
>>
>> This really just suppresses the warning and nothing else.
>
> Thank you for your detailed explanation in the patch.
>
>> It does not
>> fix any lockup/crash/...
>
> I know.  I was surprised that my patch fixed something else, but now we
> know that it didn't.  It's better when patches don't have unexpected
> effects even if the effects are positive :)

Indeed. And I appreciate your help a lot.

>> And your PCI-BAR adjustment doesn't change
>> anything either, sorry.
>
> I simply tried another approach to pacify the resource checker.
>
> However, there is some difference.  nvidiafb cannot access the
> resources if IORESOURCE_BUSY is used.

Are you sure this is related to IORESOURCE_BUSY? Or is it related to
CONFIG_X86_SYSFB?

Thanks
David

> It's not that it matters for me.  nvidiafb fails on my hardware anyway
> and I don't need it when I already have simplefb and nouveau.  But I
> think we should have a closer look why it fails and what other drivers
> may fail.
>
> --
> Regards,
> Pavel Roskin
