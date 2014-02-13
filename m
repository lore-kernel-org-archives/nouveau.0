From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: nouveau init unknown opcode error,
	when CONFIG_DRM_NOUVEAU=y
Date: Thu, 13 Feb 2014 02:47:13 -0500
Message-ID: <CAKb7UviSXdXGpAkPJPzYbSPk=8mExO7CE-jcFBZiJsT6EDe8Jg@mail.gmail.com>
References: <CAKx2Y1kyfxzaWnFhSx-EkeCWKi+tn6e1YHCkbt4RtYmBskZHTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKx2Y1kyfxzaWnFhSx-EkeCWKi+tn6e1YHCkbt4RtYmBskZHTQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Kui Zhang <kuizhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Feb 13, 2014 at 2:15 AM, Kui Zhang <kuizhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
>
> When CONFIG_DRM_NOUVEAU=y, I get following error. Blank screen after initrd.
>
> This was in the dmesg.
>
> [    0.282559] [drm] hdmi device  not found 1 0 1
> [    0.282688] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x046800a3
> [    0.282693] nouveau  [  DEVICE][0000:01:00.0] Chipset: G72 (NV46)
> [    0.282696] nouveau  [  DEVICE][0000:01:00.0] Family : NV40
> [    0.284293] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
> [    0.366261] nouveau  [   VBIOS][0000:01:00.0] ... checksum invalid
> [    0.366266] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
> [    0.366279] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
> [    0.366283] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
> [    0.366286] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
> [    0.366290] nouveau  [   VBIOS][0000:01:00.0] checking PCIROM for image...
> [    0.366454] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
> [    0.366462] nouveau  [   VBIOS][0000:01:00.0] using image from PCIROM
> [    0.366603] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
> [    0.366609] nouveau  [   VBIOS][0000:01:00.0] version 05.72.22.41.19
> [    0.367101] nouveau E[   VBIOS][0000:01:00.0] 0xe008[ ]: unknown opcode 0xc0
> [    0.367107] nouveau E[ DEVINIT][0000:01:00.0] init failed, -22
> [    0.367112] nouveau E[     DRM] failed to create 0x80000080, -22
> [    0.367833] nouveau: probe of 0000:01:00.0 failed with error -22
>
>
> When CONFIG_DRM_NOUVEAU=m. Everything appears to work as expected.
>
> [    0.796974] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x046800a3
> [    0.796980] nouveau  [  DEVICE][0000:01:00.0] Chipset: G72 (NV46)
> [    0.796985] nouveau  [  DEVICE][0000:01:00.0] Family : NV40
> [    0.799366] nouveau  [   VBIOS][0000:01:00.0] source: PRAMIN
> [    0.887657] nouveau  [   VBIOS][0000:01:00.0] ... checksum invalid
> [    0.887838] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
> [    0.887844] nouveau  [   VBIOS][0000:01:00.0] version 05.72.22.41.19

You appear to have a module parameter set for nouveau,
config=NvBios=PRAMIN, probably in your modprobe.conf or similar file.
If you append nouveau.config=NvBios=PRAMIN to your kernel cmdline, it
should work similarly.

  -ilia
