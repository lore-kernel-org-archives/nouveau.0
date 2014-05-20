From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 00/12] Cherry-pick nv50/nvc0 patches from
	gallium-nine
Date: Tue, 20 May 2014 19:39:54 -0400
Message-ID: <1400629206-4447-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

I went through the gallium-nine tree and picked out nouveau patches that are
general bug-fixes. The first bunch I'd like to also get into 10.2. I've
reviewed all of them and they make sense to me, but sending them out for
public review as well in case there are any objections.

Unless I hear objections, I'd like to push this by Friday.

Christoph Bumiller (11):
  nv50,nvc0: always pull out bufctx on context destruction
  nv50: setup scissors on clear_render_target/depth_stencil
  nv50,nvc0: set constbufs dirty on pipe context switch
  nv50/ir/tgsi: TGSI_OPCODE_POW replicates its result
  nv50/ir/opt: fix constant folding with saturate modifier
  nv50/ir: fix lowering of predicated instructions (without defs)
  nv50/ir/tgsi: optimize KIL
  nv50,nvc0: handle guard band defines
  nv50,nvc0: allow 15,16,30 bpp display formats
  nvc0: use PRIxPTR for sizeof()
  nvc0: assert that we have vertex elements state

Joakim Sindholt (1):
  nv50: count wrapped textures towards the tex_obj count

 .../drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp    | 11 ++++++++++-
 .../nouveau/codegen/nv50_ir_lowering_nv50.cpp        |  5 ++++-
 .../drivers/nouveau/codegen/nv50_ir_peephole.cpp     |  4 +++-
 src/gallium/drivers/nouveau/nv50/nv50_context.c      |  7 ++-----
 src/gallium/drivers/nouveau/nv50/nv50_formats.c      |  8 ++++----
 src/gallium/drivers/nouveau/nv50/nv50_miptree.c      |  2 ++
 src/gallium/drivers/nouveau/nv50/nv50_screen.c       | 10 ++++++++--
 .../drivers/nouveau/nv50/nv50_state_validate.c       |  4 ++++
 src/gallium/drivers/nouveau/nv50/nv50_surface.c      | 20 ++++++++++++++++++--
 src/gallium/drivers/nouveau/nvc0/nvc0_context.c      |  9 +++++----
 src/gallium/drivers/nouveau/nvc0/nvc0_program.c      |  2 +-
 src/gallium/drivers/nouveau/nvc0/nvc0_screen.c       | 10 ++++++++--
 .../drivers/nouveau/nvc0/nvc0_state_validate.c       |  1 +
 src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c          |  1 +
 14 files changed, 71 insertions(+), 23 deletions(-)

-- 
1.8.5.5
