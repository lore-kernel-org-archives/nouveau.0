From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RESEND PATCH 0/3] nouveau: fixes for SVM
Date: Mon, 22 Jun 2020 16:38:51 -0700
Message-ID: <20200622233854.10889-1-rcampbell@nvidia.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

These are based on 5.8.0-rc2 and intended for Ben Skeggs' nouveau tree.
I believe the changes can be queued for 5.8-rcX after being reviewed.
These were part of a larger series but I'm resending them separately as
suggested by Jason Gunthorpe.
https://lore.kernel.org/linux-mm/20200619215649.32297-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org/
Note that in order to exercise/test patch 2 here, you will need a
kernel with patch 1 from the original series (the fix to mm/migrate.c).
It is safe to apply these changes before the fix to mm/migrate.c
though.

Ralph Campbell (3):
  nouveau: fix migrate page regression
  nouveau: fix mixed normal and device private page migration
  nouveau: make nvkm_vmm_ctor() and nvkm_mmu_ptp_get() static

 drivers/gpu/drm/nouveau/nouveau_dmem.c         | 10 +++++++++-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c  |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h  |  3 ---
 4 files changed, 11 insertions(+), 6 deletions(-)

-- 
2.20.1
