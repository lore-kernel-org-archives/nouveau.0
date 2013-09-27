From: David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Resource map sanity check fails after GRUB "keeps"
 the gfx mode
Date: Fri, 27 Sep 2013 20:08:14 +0200
Message-ID: <CANq1E4STGCp8X+i-OOd1KYCZQEoUeYuEw8=tkWuXY8_8wcieuw@mail.gmail.com>
References: <20130925200706.2e6f5947@IRBT4585>
	<20130926183743.0d2420c4@IRBT4585> <524550E6.6040909@gmail.com>
	<20130927113743.1383f9b5@IRBT4585>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20130927113743.1383f9b5@IRBT4585>
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

Hi

On Fri, Sep 27, 2013 at 5:37 PM, Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org> wrote:
> On Fri, 27 Sep 2013 10:33:26 +0100
> Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> FWIW another nvc0 user is experiencing the same/similar issue and the
>> patch seems to resolve the problem in his case.
>>
>> https://bugs.freedesktop.org/show_bug.cgi?id=69488
>
> Good to hear that my patch actually makes more than cosmetic difference
> for somebody.  My system doesn't hang even with the stack trace.

I am aware of this and there is already a fix pending from 2 weeks
ago. Unfortunately, I have been in the US for the last 2 weeks and
haven't really been able to push on that. Anyhow, it should really be
just a cosmetic issue. We need to mark the sysfb FB as busy to avoid
the nasty warnings. Other than that, this shouldn't cause any issues.

Thanks
David

> I posted another patch on the bug page.  It widens the BOOTFB resource
> to match the PCI BAR instead of making it busy. With the new patch,
> nvidiafb doesn't report that the resource is busy, it reports
> unsupported hardware, which is true.
>
> Old patch:
> nvidiafb 0000:01:00.0: BAR 3: can't reserve [mem 0xf0000000-0xf1ffffff
> 64bit pref]
> nvidiafb: cannot request PCI regions
>
> New patch:
> nvidiafb: Device ID: 10de0ffc
> nvidiafb: unknown NV_ARCH
>
> I'll send the patch to x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, it's clearly not an nvidia issue.
>
> --
> Regards,
> Pavel Roskin
