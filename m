From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Is binary firmware still necessary for GTX660 card
 (NVE0 family) in order to use DRM and/or VDPAU video acceleration?
Date: Thu, 12 Dec 2013 07:18:48 -0500
Message-ID: <CAKb7Uvjh2hKeoyLZFAgkQotPGhALyoyRoLksfQBBk-Pp3VQPhg@mail.gmail.com>
References: <CAN39ZY-1Z=t7i8e=jFYaNH8Tj32J62da085N3uTi-P-8-rp9Uw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAN39ZY-1Z=t7i8e=jFYaNH8Tj32J62da085N3uTi-P-8-rp9Uw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Matthias Nagel <matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Dec 12, 2013 at 2:32 AM, Matthias Nagel
<matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
>
> I run the Gentoo Linux distribution and use a self-compiled Linux 3.10.17
> kernel. According to
>
> [1] http://nouveau.freedesktop.org/wiki/InstallDRM/
> [2] http://nouveau.freedesktop.org/wiki/VideoAcceleration/
>
> I need the original firmware from the binary driver in order to sucessully
> use DRM and to use VDPAU video acceleration. I used the python script from
> [2] and I had a look at the ebuild from
>
> [3] https://bugs.gentoo.org/show_bug.cgi?id=480832
>
> to extract the firmware and to place it at /lib/firmware/nouveau. But I do
> not see any dmesg output about loading the firmware. I do not see any dmesg
> output about nouveau failing to do so either. I neither do no see any
> "nouveau <pci id>: firmware: requesting nouveau/" in my kernel output.

Try booting with

nouveau.debug=PVP=debug,PBSP=debug,PPPP=debug

Note the new-found kernel output.

>
> Anyway VDPAU seems to work. If I call mplayer with "-vo vdpau -vc
> ffmpeg12vdpau,...", I don't get any error message and my CPU load drops from
> 30% to 7% for a recent mpeg transport stream 1080p video.
>
> In conclusion, do I still need the firmware? Do the information given at
> [1], [2] still apply or are they outdated?

You definitely need firmware to do vdpau (just try removing it and
reboot, and see what happens) on all NV84+ cards. AFAIK there is no
active work being done to replace the firmware on VP5 cards (nvd0+),
although that is the one that is probably the most feasible since the
actual video decoding is done with firmware that's on the card (or
with dedicated hardware, who knows) so all that's left is providing
the little "os" running on the connected falcon processors.

Unless you're booting with nouveau.NvGrUseFW=1, you don't need the
pgraph firmware. It generally tends to work for nve0 cards nowadays,
although some people have issues with hangs (e.g.
https://bugs.freedesktop.org/show_bug.cgi?id=70354,
https://bugs.freedesktop.org/show_bug.cgi?id=72180). I believe there
were a bunch of fixes to the fuc ucode in 3.11, which is probably why
Martin suggested you use a more recent kernel. But if it's working
fine for you, no need to worry about it.

  -ilia
