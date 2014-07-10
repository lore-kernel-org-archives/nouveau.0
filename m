From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 0/3] nvc0: ARB_(multi_)draw_indirect support
Date: Wed,  9 Jul 2014 23:59:02 -0400
Message-ID: <1404964745-31949-1-git-send-email-imirkin@alum.mit.edu>
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
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

The main patches are from Christoph. Unfortunately they're a little beyond my
understanding of all the vertex-related details, but they generally seemed
fine. I'm just going to push these unless someone steps up to review them.

Christoph Bumiller (2):
  nvc0: add support for indirect drawing
  nvc0: fix translate path for PRIM_RESTART_WITH_DRAW_ARRAYS

Ilia Mirkin (1):
  nouveau: check if a fence has already been signalled

 docs/GL3.txt                                       |  5 +-
 docs/relnotes/10.3.html                            |  1 +
 src/gallium/drivers/nouveau/nouveau_fence.c        |  3 +
 src/gallium/drivers/nouveau/nouveau_screen.c       |  6 +-
 src/gallium/drivers/nouveau/nv50/nv50_3d.xml.h     |  2 +-
 src/gallium/drivers/nouveau/nv50/nv50_screen.c     |  2 +
 src/gallium/drivers/nouveau/nvc0/mme/com9097.mme   | 75 ++++++++++++++++++
 src/gallium/drivers/nouveau/nvc0/mme/com9097.mme.h | 56 ++++++++++++++
 src/gallium/drivers/nouveau/nvc0/nvc0_3d.xml.h     |  6 ++
 src/gallium/drivers/nouveau/nvc0/nvc0_screen.c     | 13 +++-
 src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c        | 90 ++++++++++++++++------
 .../drivers/nouveau/nvc0/nvc0_vbo_translate.c      | 41 ++++++----
 12 files changed, 254 insertions(+), 46 deletions(-)

-- 
1.8.5.5
