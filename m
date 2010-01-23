From: Stephane Marchesin <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Porting nouveau/ttm/drm to FreeBSD/OpenSolaris
Date: Sat, 23 Jan 2010 12:43:05 -0800
Message-ID: <6a89f9d51001231243o1cc0899aw4338c121e4af59b1@mail.gmail.com>
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
To: =?ISO-8859-1?B?Qy4gQmVyZ3N0cvZt?= <cbergstrom-Hl0AACgZOF5l57MIdRCFDg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

2010/1/23 "C. Bergstr=F6m" <cbergstrom-Hl0AACgZOF5l57MIdRCFDg@public.gmane.org>:
> Hi all,
>
> One of our (PathScale) engineers is planning to port nouveau and all
> dependencies to OpenSolaris. =A0We have two routes we can take and would
> like some feedback from the community.
>
> 1) There's an existing drm without ttm that was done by the FreeBSD
> developers. =A0Would anyone from the fbsd team like to go over some of the
> trouble they've had in porting ttm?
>
> 2) The engineer doing the work is much more familiar with Intel GEM and
> has said the following (which I don't honestly know if it's true or not)
> =A0 =A0a. Intel GEM surely will continue to be supported
> =A0 =A0b. It's already available on OpenSolaris
> =A0 =A0c. More portable than ttm
> =A0 =A0d. GEM doesn't have support for nvidia cards and is missing some
> important features. =A0(For OpenSolaris he says those can be added and is
> less effort than porting ttm)
> =A0 =A0e. Is probably better performance compared to ttm
>

How do you plan to handle "real" video memory in GEM? Will you add
support for it in the GEM common code?

Stephane
