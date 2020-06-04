From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] NVIDIA GP107 (137000a1) - acr: failed to load firmware
Date: Thu, 4 Jun 2020 12:13:35 -0400
Message-ID: <CAKb7UviB22HxSJ6j4ts=fU=J24Hh69NCBw4uHC5vsi902Pp6bA@mail.gmail.com>
References: <CAOkhzLUrNYk6JKTbTQuFkfuGKxGvW9XVq6+p9igsBgX1-e9Cxg@mail.gmail.com>
 <CAKb7Uvg0W_1qUjf3G4JrCb2oJgkwz4G5T6PwkyeL-rZEp4UnTw@mail.gmail.com>
 <CAOkhzLV+suVNAoyiaHKOkbwP-KKgTLEa7S8kp8+GSTLm_-wWFw@mail.gmail.com>
 <CAKb7UvgWMsLSHCayzdY7UYMVTjN3OHbH2WhKd-BP46K=r4Ra8A@mail.gmail.com> <CAOkhzLXZVNdpgwV=iiO0TEvLp3Hx28Zk8iYzwy5BvJ1pWi4QxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOkhzLXZVNdpgwV=iiO0TEvLp3Hx28Zk8iYzwy5BvJ1pWi4QxQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zeno Davatz <zdavatz@gmail.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Thu, Jun 4, 2020 at 12:04 PM Zeno Davatz <zdavatz@gmail.com> wrote:
>
> Thank you, Ilia
>
> On Thu, Jun 4, 2020 at 5:25 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> > There's a lot more firmware files than that ... everything in the
> > gp107 directory. Also this would only be necessary if nouveau is built
> > into the kernel. The files just have to be available whenever nouveau
> > is loaded -- if it's built in, that means the firmware has to be baked
> > into the kernel too. If it's loaded from initrd, that means the
> > firmware has to be in initrd. If it's loaded after boot, then the
> > firmware has to be available after boot.
>
> For the time being I got it working by removing all nouveau selections
> in "make menuconfig" and by emerging "x11-drivers/nvidia-drivers"
> Version 440.82.
>
> Back on the latest Linux Kernel. Feels great ;).
>
> Linux zenogentoo 5.7.0 #84 SMP Thu Jun 4 17:47:15 CEST 2020 x86_64
> Intel(R) Core(TM) i7 CPU 960 @ 3.20GHz GenuineIntel GNU/Linux

Not sure why you bother asking questions when you're just going to
dump nouveau anyways. This is the second time I've answered your
questions on this very topic, I think it'll be the last too.

Cheers,

  -ilia
