From: Anthony Callegaro <callytic-GANU6spQydw@public.gmane.org>
Subject: Re: blank screen with nouveau
Date: Mon, 18 May 2009 11:26:30 +0100
Message-ID: <1242642390.4281.0.camel@anthony>
References: <49fd3677.11355e0a.1a46.7dee@mx.google.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2032678569=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <49fd3677.11355e0a.1a46.7dee-ATjtLOhZ0NVl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2032678569==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-Yxx3E95hWulVtqDn7Tf5"


--=-Yxx3E95hWulVtqDn7Tf5
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hey I am having exactly the same issue on a NV15 chipset.

I am working a Debian Sid box up to date with git pull today (15/05/09).
What baffles me, is that there is no error anywhere in the logs. When I
start Xorg I just get a blank screen with a blinking cursor.

Here are the details of my testbox :
$ uname -a
Linux testbox 2.6.29-letic #1 SMP Fri May 1 19:16:24 IST 2009 i686
GNU/Linux=20
// This is a stock debian kernel with CONFIG_DRM unset (same behaviour
with Debian's 2.6.29-2)

$ Xorg -version
X.Org X Server 1.6.1.901 (1.6.2 RC 1)
Release Date: 2009-5-8
//Debian sid current version of Xorg

$ lspci | grep nV
01:00.0 VGA compatible controller: nVidia Corporation NV15 [GeForce2
GTS/Pro] (rev a4)

What I did :
 wget
"http://nouveau.freedesktop.org/wiki/DebianInstall?action=3DAttachFile&do=
=3Dview&target=3Dnouveau-build-deps_1.0_all.deb"
 dpkg -i nouveau-build-deps_1.0_all.deb # will complain about the
dependencies
 apt-get -f install
 git clone git://anongit.freedesktop.org/git/mesa/drm/
 cd drm
 ./autogen.sh --prefix=3D/usr && ./configure
--enable-nouveau-experimental-api && make
//Tried without --enable-nouveau-experimental-api flag with exact same
results
 su -c "make install"
 cd linux-core && make=20
 insmod linux-core/drm.ko debug=3D1
 insmod linux-core/nouveau.ko

 git clone git://anongit.freedesktop.org/git/nouveau/xf86-video-nouveau/
 export NOUVEAU=3D/home/letic/work/nouveau/drm/libdrm/nouveau/
 LIBDRM_NOUVEAU_LIBS=3D$NOUVEAU LIBDRM_NOUVEAU_CFLAGS=3D-I
$NOUVEAU ./autogen.sh
 make
 su -c "cp  src/.libs/nouveau_drv.so /usr/lib/xorg/modules/drivers"

The logs :
 Syslog : http://www.letic.fr/files/syslog=20
 Dmesg : http://www.letic.fr/files/dmesg=20
 xorg.0.log : http://www.letic.fr/files/Xorg.0.log=20

So far I tried recompiling the kernel without the DRM module set, and
removing the framebuffer. I tried with different kernel version and
without the --enable-nouveau-experimental-api flag without success.

The only error message I have is when compiling the nouveau driver man
pages :
Making all in man
make[2]: Entering directory
`/home/letic/work/nouveau/xf86-video-nouveau/man'
make[2]: *** No rule to make target `nouveau.@DRIVER_MAN_SUFFIX@',
needed by `all-am'.  Stop.
make[2]: Leaving directory
`/home/letic/work/nouveau/xf86-video-nouveau/man'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/letic/work/nouveau/xf86-video-nouveau'
make: *** [all] Error 2

So I don't believe this should have an impact :o)

I would really appreciate if somebody could give me a pointer of where
to start troubleshooting as so far the FAQ doesn't cover this kind of
issue.

Thanks in advance
LeTic


On Sun, 2009-05-03 at 10:15 +0400, lexa wrote:
> I install nouveau from git (from overlay "nouveau"). But when i try start=
 Xorg i have black screen and blinking cursor.
> I use FX5200 (NV34).
>=20
> Xorg.log
> X.Org X Server 1.5.3
> Release Date: 5 November 2008
> X Protocol Version 11, Revision 0
> Build Operating System: Linux 2.6.29-gentoo-r1 i686
> Current Operating System: Linux localhost 2.6.29-gentoo-r2 #1 SMP PREEMPT=
 Sat May 2 14:23:23 MSD 2009 i686
> Build Date: 22 April 2009  02:53:02PM
>=20
> 	Before reporting problems, check http://wiki.x.org
> 	to make sure that you have the latest version.
> Markers: (--) probed, (**) from config file, (=3D=3D) default setting,
> 	(++) from command line, (!!) notice, (II) informational,
> 	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
> (=3D=3D) Log file: "/var/log/Xorg.0.log", Time: Sun May  3 09:41:11 2009
> (=3D=3D) Using config file: "/etc/X11/xorg.conf"
> (=3D=3D) ServerLayout "Simple Layout"
> (**) |-->Screen "Screen 1" (0)
> (**) |   |-->Monitor "monitor1"
> (**) |   |-->Device "card1"
> (=3D=3D) Automatically adding devices
> (=3D=3D) Automatically enabling devices
> (**) FontPath set to:
> 	/usr/share/fonts/church_fonts/,
> 	/usr/share/fonts/misc/,
> 	/usr/share/fonts/100dpi/,
> 	/usr/share/fonts/75dpi/,
> 	/usr/share/fonts/inconsolata/,
> 	/usr/share/fonts/cronyx/,
> 	/usr/share/fonts/default/ghostscript/,
> 	/usr/share/fonts/encodings/,
> 	/usr/share/fonts/encodings/large/,
> 	/usr/share/fonts/terminus/,
> 	/usr/share/fonts/dejavu/,
> 	/usr/share/fonts/corefonts/,
> 	/usr/share/fonts/intlfonts/,
> 	/usr/share/fonts/cyrillic/,
> 	/usr/share/fonts/misc/,
> 	/usr/share/fonts/TTF/,
> 	/usr/share/fonts/OTF,
> 	/usr/share/fonts/Type1/,
> 	/usr/share/fonts/100dpi/,
> 	/usr/share/fonts/75dpi/,
> 	built-ins
> (=3D=3D) ModulePath set to "/usr/lib/xorg/modules"
> (II) Cannot locate a core pointer device.
> (II) Cannot locate a core keyboard device.
> (II) The server relies on HAL to provide the list of input devices.
> 	If no devices become available, reconfigure HAL or disable AllowEmptyInp=
ut.
> (II) Open ACPI successful (/var/run/acpid.socket)
> (II) Loader magic: 0x9a0
> (II) Module ABI versions:
> 	X.Org ANSI C Emulation: 0.4
> 	X.Org Video Driver: 4.1
> 	X.Org XInput driver : 2.1
> 	X.Org Server Extension : 1.1
> (II) Loader running on linux
> (--) using VT number 7
>=20
> (--) PCI:*(0@1:0:0) nVidia Corporation NV34 [GeForce FX 5200] rev 161, Me=
m @ 0xec000000/0, 0xe0000000/0, BIOS @ 0x????????/131072
> (II) System resource ranges:
> 	[0] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
> 	[1] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
> 	[2] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
> 	[3] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
> 	[4] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
> 	[5] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
> (II) LoadModule: "extmod"
>=20
> (II) Loading /usr/lib/xorg/modules/extensions//libextmod.so
> (II) Module extmod: vendor=3D"X.Org Foundation"
> 	compiled for 1.5.3, module version =3D 1.0.0
> 	Module class: X.Org Server Extension
> 	ABI class: X.Org Server Extension, version 1.1
> (II) Loading extension SHAPE
> (II) Loading extension MIT-SUNDRY-NONSTANDARD
> (II) Loading extension BIG-REQUESTS
> (II) Loading extension SYNC
> (II) Loading extension MIT-SCREEN-SAVER
> (II) Loading extension XC-MISC
> (II) Loading extension XFree86-VidModeExtension
> (II) Loading extension XFree86-Misc
> (II) Loading extension XFree86-DGA
> (II) Loading extension DPMS
> (II) Loading extension TOG-CUP
> (II) Loading extension Extended-Visual-Information
> (II) Loading extension XVideo
> (II) Loading extension XVideo-MotionCompensation
> (II) Loading extension X-Resource
> (II) LoadModule: "dbe"
>=20
> (II) Loading /usr/lib/xorg/modules/extensions//libdbe.so
> (II) Module dbe: vendor=3D"X.Org Foundation"
> 	compiled for 1.5.3, module version =3D 1.0.0
> 	Module class: X.Org Server Extension
> 	ABI class: X.Org Server Extension, version 1.1
> (II) Loading extension DOUBLE-BUFFER
> (II) LoadModule: "glx"
>=20
> (II) Loading /usr/lib/xorg/modules/extensions//libglx.so
> (II) Module glx: vendor=3D"X.Org Foundation"
> 	compiled for 1.5.3, module version =3D 1.0.0
> 	ABI class: X.Org Server Extension, version 1.1
> (=3D=3D) AIGLX enabled
> (=3D=3D) Exporting typical set of GLX visuals
> (II) Loading extension GLX
> (II) LoadModule: "record"
>=20
> (II) Loading /usr/lib/xorg/modules/extensions//librecord.so
> (II) Module record: vendor=3D"X.Org Foundation"
> 	compiled for 1.5.3, module version =3D 1.13.0
> 	Module class: X.Org Server Extension
> 	ABI class: X.Org Server Extension, version 1.1
> (II) Loading extension RECORD
> (II) LoadModule: "dri"
>=20
> (II) Loading /usr/lib/xorg/modules/extensions//libdri.so
> (II) Module dri: vendor=3D"X.Org Foundation"
> 	compiled for 1.5.3, module version =3D 1.0.0
> 	ABI class: X.Org Server Extension, version 1.1
> (II) Loading extension XFree86-DRI
> (II) LoadModule: "nouveau"
>=20
> (II) Loading /usr/lib/xorg/modules/drivers//nouveau_drv.so
> (II) Module nouveau: vendor=3D"X.Org Foundation"
> 	compiled for 1.5.3, module version =3D 0.0.10
> 	Module class: X.Org Video Driver
> 	ABI class: X.Org Video Driver, version 4.1
> (II) NOUVEAU driver
> (II) NOUVEAU driver for NVIDIA chipset families :
> 	RIVA TNT    (NV04)
> 	RIVA TNT2   (NV05)
> 	GeForce 256 (NV10)
> 	GeForce 2   (NV11, NV15)
> 	GeForce 4MX (NV17, NV18)
> 	GeForce 3   (NV20)
> 	GeForce 4Ti (NV25, NV28)
> 	GeForce FX  (NV3x)
> 	GeForce 6   (NV4x)
> 	GeForce 7   (G7x)
> 	GeForce 8   (G8x)
> (II) Primary Device is: PCI 01@00:00:0
> (II) resource ranges after probing:
> 	[0] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
> 	[1] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
> 	[2] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
> 	[3] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
> 	[4] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
> 	[5] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
> (--) NOUVEAU(0): Chipset: "NVIDIA NV34"
> (II) Loading sub module "int10"
> (II) LoadModule: "int10"
>=20
> (II) Loading /usr/lib/xorg/modules//libint10.so
> (II) Module int10: vendor=3D"X.Org Foundation"
> 	compiled for 1.5.3, module version =3D 1.0.0
> 	ABI class: X.Org Video Driver, version 4.1
> (II) NOUVEAU(0): Initializing int10
> (II) NOUVEAU(0): Primary V_BIOS segment is: 0xc000
> (II) Loading sub module "dri"
> (II) LoadModule: "dri"
>=20
> (II) Reloading /usr/lib/xorg/modules/extensions//libdri.so
> (II) NOUVEAU(0): Loaded DRI module
> drmOpenDevice: node name is /dev/dri/card0
> drmOpenDevice: open result is 9, (OK)
> drmOpenDevice: node name is /dev/dri/card0
> drmOpenDevice: open result is 9, (OK)
> drmOpenByBusid: Searching for BusID pci:0000:01:00.0
> drmOpenDevice: node name is /dev/dri/card0
> drmOpenDevice: open result is 9, (OK)
> drmOpenByBusid: drmOpenMinor returns 9
> drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
> (II) [drm] DRM interface version 1.3
> (II) [drm] DRM open master succeeded.
> (II) NOUVEAU(0): [drm] nouveau interface version: 0.0.12
>=20
>=20
> dmesg (partially)
> Linux version 2.6.29-gentoo-r2 (lexa@localhost) (gcc version 4.3.2 (Gento=
o 4.3.2-r3 p1.6, pie-10.1.5) ) #1 SMP PREEMPT Sat May 2 14:23:23 MSD 2009
> .......
> mtrr: no MTRR for e0000000,8000000 found
> [drm] Initialized drm 1.1.0 20060810
> pci 0000:01:00.0: BAR 1: can't reserve mem region [0xe0000000-0xe7ffffff]
> pci 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
> [drm] Detected an NV30 generation card (0x034200b1)
> [drm] Initialized nouveau 0.0.12 libdrm-2.4.9-5-g68103b2758029b3c1 on min=
or 0
> [drm] Used old pci detect: framebuffer loaded
> agpgart-sis 0000:00:00.0: AGP 3.5 bridge
> agpgart: X tried to set rate=3Dx12. Setting to AGP3 x8 mode.
> agpgart-sis 0000:00:00.0: putting AGP V3 device at 0000:00:00.0 into 8x m=
ode
> agpgart-sis 0000:00:00.0: SiS delay workaround: giving bridge time to rec=
over
> agpgart-sis 0000:00:00.0: putting AGP V3 device at 0000:01:00.0 into 8x m=
ode
> [drm] Allocating FIFO number 0
> [drm] nouveau_fifo_alloc: initialised FIFO 0
> [drm] nouveau_fifo_free: freeing fifo 0
> SysRq : Keyboard mode set to system default
> SysRq : Keyboard mode set to system default
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-Yxx3E95hWulVtqDn7Tf5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkoRN84ACgkQNSoUaANIAMhOMACfaYXoIlDqSNVTXOYjtGl7vocA
IioAn0HpiGS1agQQxIixGOz5N6+Wrk0L
=4Ynd
-----END PGP SIGNATURE-----

--=-Yxx3E95hWulVtqDn7Tf5--


--===============2032678569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2032678569==--
