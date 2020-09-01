From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: VAAPI on GeForce GT 620M
Date: Tue, 1 Sep 2020 08:31:23 -0400
Message-ID: <CAKb7Uvh4cdg0=dGJqQVXx_p4O2c5BJbG3JRnjznwjsMQwc505Q@mail.gmail.com>
References: <CAKiGokHoArQcnVAPs0HWzJSFXhwCSLfQAirOQ-zTq=0C-97neQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKiGokHoArQcnVAPs0HWzJSFXhwCSLfQAirOQ-zTq=0C-97neQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Analabha Roy <hariseldon99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Sep 1, 2020 at 3:31 AM Analabha Roy <hariseldon99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Hi,
>
> If I am reading the featurematrix right, VAAPI is supported for nouveau on the GeForce650M (my card).
>
> Here is the output of inxi -F
>
> System:    Host: MediaServer Kernel: 5.4.0-42-generic x86_64 bits: 64 Console: tty 1 Distro: Ubuntu 18.04.5 LTS
> Machine:   Device: laptop System: SAMSUNG product: 300E4C/300E5C/300E7C v: 0.1 serial: N/A
>            Mobo: SAMSUNG model: NP300E5X-U01IN v: FAB1 serial: N/A
>            UEFI [Legacy]: Phoenix v: P06RAC date: 10/25/2012
> Battery    BAT1: charge: 47.5 Wh 100.0% condition: 47.5/47.5 Wh (100%)
> CPU:       Dual core Intel Core i3-2310M (-MT-MCP-) cache: 3072 KB
>            clock speeds: max: 2100 MHz 1: 835 MHz 2: 1031 MHz 3: 905 MHz 4: 927 MHz
> Graphics:  Card-1: Intel 2nd Generation Core Processor Family Integrated Graphics Controller
>            Card-2: NVIDIA GF108M [GeForce GT 620M]
>            Display Server: X.org 1.20.8 driver: i915 tty size: 171x45 Advanced Data: N/A out of X
>
>
> I have installed nouveau, and extracted the firmware from the prop nvidia drivers separately as per instructions on https://nouveau.freedesktop.org/wiki/VideoAcceleration/
> See installed firmware @ https://pastebin.com/Gaqxb88g
>
> But running vainfo yields error: https://pastebin.com/NyULBhXt
>
> Does the error mean that VAAPI is unsupported, or does it indicate a config problem?

As Karol suggests, using the onboard CPU's decoding capabilities will
yield better results. However if there's some specific reason you
want/need to use the NVIDIA card, it should still work. I note that
you don't have an X server running - is that on purpose? I believe
that va-api needs some sort of winsys to be available, but I guess I'm
not entirely sure.

Do you see any errors in dmesg after running vainfo?

Cheers,

  -ilia
