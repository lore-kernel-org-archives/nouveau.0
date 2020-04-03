From: Zeno Davatz <zdavatz@gmail.com>
Subject: Re: acr: failed to load firmware with Kernel 5.6. Kernel 5.5 works
 just fine.
Date: Fri, 3 Apr 2020 21:24:17 +0200
Message-ID: <CAOkhzLVGsOyKsf=Lm69UMGutWv-yZVFqZ=Yi61HDHCUCAwchoQ@mail.gmail.com>
References: <CAOkhzLWMB8rr0x4KKfqruCcTLVq4dH6nZ365auMqA1arZ57J7g@mail.gmail.com>
 <CAOkhzLVvmoB0TgS4bioP4PnxwmnT_+h0LbCya2=KkcHu1UT_Zw@mail.gmail.com>
 <CAKb7UvgLr2A88jbx9Zvi3SjXoKbk4iZEg7LNQ4aL3VZhKVQu3A@mail.gmail.com>
 <CAOkhzLU+buL3J3XUbzC6JUAfbnMR-27qwS3Vm7ofrAPPCipXuw@mail.gmail.com>
 <CAKb7UvhvBG49P7t6XD==26q70YywmhUHvP=hW=wj8mT6V0gpHA@mail.gmail.com>
 <CAOkhzLW42a66wNL7Pz8+d+yO_oyZZJBEps=8WPHaXXFjb54dTQ@mail.gmail.com> <CAKb7Uvh=44_S_EAfma+JX9j_igaE3CSWws_TUqLWwJ50zcmA9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKb7Uvh=44_S_EAfma+JX9j_igaE3CSWws_TUqLWwJ50zcmA9Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: Ben Skeggs <bskeggs@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, nouveau <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Fri, Apr 3, 2020 at 8:31 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> Depends on distro specifics. Also the firmware has to be available at
> the time that nouveau loads. The corollary to this is:
>
> If it's built into the kernel, then the firmware must also be included
> in the kernel (since this happens before any FS stuff)
> If it's loaded as a module from initrd, then initrd must contain the firmware
>
> If you need help including firmware in the right place, a distro
> support channel is probably your best shot.

Ok, thank you. So far no luck on the end.

https://wiki.gentoo.org/wiki/Linux_firmware

Please let me know if the fallback version comes back to life.

best
Zeno
