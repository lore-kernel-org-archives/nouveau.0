From: Meelis Roos <mroos@linux.ee>
Subject: Re: [Nouveau] 4.16-rc1: UBSAN warning in nouveau/nvkm/subdev/therm/base.c
 + oops in nvkm_therm_clkgate_fini
Date: Wed, 14 Feb 2018 22:59:37 +0200 (EET)
Message-ID: <alpine.LRH.2.21.1802142258370.25362@math.ut.ee>
References: <alpine.LRH.2.21.1802132200260.24929@math.ut.ee>  <alpine.LRH.2.21.1802141628110.25362@math.ut.ee>  <CAKb7Uvj3MKGzNNcrc=-JA5GN4jt9+TU7ZjWDZpccmYJLDo76WQ@mail.gmail.com>  <CAKb7UvhRt=25J5aOUZusdE51hh1JVc45aQ8OhCVeOJwzYvLOJw@mail.gmail.com>
 <20180214174125.b5bdowaadck3vf5n@pmoreau.org> <1518635464.3674.2.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518635464.3674.2.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: Pierre Moreau <pmoreau@pmoreau.org>, Ilia Mirkin <imirkin@alum.mit.edu>, nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>, Linux Kernel list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

> Actually this was brought up to me already, there's a fix on the mailing list
> for this I reviewed a little while ago from nvidia that we should pull in:
> 
> https://patchwork.freedesktop.org/patch/203205/
> 
> Would you guys mind confirming that this patch fixes your issues?

It works on my amd64, P4 is still compiling.

[    1.124987] nouveau 0000:04:05.0: NVIDIA NV05 (20154000)
[    1.161464] nouveau 0000:04:05.0: bios: version 03.05.00.10.00
[    1.161475] nouveau 0000:04:05.0: bios: DCB table not found
[    1.161535] nouveau 0000:04:05.0: bios: DCB table not found
[    1.161577] nouveau 0000:04:05.0: bios: DCB table not found
[    1.161586] nouveau 0000:04:05.0: bios: DCB table not found
[    1.344008] tsc: Refined TSC clocksource calibration: 2200.078 MHz
[    1.344024] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x1fb67c69f81, max_idle_ns: 440795210317 ns
[    1.344037] clocksource: Switched to clocksource tsc
[    1.408102] nouveau 0000:04:05.0: tmr: unknown input clock freq
[    1.409471] nouveau 0000:04:05.0: fb: 32 MiB SDRAM
[    1.414459] nouveau 0000:04:05.0: DRM: VRAM: 31 MiB
[    1.414467] nouveau 0000:04:05.0: DRM: GART: 128 MiB
[    1.414476] nouveau 0000:04:05.0: DRM: BMP version 5.17
[    1.414484] nouveau 0000:04:05.0: DRM: No DCB data found in VBIOS
[    1.415629] nouveau 0000:04:05.0: DRM: Adaptor not initialised, running VBIOS init tables.
[    1.415829] nouveau 0000:04:05.0: bios: DCB table not found
[    1.416125] nouveau 0000:04:05.0: DRM: Saving VGA fonts
[    1.477526] nouveau 0000:04:05.0: DRM: No DCB data found in VBIOS
[    1.478428] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.478438] [drm] Driver supports precise vblank timestamp query.
[    1.479618] nouveau 0000:04:05.0: DRM: MM: using M2MF for buffer copies
[    1.517930] nouveau 0000:04:05.0: DRM: allocated 1024x768 fb: 0x4000, bo 00000000a09f4d1f
[    1.519294] nouveau 0000:04:05.0: fb1: nouveaufb frame buffer device
[    1.519313] [drm] Initialized nouveau 1.3.1 20120801 for 0000:04:05.0 on minor 1


-- 
Meelis Roos (mroos@linux.ee)
