From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] NVIDIA GP107 (137000a1) - acr: failed to load firmware
Date: Thu, 4 Jun 2020 11:25:44 -0400
Message-ID: <CAKb7UvgWMsLSHCayzdY7UYMVTjN3OHbH2WhKd-BP46K=r4Ra8A@mail.gmail.com>
References: <CAOkhzLUrNYk6JKTbTQuFkfuGKxGvW9XVq6+p9igsBgX1-e9Cxg@mail.gmail.com>
 <CAKb7Uvg0W_1qUjf3G4JrCb2oJgkwz4G5T6PwkyeL-rZEp4UnTw@mail.gmail.com> <CAOkhzLV+suVNAoyiaHKOkbwP-KKgTLEa7S8kp8+GSTLm_-wWFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOkhzLV+suVNAoyiaHKOkbwP-KKgTLEa7S8kp8+GSTLm_-wWFw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zeno Davatz <zdavatz@gmail.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Thu, Jun 4, 2020 at 11:16 AM Zeno Davatz <zdavatz@gmail.com> wrote:
>
> On Thu, Jun 4, 2020 at 4:36 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> >
> > Starting with kernel 5.6, loading nouveau without firmware (for GPUs
> > where it is required, such as yours) got broken.
> >
> > You are loading nouveau without firmware, so it fails.
> >
> > The firmware needs to be available to the kernel at the time of nouveau loading.
>
> Ok, I am now trying this:
>
> /usr/src/linux> grep FIRMWARE /usr/src/linux/.config
> CONFIG_FIRMWARE_MEMMAP=y
> # CONFIG_GOOGLE_FIRMWARE is not set
> CONFIG_PREVENT_FIRMWARE_BUILD=y
> CONFIG_EXTRA_FIRMWARE="nvidia/gp107/gr/sw_nonctx.bin"
> # CONFIG_CYPRESS_FIRMWARE is not set
> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> # CONFIG_FIRMWARE_EDID is not set
> # CONFIG_TEST_FIRMWARE is not set

There's a lot more firmware files than that ... everything in the
gp107 directory. Also this would only be necessary if nouveau is built
into the kernel. The files just have to be available whenever nouveau
is loaded -- if it's built in, that means the firmware has to be baked
into the kernel too. If it's loaded from initrd, that means the
firmware has to be in initrd. If it's loaded after boot, then the
firmware has to be available after boot.

Cheers,

  -ilia
