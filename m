From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH] nvc0: Implement buffer_clear for this type
	of hardware
Date: Mon, 26 May 2014 16:14:44 -0400
Message-ID: <CAKb7UviJVk-fVQbeNR1qgjHFqaz0DjxjUAj99O3aZtTK5vvoeA@mail.gmail.com>
References: <53839BBA.2050501@mni.thm.de>
 <1401134038-7494-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1401134038-7494-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Before you read my comments about all the potential improvements,
congratulations on your first nouveau patch :) Well done!

On Mon, May 26, 2014 at 3:53 PM, Tobias Klausmann
<tobias.johannes.klausmann@mni.thm.de> wrote:

It's common for people to throw in a Signed-off-by line, although not
strictly required (like it is in the kernel)

Also, clear_buffer, not buffer_clear (from the subject). "for this
type of hardware" is very generic-sounding, and doesn't really add any
extra info. I'd just say

"nvc0: implement clear_buffer" or "nvc0: implement pipe->clear_buffer"

> ---
>  src/gallium/drivers/nouveau/nvc0/nvc0_surface.c | 171 ++++++++++++++++++++++++
>  1 file changed, 171 insertions(+)
>
> diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c b/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
> index 6b7c30c..987b6c4 100644
> --- a/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
> +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
> @@ -345,6 +345,176 @@ nvc0_clear_render_target(struct pipe_context *pipe,
>  }
>
>  static void
> +nvc0_clear_buffer_rgb32(struct pipe_context *pipe,
> +                        struct pipe_resource *res,
> +                        unsigned offset, unsigned size,
> +                        const void *data, int data_size)
> +{
> +   // FIXME: Find a way to do this with the GPU!

While this is hard-coded to the 12 size, nothing about this function
_requires_ that. How about calling this

nvc0_clear_buffer_cpu(...)

And making this work for all data sizes (should be just replacing 12's
with data_size). And then the FIXME (really more like TODO) belongs in
the nvc0_clear_buffer function.

> +
> +   struct nvc0_context *nvc0 = nvc0_context(pipe);
> +   struct nouveau_pushbuf *push = nvc0->base.pushbuf;
> +   struct nv04_resource *buf = nv04_resource(res);
> +
> +   struct pipe_transfer *pt;
> +   struct pipe_box pb;
> +   unsigned elements, i;
> +   union pipe_color_union color;
> +
> +      if (buf->fence_wr && !nouveau_fence_signalled(buf->fence_wr))
> +      nouveau_fence_wait(buf->fence_wr);

No need to do this. The transfer will take care of all these little
details. Also the indentation is funny... please use the same
indentation as used elsewhere in the driver -- 3 space indents, no
tabs. (This is used throughout most of, but not all of, mesa.)

> +
> +      memcpy(&color.ui, data, 12);
> +      memset(&color.ui[3], 0, 4);

What does the color union add here? Just copy things out of data directly.

> +
> +      elements = size / data_size;
> +
> +      memset(&pb, 0, sizeof(pb));
> +      pb.height = elements;

Is that right? At no point do you tell it the element size, so I think
this should just be 'size'.

> +      pb.width =  1;

Traditionally you'd set width = elements, height = 1. Not that your
way doesn't work, it's just weird. Also, perhaps I can interest you in
u_box_1d?

> +
> +      uint8_t *tf_map = buf->vtbl->transfer_map(pipe, res,
> +            0, PIPE_TRANSFER_WRITE, &pb, &pt);
> +
> +      for (i = 0; i < elements ; ++i) {
> +         memcpy(&tf_map[i*12],color.f,12);
> +      }
> +      buf->vtbl->transfer_unmap(pipe, pt);
> +}
> +
> +static void
> +nvc0_clear_buffer(struct pipe_context *pipe,
> +                  struct pipe_resource *res,
> +                  unsigned offset, unsigned size,
> +                  const void *data, int data_size)
> +{
> +   struct nvc0_context *nvc0 = nvc0_context(pipe);
> +   struct nouveau_pushbuf *push = nvc0->base.pushbuf;
> +   struct nv04_resource *buf = nv04_resource(res);
> +
> +   union pipe_color_union color;
> +   enum pipe_format dst_fmt;
> +   unsigned width, height, elements;
> +
> +   assert(res->target == PIPE_BUFFER);
> +   assert(nouveau_bo_memtype(buf->bo) == 0);
> +
> +   switch (data_size) {
> +      case 16:

The style for switch statements (which I hate, but is used everywhere
in mesa) is:

switch (...) {
case foo:
  code goes here

i.e. the 'case' is lined up to the 'switch'.

> +         dst_fmt = PIPE_FORMAT_R32G32B32A32_UINT;
> +         memcpy(&color.ui, data, 16);
> +         break;
> +      case 12:
> +         //dst_fmt = PIPE_FORMAT_R32G32B32_UINT;
> +         //memcpy(&color.ui, data, 12);
> +         //memset(&color.ui[3], 0, 4);
> +         break;
> +      case 8:
> +         dst_fmt = PIPE_FORMAT_R32G32_UINT;
> +         memcpy(&color.ui, data, 8);
> +         memset(&color.ui[2], 0, 8);
> +         break;
> +      case 4:
> +         dst_fmt = PIPE_FORMAT_R32_UINT;
> +         memcpy(&color.ui, data, 4);
> +         memset(&color.ui[1], 0, 12);
> +         break;
> +      case 2:
> +         dst_fmt = PIPE_FORMAT_R16_UINT;
> +         color.ui[0] = util_cpu_to_le32(
> +               util_le16_to_cpu(*(unsigned short *)data));
> +         memset(&color.ui[1], 0, 12);
> +         break;
> +      case 1:
> +         dst_fmt = PIPE_FORMAT_R8_UINT;
> +         color.ui[0] = util_cpu_to_le32(*(unsigned char *)data);
> +         memset(&color.ui[1], 0, 12);
> +         break;
> +      default:
> +         assert(!"Unsupported element size");
> +         return;
> +      }
> +
> +   assert(size % data_size == 0);
> +
> +   if (data_size != 12) {

How about structuring the code as

if (data_size == 12) {
  clear_buffer_cpu(...);
  return;
}

Since you don't need the fence/state update at the bottom either
(since you don't touch the state, and the GPU isn't the one doing the
work for this clear).

> +
> +      elements = size / data_size;
> +
> +      height = (elements + 16383) / 16384;
> +
> +      width = elements / height;
> +
> +      if (!PUSH_SPACE(push, 40))
> +         return;
> +
> +      PUSH_REFN (push, buf->bo, buf->domain | NOUVEAU_BO_WR);
> +
> +      BEGIN_NVC0(push, NVC0_3D(CLEAR_COLOR(0)), 4);
> +      PUSH_DATAf(push, color.f[0]);
> +      PUSH_DATAf(push, color.f[1]);
> +      PUSH_DATAf(push, color.f[2]);
> +      PUSH_DATAf(push, color.f[3]);
> +      BEGIN_NVC0(push, NVC0_3D(SCREEN_SCISSOR_HORIZ), 2);
> +      PUSH_DATA (push, width << 16);
> +      PUSH_DATA (push, height << 16);
> +
> +      BEGIN_NVC0(push, NVC0_3D(RT_CONTROL), 1);
> +      PUSH_DATA (push, 1);

You can use IMMED_NVC0 here.

> +
> +      BEGIN_NVC0(push, NVC0_3D(RT_ADDRESS_HIGH(0)), 9);
> +      PUSH_DATAh(push, buf->address + offset);
> +      PUSH_DATA (push, buf->address + offset);
> +
> +      PUSH_DATA (push, width * data_size);
> +      PUSH_DATA (push, height);
> +
> +      PUSH_DATA (push, nvc0_format_table[dst_fmt].rt);
> +      PUSH_DATA (push, 1 << 12);
> +      PUSH_DATA (push, 1);
> +      PUSH_DATA (push, 0);
> +      PUSH_DATA (push, 0);
> +
> +      BEGIN_NVC0(push, NVC0_3D(ZETA_ENABLE), 1);
> +      PUSH_DATA (push, 0);
> +      BEGIN_NVC0(push, NVC0_3D(CLEAR_BUFFERS), 1);
> +      PUSH_DATA (push, 0x3c);

You can use IMMED_NVC0 for these too. (I'm pretty sure. Feel free to
tell me it doesn't work.)

> +
> +      if (width * height != elements) {
> +         offset += width * height * data_size;
> +         width = elements - width * height;
> +         height = 1;
> +
> +         BEGIN_NVC0(push, NVC0_3D(SCREEN_SCISSOR_HORIZ), 2);
> +         PUSH_DATA (push, width << 16);
> +         PUSH_DATA (push, height << 16);
> +
> +         BEGIN_NVC0(push, NVC0_3D(RT_CONTROL), 1);
> +         PUSH_DATA (push, 1);

Do you need this RT_CONTROL thing here? It's not changing between the runs...

> +
> +         BEGIN_NVC0(push, NVC0_3D(RT_ADDRESS_HIGH(0)), 2);
> +         PUSH_DATAh(push, buf->address + offset);
> +         PUSH_DATA (push, buf->address + offset);
> +
> +         BEGIN_NVC0(push, NVC0_3D(RT_HORIZ(0)), 2);
> +         PUSH_DATA (push, width * data_size);
> +         PUSH_DATA (push, height);
> +
> +         BEGIN_NVC0(push, NVC0_3D(CLEAR_BUFFERS), 1);
> +         PUSH_DATA (push, 0x3c);
> +      }
> +   }
> +   else {
> +      nvc0_clear_buffer_rgb32(pipe,res,offset,size,data,data_size);
> +   }
> +
> +   nouveau_fence_ref(nvc0->screen->base.fence.current, &buf->fence);
> +   nouveau_fence_ref(nvc0->screen->base.fence.current, &buf->fence_wr);
> +
> +   nvc0->dirty |= NVC0_NEW_FRAMEBUFFER;
> +}
> +
> +static void
>  nvc0_clear_depth_stencil(struct pipe_context *pipe,
>                           struct pipe_surface *dst,
>                           unsigned clear_flags,
> @@ -1363,4 +1533,5 @@ nvc0_init_surface_functions(struct nvc0_context *nvc0)
>     pipe->flush_resource = nvc0_flush_resource;
>     pipe->clear_render_target = nvc0_clear_render_target;
>     pipe->clear_depth_stencil = nvc0_clear_depth_stencil;
> +   pipe->clear_buffer = nvc0_clear_buffer;
>  }
> --
> 1.8.4.5
>
