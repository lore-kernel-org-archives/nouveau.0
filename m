From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] nouveau broken on Riva TNT2 in 5.9.0-rc8: GPU not
 supported on big-endian
Date: Fri, 9 Oct 2020 18:23:38 -0400
Message-ID: <CAKb7UvggVn2c=jUNSfjf6r529n89xfNgVBpn3jnXznVh8Gs4+w@mail.gmail.com>
References: <202010092326.20482.linux@zary.sk> <CACO55tuj_=PUYuBnJLZgCEize_8Po0VnuDVPtkHLEZxL3RgF7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACO55tuj_=PUYuBnJLZgCEize_8Po0VnuDVPtkHLEZxL3RgF7Q@mail.gmail.com>
To: Karol Herbst <kherbst@redhat.com>
Cc: Ondrej Zary <linux@zary.sk>, nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Fri, Oct 9, 2020 at 5:54 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Fri, Oct 9, 2020 at 11:35 PM Ondrej Zary <linux@zary.sk> wrote:
> >
> > Hello,
> > I'm testing 5.9.0-rc8 and found that Riva TNT2 stopped working:
> > [    0.000000] Linux version 5.9.0-rc8+ (zary@gsql) (gcc (Debian 8.3.0-6) 8.3.0, GNU ld (GNU Binutils for Debian) 2.31.1) #326 SMP Fri Oct 9 22:31:40 CEST 2020
> > ...
> > [   14.771464] nouveau 0000:01:00.0: GPU not supported on big-endian
> > [   14.771782] nouveau: probe of 0000:01:00.0 failed with error -38
> >
> > big-endian? WTF? The machine is x86.
> >
>
> mhh, we reworked the endianess checks a bit and apparently that broke
> something... I will give it some thoughts, but could you be so kind
> and create an mmiotrace under 5.9 with nouveau? You won't need to
> start X or anything while doing it. Just enable the trace and modprobe
> nouveau and collect the trace.

Looks like nvkm_device_endianness unconditionally reads out 0x4. I
don't think that reg is there pre-NV11. At least NV4, NV5, NV10 and
maybe NV15 (which is logically pre-NV11) don't support big-endian
mode. Not sure about NV1A, which was the IGP of the series and IIRC
logically pre-NV11 as well (but clearly could only be used with x86
chips, since it was part of the motherboard).

Aha, it's documented in rnndb:

https://github.com/envytools/envytools/blob/master/rnndb/bus/pmc.xml
<reg32 offset="0x004" name="ENDIAN" variants="NV1A-"/>

  -ilia
