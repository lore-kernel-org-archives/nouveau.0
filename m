From: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] nouveau broken on Riva TNT2 in 5.9.0-rc8: GPU not
 supported on big-endian
Date: Fri, 9 Oct 2020 23:53:52 +0200
Message-ID: <CACO55tuj_=PUYuBnJLZgCEize_8Po0VnuDVPtkHLEZxL3RgF7Q@mail.gmail.com>
References: <202010092326.20482.linux@zary.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <202010092326.20482.linux@zary.sk>
To: Ondrej Zary <linux@zary.sk>
Cc: Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Fri, Oct 9, 2020 at 11:35 PM Ondrej Zary <linux@zary.sk> wrote:
>
> Hello,
> I'm testing 5.9.0-rc8 and found that Riva TNT2 stopped working:
> [    0.000000] Linux version 5.9.0-rc8+ (zary@gsql) (gcc (Debian 8.3.0-6) 8.3.0, GNU ld (GNU Binutils for Debian) 2.31.1) #326 SMP Fri Oct 9 22:31:40 CEST 2020
> ...
> [   14.771464] nouveau 0000:01:00.0: GPU not supported on big-endian
> [   14.771782] nouveau: probe of 0000:01:00.0 failed with error -38
>
> big-endian? WTF? The machine is x86.
>

mhh, we reworked the endianess checks a bit and apparently that broke
something... I will give it some thoughts, but could you be so kind
and create an mmiotrace under 5.9 with nouveau? You won't need to
start X or anything while doing it. Just enable the trace and modprobe
nouveau and collect the trace.

> It works fine with Debian 5.7 kernel (5.7.10-1~bpo10+1):
> [    0.000000] Linux version 5.7.0-0.bpo.2-686 (debian-kernel@lists.debian.org) (gcc version 8.3.0 (Debian 8.3.0-6), GNU ld (GNU Binutils for Debian) 2.31.1) #1 SMP Debian 5.7.10-1~bpo10+1 (2020-07-30)
> ...
> [   23.266196] nouveau 0000:01:00.0: NVIDIA NV05 (20154000)
> [   23.288582] nouveau 0000:01:00.0: bios: version 02.05.20.02.00
> [   23.288869] nouveau 0000:01:00.0: bios: DCB table not found
> [   23.289595] nouveau 0000:01:00.0: bios: DCB table not found
> [   23.289956] nouveau 0000:01:00.0: bios: DCB table not found
> [   23.290015] nouveau 0000:01:00.0: bios: DCB table not found
> [   23.290215] agpgart-intel 0000:00:00.0: AGP 3.0 bridge
> [   23.290287] agpgart-intel 0000:00:00.0: bridge is in legacy mode, falling back to 2.x
> [   23.290351] agpgart-intel 0000:00:00.0: putting AGP V2 device into 4x mode
> [   23.290430] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
> [   23.290565] agpgart-intel 0000:00:00.0: AGP 3.0 bridge
> [   23.290627] agpgart-intel 0000:00:00.0: bridge is in legacy mode, falling back to 2.x
> [   23.290690] agpgart-intel 0000:00:00.0: putting AGP V2 device into 4x mode
> [   23.290768] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
> [   23.290830] nouveau 0000:01:00.0: tmr: unknown input clock freq
> [   23.293026] nouveau 0000:01:00.0: fb: 32 MiB SDRAM
> [   23.301269] [TTM] Zone  kernel: Available graphics memory: 382728 KiB
> [   23.301327] [TTM] Initializing pool allocator
> [   23.301414] nouveau 0000:01:00.0: DRM: VRAM: 31 MiB
> [   23.301465] nouveau 0000:01:00.0: DRM: GART: 128 MiB
> [   23.301518] nouveau 0000:01:00.0: DRM: BMP version 5.6
> [   23.301570] nouveau 0000:01:00.0: DRM: No DCB data found in VBIOS
> [   23.303594] nouveau 0000:01:00.0: DRM: MM: using M2MF for buffer copies
> [   23.303719] nouveau 0000:01:00.0: bios: DCB table not found
> [   23.304904] nouveau 0000:01:00.0: DRM: Saving VGA fonts
> [   23.349089] nouveau 0000:01:00.0: DRM: No DCB data found in VBIOS
> [   23.349681] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [   23.383066] nouveau 0000:01:00.0: DRM: allocated 1280x1024 fb: 0x4000, bo b10d2f17
> [   23.413903] fbcon: nouveaudrmfb (fb0) is primary device
> [   23.569851] Console: switching to colour frame buffer device 160x64
> [   23.571050] nouveau 0000:01:00.0: fb0: nouveaudrmfb frame buffer device
>
>
> --
> Ondrej Zary
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>
