From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nv20tcl and renouveau questions
Date: Thu, 22 Apr 2010 11:59:14 +0200
Message-ID: <v2sb67489df1004220259z7c967284i6680aaf7791105c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

First some data errors I get with both nv20 exa and nv20 dri/mesa.

1.
RT_FORMAT
LINEAR + X8R8G8B8
 Ch 1/5 Class 0x0597 Mthd 0x0208 Data 0x00800080:0x00000105
 Ch 1/5 Class 0x0597 Mthd 0x0208 Data 0x01000100:0x00000105
LINEAR + A8R8G8B8
 Ch 1/5 Class 0x0597 Mthd 0x0208 Data 0x01000100:0x00000108
 Ch 1/5 Class 0x0597 Mthd 0x0208 Data 0x00800080:0x00000108

The only value I found in renouveau dump was 0x00000128.

Let's look at renouveau.xml
nv20
    <reg32 offset="0x0208" name="RT_FORMAT" type="bitfield">
      <bitfield name="TYPE" high="11" low="8" type="enum"
enum_name="nv40_rendertarget_type"/>
      <bitfield name="COLOR" high="4" low="0" type="enum"
enum_name="nv40_rendertarget_color_format"/>
    </reg32>

Nothing for bit 5.

Looking at dri/mesa :
        case MESA_FORMAT_XRGB8888:
                return 0x05;
        case MESA_FORMAT_ARGB8888:
                return 0x08;
        case MESA_FORMAT_RGB565:
                return 0x03;
        case MESA_FORMAT_Z16:
                return 0x10;
        case MESA_FORMAT_Z24_S8:
                return 0x20;

Does that mean that color only goes from bit 0 to 3, and zeta is bit 4-5.
Unlike nv30 where color goes from 0 to 4, and has zeta on 5-6 ?

On nv20, 0x10 and 0x20 is valid, but not 0x40.

And it seems nv20 dri also cause data errors because it does not
always set zeta with 0x10/0x20, it only does that in depth/stencil
case.


2.
TX_FILTER(0)
MIN NEAREST + MAG NEAREST
 Ch 1/7 Class 0x0597 Mthd 0x1b14 Data 0x01010000:0x01010000

For that one, I found the 0x2000 value both in nv20 renouveau dump and nv30 exa.
nv30 exa documents it as "engine lock". Anyway idea what that is, and
how to add it to renouveau.xml ?
<bitfield name="ENGINE_LOCK" high="13" low="13" type="boolean"/> ?


3.
And finally, is this name difference RT_PITCH / COLOR0_PITCH between
nv10/nv20 and nv30/nv40 normal ?
I saw many naming inconsistencies that were more obvious, the worse
part is probably between nv30 and nv40. But not sure about that one,
if 0x20c is the same method or a different one.
nv10
    <reg32 offset="0x0208" name="RT_FORMAT" type="bitfield">
    <reg32 offset="0x020c" name="RT_PITCH" type="bitfield">
    <reg32 offset="0x0210" name="COLOR_OFFSET" type="hexa"/>
    <reg32 offset="0x0214" name="ZETA_OFFSET" type="hexa"/>
nv20
    <reg32 offset="0x0208" name="RT_FORMAT" type="bitfield">
    <reg32 offset="0x020c" name="RT_PITCH" type="bitfield">
    <reg32 offset="0x0210" name="COLOR_OFFSET" type="hexa"/>
    <reg32 offset="0x0214" name="ZETA_OFFSET" type="hexa"/>
nv30
    <reg32 offset="0x0208" name="RT_FORMAT" type="bitfield">
    <reg32 offset="0x020c" name="COLOR0_PITCH" type="bitfield">
    <reg32 offset="0x0210" name="COLOR0_OFFSET" type="hexa"/>
    <reg32 offset="0x0214" name="ZETA_OFFSET" type="hexa"/>
nv40
    <reg32 offset="0x0208" name="RT_FORMAT" type="bitfield">
    <reg32 offset="0x020c" name="COLOR0_PITCH" type="int"/>
    <reg32 offset="0x0210" name="COLOR0_OFFSET" type="hexa"/>
    <reg32 offset="0x0214" name="ZETA_OFFSET" type="hexa"/>
