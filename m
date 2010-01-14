From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [libdrm PATCH] nouveau: disable flush_notify on
	channel_free
Date: Fri, 15 Jan 2010 00:01:39 +0100
Message-ID: <6d4bc9fc1001141501q18f80be4u6f21fc0b34ab560c@mail.gmail.com>
References: <20100112143829.GD2984@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100112143829.GD2984-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

I'll push this one tomorrow if there are no complaints.

On Tue, Jan 12, 2010 at 3:38 PM, Marcin Slusarz
<marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Subject: [libdrm PATCH] nouveau: disable flush_notify on channel_free
>
> We don't want do call flush_notify when we will FIRE the RING
> a couple of lines later, because grobj bound to this channel
> might be already freed.
> ---
> =A0nouveau/nouveau_channel.c | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/nouveau/nouveau_channel.c b/nouveau/nouveau_channel.c
> index 14cf4c6..01d6681 100644
> --- a/nouveau/nouveau_channel.c
> +++ b/nouveau/nouveau_channel.c
> @@ -107,6 +107,7 @@ nouveau_channel_free(struct nouveau_channel **chan)
> =A0 =A0 =A0 =A0if (!chan || !*chan)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> =A0 =A0 =A0 =A0nvchan =3D nouveau_channel(*chan);
> + =A0 =A0 =A0 (*chan)->flush_notify =3D NULL;
> =A0 =A0 =A0 =A0*chan =3D NULL;
> =A0 =A0 =A0 =A0nvdev =3D nouveau_device(nvchan->base.device);
>
> --
> 1.6.6.rc3
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
