From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: nouveau: DRM: GPU lockup - switching to software fbcon
Date: Wed, 19 Jun 2019 02:07:00 -0400
Message-ID: <CAKb7UvgkEXtmJV67EXeBctgaOxM1D91fBbKw9oFMUaB1ZViZQg@mail.gmail.com>
References: <20190614024957.GA9645@jagdpanzerIV> <20190619050811.GA15221@jagdpanzerIV>
 <CAKb7UvhdN=RUdfrnWswT4ANK5UwPcM-upDP85=84zsCF+a5-bg@mail.gmail.com> <20190619054826.GA2059@jagdpanzerIV>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190619054826.GA2059@jagdpanzerIV>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Wed, Jun 19, 2019 at 1:48 AM Sergey Senozhatsky
<sergey.senozhatsky.work@gmail.com> wrote:
>
> On (06/19/19 01:20), Ilia Mirkin wrote:
> > On Wed, Jun 19, 2019 at 1:08 AM Sergey Senozhatsky
> > <sergey.senozhatsky.work@gmail.com> wrote:
> > >
> > > On (06/14/19 11:50), Sergey Senozhatsky wrote:
> > > > dmesg
> > > >
> > > >  nouveau 0000:01:00.0: DRM: GPU lockup - switching to software fbcon
> > > >  nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
> > > >  nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
> > > >  nouveau 0000:01:00.0: fifo: channel 5: killed
> > > >  nouveau 0000:01:00.0: fifo: engine 6: scheduled for recovery
> > > >  nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
> > > >  nouveau 0000:01:00.0: firefox[476]: channel 5 killed!
> > > >  nouveau 0000:01:00.0: firefox[476]: failed to idle channel 5 [firefox[476]]
> > > >
> > > > It lockups several times a day. Twice in just one hour today.
> > > > Can we fix this?
> > >
> > > Unusable
> >
> > Are you using a GTX 660 by any chance? You've provided rather minimal
> > system info.
>
> 01:00.0 VGA compatible controller: NVIDIA Corporation GK208B [GeForce GT 730] (rev a1)

Quite literally the same GPU I have plugged in...

02:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK208B
[GeForce GT 730] [10de:1287] (rev a1)

Works great here! Only other thing I can think of is that I avoid
applications with the letters "G" and "K" in their names, and I'm
using xf86-video-nouveau ddx, whereas you might be using the "modeset"
ddx with glamor.

If all else fails, just remove nouveau_dri.so and/or boot with
nouveau.noaccel=1 -- should be perfect.

Cheers,

  -ilia
