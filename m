From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau driver is not loading
Date: Thu, 1 Dec 2011 17:30:39 -0500
Message-ID: <CAMVNhxQyCsJFxu2gK_uG3wqPfrzqhMCcfw1GryyV+D-mKRYRHw@mail.gmail.com>
References: <20111129210404.162990@gmx.net>
	<CAMVNhxQTizDCJ8utXW=Mr=ktu3S_6SozYg2+vqAcbEz8V9PvAg@mail.gmail.com>
	<20111201195400.107610@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20111201195400.107610-hi6Y0CQ0nG0@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Lars Callenbach <lars.callenbach-Mmb7MZpHnFY@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, Dec 1, 2011 at 2:54 PM, Lars Callenbach <lars.callenbach-Mmb7MZpHnFY@public.gmane.org> wr=
ote:
> Thank you for your answer. I have restartet the computer and have not loa=
ded nvidiafb. This is the output for the latest git-nouveau kernel module (=
error code -12):
> ---
> [ =A0 =A06.971517] [drm] Initialized drm 1.1.0 20060810

> [ =A0 =A07.037917] [drm] nouveau 0000:06:00.0: Detected an NV40 generatio=
n card (0x043000a4)

> [ =A0 =A07.073400] [drm] nouveau 0000:06:00.0: 0 MiB GART (aperture)

That's strange...

> [ =A0 =A07.170138] [drm] nouveau 0000:06:00.0: ntfy -12
> [ =A0 =A07.170288] [drm] nouveau 0000:06:00.0: 0xD642: Parsing digital ou=
tput script table
> [ =A0 =A07.220570] [drm] nouveau 0000:06:00.0: Restoring VGA fonts
> [ =A0 =A07.221181] [drm] nouveau 0000:06:00.0: PMC - unhandled INTR 0x010=
00000
> [ =A0 =A07.221584] [drm] nouveau 0000:06:00.0: PMC - unhandled INTR 0x010=
00000
> [ =A0 =A07.221980] [drm] nouveau 0000:06:00.0: PMC - unhandled INTR 0x010=
00000
> [ =A0 =A07.222372] [drm] nouveau 0000:06:00.0: PMC - unhandled INTR 0x010=
00000
> [ =A0 =A07.222760] [drm] nouveau 0000:06:00.0: PMC - unhandled INTR 0x010=
00000
> [ =A0 =A07.223127] [drm] nouveau 0000:06:00.0: PMC - unhandled INTR 0x010=
00000
> [ =A0 =A07.223516] [drm] nouveau 0000:06:00.0: PMC - unhandled INTR 0x010=
00000
> [ =A0 =A07.223905] [drm] nouveau 0000:06:00.0: PMC - unhandled INTR 0x010=
00000
> [ =A0 =A07.224310] [drm] nouveau 0000:06:00.0: PMC - unhandled INTR 0x010=
00000
> [ =A0 =A07.224707] [drm] nouveau 0000:06:00.0: PMC - unhandled INTR 0x010=
00000
> [ =A0 =A07.225097] [drm] nouveau 0000:06:00.0: PMC - unhandled INTR 0x010=
00000
> [ =A0 =A07.225486] [drm] nouveau 0000:06:00.0: PMC - unhandled INTR 0x010=
00000
> [ =A0 =A07.225875] [drm] nouveau 0000:06:00.0: PMC - unhandled INTR 0x010=
00000
> [ =A0 =A07.226263] [drm] nouveau 0000:06:00.0: PMC - unhandled INTR 0x010=
00000
> [ =A0 =A07.226656] [drm] nouveau 0000:06:00.0: PMC - unhandled INTR 0x010=
00000
> [ =A0 =A07.227048] [drm] nouveau 0000:06:00.0: PMC - unhandled INTR 0x010=
00000
> [ =A0 =A07.227445] [drm] nouveau 0000:06:00.0: PMC - unhandled INTR 0x010=
00000
> [ =A0 =A07.227842] [drm] nouveau 0000:06:00.0: PMC - unhandled INTR 0x010=
00000
> [ =A0 =A07.228253] [drm] nouveau 0000:06:00.0: PMC - unhandled INTR 0x010=
00000
> [ =A0 =A07.228625] [drm] nouveau 0000:06:00.0: PMC - unhandled INTR 0x010=
00000

This is also strange...

> [ =A0 =A07.232989] [drm:drm_sysfs_connector_remove], removing "VGA-1" fro=
m sysfs
> [ =A0 =A07.233027] [drm:drm_sysfs_connector_remove], removing "DVI-I-1" f=
rom sysfs
> [ =A0 =A07.233054] [drm:drm_sysfs_connector_remove], removing "TV-1" from=
 sysfs
> [ =A0 =A07.233099] [drm:drm_irq_uninstall], irq=3D16
> [ =A0 =A07.233118] [drm:drm_mm_takedown] *ERROR* Memory manager not clean=
. Delaying takedown
> [ =A0 =A07.233260] [drm:drm_mm_takedown] *ERROR* Memory manager not clean=
. Delaying takedown
> [ =A0 =A07.233401] [TTM] Finalizing pool allocator.
> [ =A0 =A07.233437] [TTM] Zone =A0kernel: Used memory at exit: 0 kiB.
> [ =A0 =A07.235221] [drm:drm_put_minor], release secondary minor 0
> [ =A0 =A07.235330] [drm:drm_put_minor], release secondary minor 64
> [ =A0 =A07.235507] nouveau 0000:06:00.0: PCI INT A disabled
> [ =A0 =A07.235529] nouveau: probe of 0000:06:00.0 failed with error -12

Not sure what's going on with your card. Is this a regression? Did
nouveau ever work for you? Does Nvidia's official driver work?
