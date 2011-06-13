From: Jeff Mahoney <jeffm-IBi9RG/b67k@public.gmane.org>
Subject: [PATCH] nouveau: Make vga_switcheroo code depend on
	VGA_SWITCHEROO
Date: Mon, 13 Jun 2011 15:53:25 -0400
Message-ID: <4DF66AB5.2010409@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

 Commit 8116188 (nouveau/acpi: hook up to the MXM method for mux
 switching.) broke the build on non-x86 architectures due to the new
 dependency on MXM and MXM being an x86 platform driver.

 It built previously since the vga switcheroo registration routines
 were zereod out on !X86. The code was built in but unused.

 This patch makes all of the DSM code depend on CONFIG_VGA_SWITCHEROO,
 allowing it to build on non-x86 and shrinking the module size as well.

Signed-off-by: Jeff Mahoney <jeffm-IBi9RG/b67k@public.gmane.org>
- ---

 drivers/gpu/drm/nouveau/nouveau_acpi.c |    5 +++++
 1 file changed, 5 insertions(+)

- --- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -45,6 +45,7 @@ static struct nouveau_dsm_priv {
 #define NOUVEAU_DSM_HAS_MUX 0x1
 #define NOUVEAU_DSM_HAS_OPT 0x2
 +#ifdef CONFIG_VGA_SWITCHEROO
 static const char nouveau_dsm_muid[] = {
 	0xA0, 0xA0, 0x95, 0x9D, 0x60, 0x00, 0x48, 0x4D,
 	0xB3, 0x4D, 0x7E, 0x5F, 0xEA, 0x12, 0x9F, 0xD4,
@@ -298,6 +299,10 @@ void nouveau_unregister_dsm_handler(void
 {
 	vga_switcheroo_unregister_handler();
 }
+#else
+void nouveau_register_dsm_handler(void) {}
+void nouveau_unregister_dsm_handler(void) {}
+#endif
  /* retrieve the ROM in 4k blocks */
 static int nouveau_rom_call(acpi_handle rom_handle, uint8_t *bios,
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAk32arUACgkQLPWxlyuTD7J4+gCbBV8DPRXwPck6uKMrAPWpuCnM
IXQAnRvhYUZQVKL54WbC4DXChfPt2wxd
=KUB7
-----END PGP SIGNATURE-----
