From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 0/5] nvc0: fp64 preparation
Date: Fri, 18 Jul 2014 09:57:24 -0400
Message-ID: <1405691849-18853-1-git-send-email-imirkin@alum.mit.edu>
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

Most of codegen is already FP64-ready. There are a few edge-cases that I ran
into, many of which can apply even to non-fp64-enabled programs (although the
double-wide registers are not very common without fp64).

I've yet to give this a full piglit run, but wanted to send these out in case
someone wanted to comment. They do not depend on the preliminary core fp64
work.

Ilia Mirkin (5):
  nvc0: make sure that the local memory allocation is aligned to 0x10
  nv50/ir: keep track of whether the program uses fp64
  nvc0: mark shader header if fp64 is used
  nv50/ir: fix hard-coded TYPE_U32 sized register
  nv50/ir: fix phi/union sources when their def has been merged

 src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h   |  1 +
 src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp     | 15 ++++++++++++---
 src/gallium/drivers/nouveau/codegen/nv50_ir_target.cpp |  8 ++++++--
 src/gallium/drivers/nouveau/nvc0/nvc0_program.c        |  4 +++-
 4 files changed, 22 insertions(+), 6 deletions(-)

-- 
1.8.5.5
