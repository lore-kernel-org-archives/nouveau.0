From: Zeno Davatz <zdavatz@gmail.com>
Subject: Kernel 5.7.0, nouveau 1.0.15-r1, sudo lshw -C display, *-display UNCLAIMED
Date: Thu, 11 Jun 2020 10:12:12 +0200
Message-ID: <CAOkhzLUrm6bS1ejmBdCOmU4G7O=t0XU_0PqYPx4AssGm5z1uCw@mail.gmail.com>
References: <CAOkhzLUrNYk6JKTbTQuFkfuGKxGvW9XVq6+p9igsBgX1-e9Cxg@mail.gmail.com>
 <CAKb7Uvg0W_1qUjf3G4JrCb2oJgkwz4G5T6PwkyeL-rZEp4UnTw@mail.gmail.com>
 <CAOkhzLV+suVNAoyiaHKOkbwP-KKgTLEa7S8kp8+GSTLm_-wWFw@mail.gmail.com>
 <CAKb7UvgWMsLSHCayzdY7UYMVTjN3OHbH2WhKd-BP46K=r4Ra8A@mail.gmail.com>
 <CAOkhzLXZVNdpgwV=iiO0TEvLp3Hx28Zk8iYzwy5BvJ1pWi4QxQ@mail.gmail.com>
 <CAKb7UviB22HxSJ6j4ts=fU=J24Hh69NCBw4uHC5vsi902Pp6bA@mail.gmail.com> <CAOkhzLUQXAB1-=2VasSeJC9-LDgsd0Sk-pJY2LBbHaLqpcBeLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOkhzLUQXAB1-=2VasSeJC9-LDgsd0Sk-pJY2LBbHaLqpcBeLg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Ilia Mirkin <imirkin@alum.mit.edu>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

Hi

With Kernel 5.7.0, nouveau drivers 1.0.15-r1

sudo `lshw -C display`

will show me:

 *-display UNCLAIMED

Also `xrandr -q` will not work:

xrandr: Failed to get size of gamma for output default
Screen 0: minimum 1680 x 1050, current 1680 x 1050, maximum 1680 x 1050
default connected primary 1680x1050+0+0 0mm x 0mm
   1680x1050      0.00*

So I can not start up my second monitor with this command:

xrandr --output DVI-D-1 --auto --output DP-1 --auto --left-of DVI-D-1

This used to work with Kernel 5.5.

It was "completely broken" in 5.6 and with 5.7 my first display is
back, but not my second.

I am on Gentoo Linux. Please CC for replies.

Best
Zeno
