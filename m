From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: drm/nouveau contiguous bo check produces lots of
	output
Date: Mon, 11 Nov 2013 16:57:48 +0100
Message-ID: <5280FE7C.3030704@canonical.com>
References: <5280F855.1020900@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5280F855.1020900-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Jerry Cooperstein <coop-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

op 11-11-13 16:31, Jerry Cooperstein schreef:
> Hi:
>
> commit bd9c5a2016307164c419c5e24a46921c10e620a0
>
> (drm/nouveau: require contiguous bo for framebuffer)
> produces about 2000 lines of
>
> nouveau E[     DRM] framebuffer requires contiguous bo
>
> on system boot and more on shutdown, but I don't see other
> negative effects.  I tried deploying a trivial patch removing the check and saw
> no other problems.
>
> Is this a problem you have heard about?
>
> My hardware is an NVIDIA Geoforce G98 (8400 GS), lspci -v gives:
>
> 01:00.0 VGA compatible controller: NVIDIA Corporation G98 [GeForce 8400 GS] (rev a1) (prog-if 00 [VGA controller])
>     Subsystem: ASUSTeK Computer Inc. Device 8278
>     Flags: bus master, fast devsel, latency 0, IRQ 16
>     Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
>     Memory at d0000000 (64-bit, prefetchable) [size=256M]
>     Memory at fa000000 (64-bit, non-prefetchable) [size=32M]
>     I/O ports at cc00 [size=128]
>     Expansion ROM at fe9e0000 [disabled] [size=128K]
>     Capabilities: [60] Power Management version 3
>     Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
>     Capabilities: [78] Express Endpoint, MSI 00
>     Capabilities: [100] Virtual Channel
>     Capabilities: [128] Power Budgeting <?>
>     Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
>     Kernel driver in use: nouveau
>     Kernel modules: nouveau
>
> This appeared in the 3.12 rc kernels and is in 3.12.0
>
> If there is anything I can do to help you debug this please let me know.
> I don't understand the drm code well enough to dive in deep on my own.
It's a paranoia patch and any bo should not be created with NOUVEAU_GEM_TILE_NONCONTIG flag.
Even if it happens to work it will fail on any sufficiently fragmented vram.

What driver versions do you use?

~Maarten
