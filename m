From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 0/3] ARB_viewport_array for nvc0
Date: Sat, 14 Jun 2014 11:54:27 -0400
Message-ID: <CAKb7UvjSrrDCTyG26b6yWVandZBhScOze5HVjiYxH_3TBX5fVQ@mail.gmail.com>
References: <1402756870-2207-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1402756870-2207-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
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

Review comments sent; you should also add a separate patch that marks
off ARB_viewport_array in GL3.txt and adds it to relnotes for 10.3.

On Sat, Jun 14, 2014 at 10:41 AM, Tobias Klausmann
<tobias.johannes.klausmann@mni.thm.de> wrote:
> This patch-series implements the ARB_viewport_array for nvc0 and does
> a little house-cleanig afterwords.
>
> Tobias Klausmann (3):
>   nvc0: implement multiple viewports/scissors, enable ARB_viewport_array
>   nvc0: mark scissor in nvc0_clear_{}
>   nv50/ir: Remove NV50_SEMANTIC_VIEWPORTINDEX and its last consumer
>
>  .../drivers/nouveau/codegen/nv50_ir_driver.h       |   1 -
>  .../nouveau/codegen/nv50_ir_target_nv50.cpp        |   1 -
>  src/gallium/drivers/nouveau/nvc0/nvc0_context.h    |   7 +-
>  src/gallium/drivers/nouveau/nvc0/nvc0_program.c    |   2 +-
>  src/gallium/drivers/nouveau/nvc0/nvc0_screen.c     |  20 ++--
>  src/gallium/drivers/nouveau/nvc0/nvc0_screen.h     |   3 +
>  src/gallium/drivers/nouveau/nvc0/nvc0_state.c      |  27 ++++-
>  .../drivers/nouveau/nvc0/nvc0_state_validate.c     | 121 +++++++++++++--------
>  src/gallium/drivers/nouveau/nvc0/nvc0_surface.c    |   3 +
>  9 files changed, 120 insertions(+), 65 deletions(-)
>
> --
> 1.8.4.5
>
