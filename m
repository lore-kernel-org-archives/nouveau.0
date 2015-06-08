From: Andre Campos Rodovalho <andre.rodovalho-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Problem with GT218 (GeForce GT210)
Date: Mon, 8 Jun 2015 15:43:29 -0300
Message-ID: <CABLbVHNMTS9SzT_Qgn+N0L4p+fFOTHA=C2-FmUaYu0f-xA6zZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1691674162=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

--===============1691674162==
Content-Type: multipart/alternative; boundary=089e013c6a7cd79128051806058a

--089e013c6a7cd79128051806058a
Content-Type: text/plain; charset=UTF-8

Hello, I'm facing issues with a Point of View GT210/218 and nouveau
drivers. I'm using ubuntu server with LXDE on top of it...

*lshw -c video* output:
*-display
       description: VGA compatible controller
       product: GT218 [GeForce 210]
       vendor: NVIDIA Corporation
       physical id: 0
       bus info: pci@0000:01:00.0
       version: a2
       width: 64 bits
       clock: 33MHz
       capabilities: vga_controller bus_master cap_list rom
       configuration: driver=nouveau latency=0
       resources: irq:82 memory:fd000000-fdffffff memory:d0000000-d7ffffff
memory:d8000000-d9ffffff ioport:e000(size=128) memory:fe000000-fe07ffff

*modeinfo nouveau *output:
filename:
/lib/modules/3.16.0-38-generic/kernel/drivers/gpu/drm/nouveau/nouveau.ko
license:        GPL and additional rights
description:    nVidia Riva/TNT/GeForce/Quadro/Tesla
author:         Nouveau Project
srcversion:     D0FCF627599F97CE5A4C810
alias:          pci:v000012D2d*sv*sd*bc03sc*i*
alias:          pci:v000010DEd*sv*sd*bc03sc*i*
depends:        drm,drm_kms_helper,ttm,mxm-wmi,wmi,video,i2c-algo-bit
intree:         Y
vermagic:       3.16.0-38-generic SMP mod_unload modversions
signer:         Magrathea: Glacier signing key
sig_key:        C2:84:ED:AC:CF:0B:47:36:52:C3:4D:23:BE:C3:56:94:42:36:E6:3B
sig_hashalgo:   sha512
parm:           tv_norm:Default TV norm.
Supported: PAL, PAL-M, PAL-N, PAL-Nc, NTSC-M, NTSC-J,
hd480i, hd480p, hd576i, hd576p, hd720p, hd1080i.
Default: PAL
*NOTE* Ignored for cards with external TV encoders. (charp)
parm:           tv_disable:Disable TV-out detection (int)
parm:           ignorelid:Ignore ACPI lid status (int)
parm:           duallink:Allow dual-link TMDS (default: enabled) (int)
parm:           nofbaccel:Disable fbcon acceleration (int)
parm:           agpmode:AGP mode (0 to disable AGP) (int)
parm:           vram_pushbuf:Create DMA push buffers in VRAM (int)
parm:           config:option string to pass to driver core (charp)
parm:           debug:debug string to pass to driver core (charp)
parm:           noaccel:disable kernel/abi16 acceleration (int)
parm:           modeset:enable driver (default: auto, 0 = disabled, 1 =
enabled, 2 = headless) (int)
parm:           runpm:disable (0), force enable (1), optimus only default
(-1) (int)

I need to boot with nomodeset to see something on this machine. But the
most wierd is that I have a very similar machine with almost the same video
card and I have no problems to use it. The installation is the same, I
cloned the hard drive...

The machine that is working fine is a Asus M5A97 R.20 + Zogis GeForce GT210
The machine that is with blank screen after Xorg is loaded is ASRock
980DE3/U3S3 + Point of View GeForce GT210.

What can I do to solve this problem?

ASRock has:
Northbridge: AMD RX881/760G; Southbridge: AMD SB710
And Asus has:
Northbridge: AMD 970; Southbridge: AMD SB950

Tnx for your help!

*Other outputs:*
*-core
 description: Motherboard
       product: M5A97 LE R2.0
       vendor: ASUSTeK COMPUTER INC.
       physical id: 0
       version: Rev 1.xx
       serial: 130207833100091
       slot: To be filled by O.E.M.
     *-firmware
          description: BIOS
          vendor: American Megatrends Inc.
          physical id: 0
          version: 1503
          date: 01/11/2013
          size: 64KiB
          capacity: 8128KiB
          capabilities: pci upgrade shadowing cdboot bootselect socketedrom
edd int13floppy1200 int13floppy720 int13floppy2880 int5printscreen
int9keyboard int14serial
int17printer acpi usb biosbootspecification uefi
*-pci:0
          description: Host bridge
          product: RD890 PCI to PCI bridge (external gfx0 port B)
          vendor: Advanced Micro Devices, Inc. [AMD/ATI]
          physical id: 100
          bus info: pci@0000:00:00.0
          version: 02
          width: 32 bits
          clock: 33MHz

----------------------------------------------------------------------------------

*-core
       description: Motherboard
       product: 980DE3/U3S3
       vendor: ASRock
       physical id: 0
       serial: E80-46037902134
     *-firmware
          description: BIOS
          vendor: American Megatrends Inc.
          physical id: 0
          version: P1.60
          date: 05/06/2014
          size: 64KiB
          capacity: 1984KiB
          capabilities: pci upgrade shadowing cdboot bootselect socketedrom
edd int13floppy1200 int13floppy720 int13floppy2880 int5printscreen
int9keyboard int14serial
int17printer int10video acpi usb ls120boot zipboot biosbootspecification
netboot
 *-pci:0
          description: Host bridge
          product: RS880 Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 100
          bus info: pci@0000:00:00.0
          version: 00
          width: 32 bits
          clock: 66MHz

--089e013c6a7cd79128051806058a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello, I&#39;m facing issues with a Point of View GT210/21=
8 and nouveau drivers. I&#39;m using ubuntu server with LXDE on top of it..=
.<div><br></div><div><b>lshw -c video</b> output:</div><div><div><div>*-dis=
play =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0description: VGA compatible controller</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0product: GT218 [GeForce 210]</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0vendor: NVIDIA Corporation</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0physical id: 0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0bus info: pci=
@0000:01:00.0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0version: a2</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0width: 64 bits</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0clock: 33MHz</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0capabilities: vga_c=
ontroller bus_master cap_list rom</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0conf=
iguration: driver=3Dnouveau latency=3D0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0resources: irq:82 memory:fd000000-fdffffff memory:d0000000-d7ffffff memo=
ry:d8000000-d9ffffff ioport:e000(size=3D128) memory:fe000000-fe07ffff</div>=
</div></div><div><br></div><div><b>modeinfo nouveau </b>output:</div><div><=
div>filename: =C2=A0 =C2=A0 =C2=A0 /lib/modules/3.16.0-38-generic/kernel/dr=
ivers/gpu/drm/nouveau/nouveau.ko</div><div>license: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0GPL and additional rights</div><div>description: =C2=A0 =C2=A0nVidia =
Riva/TNT/GeForce/Quadro/Tesla</div><div>author: =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 Nouveau Project</div><div>srcversion: =C2=A0 =C2=A0 D0FCF627599F97CE5A4C81=
0</div><div>alias: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci:v000012D2d*sv*sd*b=
c03sc*i*</div><div>alias: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci:v000010DEd*=
sv*sd*bc03sc*i*</div><div>depends: =C2=A0 =C2=A0 =C2=A0 =C2=A0drm,drm_kms_h=
elper,ttm,mxm-wmi,wmi,video,i2c-algo-bit</div><div>intree: =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Y</div><div>vermagic: =C2=A0 =C2=A0 =C2=A0 3.16.0-38-generic =
SMP mod_unload modversions=C2=A0</div><div>signer: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Magrathea: Glacier signing key</div><div>sig_key: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0C2:84:ED:AC:CF:0B:47:36:52:C3:4D:23:BE:C3:56:94:42:36:E6:3B</div><div=
>sig_hashalgo: =C2=A0 sha512</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 tv_norm:Default TV norm.</div><div><span style=3D"white-space:pre-wr=
ap">		</span>Supported: PAL, PAL-M, PAL-N, PAL-Nc, NTSC-M, NTSC-J,</div><di=
v><span style=3D"white-space:pre-wrap">			</span>hd480i, hd480p, hd576i, hd=
576p, hd720p, hd1080i.</div><div><span style=3D"white-space:pre-wrap">		</s=
pan>Default: PAL</div><div><span style=3D"white-space:pre-wrap">		</span>*N=
OTE* Ignored for cards with external TV encoders. (charp)</div><div>parm: =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tv_disable:Disable TV-out detection (int=
)</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ignorelid:Ignore ACPI =
lid status (int)</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 duallin=
k:Allow dual-link TMDS (default: enabled) (int)</div><div>parm: =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 nofbaccel:Disable fbcon acceleration (int)</div><d=
iv>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 agpmode:AGP mode (0 to disable =
AGP) (int)</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vram_pushbuf:=
Create DMA push buffers in VRAM (int)</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 config:option string to pass to driver core (charp)</div><div=
>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debug:debug string to pass to dri=
ver core (charp)</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 noaccel=
:disable kernel/abi16 acceleration (int)</div><div>parm: =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 modeset:enable driver (default: auto, 0 =3D disabled, 1 =
=3D enabled, 2 =3D headless) (int)</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 runpm:disable (0), force enable (1), optimus only default (-1) (=
int)</div></div><div><br></div><div>I need to boot with nomodeset to see so=
mething on this machine. But the most wierd is that I have a very similar m=
achine with almost the same video card and I have no problems to use it. Th=
e installation is the same, I cloned the hard drive...</div><div><br></div>=
<div>The machine that is working fine is a Asus=C2=A0M5A97 R.20 + Zogis GeF=
orce GT210</div><div>The machine that is with blank screen after Xorg is lo=
aded is ASRock 980DE3/U3S3 + Point of View GeForce GT210.<br><br>What can I=
 do to solve this problem?</div><div><br></div><div>ASRock has:</div><div>N=
orthbridge: AMD RX881/760G; Southbridge: AMD SB710<br></div><div>And Asus h=
as:</div><div>Northbridge:=C2=A0AMD 970; Southbridge:=C2=A0AMD=C2=A0SB950</=
div><div><br></div><div>Tnx for your help!</div><div><br></div><div><b>Othe=
r outputs:</b></div><div>*-core<b><br></b></div><div><div>=C2=A0description=
: Motherboard</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0product: M5A97 LE R2.0</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor: ASUSTeK COMPUTER INC.</div><div=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0physical id: 0</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0version: Rev 1.xx</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0serial: 130207=
833100091</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0slot: To be filled by O.E.M.=
</div><div>=C2=A0 =C2=A0 =C2=A0*-firmware</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 description: BIOS</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 vendor: American Megatrends Inc.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 physical id: 0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 version:=
 1503</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 date: 01/11/2013</div><d=
iv>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size: 64KiB</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 capacity: 8128KiB</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 capabilities: pci upgrade shadowing cdboot bootselect socketedro=
m edd int13floppy1200 int13floppy720 int13floppy2880 int5printscreen int9ke=
yboard int14serial=C2=A0</div><div>int17printer acpi usb biosbootspecificat=
ion uefi</div><div><div>*-pci:0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 description: Host bridge</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p=
roduct: RD890 PCI to PCI bridge (external gfx0 port B)</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 vendor: Advanced Micro Devices, Inc. [AMD/ATI]</di=
v><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 physical id: 100</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bus info: pci@0000:00:00.0</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 version: 02</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 width: 32 bits</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cloc=
k: 33MHz</div></div><div><br></div><div>-----------------------------------=
-----------------------------------------------</div><div><br></div><div><d=
iv>*-core</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0description: Motherboard</di=
v><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0product: 980DE3/U3S3</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0vendor: ASRock</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0physic=
al id: 0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0serial: E80-46037902134</div>=
<div>=C2=A0 =C2=A0 =C2=A0*-firmware</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 description: BIOS</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vendo=
r: American Megatrends Inc.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ph=
ysical id: 0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 version: P1.60</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 date: 05/06/2014</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size: 64KiB</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 capacity: 1984KiB</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 capabilities: pci upgrade shadowing cdboot bootselect socketedrom edd i=
nt13floppy1200 int13floppy720 int13floppy2880 int5printscreen int9keyboard =
int14serial=C2=A0</div><div>int17printer int10video acpi usb ls120boot zipb=
oot biosbootspecification netboot</div></div><div><div>=C2=A0*-pci:0</div><=
div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 description: Host bridge</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 product: RS880 Host Bridge</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vendor: Advanced Micro Devices, Inc. [AMD]<=
/div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 physical id: 100</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bus info: pci@0000:00:00.0</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 version: 00</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 width: 32 bits</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cloc=
k: 66MHz</div></div><div><br></div><div><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">=
<div><div dir=3D"ltr"><div><div dir=3D"ltr"><br></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div></div>
</div></div>

--089e013c6a7cd79128051806058a--

--===============1691674162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1691674162==--
