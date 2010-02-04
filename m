From: Adrian Knoth <adi-5gjw4BGRu82yAo/rNOIehoJPQCENF9+z@public.gmane.org>
Subject: Re: nouveau interrupts firewire ISO streaming
Date: Thu, 4 Feb 2010 11:58:39 +0100
Message-ID: <20100204105839.GV9700@ltw.loris.tv>
References: <20100202131549.GI9700@ltw.loris.tv>
	<6d4bc9fc1002020535m37223f74o60d081a85990586e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6d4bc9fc1002020535m37223f74o60d081a85990586e-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Feb 02, 2010 at 02:35:04PM +0100, Maarten Maathuis wrote:

Hi!

> > When the X pointer changes from arrow to the vertical text selection
> > bar, firewire streaming is interrupted. Same with scrolling in firefox
> > or hovering over a link, thus changing the pointer to "hand".
> >
> > Looks like nouveau is disabling interrupts now and then, which leads to
> > stalled firewire ISO streaming. I don't know what nouveau's actually
> > doing, I'm just guessing. ;)
> I don't think interrupts are disabled for uploading a cursor, more
> likely is that your firewire driver depends on the big kernel lock.

No, the firewire subsystem doesn't use BKL:

adi@hex:/usr/src/linux-2.6.33-rc6/drivers/firewire$ grep lock_kernel *
adi@hex:/usr/src/linux-2.6.33-rc6/drivers/firewire$ echo $?
1

But I don't know what happens to a BKL-free subsystem when another
subsystem calls lock_kernel.

> At the moment we still hold that. 

I only found lock_kernel() in drm_drv.c and drm_fops.c, so I guess it's
drm_ioctl, given that BKL is the culprit.


I just removed the BKL around the func call, surprisingly, my system
still worked with some minor image corruption, but it's exactly the same
issue wrt firewire. So it might not be the BKL.


What about DMA or PFIFO interrupts? I only read "interrupt" here, I
don't know if they are local to the GPU or also reach other parts of the
system. And uploading a cursor couldn't cause long DMA transfers, at
least I guess.


Cheerio

-- 
mail: adi-KgVc3FjDepk@public.gmane.org  	http://adi.thur.de	PGP/GPG: key via keyserver
