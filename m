From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 0/4] nouveau/hmm: map pages after migration
Date: Tue, 3 Mar 2020 16:13:35 -0800
Message-ID: <20200304001339.8248-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Originally patch 4 was targeted for Jason's rdma tree since other HMM
related changes were queued there. Now that those have been merged,
these patches just contain changes to nouveau so they could go through
any tree. I guess Ben Skeggs' tree would be appropriate.

Changes since v2:
 Added patches 1-3 to fix some minor issues.
 Eliminated nouveau_find_svmm() since it is easily found.
 Applied Jason Gunthorpe's suggestions for nouveau_pfns_to_args().

Changes since v1:
 Rebase to linux-5.6.0-rc4
 Address Christoph Hellwig's comments


Ralph Campbell (4):
  nouveau/hmm: fix vma range check for migration
  nouveau/hmm: check for SVM initialized before migrating
  nouveau: remove useless SVM range check
  nouveau/hmm: map pages after migration

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 46 +++++++++++------
 drivers/gpu/drm/nouveau/nouveau_dmem.h |  2 +
 drivers/gpu/drm/nouveau/nouveau_svm.c  | 69 ++++++++++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_svm.h  |  5 ++
 4 files changed, 102 insertions(+), 20 deletions(-)

--=20
2.20.1
