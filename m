From: Krzysztof Smiechowicz <deadwood-5tc4TXWwyLM@public.gmane.org>
Subject: Re: Porting nouveau/ttm/drm to FreeBSD/OpenSolaris
Date: Sat, 23 Jan 2010 15:20:46 +0100
Message-ID: <4B5B05BE.3080606@wp.pl>
References: <1262755950.2346.5.camel@araqiel>	<20100107005827.466c968e@daedalus.pq.iki.fi>	<1262829587.2486.42.camel@balrog.2hip.net>
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
To: =?ISO-8859-1?Q?=22C=2E_Bergstr=F6m=22?= <cbergstrom-Hl0AACgZOF5l57MIdRCFDg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

C. Bergstr=F6m pisze:
> Hi all,
> =


Hi Christopher

> nouveau itself should be relatively easy to port, but what information =

> do others have with regards to the surrounding dependencies.

I can give you some information my work porting the nouveau/drm/ttm to =

AROS (http://www.aros.org/). AROS is AmigaOS clone and it's very very =

very far in terms of API and concepts from Linux kernel so I think it's =

a good example to talk about portability.

Currently my work is only focused on 3D part, not touching the 2D part =

at all. Generally it took me about 1,5 months of evenings to port the =

current (sources from December 2009) nouvea/drm/ttm/libdrm/nouvea =

gallium driver to AROS (I would call it alpha version of the port =

though) however I have never been working with graphics or graphics =

drivers before.

In terms of portability I would rate the modules in following order =

(starting from most portable)

nouveau gallium 3D drivers
nouveau NV0X-NV40 drm drivers
libdrm
nouveau "common code" (files named nouveau_XXX)
drm "common code" (files named drm_XXX)
nouveau NV50 drm driver
ttm

Basically the only module that does not seem to be specially written =

with portability in mind and has a lot of Linux dependencies it ttm. I =

implemented some of those dependencies in my AROS port (reference =

counting, atomics, spin locks) and disabled some others (swapping =

support, work queues)

If you are interested in any specific topic, please let me know :)

Best regards,
Krzysztof
