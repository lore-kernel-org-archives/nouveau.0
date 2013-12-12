From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: Is binary firmware still necessary for GTX660 card
 (NVE0 family) in order to use DRM and/or VDPAU video acceleration?
Date: Thu, 12 Dec 2013 08:44:58 +0100
Message-ID: <52A9697A.4050204@free.fr>
References: <CAN39ZY-1Z=t7i8e=jFYaNH8Tj32J62da085N3uTi-P-8-rp9Uw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 12/12/2013 08:32, Matthias Nagel wrote:
> Hello,
>
> I run the Gentoo Linux distribution and use a self-compiled Linux 
> 3.10.17 kernel. According to
>
> [1] http://nouveau.freedesktop.org/wiki/InstallDRM/
> [2] http://nouveau.freedesktop.org/wiki/VideoAcceleration/
>
> I need the original firmware from the binary driver in order to 
> sucessully use DRM and to use VDPAU video acceleration. I used the 
> python script from [2] and I had a look at the ebuild from
>
> [3] https://bugs.gentoo.org/show_bug.cgi?id=480832
>
> to extract the firmware and to place it at /lib/firmware/nouveau. But 
> I do not see any dmesg output about loading the firmware. I do not see 
> any dmesg output about nouveau failing to do so either. I neither do 
> no see any "nouveau <pci id>: firmware: requesting nouveau/" in my 
> kernel output.
>
> Anyway VDPAU seems to work. If I call mplayer with "-vo vdpau -vc 
> ffmpeg12vdpau,...", I don't get any error message and my CPU load 
> drops from 30% to 7% for a recent mpeg transport stream 1080p video.
>
> In conclusion, do I still need the firmware? Do the information given 
> at [1], [2] still apply or are they outdated?

Thanks for your first hand investigation. To be honest, I can't remember 
which kernel provides a working-enough open source pgraph fw.

As you figured out, it works for you, but you should update your kernel, 
there is no point in staying on old Linux releases, at least 
Nouveau-wise. If there was a regression, let us know instead of staying 
on an old kernel.

Cheers,
Martin Peres
