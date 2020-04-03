From: Zeno Davatz <zdavatz@gmail.com>
Subject: Re: acr: failed to load firmware with Kernel 5.6. Kernel 5.5 works
 just fine.
Date: Fri, 3 Apr 2020 19:50:23 +0200
Message-ID: <CAOkhzLUE62zCKt1wCQjOVz=7keSHVFHDfqZhN54_-0LtC7BoAw@mail.gmail.com>
References: <CAOkhzLWMB8rr0x4KKfqruCcTLVq4dH6nZ365auMqA1arZ57J7g@mail.gmail.com>
 <CAOkhzLVvmoB0TgS4bioP4PnxwmnT_+h0LbCya2=KkcHu1UT_Zw@mail.gmail.com>
 <CAKb7UvgLr2A88jbx9Zvi3SjXoKbk4iZEg7LNQ4aL3VZhKVQu3A@mail.gmail.com>
 <CAOkhzLU+buL3J3XUbzC6JUAfbnMR-27qwS3Vm7ofrAPPCipXuw@mail.gmail.com> <CAKb7UvhvBG49P7t6XD==26q70YywmhUHvP=hW=wj8mT6V0gpHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKb7UvhvBG49P7t6XD==26q70YywmhUHvP=hW=wj8mT6V0gpHA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: Ben Skeggs <bskeggs@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, nouveau <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Fri, Apr 3, 2020 at 7:23 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> On Fri, Apr 3, 2020 at 1:21 PM Zeno Davatz <zdavatz@gmail.com> wrote:
> >
> > On Fri, Apr 3, 2020 at 6:59 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > >
> > > Ben -- probably the ACR changes in 5.6 don't fall back nicely anymore
> > > when there's no firmware? The load shouldn't be failed, just GR
> > > disabled...
> > >
> > > Zeno -- if you grab linux-firmware, it should be all better. Not sure
> > > if you're missing it on purpose or by accident.
> >
> > Thank you, Ilia
> >
> > I will try that on my Gentoo/Funtoo machine now. So far linux-firmware
> > was not needed with Kernel 5.5, so it was not installed on my machine.
>
> It was needed on 5.5 as well. It's just that it fell back gracefully
> without firmware, and you didn't get any acceleration features.

Thank you, Ilia

Installing linux-firmware-20200122 on Gentoo/Funtoo Linux with Kernel
5.6 did not really help.

I still get the same message.

~> dmesg | grep nouveau
[    0.762819] nouveau 0000:05:00.0: NVIDIA GP107 (137000a1)
[    0.875252] nouveau 0000:05:00.0: bios: version 86.07.42.00.4a
[    0.875552] nouveau 0000:05:00.0: acr: failed to load firmware
[    0.875651] nouveau 0000:05:00.0: acr: failed to load firmware
[    0.875751] nouveau 0000:05:00.0: acr ctor failed, -2
[    0.875850] nouveau: probe of 0000:05:00.0 failed with error -2
~> uname -a
Linux zenogentoo 5.6.0 #74 SMP Fri Apr 3 19:44:55 CEST 2020 x86_64
Intel(R) Core(TM) i7 CPU 960 @ 3.20GHz GenuineIntel GNU/Linux

is there any other Kernel setting I need for 5.6?

Best
Zeno
