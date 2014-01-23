From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH v2] nv50, nvc0: clear out RT on a null cbuf
Date: Thu, 23 Jan 2014 14:39:50 -0500
Message-ID: <CAKb7UvgB_5omfkrL1mfFUYHL_3Pi8V01NzJJeo2sbKTfuNYOkA@mail.gmail.com>
References: <1389925395-22379-1-git-send-email-imirkin@alum.mit.edu>
	<52E1701A.3060203@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <52E1701A.3060203-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Jan 23, 2014 at 2:40 PM, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 17/01/14 02:23, Ilia Mirkin wrote:
>> This is needed since commit 9baa45f78b (st/mesa: bind NULL colorbuffers
>> as specified by glDrawBuffers).
>>
>> This implementation is highly based on a larger commit by
>> Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org> in his gallium-nine
>> branch.
>>
> Ilia,
> Do you know why we cannot set the rt height to 64? After all you
> explicitly set the format to NONE.

Because then the RT would have a size, which we don't want. The real
question is why not set the width to 0. It was that way in Christoph's
code, I assumed he did it that way for a reason.

>
> Either way this patch looks good afaics
> Reviewed-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
>> ---
>>  src/gallium/drivers/nouveau/nv50/nv50_defs.xml.h   |  1 +
>>  src/gallium/drivers/nouveau/nv50/nv50_formats.c    |  1 -
>>  .../drivers/nouveau/nv50/nv50_state_validate.c     | 30 +++++++++++++++++++---
>>  .../drivers/nouveau/nvc0/nvc0_state_validate.c     | 28 +++++++++++++++++---
>>  4 files changed, 52 insertions(+), 8 deletions(-)
>>
>> diff --git a/src/gallium/drivers/nouveau/nv50/nv50_defs.xml.h b/src/gallium/drivers/nouveau/nv50/nv50_defs.xml.h
>> index 2e42843..80de3be 100644
>> --- a/src/gallium/drivers/nouveau/nv50/nv50_defs.xml.h
>> +++ b/src/gallium/drivers/nouveau/nv50/nv50_defs.xml.h
>> @@ -78,6 +78,7 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>>  #define NV50_VSTATUS_BLOCKED                                 0x00000005
>>  #define NV50_VSTATUS_FAULTED                                 0x00000006
>>  #define NV50_VSTATUS_PAUSED                                  0x00000007
>> +#define NV50_SURFACE_FORMAT_NONE                             0x00000000
>>  #define NV50_SURFACE_FORMAT_BITMAP                           0x0000001c
>>  #define NV50_SURFACE_FORMAT_UNK1D                            0x0000001d
>>  #define NV50_SURFACE_FORMAT_RGBA32_FLOAT                     0x000000c0
>> diff --git a/src/gallium/drivers/nouveau/nv50/nv50_formats.c b/src/gallium/drivers/nouveau/nv50/nv50_formats.c
>> index 0a7e812..d21905d 100644
>> --- a/src/gallium/drivers/nouveau/nv50/nv50_formats.c
>> +++ b/src/gallium/drivers/nouveau/nv50/nv50_formats.c
>> @@ -71,7 +71,6 @@
>>  # define U_tV  U_V
>>  #endif
>>
>> -#define NV50_SURFACE_FORMAT_NONE 0
>>  #define NV50_ZETA_FORMAT_NONE 0
>>
>>  /* for vertex buffers: */
>> diff --git a/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c b/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
>> index 86b9a23..bb05f03 100644
>> --- a/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
>> +++ b/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
>> @@ -1,6 +1,19 @@
>>
>>  #include "nv50/nv50_context.h"
>> -#include "os/os_time.h"
>> +#include "nv50/nv50_defs.xml.h"
>> +
>> +static INLINE void
>> +nv50_fb_set_null_rt(struct nouveau_pushbuf *push, unsigned i)
>> +{
>> +   BEGIN_NV04(push, NV50_3D(RT_ADDRESS_HIGH(i)), 4);
>> +   PUSH_DATA (push, 0);
>> +   PUSH_DATA (push, 0);
>> +   PUSH_DATA (push, NV50_SURFACE_FORMAT_NONE);
>> +   PUSH_DATA (push, 0);
>> +   BEGIN_NV04(push, NV50_3D(RT_HORIZ(i)), 2);
>> +   PUSH_DATA (push, 64);
>> +   PUSH_DATA (push, 0);
>> +}
>>
>>  static void
>>  nv50_validate_fb(struct nv50_context *nv50)
>> @@ -20,9 +33,18 @@ nv50_validate_fb(struct nv50_context *nv50)
>>     PUSH_DATA (push, fb->height << 16);
>>
>>     for (i = 0; i < fb->nr_cbufs; ++i) {
>> -      struct nv50_miptree *mt = nv50_miptree(fb->cbufs[i]->texture);
>> -      struct nv50_surface *sf = nv50_surface(fb->cbufs[i]);
>> -      struct nouveau_bo *bo = mt->base.bo;
>> +      struct nv50_miptree *mt;
>> +      struct nv50_surface *sf;
>> +      struct nouveau_bo *bo;
>> +
>> +      if (!fb->cbufs[i]) {
>> +         nv50_fb_set_null_rt(push, i);
>> +         continue;
>> +      }
>> +
>> +      mt = nv50_miptree(fb->cbufs[i]->texture);
>> +      sf = nv50_surface(fb->cbufs[i]);
>> +      bo = mt->base.bo;
>>
>>        array_size = MIN2(array_size, sf->depth);
>>        if (mt->layout_3d)
>> diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c b/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
>> index 0ba4bad..dd71c65 100644
>> --- a/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
>> +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
>> @@ -2,6 +2,7 @@
>>  #include "util/u_math.h"
>>
>>  #include "nvc0/nvc0_context.h"
>> +#include "nv50/nv50_defs.xml.h"
>>
>>  #if 0
>>  static void
>> @@ -54,6 +55,18 @@ nvc0_validate_zcull(struct nvc0_context *nvc0)
>>  }
>>  #endif
>>
>> +static INLINE void
>> +nvc0_fb_set_null_rt(struct nouveau_pushbuf *push, unsigned i)
>> +{
>> +   BEGIN_NVC0(push, NVC0_3D(RT_ADDRESS_HIGH(i)), 6);
>> +   PUSH_DATA (push, 0);
>> +   PUSH_DATA (push, 0);
>> +   PUSH_DATA (push, 64);
>> +   PUSH_DATA (push, 0);
>> +   PUSH_DATA (push, NV50_SURFACE_FORMAT_NONE);
>> +   PUSH_DATA (push, 0);
>> +}
>> +
>>  static void
>>  nvc0_validate_fb(struct nvc0_context *nvc0)
>>  {
>> @@ -72,9 +85,18 @@ nvc0_validate_fb(struct nvc0_context *nvc0)
>>      PUSH_DATA (push, fb->height << 16);
>>
>>      for (i = 0; i < fb->nr_cbufs; ++i) {
>> -        struct nv50_surface *sf = nv50_surface(fb->cbufs[i]);
>> -        struct nv04_resource *res = nv04_resource(sf->base.texture);
>> -        struct nouveau_bo *bo = res->bo;
>> +        struct nv50_surface *sf;
>> +        struct nv04_resource *res;
>> +        struct nouveau_bo *bo;
>> +
>> +        if (!fb->cbufs[i]) {
>> +           nvc0_fb_set_null_rt(push, i);
>> +           continue;
>> +        }
>> +
>> +        sf = nv50_surface(fb->cbufs[i]);
>> +        res = nv04_resource(sf->base.texture);
>> +        bo = res->bo;
>>
>>          BEGIN_NVC0(push, NVC0_3D(RT_ADDRESS_HIGH(i)), 9);
>>          PUSH_DATAh(push, res->address + sf->offset);
>>
>
