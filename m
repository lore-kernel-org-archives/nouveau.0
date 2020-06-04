From: Zeno Davatz <zdavatz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: NVIDIA GP107 (137000a1) - acr: failed to load firmware
Date: Thu, 4 Jun 2020 18:04:40 +0200
Message-ID: <CAOkhzLXZVNdpgwV=iiO0TEvLp3Hx28Zk8iYzwy5BvJ1pWi4QxQ@mail.gmail.com>
References: <CAOkhzLUrNYk6JKTbTQuFkfuGKxGvW9XVq6+p9igsBgX1-e9Cxg@mail.gmail.com>
 <CAKb7Uvg0W_1qUjf3G4JrCb2oJgkwz4G5T6PwkyeL-rZEp4UnTw@mail.gmail.com>
 <CAOkhzLV+suVNAoyiaHKOkbwP-KKgTLEa7S8kp8+GSTLm_-wWFw@mail.gmail.com>
 <CAKb7UvgWMsLSHCayzdY7UYMVTjN3OHbH2WhKd-BP46K=r4Ra8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvgWMsLSHCayzdY7UYMVTjN3OHbH2WhKd-BP46K=r4Ra8A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Thank you, Ilia

On Thu, Jun 4, 2020 at 5:25 PM Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:

> There's a lot more firmware files than that ... everything in the
> gp107 directory. Also this would only be necessary if nouveau is built
> into the kernel. The files just have to be available whenever nouveau
> is loaded -- if it's built in, that means the firmware has to be baked
> into the kernel too. If it's loaded from initrd, that means the
> firmware has to be in initrd. If it's loaded after boot, then the
> firmware has to be available after boot.

For the time being I got it working by removing all nouveau selections
in "make menuconfig" and by emerging "x11-drivers/nvidia-drivers"
Version 440.82.

Back on the latest Linux Kernel. Feels great ;).

Linux zenogentoo 5.7.0 #84 SMP Thu Jun 4 17:47:15 CEST 2020 x86_64
Intel(R) Core(TM) i7 CPU 960 @ 3.20GHz GenuineIntel GNU/Linux

Best
Zeno
