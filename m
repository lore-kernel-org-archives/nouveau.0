From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Fix unaligned accesses for SPARC
Date: Wed, 13 Mar 2013 22:29:10 +0100
Message-ID: <20130313212910.GB10649@joi.lan>
References: <CAEk2St=L0goZW-9XfKZx0-ApzO9yKYROtusdqZeoOEB=BB+Esg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAEk2St=L0goZW-9XfKZx0-ApzO9yKYROtusdqZeoOEB=BB+Esg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Mar 12, 2013 at 10:18:41PM -0500, Patrick Baggett wrote:
>    The nouveau driver makes a number of unaligned accesses via the
>    ROM16(), ROM32() and ROM64() macros which fault on SPARC (but would be
>    transparently handled by x86 hardware). Making use of get_unaligned()
>    macro fixes the problem for me.
> 
>    diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.h
>    b/drivers/gpu/drm/nouveau/nouveau_bios.h
>    index 7ccd28f..92031f6 100644
>    --- a/drivers/gpu/drm/nouveau/nouveau_bios.h
>    +++ b/drivers/gpu/drm/nouveau/nouveau_bios.h
>    @@ -26,6 +26,8 @@
>     #include "nvreg.h"
>    +#include <asm/unaligned.h>
>    +
>     #define DCB_MAX_NUM_ENTRIES 16
>     #define DCB_MAX_NUM_I2C_ENTRIES 16
>     #define DCB_MAX_NUM_GPIO_ENTRIES 32
>    @@ -33,10 +35,10 @@
>     #define DCB_LOC_ON_CHIP 0
>    -#define ROM16(x) le16_to_cpu(*(u16 *)&(x))
>    -#define ROM32(x) le32_to_cpu(*(u32 *)&(x))
>    +#define ROM16(x) le16_to_cpu(get_unaligned((u16 *)&(x)))
>    +#define ROM32(x) le32_to_cpu(get_unaligned((u32 *)&(x)))
>     #define ROM48(x) ({ u8 *p = &(x); (u64)ROM16(p[4]) << 32 |
>    ROM32(p[0]); })
>    -#define ROM64(x) le64_to_cpu(*(u64 *)&(x))
>    +#define ROM64(x) le64_to_cpu(get_unaligned((u64 *)&(x)))
>     #define ROMPTR(d,x) ({            \
>            struct nouveau_drm *drm = nouveau_drm((d)); \
>            ROM16(x) ? &drm->vbios.data[ROM16(x)] : NULL; \

Please take a look at Documentation/SubmittingPatches and resubmit after
adapting.

IMHO, I think you should submit this patch only once you figure out how to
correctly boot and use at least basic accelerated operations, because I'm not
100% sure this is correct - 1. you have other severe issues with nouveau which
may or may not be connected to this code, 2. sparc defines get_unaligned to
__get_unaligned_be, so maybe you need to use _le variant? or maybe use
get_unaligned_le* without le*_to_cpu?.

Marcin
