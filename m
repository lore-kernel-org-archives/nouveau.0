From: Stephane Marchesin <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nv20tcl and renouveau questions
Date: Thu, 22 Apr 2010 03:05:27 -0700
Message-ID: <l2p6a89f9d51004220305r984f1fa2vca70ba9927fa28b8@mail.gmail.com>
References: <v2sb67489df1004220259z7c967284i6680aaf7791105c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <v2sb67489df1004220259z7c967284i6680aaf7791105c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Apr 22, 2010 at 02:59, Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> First some data errors I get with both nv20 exa and nv20 dri/mesa.
>
> 1.
> RT_FORMAT
> LINEAR + X8R8G8B8
> =A0Ch 1/5 Class 0x0597 Mthd 0x0208 Data 0x00800080:0x00000105
> =A0Ch 1/5 Class 0x0597 Mthd 0x0208 Data 0x01000100:0x00000105
> LINEAR + A8R8G8B8
> =A0Ch 1/5 Class 0x0597 Mthd 0x0208 Data 0x01000100:0x00000108
> =A0Ch 1/5 Class 0x0597 Mthd 0x0208 Data 0x00800080:0x00000108
>
> The only value I found in renouveau dump was 0x00000128.
>

You need to have renouveau create other buffer formats... otherwise
you'll only get 0x128 indeed.

> Let's look at renouveau.xml
> nv20
> =A0 =A0<reg32 offset=3D"0x0208" name=3D"RT_FORMAT" type=3D"bitfield">
> =A0 =A0 =A0<bitfield name=3D"TYPE" high=3D"11" low=3D"8" type=3D"enum"
> enum_name=3D"nv40_rendertarget_type"/>
> =A0 =A0 =A0<bitfield name=3D"COLOR" high=3D"4" low=3D"0" type=3D"enum"
> enum_name=3D"nv40_rendertarget_color_format"/>
> =A0 =A0</reg32>
>
> Nothing for bit 5.
>
> Looking at dri/mesa :
> =A0 =A0 =A0 =A0case MESA_FORMAT_XRGB8888:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0x05;
> =A0 =A0 =A0 =A0case MESA_FORMAT_ARGB8888:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0x08;
> =A0 =A0 =A0 =A0case MESA_FORMAT_RGB565:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0x03;
> =A0 =A0 =A0 =A0case MESA_FORMAT_Z16:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0x10;
> =A0 =A0 =A0 =A0case MESA_FORMAT_Z24_S8:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0x20;
>
> Does that mean that color only goes from bit 0 to 3, and zeta is bit 4-5.
> Unlike nv30 where color goes from 0 to 4, and has zeta on 5-6 ?
>

Probably yes. Testing in renouveau will tell you.

> On nv20, 0x10 and 0x20 is valid, but not 0x40.
>
> And it seems nv20 dri also cause data errors because it does not
> always set zeta with 0x10/0x20, it only does that in depth/stencil
> case.
>
>
> 2.
> TX_FILTER(0)
> MIN NEAREST + MAG NEAREST
> =A0Ch 1/7 Class 0x0597 Mthd 0x1b14 Data 0x01010000:0x01010000
>
> For that one, I found the 0x2000 value both in nv20 renouveau dump and nv=
30 exa.
> nv30 exa documents it as "engine lock". Anyway idea what that is, and
> how to add it to renouveau.xml ?
> <bitfield name=3D"ENGINE_LOCK" high=3D"13" low=3D"13" type=3D"boolean"/> ?
>

It's real name is not ENGINE_LOCK, we don't know what this bit is exactly.

>
> 3.
> And finally, is this name difference RT_PITCH / COLOR0_PITCH between
> nv10/nv20 and nv30/nv40 normal ?
> I saw many naming inconsistencies that were more obvious, the worse
> part is probably between nv30 and nv40. But not sure about that one,
> if 0x20c is the same method or a different one.
> nv10
> =A0 =A0<reg32 offset=3D"0x0208" name=3D"RT_FORMAT" type=3D"bitfield">
> =A0 =A0<reg32 offset=3D"0x020c" name=3D"RT_PITCH" type=3D"bitfield">
> =A0 =A0<reg32 offset=3D"0x0210" name=3D"COLOR_OFFSET" type=3D"hexa"/>
> =A0 =A0<reg32 offset=3D"0x0214" name=3D"ZETA_OFFSET" type=3D"hexa"/>
> nv20
> =A0 =A0<reg32 offset=3D"0x0208" name=3D"RT_FORMAT" type=3D"bitfield">
> =A0 =A0<reg32 offset=3D"0x020c" name=3D"RT_PITCH" type=3D"bitfield">
> =A0 =A0<reg32 offset=3D"0x0210" name=3D"COLOR_OFFSET" type=3D"hexa"/>
> =A0 =A0<reg32 offset=3D"0x0214" name=3D"ZETA_OFFSET" type=3D"hexa"/>
> nv30
> =A0 =A0<reg32 offset=3D"0x0208" name=3D"RT_FORMAT" type=3D"bitfield">
> =A0 =A0<reg32 offset=3D"0x020c" name=3D"COLOR0_PITCH" type=3D"bitfield">
> =A0 =A0<reg32 offset=3D"0x0210" name=3D"COLOR0_OFFSET" type=3D"hexa"/>
> =A0 =A0<reg32 offset=3D"0x0214" name=3D"ZETA_OFFSET" type=3D"hexa"/>
> nv40
> =A0 =A0<reg32 offset=3D"0x0208" name=3D"RT_FORMAT" type=3D"bitfield">
> =A0 =A0<reg32 offset=3D"0x020c" name=3D"COLOR0_PITCH" type=3D"int"/>
> =A0 =A0<reg32 offset=3D"0x0210" name=3D"COLOR0_OFFSET" type=3D"hexa"/>
> =A0 =A0<reg32 offset=3D"0x0214" name=3D"ZETA_OFFSET" type=3D"hexa"/>

Yes those should be renamed to RT_*

Stephane
