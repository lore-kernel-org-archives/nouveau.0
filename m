From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] man page: Fix the supported fb depths.
Date: Mon, 24 Aug 2009 16:07:57 +0200
Message-ID: <6d4bc9fc0908240707p40f1af97xcc60971b63ae2af@mail.gmail.com>
References: <1251122638-17936-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1251122638-17936-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Aug 24, 2009 at 4:03 PM, Francisco Jerez<currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> wro=
te:
> Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
> ---
> =A0man/nouveau.man | =A0 =A07 ++++---
> =A01 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/man/nouveau.man b/man/nouveau.man
> index 87f645a..5c4e4ae 100644
> --- a/man/nouveau.man
> +++ b/man/nouveau.man
> @@ -13,9 +13,10 @@ nouveau \- NVIDIA video driver
> =A0.fi
> =A0.SH DESCRIPTION
> =A0.B nouveau
> -is an __xservername__ driver for NVIDIA video cards. =A0The driver suppo=
rts 2D
> -acceleration and provides support for the following framebuffer depths:
> -(15,) 16 =A0and 24. =A0TrueColor visuals are supported for these depths.
> +is an __xservername__ driver for NVIDIA video cards. =A0The driver
> +supports 2D acceleration and provides support for the following
> +framebuffer depths: 16, 24 and 30. =A0TrueColor visuals are supported

30 is only supported for nv50 iirc.

> +for these depths.
>
> =A0.SH SUPPORTED HARDWARE
> =A0The
> --
> 1.6.3.3
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
