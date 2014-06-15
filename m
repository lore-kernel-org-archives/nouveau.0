From: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Subject: [PATCH v2 0/3] ARB_viewport_array for nvc0
Date: Sun, 15 Jun 2014 21:24:03 +0200
Message-ID: <1402860246-24772-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
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
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org
List-Id: nouveau.vger.kernel.org

This patch-series implements the ARB_viewport_array for nvc0 and does
a little house-cleanig afterwords.

V2: 
  Add Release-Notes, mark this in GL3 as done for nvc0
  Don't mark the scissors dirty when we don't need to do that

Tobias Klausmann (3):
  nvc0: implement multiple viewports/scissors, enable ARB_viewport_array
  docs: update GL3.txt, relnotes: mark GL_ARB_viewport_array as done for
    nvc0
  nv50/ir: Remove NV50_SEMANTIC_VIEWPORTINDEX

 docs/GL3.txt                                       |   2 +-
 docs/relnotes/10.3.html                            |   1 +
 .../drivers/nouveau/codegen/nv50_ir_driver.h       |   1 -
 .../nouveau/codegen/nv50_ir_target_nv50.cpp        |   2 +-
 src/gallium/drivers/nouveau/nvc0/nvc0_context.h    |   7 +-
 src/gallium/drivers/nouveau/nvc0/nvc0_program.c    |   2 +-
 src/gallium/drivers/nouveau/nvc0/nvc0_screen.c     |  20 ++--
 src/gallium/drivers/nouveau/nvc0/nvc0_screen.h     |   3 +
 src/gallium/drivers/nouveau/nvc0/nvc0_state.c      |  27 +++--
 .../drivers/nouveau/nvc0/nvc0_state_validate.c     | 116 +++++++++++++--------
 10 files changed, 115 insertions(+), 66 deletions(-)

-- 
1.8.4.5
