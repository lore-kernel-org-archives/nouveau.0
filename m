From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH] drm/nouveau/kms/nv50-: Fix clock checking algorithm in nv50_dp_mode_valid()
Date: Tue, 22 Sep 2020 17:22:23 -0400
Message-ID: <CAKb7Uvj++15aEXiLGgSZb37wwzDSRCetVT+trP6JNwhk8n-whA@mail.gmail.com>
References: <20200922210510.156220-1-lyude@redhat.com> <CAKb7UvhAb0wFd9Qi1FGJ=TAYZJ9DYXL6XXMfnG49xEO=a9TuYg@mail.gmail.com>
 <7b10668ee337e531b14705ebecb1f6c1004728d6.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7b10668ee337e531b14705ebecb1f6c1004728d6.camel@redhat.com>
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Tue, Sep 22, 2020 at 5:14 PM Lyude Paul <lyude@redhat.com> wrote:
>
> On Tue, 2020-09-22 at 17:10 -0400, Ilia Mirkin wrote:
> > Can we use 6bpc on arbitrary DP monitors, or is there a capability for
> > it? Maybe only use 6bpc if display_info.bpc == 6 and otherwise use 8?
>
> I don't think that display_info.bpc actually implies a minimum bpc, only a
> maximum bpc iirc (Ville would know the answer to this one). The other thing to
> note here is that we want to assume the lowest possible bpc here since we're
> only concerned if the mode passed to ->mode_valid can be set under -any-
> conditions (including those that require lowering the bpc beyond it's maximum
> value), so we definitely do want to always use 6bpc here even once we get
> support for optimizing the bpc based on the available display bandwidth.

Yeah, display_info is the max bpc. But would an average monitor
support 6bpc? And if it does, does the current link training code even
try that when display_info.bpc != 6?

  -ilia
