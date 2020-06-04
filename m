From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: NVIDIA GP107 (137000a1) - acr: failed to load firmware
Date: Thu, 4 Jun 2020 10:36:26 -0400
Message-ID: <CAKb7Uvg0W_1qUjf3G4JrCb2oJgkwz4G5T6PwkyeL-rZEp4UnTw@mail.gmail.com>
References: <CAOkhzLUrNYk6JKTbTQuFkfuGKxGvW9XVq6+p9igsBgX1-e9Cxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAOkhzLUrNYk6JKTbTQuFkfuGKxGvW9XVq6+p9igsBgX1-e9Cxg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Zeno Davatz <zdavatz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Starting with kernel 5.6, loading nouveau without firmware (for GPUs
where it is required, such as yours) got broken.

You are loading nouveau without firmware, so it fails.

The firmware needs to be available to the kernel at the time of nouveau loading.

Cheers,

  -ilia

On Thu, Jun 4, 2020 at 10:24 AM Zeno Davatz <zdavatz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Hi
>
> With Kernel 5.7 I am still getting this, while booting:
>
> ~> uname -a
> Linux zenogentoo 5.7.0 #80 SMP Thu Jun 4 16:10:03 CEST 2020 x86_64
> Intel(R) Core(TM) i7 CPU 960 @ 3.20GHz GenuineIntel GNU/Linux
> ~> dmesg |grep nouveau
> [    0.762872] nouveau 0000:05:00.0: NVIDIA GP107 (137000a1)
> [    0.875311] nouveau 0000:05:00.0: bios: version 86.07.42.00.4a
> [    0.875681] nouveau 0000:05:00.0: acr: failed to load firmware
> [    0.875780] nouveau 0000:05:00.0: acr: failed to load firmware
> [    0.875881] nouveau 0000:05:00.0: acr ctor failed, -2
> [    0.875980] nouveau: probe of 0000:05:00.0 failed with error -2
>
> Old thread is here: https://lkml.org/lkml/2020/4/3/775
>
> My Linxu-Firmware is: linux-firmware-20200421
>
> This used to work fine with Kernel 5.5.
>
> Please CC me for replies.
>
> best
> Zeno
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
