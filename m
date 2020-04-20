From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [RFC v3 00/11] drm/nouveau: Introduce CRC support for gf119+
Date: Tue, 21 Apr 2020 09:19:40 +1000
Message-ID: <CACAvsv7i+f1EnOB6HngisnexVc2jVVyJqfQk4kRk63uxuTG18w@mail.gmail.com>
References: <20200417194145.36350-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200417194145.36350-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>, Kate Stewart <kstewart@linuxfoundation.org>, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Ben Dooks <ben.dooks@codethink.co.uk>, Ben Skeggs <bskeggs@redhat.com>, Petr Mladek <pmladek@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula <jani.nikula@intel.com>, Peteris Rudzusiks <peteris.rudzusiks@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>, Greg
List-Id: nouveau.vger.kernel.org

On Sat, 18 Apr 2020 at 05:42, Lyude Paul <lyude@redhat.com> wrote:
>
> Nvidia released some documentation on how CRC support works on their
> GPUs, hooray!
>
> So: this patch series implements said CRC support in nouveau, along with
> adding some special debugfs interfaces for some relevant igt-gpu-tools
> tests that we'll be sending in just a short bit.
>
> This additionally adds a feature that Ville Syrj=C3=A4l=C3=A4 came up wit=
h: vblank
> works. Basically, this is just a generic DRM interface that allows for
> scheduling high-priority workers that start on a given vblank interrupt.
> Note that while we're currently only using this in nouveau, Intel has
> plans to use this for i915 as well (hence why they came up with it!).
>
> And finally: in order to implement the last feature, we expose some new
> functions in the kernel's kthread_worker infrastructure so that we can
> de-complicate our implementation of this.
>
> Anyway-welcome to the future! :)
The Nouveau bits look alright to me, I'll take them once the patches
it depends on have been acked.

Ben.

>
> Major changes since v2:
> * Use kthread_worker instead of kthreadd for vblank workers
> * Don't check debugfs return values
>
> Lyude Paul (11):
>   drm/vblank: Register drmm cleanup action once per drm_vblank_crtc
>   kthread: Introduce __kthread_queue_work()
>   drm/vblank: Add vblank works
>   drm/nouveau/kms/nv50-: Unroll error cleanup in nv50_head_create()
>   drm/nouveau/kms/nv140-: Don't modify depth in state during atomic
>     commit
>   drm/nouveau/kms/nv50-: Fix disabling dithering
>   drm/nouveau/kms/nv50-: s/harm/armh/g
>   drm/nouveau/kms/nv140-: Track wndw mappings in nv50_head_atom
>   drm/nouveau/kms/nv50-: Expose nv50_outp_atom in disp.h
>   drm/nouveau/kms/nv50-: Move hard-coded object handles into header
>   drm/nouveau/kms/nvd9-: Add CRC support
>
>  drivers/gpu/drm/drm_vblank.c                | 314 ++++++++-
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c     |  25 +-
>  drivers/gpu/drm/nouveau/dispnv50/Kbuild     |   4 +
>  drivers/gpu/drm/nouveau/dispnv50/atom.h     |  21 +
>  drivers/gpu/drm/nouveau/dispnv50/core.h     |   4 +
>  drivers/gpu/drm/nouveau/dispnv50/core907d.c |   3 +
>  drivers/gpu/drm/nouveau/dispnv50/core917d.c |   3 +
>  drivers/gpu/drm/nouveau/dispnv50/corec37d.c |   3 +
>  drivers/gpu/drm/nouveau/dispnv50/corec57d.c |   3 +
>  drivers/gpu/drm/nouveau/dispnv50/crc.c      | 715 ++++++++++++++++++++
>  drivers/gpu/drm/nouveau/dispnv50/crc.h      | 125 ++++
>  drivers/gpu/drm/nouveau/dispnv50/crc907d.c  | 139 ++++
>  drivers/gpu/drm/nouveau/dispnv50/crcc37d.c  | 153 +++++
>  drivers/gpu/drm/nouveau/dispnv50/disp.c     |  65 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.h     |  24 +
>  drivers/gpu/drm/nouveau/dispnv50/handles.h  |  16 +
>  drivers/gpu/drm/nouveau/dispnv50/head.c     | 142 +++-
>  drivers/gpu/drm/nouveau/dispnv50/head.h     |  13 +-
>  drivers/gpu/drm/nouveau/dispnv50/head907d.c |  14 +-
>  drivers/gpu/drm/nouveau/dispnv50/headc37d.c |  27 +-
>  drivers/gpu/drm/nouveau/dispnv50/headc57d.c |  20 +-
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  15 +-
>  drivers/gpu/drm/nouveau/nouveau_display.c   |  60 +-
>  include/drm/drm_vblank.h                    |  31 +
>  include/linux/kthread.h                     |   3 +
>  kernel/kthread.c                            |  34 +-
>  26 files changed, 1831 insertions(+), 145 deletions(-)
>  create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crc.c
>  create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crc.h
>  create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crc907d.c
>  create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
>  create mode 100644 drivers/gpu/drm/nouveau/dispnv50/handles.h
>
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
