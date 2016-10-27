From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: GM108GLM?
Date: Thu, 27 Oct 2016 11:06:52 +0200
Message-ID: <20161027090652.diwk2u56knemvdy3@pmoreau.org>
References: <56FA7B55.6080208@translucent.dk>
 <20160331205745.GA1723@pmoreau.org>
 <CAKb7Uvgf_zzk3zaPMXbtj=6DqrT2bjrY_GpgarvV-Dv0jb=8pQ@mail.gmail.com>
 <20160331211231.GB1723@pmoreau.org>
 <5714B399.7020303@translucent.dk>
 <20160422073317.GA5655@Sovereign.cs.lth.se>
 <a8a1ba01-26e5-441c-d13c-306545f950bc@translucent.dk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1785474042=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <a8a1ba01-26e5-441c-d13c-306545f950bc-VZMzO6RJk8wFoxwNN1DV/Q@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Sune =?utf-8?B?TcO4bGdhYXJk?= <smo-VZMzO6RJk8wFoxwNN1DV/Q@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============1785474042==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n6jflznsmnkssquc"
Content-Disposition: inline


--n6jflznsmnkssquc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

The idea was to use the modesetting DDX instead of Nouveau=E2=80=99s one fo=
r Maxwell+
as EXA was [broken][1]. But you can give a try at Ilia=E2=80=99s [patches][=
2], which
fix the Nouveau DDX for GM10x and GM20x (I don=E2=80=99t think it has been =
tested on a
GM108 yet).

Best regards,
Pierre Moreau

[1]: https://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=3D3=
e2e0faa2ee1cce9c1bb5c7ad80d0592460f3edc
[2]: https://github.com/imirkin/xf86-video-nouveau/


On 11:29 am - Oct 18 2016, Sune M=C3=B8lgaard wrote:
> Hi,
>=20
> It would seem like it (attachments are from 4.9-rc1, btw), but it
> doesn't look like there is any support in the Xorg driver.
>=20
> How can I help with that?
>=20
> Best regards,
>=20
> Sune M=C3=B8lgaard
> Translucent ApS
>=20
> On 2016-04-22 09:33, Pierre Moreau wrote:
> > Hello,
> >=20
> > A patch was merged yesterday to recognise GM108 (see
> > https://github.com/skeggsb/nouveau/commit/3da1f2a19e5e8dc8d68a4400d9cca=
01c64ecd59e).
> > I guess it will make it into 4.7.
> >=20
> > Pierre
>=20

> lspci -vvvv
> 00:00.0 Host bridge: Intel Corporation Broadwell-U Host Bridge -OPI (rev =
09)
> 	Subsystem: Lenovo Broadwell-U Host Bridge -OPI
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Step=
ping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dfast >TAbort- <TAbort=
- <MAbort+ >SERR- <PERR- INTx-
> 	Latency: 0
> 	Capabilities: <access denied>
> 	Kernel driver in use: bdw_uncore
>=20
> 00:02.0 VGA compatible controller: Intel Corporation Broadwell-U Integrat=
ed Graphics (rev 09) (prog-if 00 [VGA controller])
> 	Subsystem: Lenovo Broadwell-U Integrated Graphics
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Step=
ping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dfast >TAbort- <TAbort=
- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0
> 	Interrupt: pin A routed to IRQ 49
> 	Region 0: Memory at f2000000 (64-bit, non-prefetchable) [size=3D16M]
> 	Region 2: Memory at c0000000 (64-bit, prefetchable) [size=3D512M]
> 	Region 4: I/O ports at 4000 [size=3D64]
> 	[virtual] Expansion ROM at 000c0000 [disabled] [size=3D128K]
> 	Capabilities: <access denied>
> 	Kernel driver in use: i915
> 	Kernel modules: i915
>=20
> 00:03.0 Audio device: Intel Corporation Broadwell-U Audio Controller (rev=
 09)
> 	Subsystem: Lenovo Broadwell-U Audio Controller
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Step=
ping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort=
- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupt: pin A routed to IRQ 50
> 	Region 0: Memory at f4230000 (64-bit, non-prefetchable) [size=3D16K]
> 	Capabilities: <access denied>
> 	Kernel driver in use: snd_hda_intel
> 	Kernel modules: snd_hda_intel
>=20
> 00:14.0 USB controller: Intel Corporation Wildcat Point-LP USB xHCI Contr=
oller (rev 03) (prog-if 30 [XHCI])
> 	Subsystem: Lenovo Wildcat Point-LP USB xHCI Controller
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Step=
ping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort- <TAbo=
rt- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0
> 	Interrupt: pin A routed to IRQ 42
> 	Region 0: Memory at f4220000 (64-bit, non-prefetchable) [size=3D64K]
> 	Capabilities: <access denied>
> 	Kernel driver in use: xhci_hcd
>=20
> 00:16.0 Communication controller: Intel Corporation Wildcat Point-LP MEI =
Controller #1 (rev 03)
> 	Subsystem: Lenovo Wildcat Point-LP MEI Controller
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Step=
ping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort=
- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0
> 	Interrupt: pin A routed to IRQ 46
> 	Region 0: Memory at f4239000 (64-bit, non-prefetchable) [size=3D32]
> 	Capabilities: <access denied>
> 	Kernel driver in use: mei_me
> 	Kernel modules: mei_me
>=20
> 00:19.0 Ethernet controller: Intel Corporation Ethernet Connection (3) I2=
18-V (rev 03)
> 	Subsystem: Lenovo Ethernet Connection (3) I218-V
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Step=
ping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort=
- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0
> 	Interrupt: pin A routed to IRQ 43
> 	Region 0: Memory at f4200000 (32-bit, non-prefetchable) [size=3D128K]
> 	Region 1: Memory at f423e000 (32-bit, non-prefetchable) [size=3D4K]
> 	Region 2: I/O ports at 4080 [size=3D32]
> 	Capabilities: <access denied>
> 	Kernel driver in use: e1000e
> 	Kernel modules: e1000e
>=20
> 00:1b.0 Audio device: Intel Corporation Wildcat Point-LP High Definition =
Audio Controller (rev 03)
> 	Subsystem: Lenovo Wildcat Point-LP High Definition Audio Controller
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Step=
ping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort=
- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 32, Cache Line Size: 64 bytes
> 	Interrupt: pin A routed to IRQ 47
> 	Region 0: Memory at f4234000 (64-bit, non-prefetchable) [size=3D16K]
> 	Capabilities: <access denied>
> 	Kernel driver in use: snd_hda_intel
> 	Kernel modules: snd_hda_intel
>=20
> 00:1c.0 PCI bridge: Intel Corporation Wildcat Point-LP PCI Express Root P=
ort #6 (rev e3) (prog-if 00 [Normal decode])
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Step=
ping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort=
- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupt: pin B routed to IRQ 17
> 	Bus: primary=3D00, secondary=3D02, subordinate=3D02, sec-latency=3D0
> 	I/O behind bridge: 0000f000-00000fff
> 	Memory behind bridge: f4100000-f41fffff
> 	Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort=
- <MAbort+ <SERR- <PERR-
> 	BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: <access denied>
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
>=20
> 00:1c.1 PCI bridge: Intel Corporation Wildcat Point-LP PCI Express Root P=
ort #3 (rev e3) (prog-if 00 [Normal decode])
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Step=
ping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort=
- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupt: pin C routed to IRQ 18
> 	Bus: primary=3D00, secondary=3D03, subordinate=3D03, sec-latency=3D0
> 	I/O behind bridge: 0000f000-00000fff
> 	Memory behind bridge: f4000000-f40fffff
> 	Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort=
- <MAbort+ <SERR- <PERR-
> 	BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: <access denied>
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
>=20
> 00:1c.4 PCI bridge: Intel Corporation Wildcat Point-LP PCI Express Root P=
ort #5 (rev e3) (prog-if 00 [Normal decode])
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Step=
ping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort=
- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupt: pin A routed to IRQ 16
> 	Bus: primary=3D00, secondary=3D08, subordinate=3D08, sec-latency=3D0
> 	I/O behind bridge: 00003000-00003fff
> 	Memory behind bridge: f3000000-f3ffffff
> 	Prefetchable memory behind bridge: 00000000e0000000-00000000f1ffffff
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort=
- <MAbort+ <SERR- <PERR-
> 	BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: <access denied>
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
>=20
> 00:1d.0 USB controller: Intel Corporation Wildcat Point-LP USB EHCI Contr=
oller (rev 03) (prog-if 20 [EHCI])
> 	Subsystem: Lenovo Wildcat Point-LP USB EHCI Controller
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Step=
ping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort- <TAbo=
rt- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0
> 	Interrupt: pin A routed to IRQ 23
> 	Region 0: Memory at f423d000 (32-bit, non-prefetchable) [size=3D1K]
> 	Capabilities: <access denied>
> 	Kernel driver in use: ehci-pci
>=20
> 00:1f.0 ISA bridge: Intel Corporation Wildcat Point-LP LPC Controller (re=
v 03)
> 	Subsystem: Lenovo Wildcat Point-LP LPC Controller
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Step=
ping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dmedium >TAbort- <TAbo=
rt- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0
> 	Capabilities: <access denied>
> 	Kernel driver in use: lpc_ich
> 	Kernel modules: lpc_ich
>=20
> 00:1f.2 SATA controller: Intel Corporation Wildcat Point-LP SATA Controll=
er [AHCI Mode] (rev 03) (prog-if 01 [AHCI 1.0])
> 	Subsystem: Lenovo Wildcat Point-LP SATA Controller [AHCI Mode]
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Step=
ping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort- <TAbo=
rt- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0
> 	Interrupt: pin B routed to IRQ 19
> 	Region 0: I/O ports at 40a8 [size=3D8]
> 	Region 1: I/O ports at 40b4 [size=3D4]
> 	Region 2: I/O ports at 40a0 [size=3D8]
> 	Region 3: I/O ports at 40b0 [size=3D4]
> 	Region 4: I/O ports at 4060 [size=3D32]
> 	Region 5: Memory at f423c000 (32-bit, non-prefetchable) [size=3D2K]
> 	Capabilities: <access denied>
> 	Kernel driver in use: ahci
> 	Kernel modules: ahci
>=20
> 00:1f.3 SMBus: Intel Corporation Wildcat Point-LP SMBus Controller (rev 0=
3)
> 	Subsystem: Lenovo Wildcat Point-LP SMBus Controller
> 	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Step=
ping- SERR- FastB2B- DisINTx-
> 	Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort- <TAbo=
rt- <MAbort- >SERR- <PERR- INTx-
> 	Interrupt: pin C routed to IRQ 10
> 	Region 0: Memory at f4238000 (64-bit, non-prefetchable) [size=3D256]
> 	Region 4: I/O ports at efa0 [size=3D32]
> 	Kernel modules: i2c_i801
>=20
> 00:1f.6 Signal processing controller: Intel Corporation Wildcat Point-LP =
Thermal Management Controller (rev 03)
> 	Subsystem: Lenovo Wildcat Point-LP Thermal Management Controller
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Step=
ping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort=
- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0
> 	Interrupt: pin C routed to IRQ 18
> 	Region 0: Memory at f423b000 (64-bit, non-prefetchable) [size=3D4K]
> 	Capabilities: <access denied>
> 	Kernel driver in use: intel_pch_thermal
> 	Kernel modules: intel_pch_thermal
>=20
> 02:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS5227 =
PCI Express Card Reader (rev 01)
> 	Subsystem: Lenovo RTS5227 PCI Express Card Reader
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Step=
ping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort=
- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupt: pin A routed to IRQ 44
> 	Region 0: Memory at f4100000 (32-bit, non-prefetchable) [size=3D4K]
> 	Capabilities: <access denied>
> 	Kernel driver in use: rtsx_pci
> 	Kernel modules: rtsx_pci
>=20
> 03:00.0 Network controller: Intel Corporation Wireless 7265 (rev 99)
> 	Subsystem: Intel Corporation Dual Band Wireless-AC 7265
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Step=
ping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort=
- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupt: pin A routed to IRQ 48
> 	Region 0: Memory at f4000000 (64-bit, non-prefetchable) [size=3D8K]
> 	Capabilities: <access denied>
> 	Kernel driver in use: iwlwifi
> 	Kernel modules: iwlwifi
>=20
> 08:00.0 3D controller: NVIDIA Corporation GM108GLM [Quadro K620M] (rev a2)
> 	Subsystem: Lenovo GM108GLM [Quadro K620M]
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Step=
ping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort=
- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupt: pin A routed to IRQ 45
> 	Region 0: Memory at f3000000 (32-bit, non-prefetchable) [size=3D16M]
> 	Region 1: Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
> 	Region 3: Memory at f0000000 (64-bit, prefetchable) [size=3D32M]
> 	Region 5: I/O ports at 3000 [size=3D128]
> 	Expansion ROM at <ignored> [disabled]
> 	Capabilities: <access denied>
> 	Kernel driver in use: nouveau
> 	Kernel modules: nvidiafb, nouveau
>=20

> dmesg |egrep -i "nouveau|nvidia"
> [    1.893467] nouveau: detected PR support, will not use DSM
> [    1.893677] nouveau 0000:08:00.0: NVIDIA GM108 (1183a0a2)
> [    1.907342] nouveau 0000:08:00.0: bios: version 82.08.1f.00.03
> [    1.991211] nouveau 0000:08:00.0: priv: HUB0: 6013d4 badf573f (1d40820=
0)
> [    1.991212] nouveau 0000:08:00.0: fb: 2048 MiB DDR3
> [    3.269352] nouveau 0000:08:00.0: DRM: VRAM: 2048 MiB
> [    3.269408] nouveau 0000:08:00.0: DRM: GART: 1048576 MiB
> [    3.269465] nouveau 0000:08:00.0: DRM: Pointer to TMDS table invalid
> [    3.269523] nouveau 0000:08:00.0: DRM: DCB version 4.0
> [    3.269579] nouveau 0000:08:00.0: DRM: Pointer to flat panel table inv=
alid
> [    3.451054] nouveau 0000:08:00.0: DRM: MM: using COPY for buffer copies
> [    3.451117] [drm] Initialized nouveau 1.3.1 20120801 for 0000:08:00.0 =
on minor 0
> [    8.925115] nouveau 0000:08:00.0: DRM: evicting buffers...
> [    8.925189] nouveau 0000:08:00.0: DRM: waiting for kernel channels to =
go idle...
> [    8.925283] nouveau 0000:08:00.0: DRM: suspending client object trees.=
=2E.
> [    8.929091] nouveau 0000:08:00.0: DRM: suspending kernel object tree...
> [   17.449259]  hid_logitech_hidpp hid_logitech_dj usbhid hid crct10dif_p=
clmul rtsx_pci_sdmmc crc32_pclmul crc32c_intel mmc_core nouveau ghash_clmul=
ni_intel aesni_intel mxm_wmi i2c_algo_bit aes_x86_64 ttm lrw gf128mul glue_=
helper drm_kms_helper ablk_helper cryptd syscopyarea sysfillrect psmouse sy=
simgblt fb_sys_fops drm ahci libahci rtsx_pci e1000e ptp pps_core thermal w=
mi fjes video button
> [   18.641499] nouveau 0000:08:00.0: DRM: resuming kernel object tree...
> [   18.724503] nouveau 0000:08:00.0: priv: HUB0: 6013d4 badf573f (1f40820=
0)
> [   18.761491] nouveau 0000:08:00.0: priv: HUB0: 10ecc0 ffffffff (1d40822=
c)
> [   18.761992] nouveau 0000:08:00.0: DRM: resuming client object trees...
> [   26.025637] nouveau 0000:08:00.0: DRM: evicting buffers...
> [   26.025639] nouveau 0000:08:00.0: DRM: waiting for kernel channels to =
go idle...
> [   26.025662] nouveau 0000:08:00.0: DRM: suspending client object trees.=
=2E.
> [   26.029451] nouveau 0000:08:00.0: DRM: suspending kernel object tree...

> [    20.874]=20
> X.Org X Server 1.18.4
> Release Date: 2016-07-19
> [    20.874] X Protocol Version 11, Revision 0
> [    20.874] Build Operating System: Linux 3.13.0-95-generic x86_64 Ubuntu
> [    20.874] Current Operating System: Linux dell-smo 4.9.0-040900rc1-gen=
eric #201610151630 SMP Sat Oct 15 20:33:39 UTC 2016 x86_64
> [    20.874] Kernel command line: BOOT_IMAGE=3D/vmlinuz-4.9.0-040900rc1-g=
eneric root=3DUUID=3Da9421b5e-ff3f-4ebd-8f9f-13d24c76ba34 ro cryptopts=3Dta=
rget=3Dsda6_crypt,source=3D/dev/disk/by-uuid/64096e82-f7f4-4917-80df-e123aa=
15a022,discard vt.handoff=3D7
> [    20.874] Build Date: 14 September 2016  03:33:24PM
> [    20.874] xorg-server 2:1.18.4-0ubuntu0.1 (For technical support pleas=
e see http://www.ubuntu.com/support)=20
> [    20.874] Current version of pixman: 0.33.6
> [    20.874] 	Before reporting problems, check http://wiki.x.org
> 	to make sure that you have the latest version.
> [    20.874] Markers: (--) probed, (**) from config file, (=3D=3D) defaul=
t setting,
> 	(++) from command line, (!!) notice, (II) informational,
> 	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
> [    20.874] (=3D=3D) Log file: "/var/log/Xorg.0.log", Time: Tue Oct 18 0=
9:21:13 2016
> [    20.877] (=3D=3D) Using system config directory "/usr/share/X11/xorg.=
conf.d"
> [    20.881] (=3D=3D) No Layout section.  Using the first Screen section.
> [    20.881] (=3D=3D) No screen section available. Using defaults.
> [    20.881] (**) |-->Screen "Default Screen Section" (0)
> [    20.881] (**) |   |-->Monitor "<default monitor>"
> [    20.882] (=3D=3D) No monitor specified for screen "Default Screen Sec=
tion".
> 	Using a default monitor configuration.
> [    20.882] (=3D=3D) Automatically adding devices
> [    20.882] (=3D=3D) Automatically enabling devices
> [    20.882] (=3D=3D) Automatically adding GPU devices
> [    20.882] (=3D=3D) Max clients allowed: 256, resource mask: 0x1fffff
> [    20.889] (WW) The directory "/usr/share/fonts/X11/cyrillic" does not =
exist.
> [    20.889] 	Entry deleted from font path.
> [    20.892] (WW) The directory "/usr/share/fonts/X11/75dpi/" does not ex=
ist.
> [    20.892] 	Entry deleted from font path.
> [    20.893] (WW) The directory "/usr/share/fonts/X11/75dpi" does not exi=
st.
> [    20.893] 	Entry deleted from font path.
> [    20.893] (=3D=3D) FontPath set to:
> 	/usr/share/fonts/X11/misc,
> 	/usr/share/fonts/X11/100dpi/:unscaled,
> 	/usr/share/fonts/X11/Type1,
> 	/usr/share/fonts/X11/100dpi,
> 	built-ins
> [    20.893] (=3D=3D) ModulePath set to "/usr/lib/x86_64-linux-gnu/xorg/e=
xtra-modules,/usr/lib/xorg/extra-modules,/usr/lib/xorg/modules"
> [    20.893] (II) The server relies on udev to provide the list of input =
devices.
> 	If no devices become available, reconfigure udev or disable AutoAddDevic=
es.
> [    20.894] (II) Loader magic: 0x563366d65dc0
> [    20.894] (II) Module ABI versions:
> [    20.894] 	X.Org ANSI C Emulation: 0.4
> [    20.894] 	X.Org Video Driver: 20.0
> [    20.894] 	X.Org XInput driver : 22.1
> [    20.894] 	X.Org Server Extension : 9.0
> [    20.895] (++) using VT number 7
>=20
> [    20.895] (II) systemd-logind: logind integration requires -keeptty an=
d -keeptty was not provided, disabling logind integration
> [    20.895] (II) xfree86: Adding drm device (/dev/dri/card1)
> [    20.910] (II) xfree86: Adding drm device (/dev/dri/card0)
> [    20.912] (--) PCI:*(0:0:2:0) 8086:1616:17aa:2225 rev 9, Mem @ 0xf2000=
000/16777216, 0xc0000000/536870912, I/O @ 0x00004000/64, BIOS @ 0x????????/=
131072
> [    20.912] (--) PCI: (0:8:0:0) 10de:137a:17aa:2225 rev 162, Mem @ 0xf30=
00000/16777216, 0xe0000000/268435456, 0xf0000000/33554432, I/O @ 0x00003000=
/128
> [    20.912] (II) LoadModule: "glx"
> [    20.936] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
> [    20.980] (II) Module glx: vendor=3D"X.Org Foundation"
> [    20.980] 	compiled for 1.18.4, module version =3D 1.0.0
> [    20.980] 	ABI class: X.Org Server Extension, version 9.0
> [    20.980] (=3D=3D) AIGLX enabled
> [    20.980] (=3D=3D) Matched intel as autoconfigured driver 0
> [    20.980] (=3D=3D) Matched nvidia as autoconfigured driver 1
> [    20.980] (=3D=3D) Matched nouveau as autoconfigured driver 2
> [    20.980] (=3D=3D) Matched intel as autoconfigured driver 3
> [    20.980] (=3D=3D) Matched modesetting as autoconfigured driver 4
> [    20.980] (=3D=3D) Matched fbdev as autoconfigured driver 5
> [    20.980] (=3D=3D) Matched vesa as autoconfigured driver 6
> [    20.980] (=3D=3D) Assigned the driver to the xf86ConfigLayout
> [    20.980] (II) LoadModule: "intel"
> [    20.983] (II) Loading /usr/lib/xorg/modules/drivers/intel_drv.so
> [    20.988] (II) Module intel: vendor=3D"X.Org Foundation"
> [    20.988] 	compiled for 1.18.4, module version =3D 2.99.917
> [    20.988] 	Module class: X.Org Video Driver
> [    20.988] 	ABI class: X.Org Video Driver, version 20.0
> [    20.988] (II) LoadModule: "nvidia"
> [    20.991] (WW) Warning, couldn't open module nvidia
> [    20.991] (II) UnloadModule: "nvidia"
> [    20.991] (II) Unloading nvidia
> [    20.991] (EE) Failed to load module "nvidia" (module does not exist, =
0)
> [    20.991] (II) LoadModule: "nouveau"
> [    20.991] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
> [    20.994] (II) Module nouveau: vendor=3D"X.Org Foundation"
> [    20.994] 	compiled for 1.18.3, module version =3D 1.0.13
> [    20.994] 	Module class: X.Org Video Driver
> [    20.994] 	ABI class: X.Org Video Driver, version 20.0
> [    20.994] (II) LoadModule: "modesetting"
> [    20.994] (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
> [    20.995] (II) Module modesetting: vendor=3D"X.Org Foundation"
> [    20.995] 	compiled for 1.18.4, module version =3D 1.18.4
> [    20.995] 	Module class: X.Org Video Driver
> [    20.995] 	ABI class: X.Org Video Driver, version 20.0
> [    20.995] (II) LoadModule: "fbdev"
> [    20.995] (WW) Warning, couldn't open module fbdev
> [    20.995] (II) UnloadModule: "fbdev"
> [    20.995] (II) Unloading fbdev
> [    20.995] (EE) Failed to load module "fbdev" (module does not exist, 0)
> [    20.995] (II) LoadModule: "vesa"
> [    20.995] (WW) Warning, couldn't open module vesa
> [    20.995] (II) UnloadModule: "vesa"
> [    20.995] (II) Unloading vesa
> [    20.995] (EE) Failed to load module "vesa" (module does not exist, 0)
> [    20.995] (=3D=3D) Matched intel as autoconfigured driver 0
> [    20.995] (=3D=3D) Matched nvidia as autoconfigured driver 1
> [    20.995] (=3D=3D) Matched nouveau as autoconfigured driver 2
> [    20.995] (=3D=3D) Matched intel as autoconfigured driver 3
> [    20.995] (=3D=3D) Matched modesetting as autoconfigured driver 4
> [    20.995] (=3D=3D) Matched fbdev as autoconfigured driver 5
> [    20.995] (=3D=3D) Matched vesa as autoconfigured driver 6
> [    20.995] (=3D=3D) Assigned the driver to the xf86ConfigLayout
> [    20.995] (II) LoadModule: "intel"
> [    20.996] (II) Loading /usr/lib/xorg/modules/drivers/intel_drv.so
> [    20.996] (II) Module intel: vendor=3D"X.Org Foundation"
> [    20.996] 	compiled for 1.18.4, module version =3D 2.99.917
> [    20.996] 	Module class: X.Org Video Driver
> [    20.996] 	ABI class: X.Org Video Driver, version 20.0
> [    20.996] (II) UnloadModule: "intel"
> [    20.996] (II) Unloading intel
> [    20.996] (II) Failed to load module "intel" (already loaded, 22067)
> [    20.996] (II) LoadModule: "nvidia"
> [    20.996] (WW) Warning, couldn't open module nvidia
> [    20.996] (II) UnloadModule: "nvidia"
> [    20.996] (II) Unloading nvidia
> [    20.996] (EE) Failed to load module "nvidia" (module does not exist, =
0)
> [    20.996] (II) LoadModule: "nouveau"
> [    20.996] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
> [    20.996] (II) Module nouveau: vendor=3D"X.Org Foundation"
> [    20.996] 	compiled for 1.18.3, module version =3D 1.0.13
> [    20.996] 	Module class: X.Org Video Driver
> [    20.996] 	ABI class: X.Org Video Driver, version 20.0
> [    20.996] (II) UnloadModule: "nouveau"
> [    20.996] (II) Unloading nouveau
> [    20.996] (II) Failed to load module "nouveau" (already loaded, 0)
> [    20.996] (II) LoadModule: "modesetting"
> [    20.996] (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
> [    20.996] (II) Module modesetting: vendor=3D"X.Org Foundation"
> [    20.996] 	compiled for 1.18.4, module version =3D 1.18.4
> [    20.996] 	Module class: X.Org Video Driver
> [    20.996] 	ABI class: X.Org Video Driver, version 20.0
> [    20.996] (II) UnloadModule: "modesetting"
> [    20.996] (II) Unloading modesetting
> [    20.996] (II) Failed to load module "modesetting" (already loaded, 0)
> [    20.996] (II) LoadModule: "fbdev"
> [    20.996] (WW) Warning, couldn't open module fbdev
> [    20.996] (II) UnloadModule: "fbdev"
> [    20.996] (II) Unloading fbdev
> [    20.996] (EE) Failed to load module "fbdev" (module does not exist, 0)
> [    20.996] (II) LoadModule: "vesa"
> [    20.997] (WW) Warning, couldn't open module vesa
> [    20.997] (II) UnloadModule: "vesa"
> [    20.997] (II) Unloading vesa
> [    20.997] (EE) Failed to load module "vesa" (module does not exist, 0)
> [    20.997] (II) intel: Driver for Intel(R) Integrated Graphics Chipsets:
> 	i810, i810-dc100, i810e, i815, i830M, 845G, 854, 852GM/855GM, 865G,
> 	915G, E7221 (i915), 915GM, 945G, 945GM, 945GME, Pineview GM,
> 	Pineview G, 965G, G35, 965Q, 946GZ, 965GM, 965GME/GLE, G33, Q35, Q33,
> 	GM45, 4 Series, G45/G43, Q45/Q43, G41, B43
> [    20.997] (II) intel: Driver for Intel(R) HD Graphics: 2000-6000
> [    20.997] (II) intel: Driver for Intel(R) Iris(TM) Graphics: 5100, 6100
> [    20.997] (II) intel: Driver for Intel(R) Iris(TM) Pro Graphics: 5200,=
 6200, P6300
> [    20.997] (II) NOUVEAU driver=20
> [    20.997] (II) NOUVEAU driver for NVIDIA chipset families :
> [    20.997] 	RIVA TNT        (NV04)
> [    20.997] 	RIVA TNT2       (NV05)
> [    20.997] 	GeForce 256     (NV10)
> [    20.997] 	GeForce 2       (NV11, NV15)
> [    20.997] 	GeForce 4MX     (NV17, NV18)
> [    20.997] 	GeForce 3       (NV20)
> [    20.997] 	GeForce 4Ti     (NV25, NV28)
> [    20.997] 	GeForce FX      (NV3x)
> [    20.997] 	GeForce 6       (NV4x)
> [    20.997] 	GeForce 7       (G7x)
> [    20.997] 	GeForce 8       (G8x)
> [    20.997] 	GeForce GTX 200 (NVA0)
> [    20.997] 	GeForce GTX 400 (NVC0)
> [    20.997] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
> [    21.020] (II) intel(0): Using Kernel Mode Setting driver: i915, versi=
on 1.6.0 20160919
> [    21.020] (II) intel(0): SNA compiled: xserver-xorg-video-intel 2:2.99=
=2E917+git1610121931.eb01cc~gd~x (Oibaf <fmrummey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>)
> [    21.020] (II) intel(0): SNA compiled for use with valgrind
> [    21.022] (II) [drm] nouveau interface version: 1.3.1
> [    21.022] (EE) Unknown chipset: NV118
> [    21.022] (WW) Falling back to old probe method for modesetting
> [    21.024] (--) intel(0): Integrated Graphics Chipset: Intel(R) HD Grap=
hics 5500
> [    21.024] (--) intel(0): CPU: x86-64, sse2, sse3, ssse3, sse4.1, sse4.=
2, avx, avx2; using a maximum of 2 threads
> [    21.024] (II) intel(0): Creating default Display subsection in Screen=
 section
> 	"Default Screen Section" for depth/fbbpp 24/32
> [    21.024] (=3D=3D) intel(0): Depth 24, (--) framebuffer bpp 32
> [    21.024] (=3D=3D) intel(0): RGB weight 888
> [    21.024] (=3D=3D) intel(0): Default visual is TrueColor
> [    21.024] (II) intel(0): Output eDP1 has no monitor section
> [    21.052] (--) intel(0): Found backlight control interface intel_backl=
ight (type 'raw') for output eDP1
> [    21.052] (II) intel(0): Enabled output eDP1
> [    21.052] (II) intel(0): Output DP1 has no monitor section
> [    21.052] (II) intel(0): Enabled output DP1
> [    21.052] (II) intel(0): Output HDMI1 has no monitor section
> [    21.052] (II) intel(0): Enabled output HDMI1
> [    21.052] (II) intel(0): Output DP2 has no monitor section
> [    21.052] (II) intel(0): Enabled output DP2
> [    21.052] (II) intel(0): Output HDMI2 has no monitor section
> [    21.052] (II) intel(0): Enabled output HDMI2
> [    21.052] (--) intel(0): Using a maximum size of 256x256 for hardware =
cursors
> [    21.052] (II) intel(0): Output VIRTUAL1 has no monitor section
> [    21.052] (II) intel(0): Enabled output VIRTUAL1
> [    21.052] (--) intel(0): Output eDP1 using initial mode 2880x1620 on p=
ipe 0
> [    21.052] (--) intel(0): Output DP1 using initial mode 2560x1440 on pi=
pe 1
> [    21.052] (=3D=3D) intel(0): TearFree enabled
> [    21.052] (=3D=3D) intel(0): DPI set to (96, 96)
> [    21.052] (II) Loading sub module "dri2"
> [    21.052] (II) LoadModule: "dri2"
> [    21.053] (II) Module "dri2" already built-in
> [    21.053] (II) Loading sub module "present"
> [    21.053] (II) LoadModule: "present"
> [    21.053] (II) Module "present" already built-in
> [    21.053] (=3D=3D) Depth 24 pixmap format is 32 bpp
> [    21.058] (II) intel(0): SNA initialized with Broadwell (gen8) backend
> [    21.058] (=3D=3D) intel(0): Backing store enabled
> [    21.058] (=3D=3D) intel(0): Silken mouse enabled
> [    21.060] (II) intel(0): HW Cursor enabled
> [    21.060] (II) intel(0): RandR 1.2 enabled, ignore the following RandR=
 disabled message.
> [    21.061] (=3D=3D) intel(0): DPMS enabled
> [    21.061] (=3D=3D) intel(0): Display hotplug detection enabled
> [    21.061] (II) intel(0): [DRI2] Setup complete
> [    21.061] (II) intel(0): [DRI2]   DRI driver: i965
> [    21.061] (II) intel(0): [DRI2]   VDPAU driver: va_gl
> [    21.061] (II) intel(0): direct rendering: DRI2 enabled
> [    21.061] (II) intel(0): hardware support for Present enabled
> [    21.061] (--) RandR disabled
> [    21.067] (II) SELinux: Disabled on system
> [    21.115] (II) AIGLX: enabled GLX_MESA_copy_sub_buffer
> [    21.115] (II) AIGLX: enabled GLX_ARB_create_context
> [    21.115] (II) AIGLX: enabled GLX_ARB_create_context_profile
> [    21.115] (II) AIGLX: enabled GLX_EXT_create_context_es{,2}_profile
> [    21.115] (II) AIGLX: enabled GLX_INTEL_swap_event
> [    21.115] (II) AIGLX: enabled GLX_SGI_swap_control and GLX_MESA_swap_c=
ontrol
> [    21.115] (II) AIGLX: enabled GLX_EXT_framebuffer_sRGB
> [    21.115] (II) AIGLX: enabled GLX_ARB_fbconfig_float
> [    21.115] (II) AIGLX: enabled GLX_EXT_fbconfig_packed_float
> [    21.115] (II) AIGLX: GLX_EXT_texture_from_pixmap backed by buffer obj=
ects
> [    21.115] (II) AIGLX: enabled GLX_ARB_create_context_robustness
> [    21.116] (II) AIGLX: Loaded and initialized i965
> [    21.116] (II) GLX: Initialized DRI2 GL provider for screen 0
> [    21.125] (II) intel(0): switch to mode 2880x1620@60.0 on eDP1 using p=
ipe 0, position (0, 0), rotation normal, reflection none
> [    21.126] (II) intel(0): switch to mode 2560x1440@60.0 on DP1 using pi=
pe 1, position (0, 0), rotation normal, reflection none
> [    21.127] (II) intel(0): Setting screen physical size to 762 x 428
> [    21.271] (II) config/udev: Adding input device Power Button (/dev/inp=
ut/event3)
> [    21.276] (**) Power Button: Applying InputClass "evdev keyboard catch=
all"
> [    21.276] (II) LoadModule: "evdev"
> [    21.276] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
> [    21.279] (II) Module evdev: vendor=3D"X.Org Foundation"
> [    21.280] 	compiled for 1.18.1, module version =3D 2.10.1
> [    21.280] 	Module class: X.Org XInput Driver
> [    21.280] 	ABI class: X.Org XInput driver, version 22.1
> [    21.280] (II) Using input driver 'evdev' for 'Power Button'
> [    21.280] (**) Power Button: always reports core events
> [    21.280] (**) evdev: Power Button: Device: "/dev/input/event3"
> [    21.280] (--) evdev: Power Button: Vendor 0 Product 0x1
> [    21.280] (--) evdev: Power Button: Found keys
> [    21.280] (II) evdev: Power Button: Configuring as keyboard
> [    21.280] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNX=
PWRBN:00/input/input4/event3"
> [    21.280] (II) XINPUT: Adding extended input device "Power Button" (ty=
pe: KEYBOARD, id 6)
> [    21.280] (**) Option "xkb_rules" "evdev"
> [    21.280] (**) Option "xkb_model" "pc105"
> [    21.280] (**) Option "xkb_layout" "dk"
> [    21.359] (II) config/udev: Adding input device Video Bus (/dev/input/=
event15)
> [    21.359] (**) Video Bus: Applying InputClass "evdev keyboard catchall"
> [    21.359] (II) Using input driver 'evdev' for 'Video Bus'
> [    21.359] (**) Video Bus: always reports core events
> [    21.359] (**) evdev: Video Bus: Device: "/dev/input/event15"
> [    21.359] (--) evdev: Video Bus: Vendor 0 Product 0x6
> [    21.359] (--) evdev: Video Bus: Found keys
> [    21.359] (II) evdev: Video Bus: Configuring as keyboard
> [    21.359] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNX=
SYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input16/event15"
> [    21.359] (II) XINPUT: Adding extended input device "Video Bus" (type:=
 KEYBOARD, id 7)
> [    21.359] (**) Option "xkb_rules" "evdev"
> [    21.359] (**) Option "xkb_model" "pc105"
> [    21.359] (**) Option "xkb_layout" "dk"
> [    21.359] (II) config/udev: Adding input device Video Bus (/dev/input/=
event16)
> [    21.359] (**) Video Bus: Applying InputClass "evdev keyboard catchall"
> [    21.361] (II) Using input driver 'evdev' for 'Video Bus'
> [    21.361] (**) Video Bus: always reports core events
> [    21.361] (**) evdev: Video Bus: Device: "/dev/input/event16"
> [    21.361] (--) evdev: Video Bus: Vendor 0 Product 0x6
> [    21.361] (--) evdev: Video Bus: Found keys
> [    21.361] (II) evdev: Video Bus: Configuring as keyboard
> [    21.361] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNX=
SYBUS:00/PNP0A08:00/device:09/LNXVIDEO:01/input/input17/event16"
> [    21.361] (II) XINPUT: Adding extended input device "Video Bus" (type:=
 KEYBOARD, id 8)
> [    21.361] (**) Option "xkb_rules" "evdev"
> [    21.361] (**) Option "xkb_model" "pc105"
> [    21.361] (**) Option "xkb_layout" "dk"
> [    21.362] (II) config/udev: Adding input device Lid Switch (/dev/input=
/event1)
> [    21.362] (II) No input driver specified, ignoring this device.
> [    21.362] (II) This device may have been added with another device fil=
e.
> [    21.362] (II) config/udev: Adding input device Sleep Button (/dev/inp=
ut/event2)
> [    21.362] (**) Sleep Button: Applying InputClass "evdev keyboard catch=
all"
> [    21.362] (II) Using input driver 'evdev' for 'Sleep Button'
> [    21.362] (**) Sleep Button: always reports core events
> [    21.362] (**) evdev: Sleep Button: Device: "/dev/input/event2"
> [    21.362] (--) evdev: Sleep Button: Vendor 0 Product 0x3
> [    21.364] (--) evdev: Sleep Button: Found keys
> [    21.364] (II) evdev: Sleep Button: Configuring as keyboard
> [    21.364] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNX=
SYBUS:00/PNP0C0E:00/input/input3/event2"
> [    21.364] (II) XINPUT: Adding extended input device "Sleep Button" (ty=
pe: KEYBOARD, id 9)
> [    21.364] (**) Option "xkb_rules" "evdev"
> [    21.364] (**) Option "xkb_model" "pc105"
> [    21.364] (**) Option "xkb_layout" "dk"
> [    21.365] (II) config/udev: Adding input device HDA Intel HDMI HDMI/DP=
,pcm=3D3 (/dev/input/event18)
> [    21.365] (II) No input driver specified, ignoring this device.
> [    21.365] (II) This device may have been added with another device fil=
e.
> [    21.365] (II) config/udev: Adding input device HDA Intel HDMI HDMI/DP=
,pcm=3D7 (/dev/input/event19)
> [    21.365] (II) No input driver specified, ignoring this device.
> [    21.365] (II) This device may have been added with another device fil=
e.
> [    21.365] (II) config/udev: Adding input device HDA Intel HDMI HDMI/DP=
,pcm=3D8 (/dev/input/event20)
> [    21.365] (II) No input driver specified, ignoring this device.
> [    21.365] (II) This device may have been added with another device fil=
e.
> [    21.366] (II) config/udev: Adding input device Logitech M705 (/dev/in=
put/event4)
> [    21.366] (**) Logitech M705: Applying InputClass "evdev pointer catch=
all"
> [    21.366] (II) Using input driver 'evdev' for 'Logitech M705'
> [    21.366] (**) Logitech M705: always reports core events
> [    21.366] (**) evdev: Logitech M705: Device: "/dev/input/event4"
> [    21.366] (--) evdev: Logitech M705: Vendor 0x46d Product 0x101b
> [    21.366] (--) evdev: Logitech M705: Found 20 mouse buttons
> [    21.366] (--) evdev: Logitech M705: Found scroll wheel(s)
> [    21.366] (--) evdev: Logitech M705: Found relative axes
> [    21.366] (--) evdev: Logitech M705: Found x and y relative axes
> [    21.366] (II) evdev: Logitech M705: Configuring as mouse
> [    21.366] (II) evdev: Logitech M705: Adding scrollwheel support
> [    21.366] (**) evdev: Logitech M705: YAxisMapping: buttons 4 and 5
> [    21.366] (**) evdev: Logitech M705: EmulateWheelButton: 4, EmulateWhe=
elInertia: 10, EmulateWheelTimeout: 200
> [    21.366] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000=
:00:14.0/usb2/2-1/2-1:1.2/0003:046D:C52B.0003/0003:046D:101B.0004/input/inp=
ut6/event4"
> [    21.366] (II) XINPUT: Adding extended input device "Logitech M705" (t=
ype: MOUSE, id 10)
> [    21.366] (II) evdev: Logitech M705: initialized for relative axes.
> [    21.366] (**) Logitech M705: (accel) keeping acceleration scheme 1
> [    21.366] (**) Logitech M705: (accel) acceleration profile 0
> [    21.366] (**) Logitech M705: (accel) acceleration factor: 2.000
> [    21.366] (**) Logitech M705: (accel) acceleration threshold: 4
> [    21.367] (II) config/udev: Adding input device Logitech M705 (/dev/in=
put/mouse0)
> [    21.367] (II) No input driver specified, ignoring this device.
> [    21.367] (II) This device may have been added with another device fil=
e.
> [    21.367] (II) config/udev: Adding input device Lite-On Technology USB=
 Productivity Option Keyboard( has the hub in # 1 ) (/dev/input/event6)
> [    21.367] (**) Lite-On Technology USB Productivity Option Keyboard( ha=
s the hub in # 1 ): Applying InputClass "evdev keyboard catchall"
> [    21.367] (II) Using input driver 'evdev' for 'Lite-On Technology USB =
Productivity Option Keyboard( has the hub in # 1 )'
> [    21.367] (**) Lite-On Technology USB Productivity Option Keyboard( ha=
s the hub in # 1 ): always reports core events
> [    21.367] (**) evdev: Lite-On Technology USB Productivity Option Keybo=
ard( has the hub in # 1 ): Device: "/dev/input/event6"
> [    21.367] (--) evdev: Lite-On Technology USB Productivity Option Keybo=
ard( has the hub in # 1 ): Vendor 0x4b3 Product 0x301b
> [    21.367] (--) evdev: Lite-On Technology USB Productivity Option Keybo=
ard( has the hub in # 1 ): Found keys
> [    21.367] (II) evdev: Lite-On Technology USB Productivity Option Keybo=
ard( has the hub in # 1 ): Configuring as keyboard
> [    21.367] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000=
:00:14.0/usb2/2-2/2-2.2/2-2.2.1/2-2.2.1:1.0/0003:04B3:301B.0005/input/input=
8/event6"
> [    21.367] (II) XINPUT: Adding extended input device "Lite-On Technolog=
y USB Productivity Option Keyboard( has the hub in # 1 )" (type: KEYBOARD, =
id 11)
> [    21.367] (**) Option "xkb_rules" "evdev"
> [    21.367] (**) Option "xkb_model" "pc105"
> [    21.367] (**) Option "xkb_layout" "dk"
> [    21.368] (II) config/udev: Adding input device Lite-On Technology USB=
 Productivity Option Keyboard( has the hub in # 1 ) (/dev/input/event7)
> [    21.368] (**) Lite-On Technology USB Productivity Option Keyboard( ha=
s the hub in # 1 ): Applying InputClass "evdev keyboard catchall"
> [    21.368] (II) Using input driver 'evdev' for 'Lite-On Technology USB =
Productivity Option Keyboard( has the hub in # 1 )'
> [    21.368] (**) Lite-On Technology USB Productivity Option Keyboard( ha=
s the hub in # 1 ): always reports core events
> [    21.368] (**) evdev: Lite-On Technology USB Productivity Option Keybo=
ard( has the hub in # 1 ): Device: "/dev/input/event7"
> [    21.368] (--) evdev: Lite-On Technology USB Productivity Option Keybo=
ard( has the hub in # 1 ): Vendor 0x4b3 Product 0x301b
> [    21.368] (--) evdev: Lite-On Technology USB Productivity Option Keybo=
ard( has the hub in # 1 ): Found keys
> [    21.368] (II) evdev: Lite-On Technology USB Productivity Option Keybo=
ard( has the hub in # 1 ): Configuring as keyboard
> [    21.368] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000=
:00:14.0/usb2/2-2/2-2.2/2-2.2.1/2-2.2.1:1.1/0003:04B3:301B.0006/input/input=
9/event7"
> [    21.368] (II) XINPUT: Adding extended input device "Lite-On Technolog=
y USB Productivity Option Keyboard( has the hub in # 1 )" (type: KEYBOARD, =
id 12)
> [    21.368] (**) Option "xkb_rules" "evdev"
> [    21.368] (**) Option "xkb_model" "pc105"
> [    21.368] (**) Option "xkb_layout" "dk"
> [    21.369] (II) config/udev: Adding input device Integrated Camera (/de=
v/input/event17)
> [    21.369] (**) Integrated Camera: Applying InputClass "evdev keyboard =
catchall"
> [    21.369] (II) Using input driver 'evdev' for 'Integrated Camera'
> [    21.369] (**) Integrated Camera: always reports core events
> [    21.369] (**) evdev: Integrated Camera: Device: "/dev/input/event17"
> [    21.369] (--) evdev: Integrated Camera: Vendor 0x5986 Product 0x366
> [    21.369] (--) evdev: Integrated Camera: Found keys
> [    21.369] (II) evdev: Integrated Camera: Configuring as keyboard
> [    21.369] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000=
:00:14.0/usb2/2-8/2-8:1.0/input/input18/event17"
> [    21.369] (II) XINPUT: Adding extended input device "Integrated Camera=
" (type: KEYBOARD, id 13)
> [    21.369] (**) Option "xkb_rules" "evdev"
> [    21.369] (**) Option "xkb_model" "pc105"
> [    21.369] (**) Option "xkb_layout" "dk"
> [    21.370] (II) config/udev: Adding input device HDA Digital PCBeep (/d=
ev/input/event10)
> [    21.370] (II) No input driver specified, ignoring this device.
> [    21.370] (II) This device may have been added with another device fil=
e.
> [    21.370] (II) config/udev: Adding input device HDA Intel PCH Dock Mic=
 (/dev/input/event11)
> [    21.370] (II) No input driver specified, ignoring this device.
> [    21.370] (II) This device may have been added with another device fil=
e.
> [    21.370] (II) config/udev: Adding input device HDA Intel PCH Mic (/de=
v/input/event12)
> [    21.370] (II) No input driver specified, ignoring this device.
> [    21.370] (II) This device may have been added with another device fil=
e.
> [    21.370] (II) config/udev: Adding input device HDA Intel PCH Dock Hea=
dphone (/dev/input/event13)
> [    21.370] (II) No input driver specified, ignoring this device.
> [    21.370] (II) This device may have been added with another device fil=
e.
> [    21.375] (II) config/udev: Adding input device HDA Intel PCH Headphon=
e (/dev/input/event14)
> [    21.375] (II) No input driver specified, ignoring this device.
> [    21.375] (II) This device may have been added with another device fil=
e.
> [    21.375] (II) config/udev: Adding input device AT Translated Set 2 ke=
yboard (/dev/input/event0)
> [    21.375] (**) AT Translated Set 2 keyboard: Applying InputClass "evde=
v keyboard catchall"
> [    21.375] (II) Using input driver 'evdev' for 'AT Translated Set 2 key=
board'
> [    21.375] (**) AT Translated Set 2 keyboard: always reports core events
> [    21.375] (**) evdev: AT Translated Set 2 keyboard: Device: "/dev/inpu=
t/event0"
> [    21.375] (--) evdev: AT Translated Set 2 keyboard: Vendor 0x1 Product=
 0x1
> [    21.375] (--) evdev: AT Translated Set 2 keyboard: Found keys
> [    21.375] (II) evdev: AT Translated Set 2 keyboard: Configuring as key=
board
> [    21.375] (**) Option "config_info" "udev:/sys/devices/platform/i8042/=
serio0/input/input0/event0"
> [    21.375] (II) XINPUT: Adding extended input device "AT Translated Set=
 2 keyboard" (type: KEYBOARD, id 14)
> [    21.375] (**) Option "xkb_rules" "evdev"
> [    21.375] (**) Option "xkb_model" "pc105"
> [    21.375] (**) Option "xkb_layout" "dk"
> [    21.376] (II) config/udev: Adding input device SynPS/2 Synaptics Touc=
hPad (/dev/input/event5)
> [    21.376] (**) SynPS/2 Synaptics TouchPad: Applying InputClass "evdev =
touchpad catchall"
> [    21.376] (**) SynPS/2 Synaptics TouchPad: Applying InputClass "evdev =
touchscreen catchall"
> [    21.376] (**) SynPS/2 Synaptics TouchPad: Applying InputClass "touchp=
ad catchall"
> [    21.376] (**) SynPS/2 Synaptics TouchPad: Applying InputClass "Defaul=
t clickpad buttons"
> [    21.376] (II) LoadModule: "synaptics"
> [    21.376] (II) Loading /usr/lib/xorg/modules/input/synaptics_drv.so
> [    21.381] (II) Module synaptics: vendor=3D"X.Org Foundation"
> [    21.381] 	compiled for 1.18.1, module version =3D 1.8.2
> [    21.381] 	Module class: X.Org XInput Driver
> [    21.381] 	ABI class: X.Org XInput driver, version 22.1
> [    21.381] (II) Using input driver 'synaptics' for 'SynPS/2 Synaptics T=
ouchPad'
> [    21.381] (**) SynPS/2 Synaptics TouchPad: always reports core events
> [    21.381] (**) Option "Device" "/dev/input/event5"
> [    21.464] (II) synaptics: SynPS/2 Synaptics TouchPad: found clickpad p=
roperty
> [    21.464] (--) synaptics: SynPS/2 Synaptics TouchPad: x-axis range 126=
6 - 5676 (res 45)
> [    21.464] (--) synaptics: SynPS/2 Synaptics TouchPad: y-axis range 109=
6 - 4758 (res 68)
> [    21.464] (--) synaptics: SynPS/2 Synaptics TouchPad: pressure range 0=
 - 255
> [    21.464] (--) synaptics: SynPS/2 Synaptics TouchPad: finger width ran=
ge 0 - 15
> [    21.464] (--) synaptics: SynPS/2 Synaptics TouchPad: buttons: left do=
uble triple
> [    21.464] (--) synaptics: SynPS/2 Synaptics TouchPad: Vendor 0x2 Produ=
ct 0x7
> [    21.464] (**) Option "SoftButtonAreas" "50% 0 82% 0 0 0 0 0"
> [    21.464] (--) synaptics: SynPS/2 Synaptics TouchPad: touchpad found
> [    21.464] (**) SynPS/2 Synaptics TouchPad: always reports core events
> [    21.500] (**) Option "config_info" "udev:/sys/devices/platform/i8042/=
serio1/input/input5/event5"
> [    21.500] (II) XINPUT: Adding extended input device "SynPS/2 Synaptics=
 TouchPad" (type: TOUCHPAD, id 15)
> [    21.500] (**) synaptics: SynPS/2 Synaptics TouchPad: (accel) MinSpeed=
 is now constant deceleration 2.5
> [    21.500] (**) synaptics: SynPS/2 Synaptics TouchPad: (accel) MaxSpeed=
 is now 1.75
> [    21.500] (**) synaptics: SynPS/2 Synaptics TouchPad: (accel) AccelFac=
tor is now 0.035
> [    21.500] (**) SynPS/2 Synaptics TouchPad: (accel) keeping acceleratio=
n scheme 1
> [    21.500] (**) SynPS/2 Synaptics TouchPad: (accel) acceleration profil=
e 1
> [    21.500] (**) SynPS/2 Synaptics TouchPad: (accel) acceleration factor=
: 2.000
> [    21.500] (**) SynPS/2 Synaptics TouchPad: (accel) acceleration thresh=
old: 4
> [    21.500] (--) synaptics: SynPS/2 Synaptics TouchPad: touchpad found
> [    21.500] (II) config/udev: Adding input device SynPS/2 Synaptics Touc=
hPad (/dev/input/mouse1)
> [    21.500] (**) SynPS/2 Synaptics TouchPad: Ignoring device from InputC=
lass "touchpad ignore duplicates"
> [    21.501] (II) config/udev: Adding input device TPPS/2 IBM TrackPoint =
(/dev/input/event8)
> [    21.501] (**) TPPS/2 IBM TrackPoint: Applying InputClass "evdev point=
er catchall"
> [    21.501] (**) TPPS/2 IBM TrackPoint: Applying InputClass "trackpoint =
catchall"
> [    21.501] (II) Using input driver 'evdev' for 'TPPS/2 IBM TrackPoint'
> [    21.501] (**) TPPS/2 IBM TrackPoint: always reports core events
> [    21.501] (**) evdev: TPPS/2 IBM TrackPoint: Device: "/dev/input/event=
8"
> [    21.501] (--) evdev: TPPS/2 IBM TrackPoint: Vendor 0x2 Product 0xa
> [    21.501] (--) evdev: TPPS/2 IBM TrackPoint: Found 3 mouse buttons
> [    21.501] (--) evdev: TPPS/2 IBM TrackPoint: Found relative axes
> [    21.501] (--) evdev: TPPS/2 IBM TrackPoint: Found x and y relative ax=
es
> [    21.501] (II) evdev: TPPS/2 IBM TrackPoint: Configuring as mouse
> [    21.501] (**) Option "Emulate3Buttons" "true"
> [    21.501] (**) Option "EmulateWheel" "true"
> [    21.501] (**) Option "EmulateWheelButton" "2"
> [    21.501] (**) Option "YAxisMapping" "4 5"
> [    21.501] (**) evdev: TPPS/2 IBM TrackPoint: YAxisMapping: buttons 4 a=
nd 5
> [    21.501] (**) Option "XAxisMapping" "6 7"
> [    21.501] (**) evdev: TPPS/2 IBM TrackPoint: XAxisMapping: buttons 6 a=
nd 7
> [    21.501] (**) evdev: TPPS/2 IBM TrackPoint: EmulateWheelButton: 2, Em=
ulateWheelInertia: 10, EmulateWheelTimeout: 200
> [    21.501] (**) Option "config_info" "udev:/sys/devices/platform/i8042/=
serio1/serio2/input/input7/event8"
> [    21.501] (II) XINPUT: Adding extended input device "TPPS/2 IBM TrackP=
oint" (type: MOUSE, id 16)
> [    21.501] (II) evdev: TPPS/2 IBM TrackPoint: initialized for relative =
axes.
> [    21.501] (**) TPPS/2 IBM TrackPoint: (accel) keeping acceleration sch=
eme 1
> [    21.501] (**) TPPS/2 IBM TrackPoint: (accel) acceleration profile 0
> [    21.501] (**) TPPS/2 IBM TrackPoint: (accel) acceleration factor: 2.0=
00
> [    21.501] (**) TPPS/2 IBM TrackPoint: (accel) acceleration threshold: 4
> [    21.501] (II) config/udev: Adding input device TPPS/2 IBM TrackPoint =
(/dev/input/mouse2)
> [    21.501] (II) No input driver specified, ignoring this device.
> [    21.501] (II) This device may have been added with another device fil=
e.
> [    21.502] (II) config/udev: Adding input device ThinkPad Extra Buttons=
 (/dev/input/event9)
> [    21.502] (**) ThinkPad Extra Buttons: Applying InputClass "evdev keyb=
oard catchall"
> [    21.502] (II) Using input driver 'evdev' for 'ThinkPad Extra Buttons'
> [    21.502] (**) ThinkPad Extra Buttons: always reports core events
> [    21.502] (**) evdev: ThinkPad Extra Buttons: Device: "/dev/input/even=
t9"
> [    21.502] (--) evdev: ThinkPad Extra Buttons: Vendor 0x17aa Product 0x=
5054
> [    21.502] (--) evdev: ThinkPad Extra Buttons: Found keys
> [    21.502] (II) evdev: ThinkPad Extra Buttons: Configuring as keyboard
> [    21.502] (**) Option "config_info" "udev:/sys/devices/platform/thinkp=
ad_acpi/input/input10/event9"
> [    21.502] (II) XINPUT: Adding extended input device "ThinkPad Extra Bu=
ttons" (type: KEYBOARD, id 17)
> [    21.502] (**) Option "xkb_rules" "evdev"
> [    21.502] (**) Option "xkb_model" "pc105"
> [    21.502] (**) Option "xkb_layout" "dk"
> [    23.053] (II) intel(0): EDID vendor "MEI", prod id 38562
> [    23.053] (II) intel(0):     EDID quirk: Use maximum size instead of d=
etailed timing sizes.
> [    23.053] (II) intel(0): Using EDID range info for horizontal sync
> [    23.053] (II) intel(0): Using EDID range info for vertical refresh
> [    23.053] (II) intel(0): Printing DDC gathered Modelines:
> [    23.053] (II) intel(0): Modeline "2880x1620"x0.0  302.50  2880 2924 2=
928 3076  1620 1629 1630 1640 +hsync +vsync (98.3 kHz eP)
> [    23.053] (II) intel(0): Modeline "2880x1620"x0.0  302.50  2880 2924 2=
928 3076  1620 1629 1630 1967 +hsync +vsync (98.3 kHz e)
> [    23.909] (II) intel(0): resizing framebuffer to 5440x1620
> [    23.960] (II) intel(0): switch to mode 2560x1440@60.0 on DP1 using pi=
pe 1, position (2880, 0), rotation normal, reflection none





> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau


--n6jflznsmnkssquc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYEcOoAAoJEK9AXpC17PcjZ88P+wfyGpI5fe1IVKHYBoOay//O
rKnQIC5eb0RjQHTFSMClYNppIXmobrPjRqQ2dTXP6b74EFLQdFjECAXAen4P4MVk
DTzkR+QGyFdpQuvVMUy7EzMFcp3nlzgMmDQoSWDt0scX4+rNqd4whWfS7WpZLfCB
5HQRqWx8ezGGOLM9FJbx7de8RwZalH5rYjPIDphYgtyc/Ztwo25WAWT54/u71lp+
UPQU1HlDLxBBhdWZydFERspZ0KNYrd9zTmCob193u9+9dMKZHrG1bh1LzaLpBFYr
KOCk+qBtJpKM9xVxr2dPTRSs4kHHfDM5vjyznmzxupyXuNiPe+ObB5d8WXqHz57G
pg6veDcebVr5wLg3xHy7mq0rAUoxmJVaAPAZXLVVFhNPWPV+hv0H29WTjHATdVaX
1bJ1oB9/6sT/BSSY3uduQ6qv47ZBqWE07C8x+T6poGm2isNplwZCrkvn3Zu7A3H4
sRSEz5fPWIP0KUZL+8ZxtmJvYxMtD0VO/+9ZFJgOujWp6TONtYBNlsNd992TuqMo
egMk/o9iRGkhPszJC2CU46Nx+4Fc0It2Ax/MYPT6Rm7DdnsdagaLfmer0lruoLBp
yClTTx9b7DjJ1Lz+2KQbdGSp+LeiZ1ZRR/3yPmn69W3hiS50dzUnSYSH4BhtpreM
aMHQnRg3+ETQLpxJWOav
=Bng5
-----END PGP SIGNATURE-----

--n6jflznsmnkssquc--

--===============1785474042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1785474042==--
