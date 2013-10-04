From: poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: GeForce 8400 GS
Date: Fri, 04 Oct 2013 16:10:50 +0200
Message-ID: <524ECC6A.8070505@gmail.com>
References: <1380825934.841834684@f291.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1380825934.841834684-MnY5EB7xCO9sdVUOrk1QfQ@public.gmane.org>
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

On 03.10.2013 20:45, Fernando Negro wrote:
>  Hi everyone.
> =

> I read on a 2011 article - http://www.phoronix.com/scan.php?page=3Darticl=
e&item=3Dnouveau_comp_2011&num=3D19 - that my particular card, GeForce 8400=
 GS, overheats with nouveau. (So, I never tried using if for long, before, =
as soon as possible, installing the proprietary drivers...) But, because it=
's a 2-year-old article, I was wondering if that problem could have been, i=
n the meantime, solved?... (Can anyone tell me if that is so, or not - or i=
ndicate me a place where I can know that?)
> =


http://www.asus.com/Graphics_Cards/EN8400GS_SILENTHTP512M

$ modinfo -F filename nouveau
/lib/modules/3.11.2-201.fc19.x86_64/kernel/drivers/gpu/drm/nouveau/nouveau.=
ko

$ sensors nouveau-pci-0200
nouveau-pci-0200
Adapter: PCI adapter
temp1:        +61.0=B0C  (high =3D +95.0=B0C, hyst =3D  +3.0=B0C)
                       (crit =3D +122.0=B0C, hyst =3D  +2.0=B0C)
                       (emerg =3D +135.0=B0C, hyst =3D  +5.0=B0C)

# nvclock -i
Xlib:  extension "NV-CONTROL" missing on display ":0.0".
-- General info --
Card: 		nVidia Geforce 8400GS
Architecture: 	G98 A2
PCI id: 	0x6e4
GPU clock: 	612.000 MHz
Bustype: 	PCI-Express

-- Shader info --
Clock: 1512.000 MHz
Stream units: 16 (1b)
ROP units: 4 (1b)
-- Memory info --
Amount: 	512 MB
Type: 		128 bit DDR2
Clock: 		399.600 MHz

-- PCI-Express info --
Current Rate: 	16X
Maximum rate: 	16X

-- Sensor info --
Sensor: GPU Internal Sensor
GPU temperature: 61C

-- VideoBios information --
Version: 62.98.2c.00.00
Signon message: ASUS EN8400GS VGA BIOS Ver 62.98.2C.00.AS07
Performance level 0: gpu 567MHz/shader 1400MHz/memory 400MHz/100%


poma
