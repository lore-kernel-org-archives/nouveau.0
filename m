From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Fwd: Problem with GT218 (GeForce GT210)
Date: Thu, 11 Jun 2015 19:17:11 -0400
Message-ID: <CAKb7UvjD464REqBi=vz7qS-KLeYb+TEqbB8hsb+2L1qvP5aZSQ@mail.gmail.com>
References: <CABLbVHNMTS9SzT_Qgn+N0L4p+fFOTHA=C2-FmUaYu0f-xA6zZg@mail.gmail.com>
 <CABLbVHP9Qgzh1RB3ZGeXJWqOpGhAbV3hF3DdS58bB2dxkdAHjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1053345469=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CABLbVHP9Qgzh1RB3ZGeXJWqOpGhAbV3hF3DdS58bB2dxkdAHjg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Andre Campos Rodovalho <andre.rodovalho-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1053345469==
Content-Type: multipart/alternative; boundary=001a11c303a6fb0c0d0518463005

--001a11c303a6fb0c0d0518463005
Content-Type: text/plain; charset=UTF-8

Include logs from the failed boot
On Jun 11, 2015 10:55 PM, "Andre Campos Rodovalho" <
andre.rodovalho-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hello, I'm facing issues with a Point of View GT210/218 and nouveau
> drivers. I'm using ubuntu server with LXDE on top of it...
>
> *lshw -c video* output:
> *-display
>        description: VGA compatible controller
>        product: GT218 [GeForce 210]
>        vendor: NVIDIA Corporation
>        physical id: 0
>        bus info: pci@0000:01:00.0
>        version: a2
>        width: 64 bits
>        clock: 33MHz
>        capabilities: vga_controller bus_master cap_list rom
>        configuration: driver=nouveau latency=0
>        resources: irq:82 memory:fd000000-fdffffff memory:d0000000-d7ffffff
> memory:d8000000-d9ffffff ioport:e000(size=128) memory:fe000000-fe07ffff
>
> *modeinfo nouveau *output:
> filename:
> /lib/modules/3.16.0-38-generic/kernel/drivers/gpu/drm/nouveau/nouveau.ko
> license:        GPL and additional rights
> description:    nVidia Riva/TNT/GeForce/Quadro/Tesla
> author:         Nouveau Project
> srcversion:     D0FCF627599F97CE5A4C810
> alias:          pci:v000012D2d*sv*sd*bc03sc*i*
> alias:          pci:v000010DEd*sv*sd*bc03sc*i*
> depends:        drm,drm_kms_helper,ttm,mxm-wmi,wmi,video,i2c-algo-bit
> intree:         Y
> vermagic:       3.16.0-38-generic SMP mod_unload modversions
> signer:         Magrathea: Glacier signing key
> sig_key:        C2:84:ED:AC:CF:0B:47:36:52:C3:4D:23:BE:C3:56:94:42:36:E6:3B
> sig_hashalgo:   sha512
> parm:           tv_norm:Default TV norm.
> Supported: PAL, PAL-M, PAL-N, PAL-Nc, NTSC-M, NTSC-J,
> hd480i, hd480p, hd576i, hd576p, hd720p, hd1080i.
> Default: PAL
> *NOTE* Ignored for cards with external TV encoders. (charp)
> parm:           tv_disable:Disable TV-out detection (int)
> parm:           ignorelid:Ignore ACPI lid status (int)
> parm:           duallink:Allow dual-link TMDS (default: enabled) (int)
> parm:           nofbaccel:Disable fbcon acceleration (int)
> parm:           agpmode:AGP mode (0 to disable AGP) (int)
> parm:           vram_pushbuf:Create DMA push buffers in VRAM (int)
> parm:           config:option string to pass to driver core (charp)
> parm:           debug:debug string to pass to driver core (charp)
> parm:           noaccel:disable kernel/abi16 acceleration (int)
> parm:           modeset:enable driver (default: auto, 0 = disabled, 1 =
> enabled, 2 = headless) (int)
> parm:           runpm:disable (0), force enable (1), optimus only default
> (-1) (int)
>
> I need to boot with nomodeset to see something on this machine. But the
> most wierd is that I have a very similar machine with almost the same video
> card and I have no problems to use it. The installation is the same, I
> cloned the hard drive...
>
> The machine that is working fine is a Asus M5A97 R.20 + Zogis GeForce GT210
> The machine that is with blank screen after Xorg is loaded is ASRock
> 980DE3/U3S3 + Point of View GeForce GT210.
>
> What can I do to solve this problem?
>
> ASRock has:
> Northbridge: AMD RX881/760G; Southbridge: AMD SB710
> And Asus has:
> Northbridge: AMD 970; Southbridge: AMD SB950
>
> Tnx for your help!
>
> *Other outputs:*
> *-core
>  description: Motherboard
>        product: M5A97 LE R2.0
>        vendor: ASUSTeK COMPUTER INC.
>        physical id: 0
>        version: Rev 1.xx
>        serial: 130207833100091
>        slot: To be filled by O.E.M.
>      *-firmware
>           description: BIOS
>           vendor: American Megatrends Inc.
>           physical id: 0
>           version: 1503
>           date: 01/11/2013
>           size: 64KiB
>           capacity: 8128KiB
>           capabilities: pci upgrade shadowing cdboot bootselect
> socketedrom edd int13floppy1200 int13floppy720 int13floppy2880
> int5printscreen int9keyboard int14serial
> int17printer acpi usb biosbootspecification uefi
> *-pci:0
>           description: Host bridge
>           product: RD890 PCI to PCI bridge (external gfx0 port B)
>           vendor: Advanced Micro Devices, Inc. [AMD/ATI]
>           physical id: 100
>           bus info: pci@0000:00:00.0
>           version: 02
>           width: 32 bits
>           clock: 33MHz
>
>
> ----------------------------------------------------------------------------------
>
> *-core
>        description: Motherboard
>        product: 980DE3/U3S3
>        vendor: ASRock
>        physical id: 0
>        serial: E80-46037902134
>      *-firmware
>           description: BIOS
>           vendor: American Megatrends Inc.
>           physical id: 0
>           version: P1.60
>           date: 05/06/2014
>           size: 64KiB
>           capacity: 1984KiB
>           capabilities: pci upgrade shadowing cdboot bootselect
> socketedrom edd int13floppy1200 int13floppy720 int13floppy2880
> int5printscreen int9keyboard int14serial
> int17printer int10video acpi usb ls120boot zipboot biosbootspecification
> netboot
>  *-pci:0
>           description: Host bridge
>           product: RS880 Host Bridge
>           vendor: Advanced Micro Devices, Inc. [AMD]
>           physical id: 100
>           bus info: pci@0000:00:00.0
>           version: 00
>           width: 32 bits
>           clock: 66MHz
>
>
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
>

--001a11c303a6fb0c0d0518463005
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Include logs from the failed boot</p>
<div class=3D"gmail_quote">On Jun 11, 2015 10:55 PM, &quot;Andre Campos Rod=
ovalho&quot; &lt;<a href=3D"mailto:andre.rodovalho-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">andre.rodoval=
ho-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">Hello,=
 I&#39;m facing issues with a Point of View GT210/218 and nouveau drivers. =
I&#39;m using ubuntu server with LXDE on top of it...<div><br></div><div><b=
>lshw -c video</b> output:</div><div><div><div>*-display =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
description: VGA compatible controller</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0product: GT218 [GeForce 210]</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor=
: NVIDIA Corporation</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0physical id: 0</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0bus info: pci@0000:01:00.0</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0version: a2</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0wi=
dth: 64 bits</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0clock: 33MHz</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0capabilities: vga_controller bus_master cap_list=
 rom</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0configuration: driver=3Dnouveau l=
atency=3D0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0resources: irq:82 memory:fd=
000000-fdffffff memory:d0000000-d7ffffff memory:d8000000-d9ffffff ioport:e0=
00(size=3D128) memory:fe000000-fe07ffff</div></div></div><div><br></div><di=
v><b>modeinfo nouveau </b>output:</div><div><div>filename: =C2=A0 =C2=A0 =
=C2=A0 /lib/modules/3.16.0-38-generic/kernel/drivers/gpu/drm/nouveau/nouvea=
u.ko</div><div>license: =C2=A0 =C2=A0 =C2=A0 =C2=A0GPL and additional right=
s</div><div>description: =C2=A0 =C2=A0nVidia Riva/TNT/GeForce/Quadro/Tesla<=
/div><div>author: =C2=A0 =C2=A0 =C2=A0 =C2=A0 Nouveau Project</div><div>src=
version: =C2=A0 =C2=A0 D0FCF627599F97CE5A4C810</div><div>alias: =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0pci:v000012D2d*sv*sd*bc03sc*i*</div><div>alias: =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci:v000010DEd*sv*sd*bc03sc*i*</div><div>dep=
ends: =C2=A0 =C2=A0 =C2=A0 =C2=A0drm,drm_kms_helper,ttm,mxm-wmi,wmi,video,i=
2c-algo-bit</div><div>intree: =C2=A0 =C2=A0 =C2=A0 =C2=A0 Y</div><div>verma=
gic: =C2=A0 =C2=A0 =C2=A0 3.16.0-38-generic SMP mod_unload modversions=C2=
=A0</div><div>signer: =C2=A0 =C2=A0 =C2=A0 =C2=A0 Magrathea: Glacier signin=
g key</div><div>sig_key: =C2=A0 =C2=A0 =C2=A0 =C2=A0C2:84:ED:AC:CF:0B:47:36=
:52:C3:4D:23:BE:C3:56:94:42:36:E6:3B</div><div>sig_hashalgo: =C2=A0 sha512<=
/div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tv_norm:Default TV norm.=
</div><div><span style=3D"white-space:pre-wrap">		</span>Supported: PAL, PA=
L-M, PAL-N, PAL-Nc, NTSC-M, NTSC-J,</div><div><span style=3D"white-space:pr=
e-wrap">			</span>hd480i, hd480p, hd576i, hd576p, hd720p, hd1080i.</div><di=
v><span style=3D"white-space:pre-wrap">		</span>Default: PAL</div><div><spa=
n style=3D"white-space:pre-wrap">		</span>*NOTE* Ignored for cards with ext=
ernal TV encoders. (charp)</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tv_disable:Disable TV-out detection (int)</div><div>parm: =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ignorelid:Ignore ACPI lid status (int)</div><div>parm=
: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 duallink:Allow dual-link TMDS (default=
: enabled) (int)</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nofbacc=
el:Disable fbcon acceleration (int)</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 agpmode:AGP mode (0 to disable AGP) (int)</div><div>parm: =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vram_pushbuf:Create DMA push buffers in VRA=
M (int)</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config:option st=
ring to pass to driver core (charp)</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 debug:debug string to pass to driver core (charp)</div><div>p=
arm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 noaccel:disable kernel/abi16 accele=
ration (int)</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 modeset:ena=
ble driver (default: auto, 0 =3D disabled, 1 =3D enabled, 2 =3D headless) (=
int)</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 runpm:disable (0), =
force enable (1), optimus only default (-1) (int)</div></div><div><br></div=
><div>I need to boot with nomodeset to see something on this machine. But t=
he most wierd is that I have a very similar machine with almost the same vi=
deo card and I have no problems to use it. The installation is the same, I =
cloned the hard drive...</div><div><br></div><div>The machine that is worki=
ng fine is a Asus=C2=A0M5A97 R.20 + Zogis GeForce GT210</div><div>The machi=
ne that is with blank screen after Xorg is loaded is ASRock 980DE3/U3S3 + P=
oint of View GeForce GT210.<br><br>What can I do to solve this problem?</di=
v><div><br></div><div>ASRock has:</div><div>Northbridge: AMD RX881/760G; So=
uthbridge: AMD SB710<br></div><div>And Asus has:</div><div>Northbridge:=C2=
=A0AMD 970; Southbridge:=C2=A0AMD=C2=A0SB950</div><div><br></div><div>Tnx f=
or your help!</div><div><br></div><div><b>Other outputs:</b></div><div>*-co=
re<b><br></b></div><div><div>=C2=A0description: Motherboard</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0product: M5A97 LE R2.0</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0vendor: ASUSTeK COMPUTER INC.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0physical id: 0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0version: Rev 1.xx</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0serial: 130207833100091</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0slot: To be filled by O.E.M.</div><div>=C2=A0 =C2=A0 =
=C2=A0*-firmware</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 description: =
BIOS</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vendor: American Megatren=
ds Inc.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 physical id: 0</div><d=
iv>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 version: 1503</div><div>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 date: 01/11/2013</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 size: 64KiB</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 capacit=
y: 8128KiB</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 capabilities: pci u=
pgrade shadowing cdboot bootselect socketedrom edd int13floppy1200 int13flo=
ppy720 int13floppy2880 int5printscreen int9keyboard int14serial=C2=A0</div>=
<div>int17printer acpi usb biosbootspecification uefi</div><div><div>*-pci:=
0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 description: Host bridge</di=
v><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 product: RD890 PCI to PCI bridge =
(external gfx0 port B)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vendor:=
 Advanced Micro Devices, Inc. [AMD/ATI]</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 physical id: 100</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bu=
s info: pci@0000:00:00.0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 versi=
on: 02</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 width: 32 bits</div><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock: 33MHz</div></div><div><br></div=
><div>---------------------------------------------------------------------=
-------------</div><div><br></div><div><div>*-core</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0description: Motherboard</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
product: 980DE3/U3S3</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor: ASRock</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0physical id: 0</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0serial: E80-46037902134</div><div>=C2=A0 =C2=A0 =C2=A0*-firmwa=
re</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 description: BIOS</div><div=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vendor: American Megatrends Inc.</div><=
div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 physical id: 0</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 version: P1.60</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 date: 05/06/2014</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 si=
ze: 64KiB</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 capacity: 1984KiB</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 capabilities: pci upgrade shadow=
ing cdboot bootselect socketedrom edd int13floppy1200 int13floppy720 int13f=
loppy2880 int5printscreen int9keyboard int14serial=C2=A0</div><div>int17pri=
nter int10video acpi usb ls120boot zipboot biosbootspecification netboot</d=
iv></div><div><div>=C2=A0*-pci:0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 description: Host bridge</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p=
roduct: RS880 Host Bridge</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vend=
or: Advanced Micro Devices, Inc. [AMD]</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 physical id: 100</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bu=
s info: pci@0000:00:00.0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 versi=
on: 00</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 width: 32 bits</div><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock: 66MHz</div></div><div><br></div=
><div><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><di=
v><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div di=
r=3D"ltr"><br></div></div></div></div></div></div></div></div></div></div><=
/div></div></div></div></div>
</div></div>
</div><br></div>
<br>_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" target=3D=
"_blank">http://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
<br></blockquote></div>

--001a11c303a6fb0c0d0518463005--

--===============1053345469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1053345469==--
