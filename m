From: Hermann Lauer <Hermann.Lauer-hEciA7+sKtudPOQpRHQ53DeJuz7u0hKX@public.gmane.org>
Subject: kernel driver prevents supend to disk since 3.7 series
Date: Wed, 30 Jan 2013 09:25:17 +0100
Message-ID: <20130130082517.GG18606@lemon.iwr.uni-heidelberg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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
List-Id: nouveau.vger.kernel.org

Hello,
3.7.x kernels prevent my laptop with Optimus VGA from suspend to disk
with an PFIFO write fault in PCOPY0, see kernel log below.

During the 3.6.x upto 3.6.11 suspend worked without problems.
lspci -v info of the VGAs is attached.

What may I do to debug this further ?

Thanks for any help and greetings,
 Hermann

Jan 30 00:32:41 seba kernel: [   69.468486] nouveau  [     DRM] suspending fbcon...
Jan 30 00:32:41 seba kernel: [   69.468488] nouveau  [     DRM] suspending display...
Jan 30 00:32:41 seba kernel: [   69.468787] nouveau  [     DRM] unpinning framebuffer(s)...
Jan 30 00:32:41 seba kernel: [   69.468852] nouveau  [     DRM] evicting buffers...
Jan 30 00:32:41 seba kernel: [   69.469358] nouveau  [     DRM] suspending client object trees...
Jan 30 00:32:41 seba kernel: [   69.469430] nouveau E[   PFIFO][0000:01:00.0] write fault at 0x0000000000 [PAGE_NOT_PRESENT] from PCOPY0/PCOPY0 on channel 0x003fe1b000
Jan 30 00:32:41 seba kernel: [   69.640461] e1000e 0000:00:19.0: wake-up capability enabled by ACPI
Jan 30 00:32:41 seba kernel: [   71.464832] nouveau E[   PFIFO][0000:01:00.0] channel 0 kick timeout
Jan 30 00:32:41 seba kernel: [   71.464834] nouveau E[   PFIFO][0000:01:00.0][0xc000906f][ffff88011b8a7480] failed to detach PCE0 context, -16
Jan 30 00:32:41 seba kernel: [   71.464836] nouveau E[    PCE0][0000:01:00.0][0x0300c01b][ffff88012b6198c0] failed suspend, -16
Jan 30 00:32:41 seba kernel: [   71.464838] nouveau W[    PCE0][0000:01:00.0][0x000090b5][ffff88011ca6dda0] parent failed suspend, -16
Jan 30 00:32:41 seba kernel: [   71.464867] nouveau E[     DRM] 0xcccc0000:0x000490b5 suspend failed with -16
Jan 30 00:32:41 seba kernel: [   71.464869] nouveau E[     DRM] 0xdddddddd:0xcccc0000 suspend failed with -16
Jan 30 00:32:41 seba kernel: [   71.464871] nouveau E[     DRM] 0xffffffff:0xdddddddd suspend failed with -16
Jan 30 00:32:41 seba kernel: [   71.464873] nouveau E[     DRM] 0xffffffff:0xffffffff suspend failed with -16
Jan 30 00:32:41 seba kernel: [   71.464874] nouveau  [     DRM] resuming display...
Jan 30 00:32:41 seba kernel: [   71.766925] pci_legacy_suspend(): nouveau_drm_suspend+0x0/0x219 [nouveau] returns -16
Jan 30 00:32:41 seba kernel: [   71.766942] dpm_run_callback(): pci_pm_freeze+0x0/0x85 returns -16
Jan 30 00:32:41 seba kernel: [   71.766944] PM: Device 0000:01:00.0 failed to freeze async: error -16

01:00.0 VGA compatible controller: NVIDIA Corporation GF119 [Quadro NVS 4200M] (rev a1) (prog-if 00 [VGA controller])
	Subsystem: Lenovo Device 21d1
	Flags: bus master, fast devsel, latency 0, IRQ 16
	Memory at f0000000 (32-bit, non-prefetchable) [size=16M]
	Memory at c0000000 (64-bit, prefetchable) [size=256M]
	Memory at d0000000 (64-bit, prefetchable) [size=32M]
	I/O ports at 5000 [size=128]
	Expansion ROM at f1000000 [disabled] [size=512K]
	Capabilities: [60] Power Management version 3
	Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
	Capabilities: [78] Express Endpoint, MSI 00
	Capabilities: [b4] Vendor Specific Information: Len=14 <?>
	Capabilities: [100] Virtual Channel
	Capabilities: [128] Power Budgeting <?>
	Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
	Kernel driver in use: nouveau

00:02.0 VGA compatible controller: Intel Corporation 2nd Generation Core Processor Family Integrated Graphics Controller (rev 09) (prog-if 00 [VGA controller])
	Subsystem: Lenovo Device 21d1
	Flags: bus master, fast devsel, latency 0, IRQ 45
	Memory at f1400000 (64-bit, non-prefetchable) [size=4M]
	Memory at e0000000 (64-bit, prefetchable) [size=256M]
	I/O ports at 6000 [size=64]
	Expansion ROM at <unassigned> [disabled]
	Capabilities: [90] MSI: Enable+ Count=1/1 Maskable- 64bit-
	Capabilities: [d0] Power Management version 2
	Capabilities: [a4] PCI Advanced Features
	Kernel driver in use: i915
-- 
Netzwerkadministration/Zentrale Dienste, Interdiziplinaeres 
Zentrum fuer wissenschaftliches Rechnen der Universitaet Heidelberg
IWR; INF 368; 69120 Heidelberg; Tel: (06221)54-8236 Fax: -5224
Email: Hermann.Lauer-hEciA7+sKtudPOQpRHQ53DeJuz7u0hKX@public.gmane.org
