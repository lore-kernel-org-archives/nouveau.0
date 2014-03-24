From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH 4/4] bios/hack: try 16 times when reading the
	vbios from PROM
Date: Mon, 24 Mar 2014 02:03:03 +0100
Message-ID: <1395622983-2807-4-git-send-email-martin.peres@free.fr>
References: <1395622983-2807-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1395622983-2807-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
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

At boot time, on one of my desktop PC and one of my card, Nouveau fails to
boot because the vbios is corrupted. If I blacklist the module and load it
after, it works fine. Also, this card on another computer works fine and other
cars on this desktop work directly (I would need to check more cards though).

I tried several things to make it work at boot time:
- use 32 bits reads instead of 8
- disable IRQs while we fetch the bios
- add a read to check the status of 88050 (but it doesn't change on its own)
- increase the number of initial reads for the signature

None of them worked so I tried something more extreme, trying to read the
vbios 16 times when reading it from PROM. It seems to work all the time now.

I'm posting this patch to leave a written trace of what I tried. If someone
needs this patch too, please let me know!

No sign off for this, this is a hack.
---
 nvkm/subdev/bios/base.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/nvkm/subdev/bios/base.c b/nvkm/subdev/bios/base.c
index 5608530..96e2eaf 100644
--- a/nvkm/subdev/bios/base.c
+++ b/nvkm/subdev/bios/base.c
@@ -139,7 +139,7 @@ out:
 }
 
 static void
-nouveau_bios_shadow_prom(struct nouveau_bios *bios)
+nouveau_bios_shadow_prom_attempt(struct nouveau_bios *bios)
 {
 	struct nouveau_device *device = nv_device(bios);
 	u32 pcireg, access;
@@ -196,6 +196,17 @@ out:
 	nv_wr32(bios, pcireg, access);
 }
 
+static void
+nouveau_bios_shadow_prom(struct nouveau_bios *bios)
+{
+	int i = 0;
+	do {
+		nouveau_bios_shadow_prom_attempt(bios);
+		if(!nvbios_checksum(bios->data, bios->size))
+			break;
+	} while (i++ < 16);
+}
+
 #if defined(CONFIG_ACPI) && defined(CONFIG_X86)
 int nouveau_acpi_get_bios_chunk(uint8_t *bios, int offset, int len);
 bool nouveau_acpi_rom_supported(struct pci_dev *pdev);
-- 
1.9.1
