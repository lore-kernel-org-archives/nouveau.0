From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 3/3] nv50/ir: Remove
 NV50_SEMANTIC_VIEWPORTINDEX and its last consumer
Date: Sat, 14 Jun 2014 11:48:41 -0400
Message-ID: <CAKb7Uvhac3RxrHieyJYJ-brWqxjdBeKBk-GNWQfWfYR57xqGSQ@mail.gmail.com>
References: <1402756870-2207-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
 <1402756870-2207-4-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1402756870-2207-4-git-send-email-tobias.johannes.klausmann@mni.thm.de>
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

On Sat, Jun 14, 2014 at 10:41 AM, Tobias Klausmann
<tobias.johannes.klausmann@mni.thm.de> wrote:
> We use TGSI_SEMANTIC_VIEWPORT_INDEX for nvc0 now as well.
>
> Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
> ---
>  src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h        | 1 -
>  src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h b/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
> index f829aac..c885c8c 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
> @@ -70,7 +70,6 @@ struct nv50_ir_varying
>  #endif
>
>  #define NV50_SEMANTIC_CLIPDISTANCE  (TGSI_SEMANTIC_COUNT + 0)
> -#define NV50_SEMANTIC_VIEWPORTINDEX (TGSI_SEMANTIC_COUNT + 4)
>  #define NV50_SEMANTIC_TESSFACTOR    (TGSI_SEMANTIC_COUNT + 7)
>  #define NV50_SEMANTIC_TESSCOORD     (TGSI_SEMANTIC_COUNT + 8)
>  #define NV50_SEMANTIC_COUNT         (TGSI_SEMANTIC_COUNT + 10)
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
> index abadc7f..7e314aa 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
> @@ -538,7 +538,6 @@ recordLocation(uint16_t *locs, uint8_t *masks,
>     case TGSI_SEMANTIC_VERTEXID: locs[SV_VERTEX_ID] = addr; break;
>     case TGSI_SEMANTIC_PRIMID: locs[SV_PRIMITIVE_ID] = addr; break;
>     case TGSI_SEMANTIC_LAYER: locs[SV_LAYER] = addr; break;
> -   case NV50_SEMANTIC_VIEWPORTINDEX: locs[SV_VIEWPORT_INDEX] = addr; break;

I know this goes against what I said earlier, but actually do you mind
flipping this over to TGSI_SEMANTIC_VIEWPORT_INDEX -- I suspect when
ARB_fragment_layer_viewport is implemented, layer/viewport might be
system values in the fragment shader.

  -ilia
