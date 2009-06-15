From: Jamie Smith <hutts-CkBdp7X+a1oIQCUVoCVjmQ@public.gmane.org>
Subject: Re: Syncing to vblank for interlaced video modes
Date: Tue, 16 Jun 2009 00:14:05 +1000
Message-ID: <20090616001405.b4242c25.hutts@internode.on.net>
References: <20090614183442.GA13749@feanor>
	<3d374d00906141158h28a7d688re1133b656dcdb6c5@mail.gmail.com>
	<3d374d00906141556y44d5d493j330cc1ebf79e5968@mail.gmail.com>
	<20090615070356.GA4197@feanor>
	<3d374d00906150044h7ea2a845y189e070026ee9fc8@mail.gmail.com>
	<20090615104352.GA5974@feanor>
	<3d374d00906150601t5ddd1592i47b1323e0956967b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <3d374d00906150601t5ddd1592i47b1323e0956967b-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
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

Hi Again,

It seems I've triggered off much more discussion than I originally thought I would provoke.  I forgot to actually state what I was proposing to do, but it appears that people have worked it out.

> >> > On Sun, Jun 14, 2009 at 11:56:45PM +0100, Alistair Buxton wrote:
> >> >> Stupid question: Given the presence of a register which indicates the
> >> >> current field, why can't NVWaitVSync simply wait until the end of the
> >> >> second field, by doing whatever it does twice iff it is called during
> >> >> the first field?

Yes, this is what I'm proposing.  A server option that modifies the behaviour of the sync code so that if a) the option is set and b) the current video mode is interlaced, then wait until after the second field has been drawn before flipping pages/updating buffers etc.

> >> > Because then you'd effectively halve the frame rate in interlaced
> >> > modes, unless you somehow queue all the information for the second
> >> > half-frame.

Yes you would but that'd not necessarily a bad thing on an interlaced display.  You'll have slower but less juddering animation with full solid frames.

> >> That isn't a problem, because you show both fields at the same time,
> >> and let the video card cut them up. You still get 50 fields per
> >> second, same as source.
> >
> > Ok, I think I understand now what you mean.
> >
> > But that will only work in the very particular case that you're
> > displaying a video full-screen, with the *intention* to let the
> > hardware do the interlacing. Which doesn't match the usual usage
> > of Xv, for example. So you're introducing a special case without
> > marking it as a special case explicitely. That's a bad idea in
> > my book. KISS.

Actually it's a much simpler situation as I described above.  Full screen/windowed mode is not a factor.  My proposal does KISS.

> Yes, that is exactly the intention, for eg a mythtv STB which only
> ever plays interlaced video which is the same size as the screen.
> 
> >> mplayer and vlc both do it.
> > But only when displaying video full-screen and they know the card
> > is in interlaced mode, I assume? Otherwise, that would be plain stupid,
> > because it will generate artifacts for every other use. Like displaying
> > the movie in a window.
> 
> No, they do it in window mode too, and regardless of display mode.
> Unless you specifically specify that you want deinterlacing, they keep
> both fields as a single frame. mplayer detects the framerate of an
> interlaced mpeg2 as 25 fps. When the vsync is at 50hz (per field)
> mplayer is ignoring every other vsync anyway. The problem then is that
> it has a 50% chance of ignoring the wrong vsync.

I can confirm that xine does it too.  They all do it as far as I know.  It makes sense to do it this way, windowed or full screen, and that is what creates the artifacts on a progressive display, and why the need for deinterlacing to begin with.  Old interlaced CRTCs have their own magic deinterlacing, and LCDs try to replicate that.

>> See above. It's a very special case, it behaves different in that special
> > case, it will break if the client doesn't know it behaves different and
> > wants to use it for other purpose (say, displaying a non-interlaced
> > source on an interlaced display).
> 
> Good point.
>
> > Why not use a method that works in all cases? Which is to give the
> > client explicit knowledge about which half-field is displayed
> > currently. Then the client can decide what to do.
> 

OK I've got lots to say on this topic:  The days of applications having direct control and awareness of the video hardware (or any hardware really these days) are dead as DOS.  (OK I know about Freedos, I used to use it)... The OS is charge of this sort of thing.  X11 is a perfect example - it never exposed any such details to the application layer.

Today's applications are not written to know about or even care about how many FPS the video is capable of or whether it is interlaced.  Because of this principle, delaying the sync on an interlaced display until the second field only will not break applications showing progressive content on an interlaced display.  They might want to show 60 fps content, but they'll just do their best and drop the other 30 frames they can't display on a 60HZ interlaced display.

Updating an interlaced display on every field is only useful to applications which are generating video source in real time specifically for an interlaced display (think standard television broadcasts).  Showing a progressive source updating at full refresh rate on an interlaced display is messy at best.  The second field is going to be not one but two frames ahead of the first in the best case.

> I mainly don't like the idea of having to patch all players ever made,
> plus the driver side is also more complex. But it does seem the more
> flexible solution.
> 

If the driver is changed as I suggest, not only will players benefit, but so will any other software that outputs animation to an interlaced display.  If implemented as an extra server option, then users need never know of its existence if they don't need its effect.  I really don't seen any drawbacks to this strategy, so if I'm missing something please let me know.

> At the moment I can't even get interlaced mode to work because I have
> a NV18 card, but I'm working on it.

To answer Dirk's original query, my card is a plain Geforce 6600 (NV 25 I think?).  It does interlaced just fine.
-- 
Jamie Smith <hutts-CkBdp7X+a1oIQCUVoCVjmQ@public.gmane.org>
