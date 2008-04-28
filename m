From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: "Unknown LVDS configuration bits,
 please report" - Error
Date: Mon, 28 Apr 2008 19:33:58 +0300
Message-ID: <20080428193358.451274bb@daedalus.pq.iki.fi>
References: <1209302986.2660.5.camel@wolverine>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1209302986.2660.5.camel@wolverine>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Andreas Happe <andy-L2Gnq7z6Vd1eoWH0uzbU5w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, 27 Apr 2008 15:29:46 +0200
Andreas Happe <andy-L2Gnq7z6Vd1eoWH0uzbU5w@public.gmane.org> wrote:

> The graphics card in question is:
> 01:00.0 VGA compatible controller: nVidia Corporation Quadro NVS 135M
> (rev a1)
...
> dmesg output:
> [34835.668083] [drm] Initialized drm 1.1.0 20060810
> [34837.472582] [drm] Initialized drm 1.1.0 20060810
> [34837.700618] PCI: Setting latency timer of device 0000:01:00.0 to 64
> [34837.705298] [drm] Detected an NV50 generation card (0x086b00a2)
> [34837.705313] [drm] Initialized nouveau 0.0.10 20060213 on minor 0
> [34837.705325] [drm] Used old pci detect: framebuffer loaded

"Framebuffer loaded" is usually a bad sign. The Nouveau driver does not
work reliably with a framebuffer driver loaded. Granted, there are rumours
that vesafb should work, and that on PPC you have to use the... hm, I fail
to recall the driver name, offb? Anyway, in the future it is preferred to
not use any framebuffer drivers, if possible. Nvidiafb will surely cause
pain.

But, I don't think this is an answer to your problem, this is just a
sidenote.

> I have the Xorg.0.conf copied and can send it, as it has around 90k I do
> not really want to send it to the mailing list. The lines with warnings
> or errors are:
> 
> (II) NOUVEAU(0): Attempting to locate BIOS image in PROM
> (WW) NOUVEAU(0): ... BIOS signature not found
> ..
> (EE) NOUVEAU(0): ========== unknown reg 0x00021218 ========== (couple of
> times)
> ..
> (EE) NOUVEAU(0): ========== unknown reg 0x00020060 ==========
> (EE) NOUVEAU(0): ========== unknown reg 0x00089008 ==========
> (EE) NOUVEAU(0): ========== unknown reg 0x00089028 ==========
> 
> And the final lines:
> 
> (II) NOUVEAU(0): Found LVDS manufacturer table revision 4.0
> (EE) NOUVEAU(0): LVDS table revision not currently supported
> (EE) NOUVEAU(0): Pointers to flat panel table invalid
> (II) NOUVEAU(0): Found TMDS table revision 2.0
> (WW) NOUVEAU(0): TMDS table script pointers not stubbed
> (II) NOUVEAU(0): Setting owner: 0x0.
> (II) NOUVEAU(0): Setting owner: 0x3.
> (II) NOUVEAU(0): Setting owner: 0x0.
> (II) NOUVEAU(0): Display Configuration Block version 4.0 found
> (II) NOUVEAU(0): DCB header length 27, with 10 possible entries
> Raw DCB entry 0: 01000323 00010034
> (EE) NOUVEAU(0): Unknown LVDS configuration bits, please report
> (II) NOUVEAU(0): NV50DispPreInit is called.

To my unexperienced eyes, this looks just a not-fully-supported hardware.
Have you searched the bugzilla? I guess there might already be a report
for this specific case. If not, please add a bug, so the developers can
track it.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
