From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: running x.org on powerpc64 with nvidia6200
Date: Fri, 13 Feb 2009 22:18:00 +0200
Message-ID: <20090213221800.53fc53f2@daedalus.pq.iki.fi>
References: <49959366.2000805@gmail.com>
	<20090213211243.60d6955a@daedalus.pq.iki.fi>
	<4995CEE7.2040805@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4995CEE7.2040805-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: aik <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, 13 Feb 2009 22:49:59 +0300
aik <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Pekka Paalanen wrote:
> >> 0005:01:00.0 VGA compatible controller: nVidia Corporation NV44 [GeForce 
> >> 6200 LE] (rev a1) (prog-if 00 [VGA controller])
> >
> > Hmm, note the bus id.
> 
> I actually did, but I have no idea how to interpret this. x86 linux show 
> only 3 numbers for every device, but this server has 6 PCI roots with 
> separate bus numbering so if we want to use 3 numbers system, the bus-id 
> needs to be fixed somehow...

I've absolutely no experience about ppc, ppc64, or multiple PCI roots,
so take my advice with a grain of salt.

> >> Section "Device"
> >>         Driver      "nouveau"
> >>         VendorName  "nVidia Corporation"
> >>         BoardName   "NV44 [GeForce 6200 LE]"
> >>         BusID       "PCI:1:0:0"
> >
> > And this is a third bus id, different from the two above?
> > It's confusing at least. Try without any BusID in config?
> 
> For example? What string would at least look correct? I did try a lot of 
> them but to no avail.

I mean literally, remove the BusID line. Or is that something that is
clearly not going to work? I've never dealt with server hardware.

> >> 3. what am I doing wrong in my expirements? I can see 4 types of drivers:
> >> - original drivers coming with the fedora10 kernel (I got rid of them 
> >> before started playing with nouveau because they did not create even 
> >> /dev/fb*);
> >
> > That's the kernel framebuffer driver device, which is usually harmful
> > to accelerated X.org drivers, but since you have ppc, you probably
> > need something. The offb driver in kernel should work.
> 
> Is /dev/dri/card0 the only device node needed for X? Do not we need /dev/fb(0) as well? Or we need both, do we?

Normally, as I said, having /dev/fb* is harmful, becuase it means the
kernel fb driver is active (if using udev). On x86 it is definitely
not needed. I don't know how ppc changes this, since there is no VGA
text mode to begin with and you need some fb driver to have a text
console at all.

If you don't need /dev/fb* to have a text console, then you don't need it.
Period.

> Original I meant is the .ko which appears after compiling the Linux 
> kernel with the nVidia driver enabled as a module.

nvidiafb.ko is a kernel fb driver. Especially nvidiafb.ko breaks things.

> My point was that there can be only it OR drm driver loaded. At least, 

Yes, nvidiafb.ko and Nouveau break each other.

> the original drriver does not start (and does not create /dev/fb - I am 
> not sure tha it has to, but anyway) because it fails on reading the 
> nVidia registers in the very beginning (while executing its _probe) - 
> all the memory space mapped via PCI BAR0 is empty.
> 
> > DRM modules are the kernel part of the Nouveau driver. Without them you
> > don't get any acceleration. These are not kernel framebuffer drivers (yet,
> > at least).
> 
> But is the original (from the linux kernel tree) driver required to make 
> things working at all?

No. nvidiafb.ko and drm.ko from the Linux kernel break Nouveau.
If you need to have some kernel fb driver to have a text console,
use offb (vesafb should work with Nouveau, too, but don't all ppc's
have OF?).

You need drm.ko and nouveau.ko from DRM git repository.

> >> - x.org drivers (which I've not changed/replaced)
> >
> > nouveau_drv.so, required, from git.
> 
> It is accessed via /dev/dri/card0, right?

Which "it"?
nouveau_drv.so, also known as the nouveau DDX, accesses the 2D hardware
acceleration features via /dev/dri/card0.

/dev/dri/card0 is created, when nouveau.ko is loaded and it recognizes
the card.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
