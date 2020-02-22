From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: NV40 under Debian
Date: Sat, 22 Feb 2020 14:49:10 -0500
Message-ID: <CAKb7UvgiCak9L62d66uEtvBRuazfde3OFQdHmmu7AKUR9w-n_w@mail.gmail.com>
References: <trinity-c5570114-8f17-4b15-bb54-f6a39340ef19-1582394224520@3c-app-gmx-bs13>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <trinity-c5570114-8f17-4b15-bb54-f6a39340ef19-1582394224520@3c-app-gmx-bs13>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lukas Schubert <lukas.schubert-Mmb7MZpHnFY@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, Feb 22, 2020 at 1:02 PM Lukas Schubert <lukas.schubert-Mmb7MZpHnFY@public.gmane.org> wrote:
>
> Hi list,
>
> my media center PC is freshly installed with Debian 10.2 "Buster". It doesn't support Geforce 6800 GT (NV40) boards through the nvidia nor the nvidia-legacy drivers any longer. The legacy drivers worked up until Debian 9 "Stretch", but no longer.
>
> I know that the hardware works because I can boot SystemRescueCD from CD and get a flawless desktop presentation on the attached full HD TV.
>
> But in Debian 10, the colours are distorted. Have a look at "Nouveau.jpg" here: https://jumpshare.com/b/Se5d7xMu5tBSsR2Zcz8p
> I can get the colours to work by starting the kernel with "nomodeset". Look at the same link, "NoModeSet.jpg".
>
> SystemRescueCD (working nouveau version) uses an older kernel:
> root@sysresccd /root % uname -a
> Linux sysresccd 3.2.28-std300-amd64 #2 SMP Tue Aug 21 18:35:38 UTC 2012 x86_64 Intel(R) Core(TM)2 CPU 6420 @ 2.13GHz GenuineIntel GNU/Linux
>
> Debian 10.2 (distorted colours) uses this kernel:
> luker@michael:~$ uname -a
> Linux michael 4.19.0-8-amd64 #1 SMP Debian 4.19.98-1 (2020-01-26) x86_64 GNU/Linux
>
> Is there a configuration setting in nouveau that causes those weird colours?
> Bit order/byte order maybe?

As you might suspect, there have been a few changes here and there
between v3.2, released in 2012, and v4.19, released in 2018. Could you
perhaps try a couple of Ubuntu (or pick-your-favorite-distro) LiveUSB
releases to see if you can narrow it down at all? You don't have to
install them, just booting them should reveal the issues, most likely.

This looks like either a messed up LUT, or a disagreement in color
layout in the framebuffer, e.g. RGB565 vs XRGB1555. The underlying
picture still has the correct shape, so it's not a 4- vs 2-byte
confusion. XRGB8888 vs XBGR8888 would look differently wrong, so it's
not the byte order (which the scanout engine does support flipping,
but we don't expose that in nouveau right now).

Does the vt console look OK? i.e. light-gray text on black background?
If you have colors in your shell, do they seem OK too?

Cheers,

  -ilia
