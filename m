From: Alistair Popple <apopple-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/5] Improve Robust Channel (RC) recovery for
 Turing
Date: Fri, 30 Oct 2020 13:36:40 +1100
Message-ID: <20201030023645.10114-1-apopple@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Alistair Popple <apopple-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an initial series of patches to improve channel recovery on Turing GPUs
with the goal of improving reliability enough to eventually enable SVM for
Turing. It's likely follow up patches will be required to fully address problems
with less trivial workloads than what I have been able to test thus far.

This series primarily addresses a number of hardware changes to interrupt layout
and channel recovery for Turing and for simple cases improves handling and
reliability of recovery.

I have been testing trivial OpenCL workloads and with this series have been able
to recover from while(1) style GPU loops and bad pointer dereferences on a
Turing GPU. However if there are less trivial tests available that have been
known to cause problems with channel recovery in the past let me know and I'll
start testing those as well.

Alistair Popple (5):
  drm/nouveau: Fix MMU fault interrupts on Turing
  drm/nouveau: Remove Turing interrupt hack
  drm/nouveau: Move Turing specific FIFO functions
  drm/nouveau: FIFO interrupt fixes for Turing
  drm/nouveau: Turing channel preemption fix

 .../gpu/drm/nouveau/nvkm/engine/fifo/gk104.c  |  46 +--
 .../gpu/drm/nouveau/nvkm/engine/fifo/gk104.h  |  32 ++
 .../gpu/drm/nouveau/nvkm/engine/fifo/tu102.c  | 364 +++++++++++++++++-
 .../gpu/drm/nouveau/nvkm/subdev/fault/tu102.c |  21 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c |   3 -
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/priv.h |   1 -
 .../gpu/drm/nouveau/nvkm/subdev/mc/tu102.c    | 113 +++++-
 7 files changed, 529 insertions(+), 51 deletions(-)

-- 
2.20.1
