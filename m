From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [REGRESSION] ACPI / nouveau: replace open-coded _DSM code with helper
	functions
Date: Mon, 17 Feb 2014 16:42:46 +0100
Message-ID: <53022DF6.9040709@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Jiang Liu <jiang.liu@linux.intel.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

This commit breaks loading nouveau on my optimus laptop. I get the following spam in dmesg:

[   24.102587] MXM: GUID detected in BIOS
[   24.103167] ACPI Exception: AE_AML_PACKAGE_LIMIT, Index (0x000000003) is beyond end of object (length 0x0) (20131218/exoparg2-420)
[   24.103242] ACPI Error: Method parse/execution failed [\_SB_.PCI0.VGA_._DSM] (Node ffff88007c82e1e0), AE_AML_PACKAGE_LIMIT (20131218/psparse-536)
[   24.103354] ACPI: \_SB_.PCI0.VGA_: failed to evaluate _DSM (0x300b)
[   24.103964] ACPI Exception: AE_AML_PACKAGE_LIMIT, Index (0x000000003) is beyond end of object (length 0x0) (20131218/exoparg2-420)
[   24.104056] ACPI Error: Method parse/execution failed [\_SB_.PCI0.VGA_._DSM] (Node ffff88007c82e1e0), AE_AML_PACKAGE_LIMIT (20131218/psparse-536)
[   24.104133] ACPI Error: Method parse/execution failed [\_SB_.PCI0.P0P4.GFX0._DSM] (Node ffff88007c82e050), AE_AML_PACKAGE_LIMIT (20131218/psparse-536)
[   24.104247] ACPI: \_SB_.PCI0.P0P4.GFX0: failed to evaluate _DSM (0x300b)
[   24.108761] nouveau 0000:04:00.0: enabling device (0004 -> 0007)
[   24.135000] [drm] hdmi device  not found 4 0 1
[   24.135950] nouveau D[  DEVICE][0000:04:00.0] initialised
[   24.136581] nouveau  [  DEVICE][0000:04:00.0] BOOT0  : 0x0a8b00b1
[   24.136594] nouveau  [  DEVICE][0000:04:00.0] Chipset: GT218 (NVA8)
[   24.136649] nouveau  [  DEVICE][0000:04:00.0] Family : NV50
[   24.136661] nouveau D[  DEVICE][0000:04:00.0] crystal freq: 27000KHz
[   24.145003] nouveau  [   VBIOS][0000:04:00.0] checking PRAMIN for image...
[   24.145085] nouveau  [   VBIOS][0000:04:00.0] ... signature not found
[   24.145143] nouveau  [   VBIOS][0000:04:00.0] checking PROM for image...
[   24.145196] nouveau  [   VBIOS][0000:04:00.0] ... signature not found
[   24.145241] nouveau  [   VBIOS][0000:04:00.0] checking ACPI for image...
[   24.145252] nouveau  [   VBIOS][0000:04:00.0] ... signature not found
[   24.145262] nouveau  [   VBIOS][0000:04:00.0] checking PCIROM for image...
[   24.145638] nouveau 0000:04:00.0: Invalid ROM contents
[   24.146181] nouveau  [   VBIOS][0000:04:00.0] ... signature not found
[   24.146195] nouveau  [   VBIOS][0000:04:00.0] checking PLATFORM for image...
[   24.146253] nouveau  [   VBIOS][0000:04:00.0] ... signature not found
[   24.146264] nouveau E[   VBIOS][0000:04:00.0] unable to locate usable image
[   24.146469] nouveau E[  DEVICE][0000:04:00.0] failed to create 0x10000001, -22
[   24.146676] nouveau E[     DRM] failed to create 0x80000080, -22

Reverting b072e53b0a27a makes this problem go away.

dmesg after reverting:
[   23.470101] MXM: GUID detected in BIOS
[   23.470239] ACPI Warning: \_SB_.PCI0.VGA_._DSM: Argument #4 type mismatch - Found [Integer], ACPI requires [Package] (20131218/nsarguments-95)
[   23.470473] ACPI Warning: \_SB_.PCI0.VGA_._DSM: Argument #4 type mismatch - Found [Buffer], ACPI requires [Package] (20131218/nsarguments-95)
[   23.472101] ACPI Warning: \_SB_.PCI0.VGA_._DSM: Argument #4 type mismatch - Found [Buffer], ACPI requires [Package] (20131218/nsarguments-95)
[   23.473582] i915 0000:00:02.0: optimus capabilities: enabled, status dynamic power, hda bios codec supported
[   23.473699] ACPI Warning: \_SB_.PCI0.P0P4.GFX0._DSM: Argument #4 type mismatch - Found [Integer], ACPI requires [Package] (20131218/nsarguments-95)
[   23.474185] ACPI Warning: \_SB_.PCI0.P0P4.GFX0._DSM: Argument #4 type mismatch - Found [Buffer], ACPI requires [Package] (20131218/nsarguments-95)
[   23.475552] ACPI Warning: \_SB_.PCI0.P0P4.GFX0._DSM: Argument #4 type mismatch - Found [Buffer], ACPI requires [Package] (20131218/nsarguments-95)
[   23.479677] pci 0000:04:00.0: optimus capabilities: enabled, status dynamic power, hda bios codec supported
[   23.479756] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.P0P4.GFX0 handle
[   23.483963] nouveau 0000:04:00.0: enabling device (0004 -> 0007)
[   23.529744] [drm] hdmi device  not found 4 0 1
[   23.531950] nouveau D[  DEVICE][0000:04:00.0] initialised
[   23.532587] nouveau  [  DEVICE][0000:04:00.0] BOOT0  : 0x0a8b00b1
[   23.532600] nouveau  [  DEVICE][0000:04:00.0] Chipset: GT218 (NVA8)
[   23.532666] nouveau  [  DEVICE][0000:04:00.0] Family : NV50
[   23.532677] nouveau D[  DEVICE][0000:04:00.0] crystal freq: 27000KHz
[   23.546686] nouveau  [   VBIOS][0000:04:00.0] checking PRAMIN for image...
[   23.547243] nouveau  [   VBIOS][0000:04:00.0] ... signature not found
[   23.547257] nouveau  [   VBIOS][0000:04:00.0] checking PROM for image...
[   23.547338] nouveau  [   VBIOS][0000:04:00.0] ... signature not found
[   23.547348] nouveau  [   VBIOS][0000:04:00.0] checking ACPI for image...
[   23.568444] asus_wmi: ASUS WMI generic driver loaded
[   23.868084] ppdev: user-space parallel port driver
[   23.891268] asus_wmi: Initialization: 0x0
[   23.891700] asus_wmi: BIOS WMI version: 0.6
[   23.892578] asus_wmi: SFUN value: 0x0
[   24.203132] nouveau  [   VBIOS][0000:04:00.0] ... appears to be valid
[   24.203148] nouveau  [   VBIOS][0000:04:00.0] using image from ACPI
