From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 0/2] drm/nouveau: Allow parsing vbios.rom with nvbios from debugfs
Date: Wed, 19 Sep 2018 13:13:50 -0400
Message-ID: <20180919171353.29648-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

This is a small patch series that adds a strap_peek file into our
debugfs, and sets the size of the vbios.rom debugfs file so that nvbios
can easily be used to parse the vbios even on systems where the normal
BIOS retrieval methods (for example, laptops that need ACPI to access
the vbios for the nvidia GPU) won't work. This should make it a little
easier to collect vbioses.

Lyude Paul (2):
  drm/nouveau: Add strap_peek to debugfs
  drm/nouveau: Add size to vbios.rom file in debugfs

 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 46 ++++++++++++++++++++---
 1 file changed, 41 insertions(+), 5 deletions(-)

-- 
2.17.1
