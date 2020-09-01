From: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: VAAPI on GeForce GT 620M
Date: Tue, 1 Sep 2020 13:04:55 +0200
Message-ID: <CACO55tvdTRRN-=4NDquvPdP5g416Vo6GuQ_=DpDAsONJaEFSBA@mail.gmail.com>
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

On Tue, Sep 1, 2020 at 9:31 AM Analabha Roy <hariseldon99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
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
>

It does indicate a config problem, but why do you want to use the
nvidia GPU for video accel? I'd rely on intel to provide acceleration
as this also reduces power consumption of the entire system. Also I
think vaapi on the secondary GPU is pretty much untested.

> Thanks,
> AR
> --
> Analabha Roy
> Assistant Professor
> Department of Physics
> The University of Burdwan
> Golapbag Campus, Barddhaman 713104
> West Bengal, India
> Emails: daneel-0v3tJM2ovI83uPMLIKxrzw@public.gmane.org, aroy-ZqCQOGSO5P5obvhnwckLr5/QNRX+jHPU@public.gmane.org, hariseldon99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> Webpage: http://www.ph.utexas.edu/~daneel/
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
