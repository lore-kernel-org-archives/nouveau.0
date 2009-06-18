From: Dirk Thierbach <dthierbach-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Syncing to vblank for interlaced video modes
Date: Thu, 18 Jun 2009 11:44:47 +0200
Message-ID: <20090618094447.GA4846@feanor>
References: <20090614183442.GA13749@feanor>
	<3d374d00906141158h28a7d688re1133b656dcdb6c5@mail.gmail.com>
	<3d374d00906141556y44d5d493j330cc1ebf79e5968@mail.gmail.com>
	<20090615070356.GA4197@feanor>
	<3d374d00906150044h7ea2a845y189e070026ee9fc8@mail.gmail.com>
	<20090615104352.GA5974@feanor>
	<3d374d00906150601t5ddd1592i47b1323e0956967b@mail.gmail.com>
	<20090616001405.b4242c25.hutts@internode.on.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090616001405.b4242c25.hutts-CkBdp7X+a1oIQCUVoCVjmQ@public.gmane.org>
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

On Tue, Jun 16, 2009 at 12:14:05AM +1000, Jamie Smith wrote:

> Yes, this is what I'm proposing.  A server option that modifies the
> behaviour of the sync code so that if a) the option is set and b)
> the current video mode is interlaced, then wait until after the
> second field has been drawn before flipping pages/updating buffers
> etc.

>>>>> Because then you'd effectively halve the frame rate in interlaced
>>>>> modes, unless you somehow queue all the information for the second
>>>>> half-frame.

> Yes you would but that'd not necessarily a bad thing on an
> interlaced display.  You'll have slower but less juddering animation
> with full solid frames.

Then the question is why the used interlace for TVs in the first place :-)
The purpose really is to get better resolution in time, trading of
vertical resolution.

And whether this is used or not should be decided on a per application
basis.

>>> But that will only work in the very particular case that you're
>>> displaying a video full-screen, with the *intention* to let the
>>> hardware do the interlacing. Which doesn't match the usual usage
>>> of Xv, for example. So you're introducing a special case without
>>> marking it as a special case explicitely. That's a bad idea in
>>> my book. KISS.

> Actually it's a much simpler situation as I described above.  Full
> screen/windowed mode is not a factor.  

Yes, it is, because it requires the application to put the information
for two half-frames in one frame, if it wants to use the full frame rate.

If the video overlay is not full screen and the video source doesn't
have the same amount of lines as the TV screen, then that is not so
easy. So interesting things already happen when you try to play an
NTSC movie on a PAL screen, say.

> My proposal does KISS.

Your proposal is simple in the sense that it requires least effort to
get the special case you're interested in working. That's called sometimes
"a quick hack" :-)

It's *not* simple in the sense that it provides a uniform interface to
the application. You have a special case, that behaves differently
from the usual case when (a) the nouveau driver is used, (b) the
option is enabled, (c) interlaced mode is active, and maybe (d) at a
particular frame rate.

So the application needs to know that in this particular case, one
frame will be displayed in two half-frames. In all other cases, one
frame will be displayed as one frame, whether halved or not.

OTOH, with the SYNC extension, the application only needs to check
if the extension is available and there's a counter present, it can
sync interlaced source material to that counter. All other applications
work like before. Say, when you want to play a game, it will output
animated frames at full 50/60Hz and nearly full vertical solution
(because the eye compensates).

> I can confirm that xine does it too.  

I'm using xine myself, and I've never noticed that (but maybe
I changed the default to deinterlacing long ago and forgot).

> They all do it as far as I know.  

I don't doubt that all movie players can do "weaving" on demand,
but I really don't think that this means this is the only sensible way.

> It makes sense to do it this way, windowed or full screen, and that
> is what creates the artifacts on a progressive display, and why the
> need for deinterlacing to begin with.

Exactly. So it actually *doesn't* make sense to do it this way. Because
it causes artifacts. It's just very easy to do, from a programming
point of view.

> Old interlaced CRTCs have their own magic deinterlacing, 

They do? I've worked with monitors that needed interlaced modes for
higher resolutions back then, and I've never seen any "magic
deinterlacing". It's the eye and the brain which do that.

> and LCDs try to replicate that.

LCDs have the problem that they can't display interlaced material in the
same way as CRTs can, so they *need* some way to make up for that deficit.
Usually not with very good results.

> OK I've got lots to say on this topic: The days of applications
> having direct control and awareness of the video hardware (or any
> hardware really these days) are dead as DOS.  

This is now getting really philosophical, but just in case: We're not
talking about control on the register level. We're talking about the extra
information needed to deal with interlaced vs. non-interlaced display
in the case you want to show information that is already in interlaced 
format. Showing non-interlaced material on an interlaced display already
works fine, but the problem with your proposal is that you want to change
this second case by giving it half the framerate. If it were not for this
side-effect (breaks all applications except full screen movie playing),
I'd have no objections.

> Today's applications are not written to know about or even care
> about how many FPS the video is capable of or whether it is interlaced.

And the reason for that is that on modern monitors, the frame rate is
high enough, so there's no need to care. That's *not* true for the TV
standard, which is old, which is why you run into a problem here in the
first place. If every TV could display non-interlaced 100Hz images,
we wouldn't have this discussion :-)

> Because of this principle, delaying the sync on an interlaced
> display until the second field only will not break applications
> showing progressive content on an interlaced display.  They might
> want to show 60 fps content, but they'll just do their best and drop
> the other 30 frames they can't display on a 60HZ interlaced display.

Which is bad, because they *could* have 60fps. And for my definition
of "break", this breaks them. It's not that they would crash, but they
are forced to behave worse than they could, and they can't do anything 
about it.

> Updating an interlaced display on every field is only useful to
> applications which are generating video source in real time

No. Updating on every field is useful for all applications which want
to display their output in the best possible quality.

> If the driver is changed as I suggest, not only will players
> benefit, but so will any other software that outputs animation to an
> interlaced display.

No. They won't benefit, on the contrary, they'll have output in lower
quality. Displaying one field twice decreases smoothness and decreases
temporal resolution.

Think of it this way: The reason for an interlaced image when TV
was introduced was limited bandwidth. If a non-interlaced image at
25fps is so much better than an interlaced-image at 50fps, why did
they even use interlace in the first place? They just could have designed
TVs differently. Why didn't they?

- Dirk
