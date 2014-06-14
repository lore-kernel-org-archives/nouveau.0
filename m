From: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Subject: [PATCH 0/3] ARB_viewport_array for nvc0
Date: Sat, 14 Jun 2014 16:41:07 +0200
Message-ID: <1402756870-2207-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
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

Tobias Klausmann (3):
  nvc0: implement multiple viewports/scissors, enable ARB_viewport_array
  nvc0: mark scissor in nvc0_clear_{}
  nv50/ir: Remove NV50_SEMANTIC_VIEWPORTINDEX and its last consumer

 .../drivers/nouveau/codegen/nv50_ir_driver.h       |   1 -
 .../nouveau/codegen/nv50_ir_target_nv50.cpp        |   1 -
 src/gallium/drivers/nouveau/nvc0/nvc0_context.h    |   7 +-
 src/gallium/drivers/nouveau/nvc0/nvc0_program.c    |   2 +-
 src/gallium/drivers/nouveau/nvc0/nvc0_screen.c     |  20 ++--
 src/gallium/drivers/nouveau/nvc0/nvc0_screen.h     |   3 +
 src/gallium/drivers/nouveau/nvc0/nvc0_state.c      |  27 ++++-
 .../drivers/nouveau/nvc0/nvc0_state_validate.c     | 121 +++++++++++++--------
 src/gallium/drivers/nouveau/nvc0/nvc0_surface.c    |   3 +
 9 files changed, 120 insertions(+), 65 deletions(-)

-- 
1.8.4.5
