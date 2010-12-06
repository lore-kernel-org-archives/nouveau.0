From: Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Display goes off when framebuffer enabled and Kernel
 Panic with fbset
Date: Sun, 5 Dec 2010 20:35:54 -0900
Message-ID: <20101206053554.GA4066@localhost2.local>
References: <20101204072803.GA4170@localhost2.local>
	<20101204075925.GB4170@localhost2.local>
	<20101205070234.GB4102@localhost2.local>
	<20101206010422.GB4122@localhost2.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101206010422.GB4122-bi+AKbBUZKbUbxaO3c2PGA@public.gmane.org>
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

On Sun, Dec 05, 2010 at 04:04:22PM -0900, Roger wrote:
>On Sat, Dec 04, 2010 at 10:02:34PM -0900, Roger wrote:
>>Wow. This is a fluke.  I got around to the recommendation of installing the
>>latest kernel snapshot (2.6.37*), but ended up rebooting using 2.6.35 after
>>apparently recompiling nouveau-drm out of kernel driver package.
>>
>>The fluke looks to me like for this card, I need to be mighty cautious and
>>recompile the nouveau-drm modules more often -- or maybe it was the cold boot
>>-- else I get the black/white vertical bars and kernel freeze.
>>
>>
>>NV40 generation card (0x04b200b1) - G73 [GeForce 7600 GS]
>Correction, as of kernel 2.6.35, this card still seems to freeze the OS on boot
>when loading nouveau drm, but sometimes it will boot.  Sometimes loading of DRM
>on boot does work, but it seems to be a fluke if it does.  I have  yet to
>hook-up my laptop via ttyS0 to get dmesg/console output remotely... I should have though,
>but just thought of this. :-/


I hooked-up my laptop via ttyS0 and sent console from this box to my laptop
using ckermit.  Captured the logs, ran diff and found the only following
differences between a "frozen boot" and a "good boot" with Nouveau DRM:

147,148c147,148
< Detected 751.591 MHz processor.
< Calibrating delay loop (skipped), value calculated using timer frequency.. 1503.18 BogoMIPS (lpj=751591)
---
> Detected 751.678 MHz processor.
> Calibrating delay loop (skipped), value calculated using timer frequency.. 1503.35 BogoMIPS (lpj=751678)
169c169
< Total of 1 processors activated (1503.18 BogoMIPS).
---
> Total of 1 processors activated (1503.35 BogoMIPS).


A little more info on this box, it's an SMP running 2x750P3.  I went into BIOS
and reduced the "AUTO" (front side) bus speed... which is very likely set to
100MHz, and reduced it to something like 85Mhz.  Hence, under-clocking the
CPU's giving my lower CPU Mhz/BogoMIPS.  I'll report back in a few days to
report on the consistency on good boots here using Nouveau Framebuffer (DRM).

Aside from this, I got nothing as far as logging is concerned from the time the
kernel was loaded and logged the last line "Freeing unused kernel memory: 416k
freed" and the freeze with black/white verticle bars.  This is happening during
th execution of the standard init scripts, and unless something is sent to
/dev/kmsg (kernel logging), I won't see anything.  So likely no "kernel panic"
is happening else I would see it.

For reference, I never over-clock.  Everything is pretty much standard here.

Another thing I should try is using "nosmp" option.

-- 
Roger
http://rogerx.freeshell.org/
