From: Ondrej Zary <linux-82g5Cmo2vi4@public.gmane.org>
Subject: Re: nouveau broken on Riva TNT2 in 5.9.0-rc8: GPU not
 supported on big-endian
Date: Wed, 28 Oct 2020 21:15:32 +0100
Message-ID: <202010282115.32811.linux@zary.sk>
References: <202010092326.20482.linux@zary.sk>
 <CAKb7UvggVn2c=jUNSfjf6r529n89xfNgVBpn3jnXznVh8Gs4+w@mail.gmail.com>
 <CACO55tuAxbcXbC9zrT5rs34s=5uBugkbcikORU5868ka9bHdkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACO55tuAxbcXbC9zrT5rs34s=5uBugkbcikORU5868ka9bHdkw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Saturday 10 October 2020 02:02:42 Karol Herbst wrote:
> On Sat, Oct 10, 2020 at 12:23 AM Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> >
> > On Fri, Oct 9, 2020 at 5:54 PM Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > >
> > > On Fri, Oct 9, 2020 at 11:35 PM Ondrej Zary <linux-82g5Cmo2vi4@public.gmane.org> wrote:
> > > >
> > > > Hello,
> > > > I'm testing 5.9.0-rc8 and found that Riva TNT2 stopped working:
> > > > [    0.000000] Linux version 5.9.0-rc8+ (zary@gsql) (gcc (Debian 8.3.0-6) 8.3.0, GNU ld (GNU Binutils for Debian) 2.31.1) #326 SMP Fri Oct 9 22:31:40 CEST 2020
> > > > ...
> > > > [   14.771464] nouveau 0000:01:00.0: GPU not supported on big-endian
> > > > [   14.771782] nouveau: probe of 0000:01:00.0 failed with error -38
> > > >
> > > > big-endian? WTF? The machine is x86.
> > > >
> > >
> > > mhh, we reworked the endianess checks a bit and apparently that broke
> > > something... I will give it some thoughts, but could you be so kind
> > > and create an mmiotrace under 5.9 with nouveau? You won't need to
> > > start X or anything while doing it. Just enable the trace and modprobe
> > > nouveau and collect the trace.
> >
> > Looks like nvkm_device_endianness unconditionally reads out 0x4. I
> > don't think that reg is there pre-NV11. At least NV4, NV5, NV10 and
> > maybe NV15 (which is logically pre-NV11) don't support big-endian
> > mode. Not sure about NV1A, which was the IGP of the series and IIRC
> > logically pre-NV11 as well (but clearly could only be used with x86
> > chips, since it was part of the motherboard).
> >
> > Aha, it's documented in rnndb:
> >
> > https://github.com/envytools/envytools/blob/master/rnndb/bus/pmc.xml
> > <reg32 offset="0x004" name="ENDIAN" variants="NV1A-"/>
> >
> 
> ohh, I should have checked there.. yeah, will write a fix for it then.
> Before my patch we just always tried to switch it, but never threw an
> error.

Any progress with the patch?

-- 
Ondrej Zary
