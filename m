From: Ben Skeggs <bskeggs@redhat.com>
Subject: Re: [linux-next] DDC responded, but no EDID for %s errors
Date: Thu, 6 Sep 2018 12:46:50 +1000
Message-ID: <CABDvA=kjVto=Wo1=K9o36mWkvnmG1ck8dPm--G5jQokqH7XGCA@mail.gmail.com>
References: <20180802024648.GA499@jagdpanzerIV> <20180906024243.GB749@jagdpanzerIV>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180906024243.GB749@jagdpanzerIV>
Sender: linux-kernel-owner@vger.kernel.org
To: sergey.senozhatsky.work@gmail.com
Cc: David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, torvalds@linux-foundation.org
List-Id: nouveau.vger.kernel.org

On Thu, Sep 6, 2018 at 12:42 PM Sergey Senozhatsky
<sergey.senozhatsky.work@gmail.com> wrote:
>
> On (08/02/18 11:46), Sergey Senozhatsky wrote:
> > Hi,
> >
> > My dmesg is filled up with these errors
> >
> >  nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for HDMI-A-1
> >  nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> >  nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for HDMI-A-1
> >  nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> >  nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> > [..]
> >  nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> >  nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> >  nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> >  nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> >  nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> >  nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> > [..]
> >
> > Basically, a message every 10s or so. Any chance we can make them
> > go away?
>
> A gentle ping?
I've got patches queued in my tree to resolve this, I will get them to
drm-fixes shortly.

Ben.

>
> It literally floods my logbuf with that "DRM: DDC responded, but no EDID
> for VGA-1" thing.
>
> name -a
> 4.19.0-rc2-dbg-00118-gb9a3bad8af2d
>
> $ dmesg | tail -42
> [ 3615.796938] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3626.036865] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3636.276878] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3646.516866] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3656.756750] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3666.996949] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3677.236884] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3687.476865] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3697.716858] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3707.956934] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3718.196925] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3728.436884] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3738.676861] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3748.916731] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3759.156754] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3769.396861] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3779.636826] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3789.876892] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3800.116686] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3810.356926] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3820.596887] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3830.836909] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3841.076932] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3851.316681] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3861.556926] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3871.796869] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3882.036750] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3892.276836] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3902.516803] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3912.756640] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3922.996957] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3933.236700] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3943.476851] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3953.716928] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3963.956915] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3974.196861] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3984.436928] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 3994.676885] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 4004.917030] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 4015.156935] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 4025.396872] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
> [ 4035.636877] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
>
>         -ss
