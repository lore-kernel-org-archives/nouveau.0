From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] Merge of a reincarnation of the nouveau classic
	mesa driver.
Date: Tue, 2 Feb 2010 23:53:39 +0100
Message-ID: <b67489df1002021453w3239cbf3t1b946ea816d3e1d9@mail.gmail.com>
References: <87k4uvvr3r.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87k4uvvr3r.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, mesa3d-dev <mesa3d-dev-TtF/mJH4Jtrk1uMJSBkQmQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Feb 2, 2010 at 12:01 PM, Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> wrote:
> For a long time the gallium pipe drivers for nvidia fixed function cards
> (nv0x, nv1x and, to some extent, nv2x) have remained unmaintained and
> godforsaken -- especially nv0x and nv1x had seen almost no progress
> since their creation.
>
> They've recently grown a classic mesa driver which implements many new
> features: texturing, hardware-accelerated tnl. However the killer
> feature is "it actually draws stuff" (and if you're lucky even some
> simple games at reasonable FPS) so I don't like to consider this a step
> back.
>
> Right now it is located in a git repo here [1], "mesa-next" is the
> branch I'm proposing to merge. I'll reply myself with the patches
> affecting core mesa it depends on, to give them more visibility. Of
> course driver-related comments are welcome too.
>
> [1] http://cgit.freedesktop.org/~currojerez/mesa/
>

I did some testing of a few opengl games, just for fun and by curiosity.
Card is nv25 (64mb vram).

- works perfectly
openarena tremulous xmoto frozen-bubble hedgewars neverball supertux2

- works with some problems
* teeworlds : perfect after a hack to workaround this issue :
       nv04_surface.c:246: nv04_surface_copy_swizzle: Assertion
`!(dst->offset & 63)' failed.

* foobillard : works but this error shows up :
	Mesa: User error: GL_STACK_OVERFLOW in glPushMatrix(mode=GL_TEXTURE, unit=0)

* etracer : first few seconds are very very slow, then its still very
slow compared to all the other games. Also some texture problems after
a recent change.

* bzflag : full screen mode broken but window mode ok. Fonts look
weird (apparently some random corruptions)

- fails
glest : needs mesa 1.3

I think it's pretty good overall :)
