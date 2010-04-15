From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] drm/nv20: Enable DATA_ERROR reporting
Date: Thu, 15 Apr 2010 19:35:24 +0200
Message-ID: <m2sb67489df1004151035p219ba2cvf377a5a6c62a91f3@mail.gmail.com>
References: <1271212173-11531-1-git-send-email-koriakin@0x04.net>
	<1271212173-11531-2-git-send-email-koriakin@0x04.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1271212173-11531-2-git-send-email-koriakin-mP9o5jsk0RY@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?ISO-8859-2?Q?Marcin_Ko=B6cielnicki?= <koriakin-mP9o5jsk0RY@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

2010/4/14 Marcin Ko=B6cielnicki <koriakin-mP9o5jsk0RY@public.gmane.org>:
> Signed-off-by: Marcin Ko=B6cielnicki <koriakin-mP9o5jsk0RY@public.gmane.org>
> ---
> =A0drivers/gpu/drm/nouveau/nv20_graph.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nv20_graph.c b/drivers/gpu/drm/nouve=
au/nv20_graph.c
> index d6fc0a8..bd83971 100644
> --- a/drivers/gpu/drm/nouveau/nv20_graph.c
> +++ b/drivers/gpu/drm/nouveau/nv20_graph.c
> @@ -570,7 +570,7 @@ nv20_graph_init(struct drm_device *dev)
> =A0 =A0 =A0 =A0nv_wr32(dev, NV04_PGRAPH_DEBUG_0, 0xFFFFFFFF);
> =A0 =A0 =A0 =A0nv_wr32(dev, NV04_PGRAPH_DEBUG_0, 0x00000000);
> =A0 =A0 =A0 =A0nv_wr32(dev, NV04_PGRAPH_DEBUG_1, 0x00118700);
> - =A0 =A0 =A0 nv_wr32(dev, NV04_PGRAPH_DEBUG_3, 0xF3CE0475); /* 0x4 =3D a=
uto ctx switch */
> + =A0 =A0 =A0 nv_wr32(dev, NV04_PGRAPH_DEBUG_3, 0xF3DE0475); /* 0x4 =3D a=
uto ctx switch */
> =A0 =A0 =A0 =A0nv_wr32(dev, NV10_PGRAPH_DEBUG_4, 0x00000000);
> =A0 =A0 =A0 =A0nv_wr32(dev, 0x40009C =A0 =A0 =A0 =A0 =A0 , 0x00000040);
>
> --
> 1.7.0.2
>

Relevant IRC discussion :
02:07 < curro> shining^: hahah, fun, that could explain why someone
decided to disable data errors on nv2x
02:07 < shining^> lol
02:07 < marcheu> curro: yes that's the reason
02:07 < marcheu> we couldn't get A8 to work on nv20 without removing
the error check
02:07 < marcheu> I didn't think anyone would reenable it
02:07 < shining^> ok so it was disabled on purpose. fun. and for that
exact same reason
02:07 < marcheu> yeah
02:08 < shining^> I got many data errors, I just decided to look into
the 2d one first
02:08 < shining^> which was the a8 one
02:08 < marcheu> same on nv40 btw
02:08 < darktama> hmmm, not the same
02:08 < curro> marcheu: ahh, good to know, mwk just sent a patch to reenabl=
e it
02:08 < marcheu> curro: yup noticed, wanted to reply but
02:08 < darktama> nv40 rejected A8+blending at draw time with INVALID_STATE
02:08 < darktama> we disabled STATE_CHECK to ignore that
02:09 < marcheu> darktama: I think that's reenabled in the last patch
from mwk though?
02:09 < marcheu> didn't check the bits yet though
02:09 < darktama> iirc STATE_CHECK was bit 29, i'll double-check though
02:10 < marcheu> hmm no nv40 is untouched
02:10 < darktama> nope, mwk turned on DATA_CHECK
02:12 < darktama> on nv40, A8 is valid, and blending is valid, but
combined they're not supposed to work I guess.. they just happen to
accidently for us
02:13 < marcheu> yeah
02:13 < marcheu> error reporting is overrated :p
02:13 < darktama> hehe :)
02:13 < marcheu> maybe we need comments there
02:13 < marcheu> "bit blah is disabled because blah"


So should we just completely give up because it's a dead end, or is it
still worth to investigate further ?
I would like to help, so any crazy ideas about how to find what's
going on are welcome.
