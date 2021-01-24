From: o1bigtenor <o1bigtenor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Request for help in adding a HDMI output
Date: Sat, 23 Jan 2021 21:45:14 -0600
Message-ID: <CAPpdf5-w2+4i---qgodB6-_gLnCBR=25=VOqCEoqqig2eym8ZA@mail.gmail.com>
References: <CAPpdf5-SoO4qPKg7WuvRsCMT4RGV34gNp+M0ir27a1E8Qu+s4g@mail.gmail.com>
 <CAKb7UvjfPptmKDm_jma90Q0T+JoTmETL-Y0-KzTbv9z7f=ccoA@mail.gmail.com>
 <CAPpdf59jfbS4dhRJ5kvhri7LwJL4UNEyL8rssG+qOcu7G1ZkQg@mail.gmail.com>
 <CAKb7Uvh3UOKQ14MQwoDti0Lvsey5oLM4qk_GLze3s9qBFq+19Q@mail.gmail.com>
 <CAPpdf58rtMsE_vHK-i-nKkX5=3K6W4HieJ0+7mH5HhkuEZG+tg@mail.gmail.com>
 <CAKb7UvgUHnYt7Uhobu5Lxu1bfFV_Lc+R9fn-UGCMMcjKbcswHw@mail.gmail.com>
 <CAPpdf58uFaMzWYQTGj=XV9naHnO5LNL==S3v+N_yUv=MQwEmWA@mail.gmail.com>
 <CAKb7UviywJgO_=8iOOf3akyJN7OtpuOFqMCmjpT704Kek7BhzA@mail.gmail.com>
 <CAPpdf590+xGC2NrznrF-QafrgsRMS2LXMXaAVYjV5QcKWtPc=A@mail.gmail.com>
 <CAKb7UvhFtXT7Kt6UCAZ7tCm2=kssTfCLRqUm+ajXiPo0Vn1Ksw@mail.gmail.com>
 <CAPpdf5_VRMAxBNkNw+THechFv_KpXfCYcHfP409__32jof8e-Q@mail.gmail.com>
 <6746024b-ab68-4d6f-626f-224800832eb6@spliet.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6746024b-ab68-4d6f-626f-224800832eb6-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Roy Spliet <nouveau-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, Jan 23, 2021 at 6:43 PM Roy Spliet <nouveau-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org> wrote:
>
> Op 23-01-2021 om 23:18 schreef o1bigtenor:
> >>>>>>
> >>>>>> OK, so this is your 4k monitor. It is plugged into the *secondary*
> >>>>>> GPU, and does not report any 4k@60 modes in the EDID (well, it does
> >>>>>> report 4k@60 YUV 4:2:0 modes, but we don't support those in nouveau at
> >>>>>> this time). Whether that's because the monitor itself doesn't support
> >>>>>> HDMI 2.0, or you plugged it into your old GPU which does not support
> >>>>>> HDMI 2.0, I couldn't say from just this output. What I can say is that
> >>>>>> no amount of modelines will get you 4k@60 in this setup with nouveau.
> >>>>>
> [...]
> > If you would point out a suggestion that I haven't tried - - - please?
>
> A quick DuckDuckGo for "Hisense 4K 60Hz only reports 30Hz" gives this
> thread: https://www.coolcomputing.com/article.php?sid=4659 . No idea
> whether this also applies to your 2016 model. Have you scavenged through
> the TVs menu's to make sure HDMI 2.0 is explicitly enabled?

What is very interesting is that the article is talking about a 43" HiSens Roku
TV. At the beginning of my trouble shooting I called HiSense USA  - - - found
out that the software is different from that on the model sold by HiSense
Canada. About 2/3rds of what is mentioned in the article  - - - - well it just
ain't so. Might be worth plugging a ethernet cord into the thing and trying
to ssh into it to see what's hiding in the system - - - the software screen
does say opensource and mentions a number of common programs
including libc (and others).

Hmmmmmmmm - - - - have found a pile of documents where EDID is shown
to be a very error prone 'standard'. The model year listed is only one of those
the companies documents indicate that the model was sold starting in 2019 and
that there are 3 HDMI 2.0b inputs.

It gets far more interesting!
I have 2 graphics cards:
card0 is an Nvidia 1050 Ti, card 1 is an Nvidia 570
there is only one HDMI port between the two cards (on card0) yet it is the HDMI
interface on card 1 that has the EDID information and reads as the port is
enabled. (Absolutely cannot enable the HDMI port on card0!!)
In my Xorg.0.log files I find a modeline that reads like:
[    40.740] (II) modeset(G0): Supported detailed timing:
[    40.740] (II) modeset(G0): clock: 297.0 MHz   Image Size:  1872 x 1053 mm
[    40.740] (II) modeset(G0): h_active: 3840  h_sync: 4016
h_sync_end 4104 h_blank_end 4400 h_border: 0
[    40.740] (II) modeset(G0): v_active: 2160  v_sync: 2168
v_sync_end 2178 v_blanking: 2250 v_border: 0

which is somewhat similar to:

Preferred Video Timing if only Block 0 is parsed:
  DTD   1:  3840x2160   30.000 Hz  16:9    67.500 kHz 297.000 MHz
(1872 mm x 1053 mm)
                 Hfront  176 Hsync  88 Hback 296 Hpol P
                 Vfront    8 Vsync  10 Vback  72 Vpol P

----------------

Native Video Timing if only Block 0 is parsed:
  DTD   1:  3840x2160   30.000 Hz  16:9    67.500 kHz 297.000 MHz
(1872 mm x 1053 mm)
                 Hfront  176 Hsync  88 Hback 296 Hpol P
                 Vfront    8 Vsync  10 Vback  72 Vpol P

----------------

Preferred Video Timings if Block 0 and CTA-861 Blocks are parsed:
  DTD   1:  3840x2160   30.000 Hz  16:9    67.500 kHz 297.000 MHz
(1872 mm x 1053 mm)
                 Hfront  176 Hsync  88 Hback 296 Hpol P
                 Vfront    8 Vsync  10 Vback  72 Vpol P
  VIC  95:  3840x2160   30.000 Hz  16:9    67.500 kHz 297.000 MHz
                 Hfront  176 Hsync  88 Hback 296 Hpol P
                 Vfront    8 Vsync  10 Vback  72 Vpol P

----------------

Native Video Timing if Block 0 and CTA-861 Blocks are parsed:
  DTD   1:  3840x2160   30.000 Hz  16:9    67.500 kHz 297.000 MHz
(1872 mm x 1053 mm)
                 Hfront  176 Hsync  88 Hback 296 Hpol P
                 Vfront    8 Vsync  10 Vback  72 Vpol P

which is was the hex dump written for HDMI-1-2 (listed as on the card that
has no HDMI ports) as the EDID.

I really don't understand how or why this are so garbled - - - but - - - -
they are. Would love to just have a usable monitor - - - - that  doesn't look
like its going to happen though.

Suggestions?

TIA
