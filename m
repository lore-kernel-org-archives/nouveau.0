From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] libdrm: Unreference pushbuf objects on
	channel destruction
Date: Mon, 28 Dec 2009 18:08:41 -0500
Message-ID: <586c2acd0912281508n18bba995r4d214c34db5e7dbf@mail.gmail.com>
References: <4B3730C4.6000903@wp.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B3730C4.6000903-5tc4TXWwyLM@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Krzysztof Smiechowicz <deadwood-5tc4TXWwyLM@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Dec 27, 2009 at 5:02 AM, Krzysztof Smiechowicz <deadwood-5tc4TXWwyLM@public.gmane.org> wro=
te:
> (resending as git patch)
>
> - unreference pushbuf objects on channel destruction
>
>
> diff --git a/nouveau/nouveau_channel.c b/nouveau/nouveau_channel.c
> index 674c5c3..6f71f89 100644
> --- a/nouveau/nouveau_channel.c
> +++ b/nouveau/nouveau_channel.c
> @@ -111,6 +111,8 @@ nouveau_channel_free(struct nouveau_channel **chan)
>
> =A0 =A0 =A0 =A0FIRE_RING(&nvchan->base);
>
> + =A0 =A0 =A0 nouveau_pushbuf_fini(&nvchan->base);
> +
> =A0 =A0 =A0 =A0nouveau_bo_unmap(nvchan->notifier_bo);
> =A0 =A0 =A0 =A0nouveau_bo_ref(NULL, &nvchan->notifier_bo);
>
> diff --git a/nouveau/nouveau_private.h b/nouveau/nouveau_private.h
> index 784afc9..de21a6b 100644
> --- a/nouveau/nouveau_private.h
> +++ b/nouveau/nouveau_private.h
> @@ -65,6 +65,9 @@ struct nouveau_pushbuf_priv {
> =A0int
> =A0nouveau_pushbuf_init(struct nouveau_channel *);
>
> +void
> +nouveau_pushbuf_fini(struct nouveau_channel *);
> +
> =A0struct nouveau_channel_priv {
> =A0 =A0 =A0 =A0struct nouveau_channel base;
>
> diff --git a/nouveau/nouveau_pushbuf.c b/nouveau/nouveau_pushbuf.c
> index b90e923..c4053ed 100644
> --- a/nouveau/nouveau_pushbuf.c
> +++ b/nouveau/nouveau_pushbuf.c
> @@ -170,6 +170,12 @@ nouveau_pushbuf_init(struct nouveau_channel *chan)
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> +void
> +nouveau_pushbuf_fini(struct nouveau_channel *chan)
> +{
> + =A0 =A0 =A0 nouveau_pushbuf_fini_call(chan);
> +}
> +
> =A0int
> =A0nouveau_pushbuf_flush(struct nouveau_channel *chan, unsigned min)
> =A0{

Pushed both. I had to apply them by hand along with a few minor
additions since they would still not apply cleanly. They probably
needed a rebase. Thanks.
