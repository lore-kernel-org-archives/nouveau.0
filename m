From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [RFT 00/13] iomap: Constify ioreadX() iomem argument
Date: Tue,  7 Jan 2020 17:52:57 +0100
Message-ID: <1578415992-24054-1-git-send-email-krzk__44850.4794317827$1578771224$gmane$org@kernel.org>
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
To: Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "James E.J. Bottomley" <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>, Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jiri Slaby <jirislaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nick Kossifidis <mickflemm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Luis Chamberlain <mcgrof-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Dave Jiang <dave.jiang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi,

The ioread8/16/32() and others have inconsistent interface among the
architectures: some taking address as const, some not.

It seems there is nothing really stopping all of them to take
pointer to const.

Patchset was really tested on all affected architectures.
Build testing is in progress - I hope auto-builders will point any issues.


Todo
====
Convert also string versions (ioread16_rep() etc) if this aproach looks OK.


Merging
=======
The first 5 patches - iomap, alpha, sh, parisc and powerpc - should probably go
via one tree, or even squashed into one.

All other can go separately after these get merged.

Best regards,
Krzysztof


Krzysztof Kozlowski (13):
  iomap: Constify ioreadX() iomem argument (as in generic
    implementation)
  alpha: Constify ioreadX() iomem argument (as in generic
    implementation)
  sh: Constify ioreadX() iomem argument (as in generic implementation)
  parisc: Constify ioreadX() iomem argument (as in generic
    implementation)
  powerpc: Constify ioreadX() iomem argument (as in generic
    implementation)
  arc: Constify ioreadX() iomem argument (as in generic implementation)
  drm/mgag200: Constify ioreadX() iomem argument (as in generic
    implementation)
  drm/nouveau: Constify ioreadX() iomem argument (as in generic
    implementation)
  media: fsl-viu: Constify ioreadX() iomem argument (as in generic
    implementation)
  net: wireless: ath5k: Constify ioreadX() iomem argument (as in generic
    implementation)
  net: wireless: rtl818x: Constify ioreadX() iomem argument (as in
    generic implementation)
  ntb: intel: Constify ioreadX() iomem argument (as in generic
    implementation)
  virtio: pci: Constify ioreadX() iomem argument (as in generic
    implementation)

 arch/alpha/include/asm/core_apecs.h                |  6 +--
 arch/alpha/include/asm/core_cia.h                  |  6 +--
 arch/alpha/include/asm/core_lca.h                  |  6 +--
 arch/alpha/include/asm/core_marvel.h               |  4 +-
 arch/alpha/include/asm/core_mcpcia.h               |  6 +--
 arch/alpha/include/asm/core_t2.h                   |  2 +-
 arch/alpha/include/asm/io.h                        | 12 +++---
 arch/alpha/include/asm/io_trivial.h                | 16 ++++----
 arch/alpha/include/asm/jensen.h                    |  2 +-
 arch/alpha/include/asm/machvec.h                   |  6 +--
 arch/alpha/kernel/core_marvel.c                    |  2 +-
 arch/alpha/kernel/io.c                             |  6 +--
 arch/arc/plat-axs10x/axs10x.c                      |  4 +-
 arch/parisc/include/asm/io.h                       |  4 +-
 arch/parisc/lib/iomap.c                            | 48 +++++++++++-----------
 arch/powerpc/kernel/iomap.c                        | 22 +++++-----
 arch/sh/kernel/iomap.c                             | 10 ++---
 drivers/gpu/drm/mgag200/mgag200_drv.h              |  4 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  2 +-
 drivers/media/platform/fsl-viu.c                   |  2 +-
 drivers/net/wireless/ath/ath5k/ahb.c               | 10 ++---
 .../net/wireless/realtek/rtl818x/rtl8180/rtl8180.h |  6 +--
 drivers/ntb/hw/intel/ntb_hw_gen1.c                 |  2 +-
 drivers/ntb/hw/intel/ntb_hw_gen3.h                 |  2 +-
 drivers/ntb/hw/intel/ntb_hw_intel.h                |  2 +-
 drivers/virtio/virtio_pci_modern.c                 |  6 +--
 include/asm-generic/iomap.h                        | 22 +++++-----
 include/linux/io-64-nonatomic-hi-lo.h              |  4 +-
 include/linux/io-64-nonatomic-lo-hi.h              |  4 +-
 lib/iomap.c                                        | 18 ++++----
 30 files changed, 123 insertions(+), 123 deletions(-)

-- 
2.7.4
