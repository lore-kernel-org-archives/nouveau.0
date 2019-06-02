From: Rhys Kidd <rhyskidd@gmail.com>
Subject: [PATCH 0/2] drm/nouveau/bios/init: Improve pre-PMU devinit opcode coverage
Date: Mon,  3 Jun 2019 00:13:13 +1000
Message-ID: <20190602141315.6197-1-rhyskidd@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Ilia Mirkin <imirkin@alum.mit.edu>
Cc: Rhys Kidd <rhyskidd@gmail.com>
List-Id: nouveau.vger.kernel.org

NVIDIA GPUs include a common scripting language (devinit) that can be
interpreted by a number of "engines", e.g. within a kernel-mode software
driver, the VGA BIOS or an on-board small microcontroller which provides
certain security assertions (the 'PMU').

This system allows a GPU programming sequence to be shared by multiple
entities that would not otherwise be able to execute common code.

This series adds support to nouveau for two opcodes seen on VBIOSes prior
to the locked-down PMU taking over responsibility for executing devinit
scripts.

Documentation for these two opcodes can be found at:

  https://github.com/envytools/envytools/pull/189

Rhys Kidd (2):
  drm/nouveau/bios/init: handle INIT_RESET_BEGUN devinit opcode
  drm/nouveau/bios/init: handle INIT_RESET_END devinit opcode

 .../gpu/drm/nouveau/nvkm/subdev/bios/init.c   | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

-- 
2.20.1
