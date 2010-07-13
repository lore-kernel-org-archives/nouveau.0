From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [TEST REQUEST] Implementation of INIT_COMPUTE_MEM.
Date: Tue, 13 Jul 2010 18:41:47 +0200
Message-ID: <87hbk3qqpg.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1561802899=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1561802899==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

The INIT_COMPUTE_MEM opcode was one of the missing pieces for pre-nv40
card cold-booting (i.e. multicard), it's supposed to detect the right
setting for several of the memory config variables a given GPU supports
(memory type, bus width, amount of installed RAM chips).

The implementation I'm attaching seems to work on all the cards I've got
at hand, but I've done a few unproven assumptions about the many
different memory configs there are, so I'd like to get as many Acked-
and Tested-by's as possible before pushing (a cleaned up version of)
this patch.

Instructions you may follow if you have an nv0x-nv3x card (i.e. GF
FX5xxx or older):
1/ Apply and build the attached patch over the latest nouveau kernel
   tree from git.
2/ Load nouveau.ko
3/ Suspend and resume from RAM (in most cases
   "# echo mem > /sys/power/state" should just work)
4/ Send me the output from "dmesg" and "lspci -vv"

Cold-booting an unposted card should also work with this patch applied,
but logs taken after a suspend/resume cycle are likely to be more
interesting.

If suspend to RAM used to work for you and this patch breaks it up,
please provide the output from dmesg and lspci anyway (grabbed before
suspend if you can't even ssh in). In that case I'd also be interested
in a BIOS dump from your card (see [1]).

If suspend has never worked for you, please try again with latest git,
I've done a few minor suspend/resume fixes lately and it might work now.

Thanks!

[1] http://nouveau.freedesktop.org/wiki/DumpingVideoBios


--=-=-=
Content-Type: text/x-diff
Content-Disposition: attachment; filename=nouveau_init_compute_mem.patch
Content-Transfer-Encoding: quoted-printable

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouve=
au/nouveau_bios.c
index f67664e..8ffb297 100644
=2D-- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -38,7 +38,7 @@
=20
 #define EDID1_LEN 128
=20
=2D#define BIOSLOG(sip, fmt, arg...) NV_DEBUG(sip->dev, fmt, ##arg)
+#define BIOSLOG(sip, fmt, arg...) NV_INFO(sip->dev, fmt, ##arg)
 #define LOG_OLD_VALUE(x)
=20
 #define ROM16(x) le16_to_cpu(*(uint16_t *)&(x))
@@ -2067,6 +2067,315 @@ init_zm_index_io(struct nvbios *bios, uint16_t offs=
et, struct init_exec *iexec)
 	return 5;
 }
=20
+#define __iowrite32(val, addr) do {				\
+		printk("iowrite32: %p <- %x\n", addr, val);	\
+		iowrite32(val, addr);				\
+	} while (0)
+
+#define __ioread32(addr) ({					\
+		uint32_t __v =3D ioread32(addr);			\
+		printk("ioread32: %p -> %x\n", addr, __v);	\
+		__v;						\
+	})
+
+static inline void
+write_mask(struct nvbios *bios, uint32_t reg, uint32_t mask, uint32_t val)
+{
+	bios_wr32(bios, reg, (bios_rd32(bios, reg) & ~mask) | val);
+}
+
+static inline bool
+read_back(uint8_t __iomem *base, uint32_t off, uint32_t val)
+{
+	__iowrite32(val, base + off);
+	return val =3D=3D __ioread32(base + off);
+}
+
+static int
+nv04_init_compute_mem(struct nvbios *bios)
+{
+	struct drm_device *dev =3D bios->dev;
+	uint32_t patt =3D 0xdeadbeef;
+	uint8_t __iomem *fb;
+	int i;
+
+	/* Map the framebuffer aperture */
+	if (pci_resource_len(dev->pdev, 1) < 0x1000000)
+		return -EINVAL;
+
+	fb =3D ioremap(pci_resource_start(dev->pdev, 1),
+		     pci_resource_len(dev->pdev, 1));
+	if (!fb)
+		return -ENOMEM;
+
+	/* Sequencer and refresh off */
+	NVWriteVgaSeq(dev, 0, 1, NVReadVgaSeq(dev, 0, 1) | 0x20);
+	write_mask(bios, NV04_PFB_DEBUG_0, 0, NV04_PFB_DEBUG_0_REFRESH_OFF);
+
+	write_mask(bios, NV04_PFB_BOOT_0, ~0,
+		   NV04_PFB_BOOT_0_RAM_AMOUNT_16MB |
+		   NV04_PFB_BOOT_0_RAM_WIDTH_128 |
+		   NV04_PFB_BOOT_0_RAM_TYPE_SGRAM_16MBIT);
+
+	for (i =3D 0; i < 4; i++) {
+		__iowrite32(patt, fb + 4 * i);
+		wmb();
+	}
+	__iowrite32(patt + 1, fb + 0x400000);
+
+	if (__ioread32(fb) =3D=3D patt + 1) {
+		write_mask(bios, NV04_PFB_BOOT_0, NV04_PFB_BOOT_0_RAM_TYPE,
+			   NV04_PFB_BOOT_0_RAM_TYPE_SDRAM_16MBIT);
+		write_mask(bios, NV04_PFB_DEBUG_0,
+			   NV04_PFB_DEBUG_0_REFRESH_OFF, 0);
+
+		for (i =3D 0; i < 4; i++) {
+			__iowrite32(patt, fb + 4 * i);
+			wmb();
+		}
+
+		if ((__ioread32(fb + 0xc) & 0xffff) !=3D (patt & 0xffff))
+			write_mask(bios, NV04_PFB_BOOT_0,
+				   NV04_PFB_BOOT_0_RAM_WIDTH_128 |
+				   NV04_PFB_BOOT_0_RAM_AMOUNT,
+				   NV04_PFB_BOOT_0_RAM_AMOUNT_8MB);
+
+	} else if ((__ioread32(fb + 0xc) & 0xffff0000) !=3D (patt & 0xffff0000)) {
+		write_mask(bios, NV04_PFB_BOOT_0,
+			   NV04_PFB_BOOT_0_RAM_WIDTH_128 |
+			   NV04_PFB_BOOT_0_RAM_AMOUNT,
+			   NV04_PFB_BOOT_0_RAM_AMOUNT_4MB);
+
+	} else if (__ioread32(fb) =3D=3D patt) {
+		if (read_back(fb, 0x800000, patt))
+			write_mask(bios, NV04_PFB_BOOT_0,
+				   NV04_PFB_BOOT_0_RAM_AMOUNT,
+				   NV04_PFB_BOOT_0_RAM_AMOUNT_8MB);
+		else
+			write_mask(bios, NV04_PFB_BOOT_0,
+				   NV04_PFB_BOOT_0_RAM_AMOUNT,
+				   NV04_PFB_BOOT_0_RAM_AMOUNT_4MB);
+
+		write_mask(bios, NV04_PFB_BOOT_0, NV04_PFB_BOOT_0_RAM_TYPE,
+			   NV04_PFB_BOOT_0_RAM_TYPE_SGRAM_8MBIT);
+
+	} else if (!read_back(fb, 0x800000, patt)) {
+		write_mask(bios, NV04_PFB_BOOT_0, NV04_PFB_BOOT_0_RAM_AMOUNT,
+			   NV04_PFB_BOOT_0_RAM_AMOUNT_8MB);
+
+	}
+
+	/* Refresh on, sequencer on */
+	write_mask(bios, NV04_PFB_DEBUG_0, NV04_PFB_DEBUG_0_REFRESH_OFF, 0);
+	NVWriteVgaSeq(dev, 0, 1, NVReadVgaSeq(dev, 0, 1) & ~0x20);
+
+	iounmap(fb);
+	return 0;
+}
+
+static const uint8_t *
+nv05_memory_config(struct nvbios *bios)
+{
+	/* Defaults for BIOSes lacking a memory config table */
+	const uint8_t default_config_tab[][2] =3D {
+		{ 0x24, 0x00 },
+		{ 0x28, 0x00 },
+		{ 0x24, 0x01 },
+		{ 0x1f, 0x00 },
+		{ 0x0f, 0x00 },
+		{ 0x17, 0x00 },
+		{ 0x06, 0x00 },
+		{ 0x00, 0x00 }
+	};
+	int i =3D (bios_rd32(bios, NV_PEXTDEV_BOOT_0) &
+		 NV_PEXTDEV_BOOT_0_RAMCFG) >> 2;
+
+	if (bios->legacy.mem_init_tbl_ptr)
+		return &bios->data[bios->legacy.mem_init_tbl_ptr + 2 * i];
+	else
+		return default_config_tab[i];
+}
+
+static int
+nv05_init_compute_mem(struct nvbios *bios)
+{
+	struct drm_device *dev =3D bios->dev;
+	const uint8_t *ramcfg =3D nv05_memory_config(bios);
+	uint32_t patt =3D 0xdeadbeef;
+	uint8_t __iomem *fb;
+	int i, v;
+
+	/* Map the framebuffer aperture */
+	if (pci_resource_len(dev->pdev, 1) < 0x2000000)
+		return -EINVAL;
+
+	fb =3D ioremap(pci_resource_start(dev->pdev, 1),
+		     pci_resource_len(dev->pdev, 1));
+	if (!fb)
+		return -ENOMEM;
+
+	/* Sequencer off */
+	NVWriteVgaSeq(dev, 0, 1, NVReadVgaSeq(dev, 0, 1) | 0x20);
+
+	if (bios_rd32(bios, NV04_PFB_BOOT_0) & NV04_PFB_BOOT_0_UMA_ENABLE)
+		goto out;
+
+	write_mask(bios, NV04_PFB_DEBUG_0, NV04_PFB_DEBUG_0_REFRESH_OFF, 0);
+
+	/* If present load the hardcoded scrambling table */
+	if (bios->legacy.mem_init_tbl_ptr) {
+		uint32_t *scramble_tab =3D (uint32_t *)&bios->data[
+			bios->legacy.mem_init_tbl_ptr + 0x10];
+
+		for (i =3D 0; i < 8; i++)
+			bios_wr32(bios, NV04_PFB_SCRAMBLE(i),
+				  ROM32(scramble_tab[i]));
+	}
+
+	/* Set memory type/width/length defaults depending on the straps */
+	write_mask(bios, NV04_PFB_BOOT_0, 0x3f, ramcfg[0]);
+
+	if (ramcfg[1] & 0x80)
+		write_mask(bios, NV04_PFB_CFG0, 0, NV04_PFB_CFG0_SCRAMBLE);
+
+	write_mask(bios, NV04_PFB_CFG1, 0x700001, (ramcfg[1] & 1) << 20);
+	write_mask(bios, NV04_PFB_CFG1, 0, 1);
+
+	/* Probe memory bus width */
+	for (i =3D 0; i < 4; i++)
+		__iowrite32(patt, fb + 4 * i);
+
+	if (__ioread32(fb + 0xc) !=3D patt)
+		write_mask(bios, NV04_PFB_BOOT_0,
+			   NV04_PFB_BOOT_0_RAM_WIDTH_128, 0);
+
+	/* Probe memory length */
+	v =3D bios_rd32(bios, NV04_PFB_BOOT_0) & NV04_PFB_BOOT_0_RAM_AMOUNT;
+
+	if (v =3D=3D NV04_PFB_BOOT_0_RAM_AMOUNT_32MB &&
+	    (!read_back(fb, 0x1000000, ++patt) ||
+	     !read_back(fb, 0, ++patt)))
+		write_mask(bios, NV04_PFB_BOOT_0, NV04_PFB_BOOT_0_RAM_AMOUNT,
+			   NV04_PFB_BOOT_0_RAM_AMOUNT_16MB);
+
+	if (v =3D=3D NV04_PFB_BOOT_0_RAM_AMOUNT_16MB &&
+	    !read_back(fb, 0x800000, ++patt))
+		write_mask(bios, NV04_PFB_BOOT_0, NV04_PFB_BOOT_0_RAM_AMOUNT,
+			   NV04_PFB_BOOT_0_RAM_AMOUNT_8MB);
+
+	if (!read_back(fb, 0x400000, ++patt))
+		write_mask(bios, NV04_PFB_BOOT_0, NV04_PFB_BOOT_0_RAM_AMOUNT,
+			   NV04_PFB_BOOT_0_RAM_AMOUNT_4MB);
+
+out:
+	/* Sequencer on */
+	NVWriteVgaSeq(dev, 0, 1, NVReadVgaSeq(dev, 0, 1) & ~0x20);
+
+	iounmap(fb);
+	return 0;
+}
+
+static int
+nv10_init_compute_mem(struct nvbios *bios)
+{
+	struct drm_device *dev =3D bios->dev;
+	struct drm_nouveau_private *dev_priv =3D bios->dev->dev_private;
+	const int mem_width[] =3D { 0x10, 0x00, 0x20 };
+	const int mem_width_count =3D (dev_priv->chipset >=3D 0x17 ? 3 : 2);
+	uint32_t patt =3D 0xdeadbeef;
+	uint8_t __iomem *fb;
+	int i, j, k;
+
+	/* Map the framebuffer aperture */
+	fb =3D ioremap(pci_resource_start(dev->pdev, 1),
+		     pci_resource_len(dev->pdev, 1));
+	if (!fb)
+		return -ENOMEM;
+
+	bios_wr32(bios, NV10_PFB_REFCTRL, NV10_PFB_REFCTRL_VALID_1);
+
+	/* Probe memory bus width */
+	for (i =3D 0; i < mem_width_count; i++) {
+		write_mask(bios, NV04_PFB_CFG0, 0x30, mem_width[i]);
+
+		for (j =3D 0; j < 4; j++) {
+			for (k =3D 0; k < 4; k++) {
+				__iowrite32(0, fb + 0x1c);
+				wmb();
+			}
+
+			__iowrite32(patt, fb + 0x1c);
+			wmb();
+			__iowrite32(0, fb + 0x3c);
+
+			if (__ioread32(fb + 0x1c) =3D=3D patt)
+				goto mem_width_found;
+		}
+	}
+
+mem_width_found:
+	patt <<=3D 1;
+
+	/* Probe amount of installed memory */
+	for (i =3D 0; i < 4; i++) {
+		int off =3D min((uint32_t)pci_resource_len(dev->pdev, 1),
+			      bios_rd32(bios, NV04_PFB_FIFO_DATA)) - 0x100000;
+
+		__iowrite32(patt, fb + off);
+		wmb();
+		__iowrite32(0, fb);
+
+		__ioread32(fb);
+		__ioread32(fb);
+		__ioread32(fb);
+		__ioread32(fb);
+
+		if (__ioread32(fb + off) =3D=3D patt)
+			goto amount_found;
+	}
+
+	/* IC missing - disable the upper half memory space. */
+	write_mask(bios, NV04_PFB_CFG0, 0x1000, 0);
+
+amount_found:
+	iounmap(fb);
+	return 0;
+}
+
+static int
+nv20_init_compute_mem(struct nvbios *bios)
+{
+	struct drm_device *dev =3D bios->dev;
+	struct drm_nouveau_private *dev_priv =3D bios->dev->dev_private;
+	uint32_t off, amount =3D pci_resource_len(dev->pdev, 1);
+	uint32_t mask =3D (dev_priv->chipset >=3D 0x30 ? 0x300 : 0x900);
+	uint8_t __iomem *fb;
+
+	/* Map the framebuffer aperture */
+	fb =3D ioremap(pci_resource_start(dev->pdev, 1), amount);
+	if (!fb)
+		return -ENOMEM;
+
+	bios_wr32(bios, NV10_PFB_REFCTRL, NV10_PFB_REFCTRL_VALID_1);
+
+	/* Allow full addressing */
+	write_mask(bios, NV04_PFB_CFG0, 0, mask);
+
+	amount =3D min(amount, bios_rd32(bios, NV04_PFB_FIFO_DATA));
+	for (off =3D amount; off > 0x2000000; off -=3D 0x2000000) {
+		__iowrite32(off, fb + off - 4);
+		wmb();
+	}
+
+	amount =3D min(amount, bios_rd32(bios, NV04_PFB_FIFO_DATA));
+	if (amount !=3D __ioread32(fb + amount - 4))
+		/* IC missing - disable the upper half memory space. */
+		write_mask(bios, NV04_PFB_CFG0, mask, 0);
+
+	iounmap(fb);
+	return 0;
+}
+
 static int
 init_compute_mem(struct nvbios *bios, uint16_t offset, struct init_exec *i=
exec)
 {
@@ -2075,64 +2384,57 @@ init_compute_mem(struct nvbios *bios, uint16_t offs=
et, struct init_exec *iexec)
 	 *
 	 * offset      (8 bit): opcode
 	 *
=2D	 * This opcode is meant to set NV_PFB_CFG0 (0x100200) appropriately so
=2D	 * that the hardware can correctly calculate how much VRAM it has
=2D	 * (and subsequently report that value in NV_PFB_CSTATUS (0x10020C))
+	 * This opcode is meant to set the PFB memory config registers
+	 * appropriately so that we can correctly calculate how much VRAM it
+	 * has (on nv10 and better chipsets the amount of installed VRAM is
+	 * subsequently reported in NV_PFB_CSTATUS (0x10020C)).
 	 *
=2D	 * The implementation of this opcode in general consists of two parts:
=2D	 * 1) determination of the memory bus width
=2D	 * 2) determination of how many of the card's RAM pads have ICs attached
+	 * The implementation of this opcode in general consists of several
+	 * parts:
 	 *
=2D	 * 1) is done by a cunning combination of writes to offsets 0x1c and
=2D	 * 0x3c in the framebuffer, and seeing whether the written values are
=2D	 * read back correctly. This then affects bits 4-7 of NV_PFB_CFG0
+	 * 1) Determination of memory type and density. Only necessary in
+	 *    really old chipsets, the memory type reported by the strap bits
+	 *    (0x101000) is assumed to be accurate on nv05 and newer.
 	 *
=2D	 * 2) is done by a cunning combination of writes to an offset slightly
=2D	 * less than the maximum memory reported by NV_PFB_CSTATUS, then seeing
=2D	 * if the test pattern can be read back. This then affects bits 12-15 of
=2D	 * NV_PFB_CFG0
+	 * 2) Determination of the memory bus width. Usually done by a cunning
+	 *    combination of writes to offsets 0x1c and 0x3c in the fb, and
+	 *    seeing whether the written values are read back correctly.
 	 *
=2D	 * In this context a "cunning combination" may include multiple reads
=2D	 * and writes to varying locations, often alternating the test pattern
=2D	 * and 0, doubtless to make sure buffers are filled, residual charges
=2D	 * on tracks are removed etc.
+	 *    Only necessary on nv0x-nv1x and nv34, for the other cards we can
+	 *    trust the straps.
 	 *
=2D	 * Unfortunately, the "cunning combination"s mentioned above, and the
=2D	 * changes to the bits in NV_PFB_CFG0 differ with nearly every bios
=2D	 * trace I have.
+	 * 3) Determination of how many of the card's RAM pads have ICs
+	 *    attached, usually done by a cunning combination of writes to an
+	 *    offset slightly less than the maximum memory reported by
+	 *    NV_PFB_CSTATUS, then seeing if the test pattern can be read back.
 	 *
=2D	 * Therefore, we cheat and assume the value of NV_PFB_CFG0 with which
=2D	 * we started was correct, and use that instead
+	 * This appears to be a NOP on IGPs and NV4x or newer chipsets, both io
+	 * logs of the VBIOS and kmmio traces of the binary driver POSTing the
+	 * card show nothing being done for this opcode. Why is it still listed
+	 * in the table?!
 	 */
=20
 	/* no iexec->execute check by design */
=20
=2D	/*
=2D	 * This appears to be a NOP on G8x chipsets, both io logs of the VBIOS
=2D	 * and kmmio traces of the binary driver POSTing the card show nothing
=2D	 * being done for this opcode.  why is it still listed in the table?!
=2D	 */
=2D
 	struct drm_nouveau_private *dev_priv =3D bios->dev->dev_private;
+	int ret;
=20
=2D	if (dev_priv->card_type >=3D NV_40)
=2D		return 1;
=2D
=2D	/*
=2D	 * On every card I've seen, this step gets done for us earlier in
=2D	 * the init scripts
=2D	uint8_t crdata =3D bios_idxprt_rd(dev, NV_VIO_SRX, 0x01);
=2D	bios_idxprt_wr(dev, NV_VIO_SRX, 0x01, crdata | 0x20);
=2D	 */
=2D
=2D	/*
=2D	 * This also has probably been done in the scripts, but an mmio trace of
=2D	 * s3 resume shows nvidia doing it anyway (unlike the NV_VIO_SRX write)
=2D	 */
=2D	bios_wr32(bios, NV_PFB_REFCTRL, NV_PFB_REFCTRL_VALID_1);
+	if (dev_priv->chipset >=3D 0x40 ||
+	    dev_priv->chipset =3D=3D 0x1a ||
+	    dev_priv->chipset =3D=3D 0x1f)
+		ret =3D 0;
+	else if (dev_priv->chipset >=3D 0x20 &&
+		 dev_priv->chipset !=3D 0x34)
+		ret =3D nv20_init_compute_mem(bios);
+	else if (dev_priv->chipset >=3D 0x10)
+		ret =3D nv10_init_compute_mem(bios);
+	else if (dev_priv->chipset >=3D 0x5)
+		ret =3D nv05_init_compute_mem(bios);
+	else
+		ret =3D nv04_init_compute_mem(bios);
=20
=2D	/* write back the saved configuration value */
=2D	bios_wr32(bios, NV_PFB_CFG0, bios->state.saved_nv_pfb_cfg0);
+	if (ret)
+		return ret;
=20
 	return 1;
 }
@@ -2209,14 +2511,14 @@ init_configure_mem(struct nvbios *bios, uint16_t of=
fset,
 	     reg =3D ROM32(bios->data[seqtbloffs +=3D 4])) {
=20
 		switch (reg) {
=2D		case NV_PFB_PRE:
=2D			data =3D NV_PFB_PRE_CMD_PRECHARGE;
+		case NV04_PFB_PRE:
+			data =3D NV04_PFB_PRE_CMD_PRECHARGE;
 			break;
=2D		case NV_PFB_PAD:
=2D			data =3D NV_PFB_PAD_CKE_NORMAL;
+		case NV04_PFB_PAD:
+			data =3D NV04_PFB_PAD_CKE_NORMAL;
 			break;
=2D		case NV_PFB_REF:
=2D			data =3D NV_PFB_REF_CMD_REFRESH;
+		case NV04_PFB_REF:
+			data =3D NV04_PFB_REF_CMD_REFRESH;
 			break;
 		default:
 			data =3D ROM32(bios->data[meminitdata]);
@@ -2418,7 +2720,7 @@ init_ram_condition(struct nvbios *bios, uint16_t offs=
et,
 	 * offset + 1  (8 bit): mask
 	 * offset + 2  (8 bit): cmpval
 	 *
=2D	 * Test if (NV_PFB_BOOT_0 & "mask") equals "cmpval".
+	 * Test if (NV04_PFB_BOOT_0 & "mask") equals "cmpval".
 	 * If condition not met skip subsequent opcodes until condition is
 	 * inverted (INIT_NOT), or we hit INIT_RESUME
 	 */
@@ -2430,7 +2732,7 @@ init_ram_condition(struct nvbios *bios, uint16_t offs=
et,
 	if (!iexec->execute)
 		return 3;
=20
=2D	data =3D bios_rd32(bios, NV_PFB_BOOT_0) & mask;
+	data =3D bios_rd32(bios, NV04_PFB_BOOT_0) & mask;
=20
 	BIOSLOG(bios, "0x%04X: Checking if 0x%08X equals 0x%08X\n",
 		offset, data, cmpval);
@@ -6234,6 +6536,16 @@ static int nouveau_parse_vbios_struct(struct drm_dev=
ice *dev)
 	return -ENODEV;
 }
=20
+static void
+dump_memory_config(struct drm_device *dev)
+{
+	NV_INFO(dev, "Memory config regs:\n");
+	NV_INFO(dev, "\tNV04_PFB_BOOT_0: %x\n", nv_rd32(dev, NV04_PFB_BOOT_0));
+	NV_INFO(dev, "\tNV04_PFB_CFG0: %x\n", nv_rd32(dev, NV04_PFB_CFG0));
+	NV_INFO(dev, "\tNV04_PFB_CFG1: %x\n", nv_rd32(dev, NV04_PFB_CFG1));
+	NV_INFO(dev, "\tNV04_PFB_FIFO_DATA: %x\n", nv_rd32(dev, NV04_PFB_FIFO_DAT=
A));
+}
+
 int
 nouveau_run_vbios_init(struct drm_device *dev)
 {
@@ -6253,7 +6565,9 @@ nouveau_run_vbios_init(struct drm_device *dev)
 		bios->fp.lvds_init_run =3D false;
 	}
=20
+	dump_memory_config(dev);
 	parse_init_tables(bios);
+	dump_memory_config(dev);
=20
 	/*
 	 * Runs some additional script seen on G8x VBIOSen.  The VBIOS'
@@ -6323,7 +6637,6 @@ nouveau_bios_init(struct drm_device *dev)
 {
 	struct drm_nouveau_private *dev_priv =3D dev->dev_private;
 	struct nvbios *bios =3D &dev_priv->vbios;
=2D	uint32_t saved_nv_pextdev_boot_0;
 	bool was_locked;
 	int ret;
=20
@@ -6344,27 +6657,16 @@ nouveau_bios_init(struct drm_device *dev)
 	if (!bios->major_version)	/* we don't run version 0 bios */
 		return 0;
=20
=2D	/* these will need remembering across a suspend */
=2D	saved_nv_pextdev_boot_0 =3D bios_rd32(bios, NV_PEXTDEV_BOOT_0);
=2D	bios->state.saved_nv_pfb_cfg0 =3D bios_rd32(bios, NV_PFB_CFG0);
=2D
 	/* init script execution disabled */
 	bios->execute =3D false;
=20
 	/* ... unless card isn't POSTed already */
 	if (!nouveau_bios_posted(dev)) {
=2D		NV_INFO(dev, "Adaptor not initialised\n");
=2D		if (dev_priv->card_type < NV_40) {
=2D			NV_ERROR(dev, "Unable to POST this chipset\n");
=2D			return -ENODEV;
=2D		}
=2D
=2D		NV_INFO(dev, "Running VBIOS init tables\n");
+		NV_INFO(dev, "Adaptor not initialised, "
+			"running VBIOS init tables.\n");
 		bios->execute =3D true;
 	}
=20
=2D	bios_wr32(bios, NV_PEXTDEV_BOOT_0, saved_nv_pextdev_boot_0);
=2D
 	ret =3D nouveau_run_vbios_init(dev);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.h b/drivers/gpu/drm/nouve=
au/nouveau_bios.h
index bd33a54..533d571 100644
=2D-- a/drivers/gpu/drm/nouveau/nouveau_bios.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.h
@@ -250,8 +250,6 @@ struct nvbios {
=20
 	struct {
 		int crtchead;
=2D		/* these need remembering across suspend */
=2D		uint32_t saved_nv_pfb_cfg0;
 	} state;
=20
 	struct {
diff --git a/drivers/gpu/drm/nouveau/nouveau_calc.c b/drivers/gpu/drm/nouve=
au/nouveau_calc.c
index 88f9bc0..ca85da7 100644
=2D-- a/drivers/gpu/drm/nouveau/nouveau_calc.c
+++ b/drivers/gpu/drm/nouveau/nouveau_calc.c
@@ -200,7 +200,7 @@ nv04_update_arb(struct drm_device *dev, int VClk, int b=
pp,
 	struct nv_sim_state sim_data;
 	int MClk =3D nouveau_hw_get_clock(dev, MPLL);
 	int NVClk =3D nouveau_hw_get_clock(dev, NVPLL);
=2D	uint32_t cfg1 =3D nvReadFB(dev, NV_PFB_CFG1);
+	uint32_t cfg1 =3D nvReadFB(dev, NV04_PFB_CFG1);
=20
 	sim_data.pclk_khz =3D VClk;
 	sim_data.mclk_khz =3D MClk;
@@ -218,7 +218,7 @@ nv04_update_arb(struct drm_device *dev, int VClk, int b=
pp,
 		sim_data.mem_latency =3D 3;
 		sim_data.mem_page_miss =3D 10;
 	} else {
=2D		sim_data.memory_type =3D nvReadFB(dev, NV_PFB_CFG0) & 0x1;
+		sim_data.memory_type =3D nvReadFB(dev, NV04_PFB_CFG0) & 0x1;
 		sim_data.memory_width =3D (nvReadEXTDEV(dev, NV_PEXTDEV_BOOT_0) & 0x10) =
? 128 : 64;
 		sim_data.mem_latency =3D cfg1 & 0xf;
 		sim_data.mem_page_miss =3D ((cfg1 >> 4) & 0xf) + ((cfg1 >> 31) & 0x1);
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouvea=
u/nouveau_mem.c
index 09db6f6..adf5ac4 100644
=2D-- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -259,19 +259,19 @@ nouveau_mem_close(struct drm_device *dev)
 static uint32_t
 nouveau_mem_detect_nv04(struct drm_device *dev)
 {
=2D	uint32_t boot0 =3D nv_rd32(dev, NV03_BOOT_0);
+	uint32_t boot0 =3D nv_rd32(dev, NV04_PFB_BOOT_0);
=20
 	if (boot0 & 0x00000100)
 		return (((boot0 >> 12) & 0xf) * 2 + 2) * 1024 * 1024;
=20
=2D	switch (boot0 & NV03_BOOT_0_RAM_AMOUNT) {
=2D	case NV04_BOOT_0_RAM_AMOUNT_32MB:
+	switch (boot0 & NV04_PFB_BOOT_0_RAM_AMOUNT) {
+	case NV04_PFB_BOOT_0_RAM_AMOUNT_32MB:
 		return 32 * 1024 * 1024;
=2D	case NV04_BOOT_0_RAM_AMOUNT_16MB:
+	case NV04_PFB_BOOT_0_RAM_AMOUNT_16MB:
 		return 16 * 1024 * 1024;
=2D	case NV04_BOOT_0_RAM_AMOUNT_8MB:
+	case NV04_PFB_BOOT_0_RAM_AMOUNT_8MB:
 		return 8 * 1024 * 1024;
=2D	case NV04_BOOT_0_RAM_AMOUNT_4MB:
+	case NV04_PFB_BOOT_0_RAM_AMOUNT_4MB:
 		return 4 * 1024 * 1024;
 	}
=20
@@ -317,10 +317,10 @@ nouveau_mem_detect(struct drm_device *dev)
 		dev_priv->vram_size =3D nouveau_mem_detect_nforce(dev);
 	} else
 	if (dev_priv->card_type < NV_50) {
=2D		dev_priv->vram_size  =3D nv_rd32(dev, NV04_FIFO_DATA);
=2D		dev_priv->vram_size &=3D NV10_FIFO_DATA_RAM_AMOUNT_MB_MASK;
+		dev_priv->vram_size  =3D nv_rd32(dev, NV04_PFB_FIFO_DATA);
+		dev_priv->vram_size &=3D NV10_PFB_FIFO_DATA_RAM_AMOUNT_MB_MASK;
 	} else {
=2D		dev_priv->vram_size =3D nv_rd32(dev, NV04_FIFO_DATA);
+		dev_priv->vram_size =3D nv_rd32(dev, NV04_PFB_FIFO_DATA);
 		dev_priv->vram_size |=3D (dev_priv->vram_size & 0xff) << 32;
 		dev_priv->vram_size &=3D 0xffffffff00ll;
 		if (dev_priv->chipset =3D=3D 0xaa || dev_priv->chipset =3D=3D 0xac) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_reg.h b/drivers/gpu/drm/nouvea=
u/nouveau_reg.h
index b6391a1..9c1056c 100644
=2D-- a/drivers/gpu/drm/nouveau/nouveau_reg.h
+++ b/drivers/gpu/drm/nouveau/nouveau_reg.h
@@ -1,19 +1,64 @@
=20
+#define NV04_PFB_BOOT_0						0x00100000
+#	define NV04_PFB_BOOT_0_RAM_AMOUNT			0x00000003
+#	define NV04_PFB_BOOT_0_RAM_AMOUNT_32MB			0x00000000
+#	define NV04_PFB_BOOT_0_RAM_AMOUNT_4MB			0x00000001
+#	define NV04_PFB_BOOT_0_RAM_AMOUNT_8MB			0x00000002
+#	define NV04_PFB_BOOT_0_RAM_AMOUNT_16MB			0x00000003
+#	define NV04_PFB_BOOT_0_RAM_WIDTH_128			0x00000004
+#	define NV04_PFB_BOOT_0_RAM_TYPE				0x00000028
+#	define NV04_PFB_BOOT_0_RAM_TYPE_SGRAM_8MBIT		0x00000000
+#	define NV04_PFB_BOOT_0_RAM_TYPE_SGRAM_16MBIT		0x00000008
+#	define NV04_PFB_BOOT_0_RAM_TYPE_SGRAM_16MBIT_4BANK	0x00000010
+#	define NV04_PFB_BOOT_0_RAM_TYPE_SDRAM_16MBIT		0x00000018
+#	define NV04_PFB_BOOT_0_RAM_TYPE_SDRAM_64MBIT		0x00000020
+#	define NV04_PFB_BOOT_0_RAM_TYPE_SDRAM_64MBITX16		0x00000028
+#	define NV04_PFB_BOOT_0_UMA_ENABLE			0x00000100
+#	define NV04_PFB_BOOT_0_UMA_SIZE				0x0000f000
+#define NV04_PFB_DEBUG_0					0x00100080
+#	define NV04_PFB_DEBUG_0_PAGE_MODE			0x00000001
+#	define NV04_PFB_DEBUG_0_REFRESH_OFF			0x00000010
+#	define NV04_PFB_DEBUG_0_REFRESH_COUNTX64		0x00003f00
+#	define NV04_PFB_DEBUG_0_REFRESH_SLOW_CLK		0x00004000
+#	define NV04_PFB_DEBUG_0_SAFE_MODE			0x00008000
+#	define NV04_PFB_DEBUG_0_ALOM_ENABLE			0x00010000
+#	define NV04_PFB_DEBUG_0_CASOE				0x00100000
+#	define NV04_PFB_DEBUG_0_CKE_INVERT			0x10000000
+#	define NV04_PFB_DEBUG_0_REFINC				0x20000000
+#	define NV04_PFB_DEBUG_0_SAVE_POWER_OFF			0x40000000
+#define NV04_PFB_CFG0						0x00100200
+#	define NV04_PFB_CFG0_SCRAMBLE				0x20000000
+#define NV04_PFB_CFG1						0x00100204
+#define NV04_PFB_FIFO_DATA					0x0010020c
+#	define NV10_PFB_FIFO_DATA_RAM_AMOUNT_MB_MASK		0xfff00000
+#	define NV10_PFB_FIFO_DATA_RAM_AMOUNT_MB_SHIFT		20
+#define NV10_PFB_REFCTRL					0x00100210
+#	define NV10_PFB_REFCTRL_VALID_1				(1 << 31)
+#define NV04_PFB_PAD						0x0010021c
+#	define NV04_PFB_PAD_CKE_NORMAL				(1 << 0)
+#define NV10_PFB_TILE(i)                              (0x00100240 + (i*16))
+#define NV10_PFB_TILE__SIZE					8
+#define NV10_PFB_TLIMIT(i)                            (0x00100244 + (i*16))
+#define NV10_PFB_TSIZE(i)                             (0x00100248 + (i*16))
+#define NV10_PFB_TSTATUS(i)                           (0x0010024c + (i*16))
+#define NV04_PFB_REF						0x001002d0
+#	define NV04_PFB_REF_CMD_REFRESH				(1 << 0)
+#define NV04_PFB_PRE						0x001002d4
+#	define NV04_PFB_PRE_CMD_PRECHARGE			(1 << 0)
+#define NV10_PFB_CLOSE_PAGE2					0x0010033c
+#define NV04_PFB_SCRAMBLE(i)                         (0x00100400 + 4 * (i))
+#define NV40_PFB_TILE(i)                              (0x00100600 + (i*16))
+#define NV40_PFB_TILE__SIZE_0					12
+#define NV40_PFB_TILE__SIZE_1					15
+#define NV40_PFB_TLIMIT(i)                            (0x00100604 + (i*16))
+#define NV40_PFB_TSIZE(i)                             (0x00100608 + (i*16))
+#define NV40_PFB_TSTATUS(i)                           (0x0010060c + (i*16))
+#define NV40_PFB_UNK_800					0x00100800
=20
=2D#define NV03_BOOT_0                                        0x00100000
=2D#    define NV03_BOOT_0_RAM_AMOUNT                         0x00000003
=2D#    define NV03_BOOT_0_RAM_AMOUNT_8MB                     0x00000000
=2D#    define NV03_BOOT_0_RAM_AMOUNT_2MB                     0x00000001
=2D#    define NV03_BOOT_0_RAM_AMOUNT_4MB                     0x00000002
=2D#    define NV03_BOOT_0_RAM_AMOUNT_8MB_SDRAM               0x00000003
=2D#    define NV04_BOOT_0_RAM_AMOUNT_32MB                    0x00000000
=2D#    define NV04_BOOT_0_RAM_AMOUNT_4MB                     0x00000001
=2D#    define NV04_BOOT_0_RAM_AMOUNT_8MB                     0x00000002
=2D#    define NV04_BOOT_0_RAM_AMOUNT_16MB                    0x00000003
=2D
=2D#define NV04_FIFO_DATA                                     0x0010020c
=2D#    define NV10_FIFO_DATA_RAM_AMOUNT_MB_MASK              0xfff00000
=2D#    define NV10_FIFO_DATA_RAM_AMOUNT_MB_SHIFT             20
+#define NV_PEXTDEV_BOOT_0					0x00101000
+#define NV_PEXTDEV_BOOT_0_RAMCFG				0x0000003c
+#	define NV_PEXTDEV_BOOT_0_STRAP_FP_IFACE_12BIT		(8 << 12)
+#define NV_PEXTDEV_BOOT_3					0x0010100c
=20
 #define NV_RAMIN                                           0x00700000
=20
@@ -131,23 +176,6 @@
 #define NV04_PTIMER_TIME_1                                 0x00009410
 #define NV04_PTIMER_ALARM_0                                0x00009420
=20
=2D#define NV04_PFB_CFG0                                      0x00100200
=2D#define NV04_PFB_CFG1                                      0x00100204
=2D#define NV40_PFB_020C                                      0x0010020C
=2D#define NV10_PFB_TILE(i)                                   (0x00100240 +=
 (i*16))
=2D#define NV10_PFB_TILE__SIZE                                8
=2D#define NV10_PFB_TLIMIT(i)                                 (0x00100244 +=
 (i*16))
=2D#define NV10_PFB_TSIZE(i)                                  (0x00100248 +=
 (i*16))
=2D#define NV10_PFB_TSTATUS(i)                                (0x0010024C +=
 (i*16))
=2D#define NV10_PFB_CLOSE_PAGE2                               0x0010033C
=2D#define NV40_PFB_TILE(i)                                   (0x00100600 +=
 (i*16))
=2D#define NV40_PFB_TILE__SIZE_0                              12
=2D#define NV40_PFB_TILE__SIZE_1                              15
=2D#define NV40_PFB_TLIMIT(i)                                 (0x00100604 +=
 (i*16))
=2D#define NV40_PFB_TSIZE(i)                                  (0x00100608 +=
 (i*16))
=2D#define NV40_PFB_TSTATUS(i)                                (0x0010060C +=
 (i*16))
=2D#define NV40_PFB_UNK_800					0x00100800
=2D
 #define NV04_PGRAPH_DEBUG_0                                0x00400080
 #define NV04_PGRAPH_DEBUG_1                                0x00400084
 #define NV04_PGRAPH_DEBUG_2                                0x00400088
diff --git a/drivers/gpu/drm/nouveau/nv40_mc.c b/drivers/gpu/drm/nouveau/nv=
40_mc.c
index 2a3495e..e4e72c1 100644
=2D-- a/drivers/gpu/drm/nouveau/nv40_mc.c
+++ b/drivers/gpu/drm/nouveau/nv40_mc.c
@@ -19,7 +19,7 @@ nv40_mc_init(struct drm_device *dev)
 	case 0x46: /* G72 */
 	case 0x4e:
 	case 0x4c: /* C51_G7X */
=2D		tmp =3D nv_rd32(dev, NV40_PFB_020C);
+		tmp =3D nv_rd32(dev, NV04_PFB_FIFO_DATA);
 		nv_wr32(dev, NV40_PMC_1700, tmp);
 		nv_wr32(dev, NV40_PMC_1704, 0);
 		nv_wr32(dev, NV40_PMC_1708, 0);
diff --git a/drivers/gpu/drm/nouveau/nvreg.h b/drivers/gpu/drm/nouveau/nvre=
g.h
index 5998c35..ad64673 100644
=2D-- a/drivers/gpu/drm/nouveau/nvreg.h
+++ b/drivers/gpu/drm/nouveau/nvreg.h
@@ -147,28 +147,6 @@
 #	define NV_VIO_GX_DONT_CARE_INDEX	0x07
 #	define NV_VIO_GX_BIT_MASK_INDEX		0x08
=20
=2D#define NV_PFB_BOOT_0			0x00100000
=2D#define NV_PFB_CFG0			0x00100200
=2D#define NV_PFB_CFG1			0x00100204
=2D#define NV_PFB_CSTATUS			0x0010020C
=2D#define NV_PFB_REFCTRL			0x00100210
=2D#	define NV_PFB_REFCTRL_VALID_1			(1 << 31)
=2D#define NV_PFB_PAD			0x0010021C
=2D#	define NV_PFB_PAD_CKE_NORMAL			(1 << 0)
=2D#define NV_PFB_TILE_NV10		0x00100240
=2D#define NV_PFB_TILE_SIZE_NV10		0x00100244
=2D#define NV_PFB_REF			0x001002D0
=2D#	define NV_PFB_REF_CMD_REFRESH			(1 << 0)
=2D#define NV_PFB_PRE			0x001002D4
=2D#	define NV_PFB_PRE_CMD_PRECHARGE			(1 << 0)
=2D#define NV_PFB_CLOSE_PAGE2		0x0010033C
=2D#define NV_PFB_TILE_NV40		0x00100600
=2D#define NV_PFB_TILE_SIZE_NV40		0x00100604
=2D
=2D#define NV_PEXTDEV_BOOT_0		0x00101000
=2D#	define NV_PEXTDEV_BOOT_0_STRAP_FP_IFACE_12BIT	(8 << 12)
=2D#define NV_PEXTDEV_BOOT_3		0x0010100c
=2D
 #define NV_PCRTC_INTR_0					0x00600100
 #	define NV_PCRTC_INTR_0_VBLANK				(1 << 0)
 #define NV_PCRTC_INTR_EN_0				0x00600140

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkw8l0wACgkQg5k4nX1Sv1sg/AD9Fmjqae0sMxBdpKUM1Jo3DJvY
puCEgJz48lAZcDRoWiIA/RdMUId+1U3OgjWmUUUx18PzfsiBDtT81ytFIyjLnYQg
=m0t/
-----END PGP SIGNATURE-----
--==-=-=--

--===============1561802899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1561802899==--
