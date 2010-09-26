From: Sven Joachim <svenjoac-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Problems with the driver
Date: Sun, 26 Sep 2010 16:37:34 +0200
Message-ID: <87ocbkbmfl.fsf@turtle.gmx.de>
References: <4C9F54F2.1010108@example.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4C9F54F2.1010108-hcDgGtZH8xNBDgjK7y7TUQ@public.gmane.org> (Piotr Hosowicz's message of "Sun,
	26 Sep 2010 16:13:06 +0200")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: public-piotr-aAmyfUXO971Wk0Htik3J/w@plane.gmane.org
Cc: public-nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW-wOFGN7rlS/M9smdsby/KFg@public.gmane.org
List-Id: nouveau.vger.kernel.org




On 2010-09-26 16:13 +0200, Piotr Hosowicz wrote:

> I can build the driver, it loads, but it does not work. Please find
> attached my local data, sorry for the form, I made it a few days ago
> and would have to build a new kernel which would also not work. My
> card is 01:00.0 VGA compatible controller: nVidia Corporation G96
> [GeForce 9400 GT] (rev a1). The things stay the same, never mind how I
> try.
> [...]
> (II) LoadModule: "glx"
> (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
> (II) Module glx: vendor="NVIDIA Corporation"
> 	compiled for 4.0.2, module version = 1.0.0
> 	Module class: X.Org Server Extension
> (II) NVIDIA GLX Module  260.19.06  Mon Sep 13 04:54:41 PDT 2010
> (II) Loading extension GLX

This is the first mistake, please uninstall the NVidia binary driver.

> (II) LoadModule: "nouveau"
> (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
> (II) Module nouveau: vendor="X.Org Foundation"
> 	compiled for 1.7.7, module version = 0.0.15
> 	Module class: X.Org Video Driver
> 	ABI class: X.Org Video Driver, version 6.0
> (II) NOUVEAU driver Date:   Tue Mar 16 13:08:37 2010 +1000

And this is the second, this version does not work with Kernels later
than 2.6.33.  On Debian, install xserver-xorg-video-nouveau from
experimental to fix that.

See also http://nouveau.freedesktop.org/wiki/TroubleShooting.

Sven
