From: Mikel Rychliski <mikel@mikelr.com>
Subject: [PATCH v2 0/2] Fix loading of platform ROM from 32-bit EFI
Date: Wed,  4 Mar 2020 22:41:24 -0500
Message-ID: <20200305034126.6989-1-mikel@mikelr.com>
Return-path: <linux-pci-owner@vger.kernel.org>
Sender: linux-pci-owner@vger.kernel.org
To: amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, Matthew Garrett <matthewgarrett@google.com>, Ben Skeggs <bskeggs@redhat.com>, Mikel Rychliski <mikel@mikelr.com>
List-Id: nouveau.vger.kernel.org

This patch series fixes an oops when loading the radeon driver on old Macs
with a 32-bit EFI implementation.

Tested on a MacPro 1,1 with a Radeon X1900 XT card and 32-bit kernel.

Mikel Rychliski (2):
  drm/radeon: Stop directly referencing iomem
  PCI: Use ioremap(), not phys_to_virt() for platform ROM

 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c             |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c | 11 ++++++++++-
 drivers/gpu/drm/radeon/radeon_bios.c                 | 12 ++++++++----
 drivers/pci/rom.c                                    |  9 ++++++---
 4 files changed, 25 insertions(+), 8 deletions(-)

-- 
2.13.7
