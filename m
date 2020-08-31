From: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Subject: Re: nouveau PUSHBUFFER_ERR on 5.9.0-rc2-next-20200824
Date: Mon, 31 Aug 2020 08:33:20 +0300
Message-ID: <CAJ1xhMVOZAM=VwtNdYmjWY9NjVOpr0JJXi0Civ5Pgb9f4og49w@mail.gmail.com>
References: <CAJ1xhMUpqtKMuGUZdComskTqd0oOKCfDuVQT3+c13u=NSJLkBw@mail.gmail.com>
 <CACAvsv6zUi=3mZTg11Y_6CVYkpCSO0RY-5+GiBZz+2EXCDmD-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACAvsv6zUi=3mZTg11Y_6CVYkpCSO0RY-5+GiBZz+2EXCDmD-g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <skeggsb@gmail.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, ML nouveau <nouveau@lists.freedesktop.org>, Linux-Next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Mon, Aug 31, 2020 at 7:30 AM Ben Skeggs <skeggsb@gmail.com> wrote:
>
> On Tue, 25 Aug 2020 at 17:21, Alexander Kapshuk
> <alexander.kapshuk@gmail.com> wrote:
> >
> > Since upgrading to linux-next based on 5.9.0-rc1 and 5.9.0-rc2 I have
> > had my mouse pointer disappear soon after logging in, and I have
> > observed the system freezing temporarily when clicking on objects and
> > when typing text.
> > I have also found records of push buffer errors in dmesg output:
> > [ 6625.450394] nouveau 0000:01:00.0: disp: ERROR 1 [PUSHBUFFER_ERR] 02
> > [] chid 0 mthd 0000 data 00000400
> Hey,
>
> Yeah, I'm aware of this.  Lyude and I have both seen it, but it's been
> very painful to track down to what's actually causing it so far.  It
> likely is the commit you mentioned that's at fault, and I'm still
> working to find a proper solution before I revert it.
>
> Ben.
>
> >
> > I tried setting CONFIG_NOUVEAU_DEBUG=5 (tracing) to try and collect
> > further debug info, but nothing caught the eye.
> >
> > The error message in question comes from nv50_disp_intr_error in
> > drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c:613,645.
> > And nv50_disp_intr_error is called from nv50_disp_intr in the
> > following while block:
> > drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c:647,658
> > void
> > nv50_disp_intr(struct nv50_disp *disp)
> > {
> >         struct nvkm_device *device = disp->base.engine.subdev.device;
> >         u32 intr0 = nvkm_rd32(device, 0x610020);
> >         u32 intr1 = nvkm_rd32(device, 0x610024);
> >
> >         while (intr0 & 0x001f0000) {
> >                 u32 chid = __ffs(intr0 & 0x001f0000) - 16;
> >                 nv50_disp_intr_error(disp, chid);
> >                 intr0 &= ~(0x00010000 << chid);
> >         }
> > ...
> > }
> >
> > Could this be in any way related to this series of commits?
> > commit 0a96099691c8cd1ac0744ef30b6846869dc2b566
> > Author: Ben Skeggs <bskeggs@redhat.com>
> > Date:   Tue Jul 21 11:34:07 2020 +1000
> >
> >     drm/nouveau/kms/nv50-: implement proper push buffer control logic
> >
> >     We had a, what was supposed to be temporary, hack in the KMS code where we'd
> >     completely drain an EVO/NVD channel's push buffer when wrapping to the start
> >     again, instead of treating it as a ring buffer.
> >
> >     Let's fix that, finally.
> >
> >     Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> >
> > Here are my GPU details:
> > 01:00.0 VGA compatible controller: NVIDIA Corporation GT216 [GeForce
> > 210] (rev a1)
> >         Subsystem: Micro-Star International Co., Ltd. [MSI] Device 8a93
> >         Kernel driver in use: nouveau
> >
> > The last linux-next kernel I built where the problem reported does not
> > manifest itself is 5.8.0-rc6-next-20200720.
> >
> > I would appreciate being given any pointers on how to further debug this.
> > Or is git bisect the only way to proceed with this?
> >
> > Thanks.
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

Thanks a lot for getting back to me about this.
Please let me know if there's anything else I can do to help track this down.

Alexander.
