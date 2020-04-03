From: Zeno Davatz <zdavatz@gmail.com>
Subject: Re: acr: failed to load firmware with Kernel 5.6. Kernel 5.5 works
 just fine.
Date: Fri, 3 Apr 2020 19:58:57 +0200
Message-ID: <CAOkhzLW42a66wNL7Pz8+d+yO_oyZZJBEps=8WPHaXXFjb54dTQ@mail.gmail.com>
References: <CAOkhzLWMB8rr0x4KKfqruCcTLVq4dH6nZ365auMqA1arZ57J7g@mail.gmail.com>
 <CAOkhzLVvmoB0TgS4bioP4PnxwmnT_+h0LbCya2=KkcHu1UT_Zw@mail.gmail.com>
 <CAKb7UvgLr2A88jbx9Zvi3SjXoKbk4iZEg7LNQ4aL3VZhKVQu3A@mail.gmail.com>
 <CAOkhzLU+buL3J3XUbzC6JUAfbnMR-27qwS3Vm7ofrAPPCipXuw@mail.gmail.com> <CAKb7UvhvBG49P7t6XD==26q70YywmhUHvP=hW=wj8mT6V0gpHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
> > On Fri, Apr 3, 2020 at 6:59 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote=
:
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

Do I need any of these enabled for linux-firmware to load properly in
Kernel 5.6?

 -*- Firmware loading facility
  =E2=94=82 =E2=94=82                                      ()    Build name=
d firmware
blobs into the kernel binary
  =E2=94=82 =E2=94=82                                      [ ]   Enable the=
 firmware
sysfs fallback mechanism
  =E2=94=82 =E2=94=82                                      [ ]   Enable com=
pressed
firmware support

Best
Zeno
