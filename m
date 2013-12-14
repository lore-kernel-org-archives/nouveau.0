From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Crash on stable kernel 3.13.0-rc3 [NV05]
Date: Sat, 14 Dec 2013 10:53:08 -0500
Message-ID: <CAKb7Uvg36wWBuUtNsV2O1JMhRZ4rDrwFuhs7DDmi2Z62XEMipQ@mail.gmail.com>
References: <20131214142031.GA4105@exact.conquest>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20131214142031.GA4105-h2K+sPwVQeJqcnIkDu7xLw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: ael <law_ence.dev-XZoyATsUNX5Wk0Htik3J/w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, Dec 14, 2013 at 9:20 AM, ael <law_ence.dev-XZoyATsUNX5Wk0Htik3J/w@public.gmane.org> wrote:
> I have a crash on the current stable kernel.
>
> Here is the trace from dmesg:-
> ----------------------------------------------------------
>
> CPU: 0 PID: 682 Comm: modprobe Not tainted 3.13.0-rc3_exact-293199-g374b105 #379
> Hardware name:                  /        , BIOS GB85010A.86A.0063.P14.0107182015 07/18/2001
> task: ef5b1a80 ti: ef5d8000 task.ti: ef5d8000
> EIP: 0060:[<f0cfe995>] EFLAGS: 00010246 CPU: 0
> EIP is at _nouveau_clock_init+0x59/0x102 [nouveau]
> EAX: c0f58240 EBX: 00000000 ECX: 00000000 EDX: 00000000
> ESI: c0f58200 EDI: c0f582bc EBP: ef5d9b24 ESP: ef5d9b00
>  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068
> CR0: 8005003b CR2: 00000000 CR3: 2f5ba000 CR4: 000007d0
> Stack:
>  c0d18cc4 ef5d9b24 f0cef579 c0d18c00 00000005 c0f58238 c0f58200 00000000
>  c0d18cc4 ef5d9b44 f0cef5ec c0f58200 00000005 f0d85d63 00000001 00000013
>  00000012 ef5d9b9c f0d2a7f1 00000000 00000012 ef68e738 000037ee 00000005
> Call Trace:
>  [<f0cef579>] ? nouveau_object_inc+0x32/0x165 [nouveau]
>  [<f0cef5ec>] nouveau_object_inc+0xa5/0x165 [nouveau]
>  [<f0d2a7f1>] nouveau_devobj_ctor+0x233/0x6f2 [nouveau]
>  [<f0cef03b>] nouveau_object_ctor+0x2f/0xce [nouveau]
>  [<f0cef7d9>] nouveau_object_new+0x12d/0x1c7 [nouveau]
>  [<f0d59ff0>] nouveau_drm_load+0x18c/0x7cf [nouveau]
>  [<c112a012>] ? kobject_set_name_vargs+0x3d/0x4e
>  [<f08e2534>] ? drm_sysfs_device_add+0xb6/0xff [drm]
>  [<f08e020d>] drm_dev_register+0x86/0x17e [drm]
>  [<f08e13cb>] drm_get_pci_dev+0x7a/0x10b [drm]
>  [<c1140c50>] ? pcibios_set_master+0x2b/0x77
>  [<f0d59af4>] nouveau_drm_probe+0x1e2/0x212 [nouveau]
>  [<c1141756>] pci_device_probe+0x52/0x88
>  [<c10e17db>] ? sysfs_create_link+0x20/0x30
>  [<c119555a>] driver_probe_device+0x4f/0x1b7
>  [<c11413d1>] ? pci_match_device+0x7b/0x84
>  [<c1195729>] __driver_attach+0x67/0x69
>  [<c11956c2>] ? driver_probe_device+0x1b7/0x1b7
>  [<c1194232>] bus_for_each_dev+0x3e/0x69
>  [<c11951f3>] driver_attach+0x19/0x1b
>  [<c11956c2>] ? driver_probe_device+0x1b7/0x1b7
>  [<c1194ed8>] bus_add_driver+0xc7/0x1b0
>  [<c1195c13>] driver_register+0x54/0xc8
>  [<c11417f7>] __pci_register_driver+0x28/0x2b
>  [<f0dc2000>] ? 0xf0dc1fff
>  [<f08e1540>] drm_pci_init+0xe4/0xec [drm]
>  [<f0dc2000>] ? 0xf0dc1fff
>  [<f0dc203e>] nouveau_drm_init+0x3e/0x40 [nouveau]
>  [<c100042c>] do_one_initcall+0xc4/0x106
>  [<c106e387>] ? jump_label_module_notify+0x14b/0x183
>  [<c104101a>] ? notifier_call_chain+0x3a/0x52
>  [<c1041209>] ? __blocking_notifier_call_chain+0x42/0x56
>  [<c105dcad>] load_module+0x1547/0x1cd8
>  [<c1266420>] ? error_code+0x58/0x60
>  [<c105e4a6>] SyS_init_module+0x68/0x8d
>  [<c12666be>] sysenter_do_call+0x12/0x26
> Code: 00 0f 85 bb 00 00 00 89 d1 c1 e9 02 f3 ab f6 c2 02 74 02 66 ab 80 e2 01 74 01 aa 8d 46 40 89 46 40 89 46 44 c6 86 b8 00 00 00 ff <8b> 13 83 fa 19 75 10 eb 46 89 44 96 54 83 c3 10 8b 13 83 fa 19
> EIP: [<f0cfe995>] _nouveau_clock_init+0x59/0x102 [nouveau] SS:ESP 0068:ef5d9b00
> CR2: 0000000000000000
> ---[ end trace 9de5f48a5c60c178 ]---
>
> Should I open a bug on bugs.freedesktop.org? And/or report on the kernel
> mailing list?

This is already fixed in
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/nouveau?id=5b19f4f9bdb69d53f967b5733d6c3273d2397b9c
-- wait for -rc4 or patch that in (or update your pull).

  -ilia
