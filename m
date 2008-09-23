From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Fatal server error: DMA queue hang
Date: Tue, 23 Sep 2008 21:40:48 +0300
Message-ID: <20080923214048.4570e0a2@daedalus.pq.iki.fi>
References: <1222131054.6895.12.camel@dkasak>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1222131054.6895.12.camel@dkasak>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Daniel Kasak <daniel.kasak-OHsUUYflbBDsBN0MCq728g@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, 23 Sep 2008 10:50:54 +1000
Daniel Kasak <daniel.kasak-OHsUUYflbBDsBN0MCq728g@public.gmane.org> wrote:

> Greetings.
> 
> I have an aging GeForce4 MX ( integrated ). I just updated to
> Ubuntu-8.10 without considering the consequences of moving to
> xserver-1.5. Needless to say I won't be using Compiz for a while now ...
> 
> So I've tried to get nouveau drivers running ( I've been watching the
> project, but mainly waiting for a release ... now my hand has been
> forced ). I used the packages for Ubuntu at
> http://nouveau.freedesktop.org/wiki/UbuntuPackages ... I also completely
> removed nVidia's drivers. I don't have mesa drivers at this point. Do I
> need them if I only want 2D? I remember reading something about some 2D
> drivers requiring the 3D engine for some reason, but I don't even

"Engine" here refers to hardware, different engines are parts of the GPU.
2D acceleration can use 3D hardware, but that has nothing to do with
3D support for applications, it's all within the 2D driver.

> remember which driver this was for. Anyway, at this point, I'm using
> Ubuntu 8.10-beta's packaged mesa-7.1, which doesn't have the
> nouveau_dri.so ( or whatever it's called ).
> 
> When I start X, I get a very corrupted display. The mouse cursor is OK -
> everything else looks like an uninitialised memory dump. I stuff like
> this in my dmesg output:
> 
> [   70.043671] nouveau 0000:01:00.0: PCI INT A -> Link[LNKE] -> GSI 16
> (level, high) -> IRQ 16
> [   70.045958] [drm] Detected an NV17 generation card (0x01f000a5)
> [   70.045965] [drm] Initialized nouveau 0.0.11  on minor 0
> [   70.478887] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
> [   70.478926] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into
> 4x mode
> [   70.478976] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
> [   71.615566] [drm] Allocating FIFO number 0
> [   71.616691] [drm] nouveau_fifo_alloc: initialised FIFO 0
> [   71.616734] [drm] PFIFO_DMA_PUSHER - Ch 0
> [   74.414225] [drm] Allocating FIFO number 1
> [   74.414856] [drm] nouveau_fifo_alloc: initialised FIFO 1
> [   74.414867] [drm] PFIFO_DMA_PUSHER - Ch 0
...
> 
> I also get:
> Fatal server error:
> DMA queue hang: dmaPut=4e9, current=0, status=0
>  ... in my Xorg.0.log

AFAIU this means that the card crashed before it managed to
start executing a single command from the fifo.

> Full Xorg.0.log:
> http://entropy.homelinux.org/nouveau/Xorg.0.log
> 
> Full dmesg output:
> http://entropy.homelinux.org/nouveau/dmesg.txt
> 
> Is this a known issue? Is there anything else I can provide? As noted, I
> can't load up nVidia's drivers now to produce a dump ... I should have
> thought about this before ...

I spotted uvesafb in your kernel log. I'm not sure that is supposed
to work (or what it does, and it seems to fail), but you
should try without any fb driver, i.e. with the plain VGA text mode
in virtual console.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
