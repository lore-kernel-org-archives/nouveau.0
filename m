From: Nils Krafft <fehmarn-rund-6WyM7rXn5Gg@public.gmane.org>
Subject: Re: TV-Out on a GeForce 2MX supported?
Date: Wed, 5 Mar 2014 20:57:56 +0100
Message-ID: <20140305195756.GA3045@reliance.ac-net>
References: <CAKb7Uvi97Yn8MOfhMiXLs+=VAd0LWEnmnF7iHyR58eKA_Pk_jg@mail.gmail.com>
Reply-To: kr-6WyM7rXn5Gg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKb7Uvi97Yn8MOfhMiXLs+=VAd0LWEnmnF7iHyR58eKA_Pk_jg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> [Mi, 05.03.2014 12:46]:
> On Wed, Mar 5, 2014 at 6:06 AM, Dirk Thierbach <dthierbach-Mmb7MZpHnFY@public.gmane.org> wrote:
> > On Wed, Mar 05, 2014 at 12:40:34AM -0500, Ilia Mirkin wrote:
> >> On Mon, Mar 3, 2014 at 5:41 PM, Nils Krafft <fehmarn-rund-6WyM7rXn5Gg@public.gmane.org> wrote:
> >> > I have here a GeForce 2MX (NV10) with a Brooktree BT869 chip for the
> >> > TV-Out.
> >
> > You can try nvtv (http://sourceforge.net/projects/nv-tv-out/). It bypasses
> > X and modesetting and programs the Brooktree and CRTC directly. I've
> > no idea if it still work with modern X and/or nouveau. :-)
> >
> >> > shows me only the DVI connection (in fact it's VGA, not DVI), but not
> >> > the S-Video connection. If not supported, is this planned for future
> >> > versions?
> >
> >> The relevant hardware is not easily available, nor is hardware to
> >> consume s-video/composite connections.
> >
> > I still have some hardware for both, though I haven't used it for a long
> > time.
> >
> >> This sort of thing is probably
> >> only going to be supported if you make it happen. If you're
> >> interested, the relevant source file is
> >> drivers/gpu/drm/nouveau/dispnv04/tvnv04.c, and you'd have to add
> >> something in drivers/gpu/drm/i2c. BT* chips are usually easy to find
> >> docs for, and some of the additional details can probably be worked
> >> out from mmiotraces, assuming you can find a kernel that the blob
> >> driver will load on.
> >
> > It's much better to work from the datasheet instead of doing mmiotraces,
> > the blob only has a few modes built-in.
> >
> > The BT is actually a very flexible chip, and supports a very wide range
> > of modes with different overscan amount, plus different filtering options.
> >
> > It probably wouldn't be hard to just take a few modes from nvtv and
> > put them into nouveau, similar to the (very few) Chrontel modes. What's
> > missing is some sort of infrastructure in X to say "look, on this hardware
> > there are these two functional blocks (CRTC + BT), I would like to program
> > with the following values, and I've specified the values in the config
> > file, or I'm a user space program and provide these values over some X
> > extension".
> >
> > This is even more effort now that modesetting is in the kernel (back
> > when nvtv was written, it wasn't).
> >
> > Without this, you are pretty much stuck with precalculated modes.
> > Which isn't optimal, because with small overscan the timing gets a bit
> > fickle, and with larger overscan you get the ugly border, and every
> > analog TV is different in that respect.
> 
> I actually checked this out last night, grabbed the BT869 datasheet.
> Basically you'd have to implement something similar to the ch7006
> driver (see drivers/gpu/drm/i2c), which provides an API for setting
> modes (the BT869 appears to have 8 of them, of which I'm guessing only
> 4 are actually usable, probably the RGB ones). Then you'd need to work
> out what the I2C index of it is, which you can tell by checking the
> VBIOS. Of course, this all requires the relevant hardware.
> 
> The stuff about overscan/etc are exposed as KMS properties (which in
> turn appear in xrandr) and not specific to the BT869. The i2c driver
> is supposed to expose a ->mode_set() function, which takes a
> drm_display_mode.
> 
>   -ilia
> 

Meanwhile I fiddled about with nvtv and found out that it still works
fine. The trick is that I have to switch the X-server to the desired
TV-Out resolution before activating the TV-Out, otherwise the X-server
freezes.

Doing the TV-Out via xrandr and Xinerama would be much more
comfortable, but I understand that nowadays (with HDMI and such stuff)
S-Video is nearly a "dead horse", so it obviously does not make much
sense to spend great efforts here. But if anyone with sufficient
knowledge (i. e. not me...) has enough spare time and feels like doing
this, I would really appreciate it :-)

Thanks for your support and your work on Nouveau.


Regards,
Nils
