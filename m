From: Joel Holdsworth <joel.holdsworth-EQPyqoE4rJiYoAmmQSGB5AC/G2K4zDHf@public.gmane.org>
Subject: [PATCH 0/4] Some initial tidy-ups and refactoring
Date: Tue, 12 Aug 2014 10:05:05 +0100
Message-ID: <1407834309-16817-1-git-send-email-joel@airwebreathe.org.uk>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

The patches contain some tidy-up work, and refactoring that has arisen
as a by-product of my initial work on adding TV support to nv50.

Joel Holdsworth (4):
  drm/nouveau: Removed unneeded include in nvc0_fence.c
  drm/nouveau: Replaced magic numbers with defines from nouveau_reg
  drm/nouveau: Replaced copy-pasted nv_wait with nv50_wait_dpms_ctrl
    helper
  drm/nouveau: Refactored encoder create functions into common
    nv50_encoder_create helper

 drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c |  33 ++--
 drivers/gpu/drm/nouveau/nv50_display.c             | 178 ++++++++-------------
 drivers/gpu/drm/nouveau/nvc0_fence.c               |   2 -
 3 files changed, 93 insertions(+), 120 deletions(-)

-- 
1.9.1
