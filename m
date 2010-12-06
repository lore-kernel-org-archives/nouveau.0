From: Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Display goes off when framebuffer enabled and Kernel
 Panic with fbset
Date: Sun, 5 Dec 2010 16:04:22 -0900
Message-ID: <20101206010422.GB4122@localhost2.local>
References: <20101204072803.GA4170@localhost2.local>
	<20101204075925.GB4170@localhost2.local>
	<20101205070234.GB4102@localhost2.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101205070234.GB4102-bi+AKbBUZKbUbxaO3c2PGA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, Dec 04, 2010 at 10:02:34PM -0900, Roger wrote:
>Wow. This is a fluke.  I got around to the recommendation of installing the
>latest kernel snapshot (2.6.37*), but ended up rebooting using 2.6.35 after
>apparently recompiling nouveau-drm out of kernel driver package.
>
>The fluke looks to me like for this card, I need to be mighty cautious and
>recompile the nouveau-drm modules more often -- or maybe it was the cold boot
>-- else I get the black/white vertical bars and kernel freeze.
>
>
>The following cards seems to work using nouveau framebuffer/Xorg:
>NV40 generation card (0x04b200b1) - G73 [GeForce 7600 GS]
Correction, as of kernel 2.6.35, this card still seems to freeze the OS on boot
when loading nouveau drm, but sometimes it will boot.  Sometimes loading of DRM
on boot does work, but it seems to be a fluke if it does.  I have  yet to
hook-up my laptop via ttyS0 to get dmesg/console output remotely... I should have though,
but just thought of this. :-/

>NV20 generation card (0x025300a3) - NV25 [GeForce4 Ti 4200]
>NV10 generation card (0x011200b2) - NV11 [GeForce2 Go]
>I only noticed some very very minor pixel disintegration when using Xorg &
>Seamonkey using LCars(?) theme colors.  Likely the LCD Display timings(?).

Duh.  Dumb user finds the "auto adjust" button on the LCD monitor. :-/

-- 
Roger
http://rogerx.freeshell.org/
