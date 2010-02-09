From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Syncing to vblank for interlaced video modes
Date: Tue, 9 Feb 2010 13:21:44 -0500
Message-ID: <586c2acd1002091021s4cfcc1b3h55d27459ee6d43a@mail.gmail.com>
References: <20090614183442.GA13749@feanor>
	<3d374d00906141158h28a7d688re1133b656dcdb6c5@mail.gmail.com>
	<3d374d00906141556y44d5d493j330cc1ebf79e5968@mail.gmail.com>
	<20090615070356.GA4197@feanor>
	<3d374d00906150044h7ea2a845y189e070026ee9fc8@mail.gmail.com>
	<20090615104352.GA5974@feanor>
	<3d374d00906150601t5ddd1592i47b1323e0956967b@mail.gmail.com>
	<20090616001405.b4242c25.hutts@internode.on.net>
	<3d374d01002090950k45d60933k9aac481b87b62d4f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <3d374d01002090950k45d60933k9aac481b87b62d4f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Alistair Buxton <a.j.buxton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Feb 9, 2010 at 12:50 PM, Alistair Buxton <a.j.buxton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 15 June 2009 14:14, Jamie Smith <hutts-CkBdp7X+a1oIQCUVoCVjmQ@public.gmane.org> wrote:
>> Hi Again,
>>
>> It seems I've triggered off much more discussion than I originally thought I would provoke.  I forgot to actually state what I was proposing to do, but it appears that people have worked it out.
>>
>>> >> > On Sun, Jun 14, 2009 at 11:56:45PM +0100, Alistair Buxton wrote:
>>> >> >> Stupid question: Given the presence of a register which indicates the
>>> >> >> current field, why can't NVWaitVSync simply wait until the end of the
>>> >> >> second field, by doing whatever it does twice iff it is called during
>>> >> >> the first field?
>>
>> Yes, this is what I'm proposing.  A server option that modifies the behaviour of the sync code so that if a) the option is set and b) the current video mode is interlaced, then wait until after the second field has been drawn before flipping pages/updating buffers etc.
>
> [snip debate about whether this is a good idea]
>
> I have been thinking about this problem recently and I have come to
> the conclusion that it isn't necessary to change the vblank interrupt
> frequency or add any special hooks to let the player know which field
> is being shown. No drivers changes should be needed at all. It only
> requires that players are more smart about how they display interlaced
> content to the screen.
>
> At the moment, every player I know of, when interlacing is disabled,
> just does simple weaving. This is bad as when you display it on an
> interlaced screen there is no way to know which field will get
> displayed first. But there is a better way. If, each time the player
> receives a vblank interrupt, it draws the next field into the display
> (ie updating every other line on the framebuffer, and leaving the
> other lines alone) then each field is in the framebuffer for 1 whole
> frame, and no matter which framebuffer field is currently shown, the
> next one will always contain the correct next field.
>
> Effectively it is weaving, but instead of weaving each frame's field
> pair, the frame rate is doubled by weaving every sequential field pair
> even if they belong to different frames. So, assuming lower-field
> first, it would produce frames composed like:
> (1L,nothing),(1L,1U),(2L,1U),(2L,2U),(3L,2U),(3L,3U)...
>
> Why it works is kind of hard to explain without a diagram so I have made one:
>
> http://al.robotfuzz.com/~al/nouveau/path7109.png
>
> Anyway, since no driver changes are needed, this is now offtopic. But
> does anyone know a player that can do what I am describing? Or maybe
> this method of playback has a special name I am not aware of?

The problem with that is that the player is typically not copying to
the actual frame buffer, or even the same buffer that was copied to in
previous frames. It's copying to some buffer that's not guaranteed to
contain anything specific, let alone the previously copied content.
