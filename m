From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: nouveau: DRM: GPU lockup - switching to software fbcon
Date: Wed, 19 Jun 2019 15:27:14 +0900
Message-ID: <20190619062714.GA11457@jagdpanzerIV>
References: <20190614024957.GA9645@jagdpanzerIV>
 <20190619050811.GA15221@jagdpanzerIV>
 <CAKb7UvhdN=RUdfrnWswT4ANK5UwPcM-upDP85=84zsCF+a5-bg@mail.gmail.com>
 <20190619054826.GA2059@jagdpanzerIV>
 <CAKb7UvgkEXtmJV67EXeBctgaOxM1D91fBbKw9oFMUaB1ZViZQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKb7UvgkEXtmJV67EXeBctgaOxM1D91fBbKw9oFMUaB1ZViZQg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On (06/19/19 02:07), Ilia Mirkin wrote:
> On Wed, Jun 19, 2019 at 1:48 AM Sergey Senozhatsky
> <sergey.senozhatsky.work@gmail.com> wrote:
> >
> > On (06/19/19 01:20), Ilia Mirkin wrote:
> > > On Wed, Jun 19, 2019 at 1:08 AM Sergey Senozhatsky
> > > <sergey.senozhatsky.work@gmail.com> wrote:
> > > >
> > > > On (06/14/19 11:50), Sergey Senozhatsky wrote:
> > > > > dmesg
> > > > >
> > > > >  nouveau 0000:01:00.0: DRM: GPU lockup - switching to software fbcon
> > > > >  nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
> > > > >  nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
> > > > >  nouveau 0000:01:00.0: fifo: channel 5: killed
> > > > >  nouveau 0000:01:00.0: fifo: engine 6: scheduled for recovery
> > > > >  nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
> > > > >  nouveau 0000:01:00.0: firefox[476]: channel 5 killed!
> > > > >  nouveau 0000:01:00.0: firefox[476]: failed to idle channel 5 [firefox[476]]
> > > > >
> > > > > It lockups several times a day. Twice in just one hour today.
> > > > > Can we fix this?
> > > >
> > > > Unusable
> > >
> > > Are you using a GTX 660 by any chance? You've provided rather minimal
> > > system info.
> >
> > 01:00.0 VGA compatible controller: NVIDIA Corporation GK208B [GeForce GT 730] (rev a1)
> 
> Quite literally the same GPU I have plugged in...
> 
> 02:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK208B
> [GeForce GT 730] [10de:1287] (rev a1)
> 
> Works great here! Only other thing I can think of is that I avoid
> applications with the letters "G" and "K" in their names, and I'm
> using xf86-video-nouveau ddx, whereas you might be using the "modeset"
> ddx with glamor.

xf86-video-nouveau 1.0.16-1

cat .local/share/xorg/Xorg.0.log

[..]
[   304.159] (II) NOUVEAU driver 
[   304.159] (II) NOUVEAU driver for NVIDIA chipset families :
[   304.159] 	RIVA TNT            (NV04)
[   304.159] 	RIVA TNT2           (NV05)
[   304.159] 	GeForce 256         (NV10)
[   304.159] 	GeForce 2           (NV11, NV15)
[   304.159] 	GeForce 4MX         (NV17, NV18)
[   304.159] 	GeForce 3           (NV20)
[   304.159] 	GeForce 4Ti         (NV25, NV28)
[   304.159] 	GeForce FX          (NV3x)
[   304.159] 	GeForce 6           (NV4x)
[   304.159] 	GeForce 7           (G7x)
[   304.159] 	GeForce 8           (G8x)
[   304.159] 	GeForce 9           (G9x)
[   304.159] 	GeForce GTX 2xx/3xx (GT2xx)
[   304.159] 	GeForce GTX 4xx/5xx (GFxxx)
[   304.159] 	GeForce GTX 6xx/7xx (GKxxx)
[   304.159] 	GeForce GTX 9xx     (GMxxx)
[   304.159] 	GeForce GTX 10xx    (GPxxx)
[   304.159] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[   304.159] (II) [drm] nouveau interface version: 1.3.1
[   304.159] (WW) Falling back to old probe method for modesetting
[   304.159] (WW) VGA arbiter: cannot open kernel arbiter, no multi-card support
[   304.159] (II) Loading sub module "dri2"
[   304.159] (II) LoadModule: "dri2"
[   304.159] (II) Module "dri2" already built-in
[   304.159] (--) NOUVEAU(0): Chipset: "NVIDIA NV106"
[   304.159] (II) NOUVEAU(0): Creating default Display subsection in Screen section
	"Default Screen Section" for depth/fbbpp 24/32
[...]
[   304.309] (II) UnloadModule: "modesetting"
[   304.309] (II) Unloading modesetting
[   304.310] (II) NOUVEAU(0): Channel setup complete.
[   304.310] (II) NOUVEAU(0): [COPY] async initialised.
[   304.310] (II) NOUVEAU(0): Hardware support for Present enabled
[   304.310] (II) NOUVEAU(0): [DRI2] Setup complete
[   304.310] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[   304.310] (II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau
[   304.310] (II) Loading sub module "exa"
[   304.310] (II) LoadModule: "exa"
[   304.310] (II) Loading /usr/lib/xorg/modules/libexa.so
[   304.310] (II) Module exa: vendor="X.Org Foundation"
[   304.310] 	compiled for 1.20.5, module version = 2.6.0
[   304.310] 	ABI class: X.Org Video Driver, version 24.0
[   304.310] (II) EXA(0): Driver allocated offscreen pixmaps
[   304.310] (II) EXA(0): Driver registered support for the following operations:
[   304.310] (II)         Solid
[   304.310] (II)         Copy
[   304.310] (II)         Composite (RENDER acceleration)
[   304.310] (II)         UploadToScreen
[   304.310] (II)         DownloadFromScreen
[   304.310] (==) NOUVEAU(0): Backing store enabled
[   304.310] (==) NOUVEAU(0): Silken mouse disabled
[   304.310] (II) NOUVEAU(0): [XvMC] Associated with Nouveau GeForce 8/9 Textured Video.
[   304.310] (II) NOUVEAU(0): [XvMC] Extension initialized.
[   304.310] (==) NOUVEAU(0): DPMS enabled
[..]

> If all else fails, just remove nouveau_dri.so and/or boot with
> nouveau.noaccel=1 -- should be perfect.

Can give it a try.

	-ss
