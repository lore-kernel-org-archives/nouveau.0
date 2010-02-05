From: Keith Whitwell <keith.whitwell-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [Mesa3d-dev] [RFC] Merge of a reincarnation of the
	nouveau classic mesa driver.
Date: Fri, 5 Feb 2010 09:53:30 +0000
Message-ID: <c524168e1002050153p874c382l6219938683cad93b@mail.gmail.com>
References: <87k4uvvr3r.fsf@riseup.net>
	<b67489df1002021453w3239cbf3t1b946ea816d3e1d9@mail.gmail.com>
	<4B68B91D.8080009@vmware.com>
	<c524168e1002041039y36d0c4c4j64ce52e3d66f150a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <c524168e1002041039y36d0c4c4j64ce52e3d66f150a-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Brian Paul <brianp-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, mesa3d-dev <mesa3d-dev-TtF/mJH4Jtrk1uMJSBkQmQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Feb 4, 2010 at 6:39 PM, Keith Whitwell
<keith.whitwell-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> On Tue, Feb 2, 2010 at 11:45 PM, Brian Paul <brianp-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org> wrote:
>> Xavier Chantry wrote:
>>> On Tue, Feb 2, 2010 at 12:01 PM, Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org=
> wrote:
>>>> For a long time the gallium pipe drivers for nvidia fixed function car=
ds
>>>> (nv0x, nv1x and, to some extent, nv2x) have remained unmaintained and
>>>> godforsaken -- especially nv0x and nv1x had seen almost no progress
>>>> since their creation.
>>>>
>>>> They've recently grown a classic mesa driver which implements many new
>>>> features: texturing, hardware-accelerated tnl. However the killer
>>>> feature is "it actually draws stuff" (and if you're lucky even some
>>>> simple games at reasonable FPS) so I don't like to consider this a step
>>>> back.
>>>>
>>>> Right now it is located in a git repo here [1], "mesa-next" is the
>>>> branch I'm proposing to merge. I'll reply myself with the patches
>>>> affecting core mesa it depends on, to give them more visibility. Of
>>>> course driver-related comments are welcome too.
>>>>
>>>> [1] http://cgit.freedesktop.org/~currojerez/mesa/
>>>>
>>>
>>> I did some testing of a few opengl games, just for fun and by curiosity.
>>> Card is nv25 (64mb vram).
>>>
>>> - works perfectly
>>> openarena tremulous xmoto frozen-bubble hedgewars neverball supertux2
>>>
>>> - works with some problems
>>> * teeworlds : perfect after a hack to workaround this issue :
>>> =A0 =A0 =A0 =A0nv04_surface.c:246: nv04_surface_copy_swizzle: Assertion
>>> `!(dst->offset & 63)' failed.
>>>
>>> * foobillard : works but this error shows up :
>>> =A0 =A0 =A0 Mesa: User error: GL_STACK_OVERFLOW in glPushMatrix(mode=3D=
GL_TEXTURE, unit=3D0)
>>
>> That's a bug in foobillard. =A0I remember looking into it years ago. =A0I
>> guess nobody fixed it yet.
>
> I'm happy to pull this anytime. =A0Is it ready to go?
>
> Keith
>

I hope it's ok.  I didn't hear any complaints, anyway.

I've just pushed the merge.

Keith
