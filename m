From: Ondrej Zary <linux-82g5Cmo2vi4@public.gmane.org>
Subject: Re: nouveau broken on Riva TNT2 in 5.9.0-rc8: GPU not
 supported on big-endian
Date: Sat, 10 Oct 2020 10:49:37 +0200
Message-ID: <202010101049.37663.linux@zary.sk>
References: <202010092326.20482.linux@zary.sk>
 <CACO55tuj_=PUYuBnJLZgCEize_8Po0VnuDVPtkHLEZxL3RgF7Q@mail.gmail.com>
 <CAKb7UvggVn2c=jUNSfjf6r529n89xfNgVBpn3jnXznVh8Gs4+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvggVn2c=jUNSfjf6r529n89xfNgVBpn3jnXznVh8Gs4+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Saturday 10 October 2020 00:23:38 Ilia Mirkin wrote:
> On Fri, Oct 9, 2020 at 5:54 PM Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> >
> > On Fri, Oct 9, 2020 at 11:35 PM Ondrej Zary <linux-82g5Cmo2vi4@public.gmane.org> wrote:
> > >
> > > Hello,
> > > I'm testing 5.9.0-rc8 and found that Riva TNT2 stopped working:
> > > [    0.000000] Linux version 5.9.0-rc8+ (zary@gsql) (gcc (Debian 8.3.0-6) 8.3.0, GNU ld (GNU Binutils for Debian) 2.31.1) #326 SMP Fri Oct 9 22:31:40 CEST 2020
> > > ...
> > > [   14.771464] nouveau 0000:01:00.0: GPU not supported on big-endian
> > > [   14.771782] nouveau: probe of 0000:01:00.0 failed with error -38
> > >
> > > big-endian? WTF? The machine is x86.
> > >
> >
> > mhh, we reworked the endianess checks a bit and apparently that broke
> > something... I will give it some thoughts, but could you be so kind
> > and create an mmiotrace under 5.9 with nouveau? You won't need to
> > start X or anything while doing it. Just enable the trace and modprobe
> > nouveau and collect the trace.
> 
> Looks like nvkm_device_endianness unconditionally reads out 0x4. I
> don't think that reg is there pre-NV11. At least NV4, NV5, NV10 and
> maybe NV15 (which is logically pre-NV11) don't support big-endian
> mode. Not sure about NV1A, which was the IGP of the series and IIRC
> logically pre-NV11 as well (but clearly could only be used with x86
> chips, since it was part of the motherboard).

Yes, you're right. Forcing nvkm_device_endianness to return true allows
5.9.0-rc8 to work:
[    0.000000] Linux version 5.9.0-rc8+ (zary@gsql) (gcc (Debian 8.3.0-6) 8.3.0, GNU ld (GNU Binutils for Debian) 2.31.1) #326 SMP Fri Oct 9 22:31:40 CEST 2020
...
[   12.311258] nouveau 0000:01:00.0: bios: DCB table not found
[   12.311583] nouveau 0000:01:00.0: bios: DCB table not found
[   12.311834] nouveau 0000:01:00.0: bios: DCB table not found
[   12.311847] nouveau 0000:01:00.0: bios: DCB table not found
[   12.311989] agpgart-intel 0000:00:00.0: AGP 3.0 bridge
[   12.312017] agpgart-intel 0000:00:00.0: bridge is in legacy mode, falling back to 2.x
[   12.312031] agpgart-intel 0000:00:00.0: putting AGP V2 device into 4x mode
[   12.312066] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
[   12.312162] agpgart-intel 0000:00:00.0: AGP 3.0 bridge
[   12.312182] agpgart-intel 0000:00:00.0: bridge is in legacy mode, falling back to 2.x
[   12.312195] agpgart-intel 0000:00:00.0: putting AGP V2 device into 4x mode
[   12.312230] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
[   12.312247] nouveau 0000:01:00.0: tmr: unknown input clock freq
[   12.318341] nouveau 0000:01:00.0: fb: 32 MiB SDRAM
[   12.333376] [TTM] Zone  kernel: Available graphics memory: 385048 KiB
[   12.333392] [TTM] Initializing pool allocator
[   12.333434] nouveau 0000:01:00.0: DRM: VRAM: 31 MiB
[   12.333443] nouveau 0000:01:00.0: DRM: GART: 128 MiB
[   12.333453] nouveau 0000:01:00.0: DRM: BMP version 5.6
[   12.333460] nouveau 0000:01:00.0: DRM: No DCB data found in VBIOS
[   12.335355] nouveau 0000:01:00.0: DRM: MM: using M2MF for buffer copies
[   12.335443] nouveau 0000:01:00.0: bios: DCB table not found
[   12.336033] nouveau 0000:01:00.0: DRM: Saving VGA fonts
[   12.376420] nouveau 0000:01:00.0: DRM: No DCB data found in VBIOS
[   12.410397] nouveau 0000:01:00.0: DRM: allocated 1280x1024 fb: 0x4000, bo b68d2ac4
[   12.441217] fbcon: nouveaudrmfb (fb0) is primary device
[   12.591964] Console: switching to colour frame buffer device 160x64
[   12.593876] nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame buffer device
[   12.594944] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0

BTW. 5.8 kernel (that appeared today in Debian packports) is broken the same way.

> Aha, it's documented in rnndb:
> 
> https://github.com/envytools/envytools/blob/master/rnndb/bus/pmc.xml
> <reg32 offset="0x004" name="ENDIAN" variants="NV1A-"/>
> 
>   -ilia
> 


-- 
Ondrej Zary
