From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Nouveau_drv problem and KMS nouveau problem... please
 HELP!
Date: Thu, 13 Jan 2011 19:42:24 +0200
Message-ID: <20110113194224.7b991243@daedalus.pq.iki.fi>
References: <AANLkTikNYKonHgt-WNsRZ6pXocfNF7xpiaVmpaLZkjf7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTikNYKonHgt-WNsRZ6pXocfNF7xpiaVmpaLZkjf7-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maginot Junior <maginot.junior-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, xorg-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, 11 Jan 2011 23:57:53 -0200
Maginot Junior <maginot.junior-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> I have being in a long journey trying to make my distro to have a
> proper support for KMS/DRI. It's something of months, and still
> nothing. I must confess that understanding the KMS concept isn't
> hard, but joing all peaces to work althogether is other thing.
> 
> So after a while without proper support, I decided to start all
> over, kernel, X11, nouveau, drm, mesa, and so on.

First things first. Forget about plymouth, libdrm, Mesa and X. Make
the KMS work. For that, you only need the kernel modules. This
means you get a working framebuffer console (fbcon).

> This are some of the links that I used to guied me:
> 
> http://dri.freedesktop.org/wiki/Download
> http://www.kernel.org/pub/linux/kernel/v2.6/
> http://nouveau.freedesktop.org/wiki/
> http://nouveau.freedesktop.org/wiki/InstallDRM
> http://nouveau.freedesktop.org/wiki/KernelModeSetting
> http://dri.freedesktop.org/wiki/
> http://gnihce.wordpress.com/2010/08/17/building-dri-drivers-for-mesa-7-8-2/
> http://www.x.org/releases/X11R7.6/src/
> 
> I really don't know if I follow the right build order (if there is
> any), I may be ommiting something, but these are the main
> packages I build trying to make a proper KMS support:

Do libdrm first, after you got KMS going.


> Linux-2.6.35.7

35?? Nouveau won't build with that, what have you built, really?

> CONFIG_DRM_KMS_HELPER=m
> CONFIG_DRM=m
> CONFIG_DRM_KMS_HELPER=m
> CONFIG_DRM_TTM=m
> CONFIG_DRM_TDFX=m
> CONFIG_DRM_R128=m
> CONFIG_DRM_RADEON=m
> CONFIG_DRM_RADEON_KMS=y
> CONFIG_DRM_I810=m
> CONFIG_DRM_I830=m
> CONFIG_DRM_I915=m
> CONFIG_DRM_I915_KMS=y
> CONFIG_DRM_MGA=m
> CONFIG_DRM_SIS=m
> CONFIG_DRM_VIA=m
> CONFIG_DRM_SAVAGE=m
> CONFIG_DRM_NOUVEAU=m
> CONFIG_DRM_NOUVEAU_BACKLIGHT=y
> CONFIG_DRM_NOUVEAU_DEBUG=y
> CONFIG_DRM_I2C_CH7006=m

You are not mentioning any of the FB options. See the requirements
in InstallDRM if you build out-of-tree.

> I did downloaded nouveau master and
> nouveau-firmware-20091212.tar.gz, build them inside linux source
> directory and installed the firmwares.

Firmware is not needed. That is mentioned in InstallDRM wiki page.

I do not understand what kernel modules you took. All I know, is
that the current modules from master need at least 2.6.37-rc1 to
build.

> The problem is that booting without NOMODESET cmdline arg gives
> me a blank screen. The system is still operant (I can hit
> CTRL+ALT+DEL in dark and reboot the system). One of the last
> things that I can see before the screen goes blank is "[drm] ..."
> line If I keep 20-nouveau.conf configuration and use NOMODESET
> xorg doesn't start, commenting it and running gdm makes Xorg
> start. I do have a problem with nouveau_drv.so afaik.
> If I comment 20-nouveau.conf and boot without NOMODESET them I
> have a blank console and a buggy X.
> 
> My Xorg's log after booting with NOMODESET and 20-nouveau.conf
> NOT commented:

Nouveau cannot work without KMS. Nomodeset disables KMS.

> My Xorg's log after booting with NOMODESET and with
> 20-nouveau.conf commented
...
> [   970.095] (II) Loading sub module "fbdevhw"
> [   970.095] (II) LoadModule: "fbdevhw"
> [   970.095] (II) Loading /usr/X11/lib/X11/modules/libfbdevhw.so
> [   970.105] (II) Module fbdevhw: vendor="X.Org Foundation"
> [   970.105]    compiled for 1.9.3, module version = 0.0.2
> [   970.105]    ABI class: X.Org Video Driver, version 8.0
> [   970.105] (EE) open /dev/fb0: No such file or directory
...
> [   970.115] (II) NV(0): Initializing int10
> [   970.120] (II) NV(0): Primary V_BIOS segment is: 0xc000
> [   970.121] (--) NV(0): Console is VGA mode 0x3
> [   970.121] (II) NV(0): Creating default Display subsection in
> Screen section "Default Screen Section" for depth/fbbpp 24/32
> [   970.121] (==) NV(0): Depth 24, (--) framebuffer bpp 32
> [   970.121] (==) NV(0): RGB weight 888
> [   970.121] (==) NV(0): Default visual is TrueColor

"nv" driver is very bad, see basic question #4 in
http://nouveau.freedesktop.org/wiki/TroubleShooting
"fbdev" would be good, but KMS is not working, so that won't either.

The next time you attach logs, try to see that the lines do not
get chopped. They are hard to read, if lines are cut.

So, get your kernel module sources right, and tell exactly what
you used. Provide a complete kernel log, without any plymouth or
X. Just trying to get the basic fbcon on Nouveau.


Thanks.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
