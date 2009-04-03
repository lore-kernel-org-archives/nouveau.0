From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau-cvs] xf86-video-nv: Branch 'master'
Date: Fri, 3 Apr 2009 10:43:37 +0200
Message-ID: <6d4bc9fc0904030143q216add58s4b2125f14fbe47c2@mail.gmail.com>
References: <20090403042615.8CCE910096@kemper.freedesktop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090403042615.8CCE910096-PlYeExAEIo6UevrW7tnuMEsOKLKoXr+P@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <darktama-PlYeExAEIo6UevrW7tnuMEsOKLKoXr+P@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

You need these ports for LVDS?

Because i know these ports are correct for dvi and friends.

So if you changed them for lvds, we need to seperate port 4 and 5 into
lvds and non-lvds.

Maarten.

On Fri, Apr 3, 2009 at 6:26 AM, Ben Skeggs
<darktama-PlYeExAEIo6UevrW7tnuMEsOKLKoXr+P@public.gmane.org> wrote:
> =A0src/nv50reg.h | =A0 =A04 ++--
> =A01 file changed, 2 insertions(+), 2 deletions(-)
>
> New commits:
> commit 11be9a982073d66a68cd3db2bfc611eb58d3ea81
> Author: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date: =A0 Fri Apr 3 12:22:04 2009 +1000
>
> =A0 =A0nv50: fix i2c port addresses
>
> diff --git a/src/nv50reg.h b/src/nv50reg.h
> index b3125ce..4e21220 100644
> --- a/src/nv50reg.h
> +++ b/src/nv50reg.h
> @@ -50,8 +50,8 @@
> =A0#define NV50_PCONNECTOR_I2C_PORT_1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 0x0000e150
> =A0#define NV50_PCONNECTOR_I2C_PORT_2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 0x0000e168
> =A0#define NV50_PCONNECTOR_I2C_PORT_3 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 0x0000e180
> -#define NV50_PCONNECTOR_I2C_PORT_4 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 0x0000e254
> -#define NV50_PCONNECTOR_I2C_PORT_5 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 0x0000e274
> +#define NV50_PCONNECTOR_I2C_PORT_4 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 0x0000e240
> +#define NV50_PCONNECTOR_I2C_PORT_5 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 0x0000e258
>
> =A0/* 0x00610024 is the state register to read, all it's bits also exist =
in 0x0061002C in the form of interrupt switches. */
> =A0#define NV50_DISPLAY_SUPERVISOR =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x00610=
024
>
> -------------------------------------------------------------------------=
-----
> _______________________________________________
> Nouveau-cvs mailing list
> Nouveau-cvs-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
> https://lists.sourceforge.net/lists/listinfo/nouveau-cvs
>
