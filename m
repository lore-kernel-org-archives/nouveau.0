From: Zeno Davatz <zdavatz@gmail.com>
Subject: Re: acr: failed to load firmware with Kernel 5.6. Kernel 5.5 works
 just fine.
Date: Fri, 3 Apr 2020 19:20:48 +0200
Message-ID: <CAOkhzLU+buL3J3XUbzC6JUAfbnMR-27qwS3Vm7ofrAPPCipXuw@mail.gmail.com>
References: <CAOkhzLWMB8rr0x4KKfqruCcTLVq4dH6nZ365auMqA1arZ57J7g@mail.gmail.com>
 <CAOkhzLVvmoB0TgS4bioP4PnxwmnT_+h0LbCya2=KkcHu1UT_Zw@mail.gmail.com> <CAKb7UvgLr2A88jbx9Zvi3SjXoKbk4iZEg7LNQ4aL3VZhKVQu3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKb7UvgLr2A88jbx9Zvi3SjXoKbk4iZEg7LNQ4aL3VZhKVQu3A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: Ben Skeggs <bskeggs@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, nouveau <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Fri, Apr 3, 2020 at 6:59 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> Ben -- probably the ACR changes in 5.6 don't fall back nicely anymore
> when there's no firmware? The load shouldn't be failed, just GR
> disabled...
>
> Zeno -- if you grab linux-firmware, it should be all better. Not sure
> if you're missing it on purpose or by accident.

Thank you, Ilia

I will try that on my Gentoo/Funtoo machine now. So far linux-firmware
was not needed with Kernel 5.5, so it was not installed on my machine.

[ please CC me ]

Best
Zeno
