From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau interrupts firewire ISO streaming
Date: Thu, 4 Feb 2010 13:49:45 +0100
Message-ID: <6d4bc9fc1002040449t7533d032gcbbff6ebf9f2f07a@mail.gmail.com>
References: <20100202131549.GI9700@ltw.loris.tv>
	<6d4bc9fc1002020535m37223f74o60d081a85990586e@mail.gmail.com>
	<20100204105839.GV9700@ltw.loris.tv>
	<6d4bc9fc1002040319y6edccf50tfc9be6c30e8df0c6@mail.gmail.com>
	<20100204123833.GY9700@ltw.loris.tv>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100204123833.GY9700-hmr3i4qI1nLZbNGZteT6vg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Adrian Knoth <adi-5gjw4BGRu82yAo/rNOIehoJPQCENF9+z@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, Feb 4, 2010 at 1:38 PM, Adrian Knoth <adi-5gjw4BGRu82yAo/rNOIehoJPQCENF9+z@public.gmane.org> wr=
ote:
> On Thu, Feb 04, 2010 at 12:19:14PM +0100, Maarten Maathuis wrote:
>
> Hi!
>
>> >> > When the X pointer changes from arrow to the vertical text selection
>> >> > bar, firewire streaming is interrupted. Same with scrolling in fire=
fox
>> >> > or hovering over a link, thus changing the pointer to "hand".
>
>> It's mostly cpu copying the cursor. Now that i think of it, we keep a
>> copy of the cursor inside the kernel, so no need to make the userspace
>> side vram too. As a quick test you could try changing VRAM to GART
>> here http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/tree/src/drm=
mode_display.c#n641.
>
> Changing to GART fixes the cursor issue. Hovering over a link now no
> longer stalls my audio streams.
>
> Is there something similar I could try to fix scrolling or even raising
> a window, thus changing the colour of the title bar? Both still
> interrupt audio.

Sounds like your situation is sensitive to accessing gpu memory
somehow, but this is just a guess. The cursor was a very special
isolated case, this is a more generic problem.

Change this to "if 1" to get some information of when cpu rendering
happens. http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/tree/src/no=
uveau_local.h#n33

You could also add some verbosity to
http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/tree/src/nouveau_exa=
.c#n291
and http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/tree/src/nouveau=
_exa.c#n302,
which would capture everything.

>
>> Assuming you don't have an agp system, otherwise you will still be
>
> PCIe.
>
>
> Cheerio
>
> --
> mail: adi-KgVc3FjDepk@public.gmane.org =A0 =A0 =A0 http://adi.thur.de =A0 =A0 =A0PGP/GPG: key =
via keyserver
>
