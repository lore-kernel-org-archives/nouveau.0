From: Alistair Buxton <a.j.buxton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Syncing to vblank for interlaced video modes
Date: Mon, 15 Jun 2009 14:01:32 +0100
Message-ID: <3d374d00906150601t5ddd1592i47b1323e0956967b@mail.gmail.com>
References: <20090614183442.GA13749@feanor>
	<3d374d00906141158h28a7d688re1133b656dcdb6c5@mail.gmail.com>
	<3d374d00906141556y44d5d493j330cc1ebf79e5968@mail.gmail.com>
	<20090615070356.GA4197@feanor>
	<3d374d00906150044h7ea2a845y189e070026ee9fc8@mail.gmail.com>
	<20090615104352.GA5974@feanor>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090615104352.GA5974@feanor>
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

2009/6/15 Dirk Thierbach <dthierbach-Mmb7MZpHnFY@public.gmane.org>:
> On Mon, Jun 15, 2009 at 08:44:26AM +0100, Alistair Buxton wrote:
>> 2009/6/15 Dirk Thierbach <dthierbach-Mmb7MZpHnFY@public.gmane.org>:
>> > On Sun, Jun 14, 2009 at 11:56:45PM +0100, Alistair Buxton wrote:
>> >> Stupid question: Given the presence of a register which indicates the
>> >> current field, why can't NVWaitVSync simply wait until the end of the
>> >> second field, by doing whatever it does twice iff it is called during
>> >> the first field?
>> >
>> > Because then you'd effectively halve the frame rate in interlaced
>> > modes, unless you somehow queue all the information for the second
>> > half-frame.
>
>> That isn't a problem, because you show both fields at the same time,
>> and let the video card cut them up. You still get 50 fields per
>> second, same as source.
>
> Ok, I think I understand now what you mean.
>
> But that will only work in the very particular case that you're
> displaying a video full-screen, with the *intention* to let the
> hardware do the interlacing. Which doesn't match the usual usage
> of Xv, for example. So you're introducing a special case without
> marking it as a special case explicitely. That's a bad idea in
> my book. KISS.

Yes, that is exactly the intention, for eg a mythtv STB which only
ever plays interlaced video which is the same size as the screen.

>> mplayer and vlc both do it.
>
> But only when displaying video full-screen and they know the card
> is in interlaced mode, I assume? Otherwise, that would be plain stupid,
> because it will generate artifacts for every other use. Like displaying
> the movie in a window.

No, they do it in window mode too, and regardless of display mode.
Unless you specifically specify that you want deinterlacing, they keep
both fields as a single frame. mplayer detects the framerate of an
interlaced mpeg2 as 25 fps. When the vsync is at 50hz (per field)
mplayer is ignoring every other vsync anyway. The problem then is that
it has a 50% chance of ignoring the wrong vsync.

>> They can also split the fields and scale vertically as you describe
>> (vlc calls it bob deinterlacing) but at extra CPU cost.
>
> Not if Xv does the scaling via hardware.
>> > If you just combine two adjacent half-frames, you get the typical
>> > comb-style ragged edges on fast moving objects.
>>
>> That's what happens on a none-interlaced display. On an interlaced
>> display it will look fine of course. So I can't see any problems with
>> this method.
>
> See above. It's a very special case, it behaves different in that special
> case, it will break if the client doesn't know it behaves different and
> wants to use it for other purpose (say, displaying a non-interlaced
> source on an interlaced display).

Good point.

> Why not use a method that works in all cases? Which is to give the
> client explicit knowledge about which half-field is displayed
> currently. Then the client can decide what to do.

I mainly don't like the idea of having to patch all players ever made,
plus the driver side is also more complex. But it does seem the more
flexible solution.

At the moment I can't even get interlaced mode to work because I have
a NV18 card, but I'm working on it.

-- 
Alistair Buxton
a.j.buxton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
