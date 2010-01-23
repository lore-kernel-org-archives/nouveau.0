From: Robert Noland <rnoland-4LXSwLOGEL8@public.gmane.org>
Subject: Re: Porting nouveau/ttm/drm to FreeBSD/OpenSolaris
Date: Sat, 23 Jan 2010 10:15:54 -0600
Message-ID: <1264263354.2226.49.camel@balrog.2hip.net>
References: <1262755950.2346.5.camel@araqiel>
	<20100107005827.466c968e@daedalus.pq.iki.fi>
	<1262829587.2486.42.camel@balrog.2hip.net>
	<4B5ACE8C.40907@pathscale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B5ACE8C.40907-Hl0AACgZOF5l57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "\"C. =?ISO-8859-1?Q?Bergstr=F6m=22?=" <cbergstrom-Hl0AACgZOF5l57MIdRCFDg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, 2010-01-23 at 13:25 +0300, "C. Bergstr=F6m" wrote:
> Hi all,
> =

> One of our (PathScale) engineers is planning to port nouveau and all =

> dependencies to OpenSolaris.  We have two routes we can take and would =

> like some feedback from the community.
> =

> 1) There's an existing drm without ttm that was done by the FreeBSD =

> developers.  Would anyone from the fbsd team like to go over some of the =

> trouble they've had in porting ttm?

That would be me.  The primary issue for me has been that I didn't have
sufficient knowledge of our VM system to interact appropriately.  I
think that I am over that hurdle now, but there is still a lack of any
real documentation on the API, which means deciphering the Linux VM
interactions at least well enough to understand what the intention of
any given function is.

> 2) The engineer doing the work is much more familiar with Intel GEM and =

> has said the following (which I don't honestly know if it's true or not)
>     a. Intel GEM surely will continue to be supported
>     b. It's already available on OpenSolaris
>     c. More portable than ttm
>     d. GEM doesn't have support for nvidia cards and is missing some =

> important features.  (For OpenSolaris he says those can be added and is =

> less effort than porting ttm)

GEM really only deals with system memory, where TTM deals with pools of
memory from either system or device, along with different attributes.
Unfortunately, my time is very limited at the moment, so I'm unsure when
I'll actually get to work on any of this now.

robert.

>     e. Is probably better performance compared to ttm
> =

> As some of you may know our interest is currently only in executing =

> cuda-like kernels.  If it doesn't add a substantial amount of effort we =

> would like our efforts to also benefit others.  (Specifically fbsd and =

> the graphics contexts)
> =

> nouveau itself should be relatively easy to port, but what information =

> do others have with regards to the surrounding dependencies.
> =

> Thanks!
> =

> ./Christopher
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
-- =

Robert Noland <rnoland-4LXSwLOGEL8@public.gmane.org>
2Hip Networks
