From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Fedora and direct rendering
Date: Sun, 10 Jun 2007 11:10:19 +1000
Message-ID: <1181437819.3599.1.camel@araqiel>
References: <466B3BDA.3040706@sms.ed.ac.uk>  <466B4BFC.5010401@sms.ed.ac.uk>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <466B4BFC.5010401-Y3tGgqFSo3OFxr2TtlUqVg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ioannis Nousias <s0238762-Y3tGgqFSo3OFxr2TtlUqVg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Am Sonntag, den 10.06.2007, 01:55 +0100 schrieb Ioannis Nousias:
> Ioannis Nousias wrote:
> > Hello,
> >
> > I'm using Fedora 7 and I thought I should try nouveau.  I couldn't get 
> > direct rendering to  work.
> >
> > I found out that the Mesa package that ships with Fedora 7 doesn't 
> > include a DRI interface for the nouveau module. So I fetched the latest 
> > Mesa source from git, compiled with 'mke DRI_DIRS=nouveau linux-dri-x86' 
> > and copied the produced ./lib/nouveau_dri.so in the appropriate 
> > directory (/usr/lib/dri/nouveau_dri.so).
> >
> > the driver nouveau_drv.so is provided by Fedora as well as the kernel 
> > module. I've added 'Load "glx"' and 'Load "dri"' in my xorg.conf, as 
> > well as 'Option "AIGLX" "True"'. Apart from the usual warnings from 
> > AIGLX for some unsupported visuals, there are no other warning or error 
> > messages in the Xorg.0.log
> >
> > there is an error message in the kernel log though:
> > [drm:nouveau_mem_init] *ERROR* Unable to acquire AGP: -19
> >
> >
> > for DRI I get this:
> > $ grep DRI /var/log/Xorg.0.log
> > (II) Loading extension XFree86-DRI
> > (II) NOUVEAU(0): Loaded DRI module
> > (II) NOUVEAU(0): [dri] Found DRI library version 1.3.0 and kernel module 
> > version 0.0.6
> > (II) NOUVEAU(0): [DRI] installation complete
> > (II) GLX: Initialized DRI GL provider for screen 0
> >
> >
> > for DRM I get this:
> > $ grep -i drm /var/log/Xorg.0.log
> > drmOpenDevice: node name is /dev/dri/card0
> > drmOpenDevice: open result is -1, (No such device)
> > drmOpenDevice: open result is -1, (No such device)
> > drmOpenDevice: Open failed
> > drmOpenByBusid: Searching for BusID pci:0000:01:00.0
> > drmOpenDevice: node name is /dev/dri/card0
> > drmOpenDevice: open result is 7, (OK)
> > drmOpenByBusid: drmOpenMinor returns 7
> > drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
> > drmOpenDevice: node name is /dev/dri/card0
> > drmOpenDevice: open result is 7, (OK)
> > drmOpenDevice: node name is /dev/dri/card0
> > drmOpenDevice: open result is 7, (OK)
> > drmOpenByBusid: Searching for BusID pci:0000:01:00.0
> > drmOpenDevice: node name is /dev/dri/card0
> > drmOpenDevice: open result is 7, (OK)
> > drmOpenByBusid: drmOpenMinor returns 7
> > drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
> > (II) NOUVEAU(0): [drm] DRM interface version 1.3
> > (II) NOUVEAU(0): [drm] created "nouveau" driver at busid "pci:0000:01:00.0"
> > (II) NOUVEAU(0): [drm] added 8192 byte SAREA at 0xf8abb000
> > (II) NOUVEAU(0): [drm] mapped SAREA 0xf8abb000 to 0xb7f9e000
> > (II) NOUVEAU(0): [drm] framebuffer handle = 0xf0000000
> > (II) NOUVEAU(0): [drm] added 1 reserved context for kernel
> > (II) NOUVEAU(0): [drm] installed DRM signal handler
> > drmOpenDevice: node name is /dev/dri/card0
> > drmOpenDevice: open result is 8, (OK)
> > drmOpenByBusid: Searching for BusID pci:0000:01:00.0
> > drmOpenDevice: node name is /dev/dri/card0
> > drmOpenDevice: open result is 8, (OK)
> > drmOpenByBusid: drmOpenMinor returns 8
> > drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
> >
> > and for AIGLX this:
> > (**) Option "AIGLX" "True"
> > (**) AIGLX enabled
> > (II) AIGLX: Loaded and initialized /usr/lib/dri/nouveau_dri.so
> >
> >
> > which looks promising to me.
> >
> > glxinfo reports
> > $ glxinfo | grep Mesa
> > OpenGL renderer string: Mesa DRI GeForce4 Ti 4200 Go AGP 8x 20060219 
> > x86/MMX/SSE2
> > OpenGL version string: 1.2 Mesa 7.1
> >
> > unfortunately direct rendering doesn't get enabled
> > $ glxinfo | grep direct
> > direct rendering: No
> >
> > Of course I know nouveau is in its infancy. Just playing with it I guess ;)
> >
> >
> > thank you for your hard work in building this driver.
> >
> > -Ioannis
> >
> >
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > http://lists.freedesktop.org/mailman/listinfo/nouveau
> >
> >   
> forgot to mention that I've properly set the permissions to 0666 for DRI 
> in xorg.conf
> 
Can you post the output of "LIBGL_DEBUG=verbose glxinfo"?

Btw, DRI will likely not do anything useful on your card as yet anyway.
Unless you count crashing as a useful feature :)

Cheers,
Ben.
> thanks
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
