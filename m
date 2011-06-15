From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau Ignoring invalid EDID block 1
Date: Wed, 15 Jun 2011 14:44:46 +0100
Message-ID: <op.vw4dswkx7cbmmg@emo>
References: <4DF88862.9030609@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4DF88862.9030609-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, zaverel <zaverel-GANU6spQydw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

So let see if I got this correct

Desktop card with 2 monitors connected to it

1 - Default monitor connected via DVI
2 - Second monitor (TV actually), via VGA

Even though xrandr reports display 2 to have resolution set to
1280x720 50hz, the display itself reports 1202x670 50hz

When you say linux-2.6.36-gentoo-r6, can you please state the
commit (or tag) it is based on

Before you were able to set the resolution of the TV, but
now you cannot - any messages? (either on TV or logs)

Was the TV being detected correctly before - same resolution via
xrandr and tv info?
Was the connection of the TV incorrectly being detected before
- VGA .. DVI?

Whereas for the "ERROR Raw EDID..." message my guess is that the
TV does not manage to provide the data fast enough or the connection
(cable/connectors) are not in good working order

Can you provide is the same logs but for the working kernel

Cheers


On Wed, 15 Jun 2011 11:24:34 +0100, zaverel <zaverel-GANU6spQydw@public.gmane.org> wrote:

> Hello ,
>
> All is fine except i can't change resolution on my second monitor vga
> ,tv in fact,
> (reported as DVI-I-2 ) anymore with my 9400gt.
>
>
>
> Now , i'm on :
>
> linux-2.6.39-gentoo-r1
> xorg-server-1.10.2
> xf86-video-nouveau-0.0.16_pre20110323
> libdrm-2.4.25
>
> Errors in dmesg  are:
>
> nouveau 0000:02:00.0: DVI-I-2: Ignoring invalid EDID block 1.
> [drm:drm_edid_block_valid] *ERROR* Raw EDID:
> <3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> <3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> <3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> <3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> <3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> <3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> <3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> <3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>
>
>
>
> whatever i valid with xrandr is not really do on my tv
> although xrandr say it's good , my tv always report 1202x670 50hz
>
> I tried with and without xorg.conf
>
> My last kernel working is linux-2.6.36-gentoo-r6.
>
> see you.
>
>
>
>
>
