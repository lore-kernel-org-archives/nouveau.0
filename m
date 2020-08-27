From: =?UTF-8?Q?Ortwin_Gl=c3=bcck?= <odi-L693kI9kcNY@public.gmane.org>
Subject: 5.8.4: WARNING at drivers/gpu/drm/nouveau/nvif/vmm.c:68
Date: Thu, 27 Aug 2020 17:12:12 +0200
Message-ID: <9a8bd359-1179-f000-e1f8-7246cd9f02ca@odi.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi,

I just found this new WARNING in dmesg. Maybe you want to know.
I haven't seen this before in 5.7.

BR

Ortwin


[Thu Aug 27 15:40:48 2020] ------------[ cut here ]------------
[Thu Aug 27 15:40:48 2020] WARNING: CPU: 6 PID: 23542 at drivers/gpu/drm/nouveau/nvif/vmm.c:68 
nvif_vmm_put+0x65/0x70
[Thu Aug 27 15:40:48 2020] CPU: 6 PID: 23542 Comm: kworker/6:2 Tainted: G                T 5.8.4 #4
[Thu Aug 27 15:40:48 2020] Hardware name: Hewlett-Packard HP ZBook 15/1909, BIOS L70 Ver. 01.21 
08/13/2014
[Thu Aug 27 15:40:48 2020] Workqueue: events nouveau_cli_work
[Thu Aug 27 15:40:48 2020] RIP: 0010:nvif_vmm_put+0x65/0x70
[Thu Aug 27 15:40:48 2020] Code: 00 00 48 89 e2 be 02 00 00 00 48 c7 04 24 00 00 00 00 48 89 44 24 
08 e8 e9 e5 ff ff 85 c0 75 0a 48 c7 43 08 00 00 00 00 eb b7 <0f> 0b eb f2 e8 52 ef 6a 00 66 90 53 48 
83 ec 20 65 48 8b 04 25 28
[Thu Aug 27 15:40:48 2020] RSP: 0018:ffffb81bc41bfdc8 EFLAGS: 00010282
[Thu Aug 27 15:40:48 2020] RAX: 00000000fffffffe RBX: ffffb81bc41bfdf0 RCX: 0000000000000000
[Thu Aug 27 15:40:48 2020] RDX: 0000000000000010 RSI: ffffb81bc41bfd38 RDI: ffffb81bc41bfdd8
[Thu Aug 27 15:40:48 2020] RBP: ffff9ea0172f5d00 R08: 00000000fffffffe R09: 0000000000000000
[Thu Aug 27 15:40:48 2020] R10: 0000000000000030 R11: 0000000000000001 R12: ffff9ea02e7b1a20
[Thu Aug 27 15:40:48 2020] R13: dead000000000100 R14: ffff9ea02e7b1b40 R15: ffff9ea02e7b1bb0
[Thu Aug 27 15:40:48 2020] FS:  0000000000000000(0000) GS:ffff9ea0ced80000(0000) knlGS:0000000000000000
[Thu Aug 27 15:40:48 2020] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Thu Aug 27 15:40:48 2020] CR2: 00007fb2f154a5ca CR3: 00000003f623e003 CR4: 00000000001606e0
[Thu Aug 27 15:40:48 2020] Call Trace:
[Thu Aug 27 15:40:48 2020]  nouveau_vma_del+0x73/0xc0
[Thu Aug 27 15:40:48 2020]  nouveau_gem_object_delete_work+0x31/0x60
[Thu Aug 27 15:40:48 2020]  nouveau_cli_work+0xc7/0x120
[Thu Aug 27 15:40:48 2020]  process_one_work+0x185/0x2d0
[Thu Aug 27 15:40:48 2020]  worker_thread+0x4b/0x390
[Thu Aug 27 15:40:48 2020]  ? process_one_work+0x2d0/0x2d0
[Thu Aug 27 15:40:48 2020]  kthread+0x10c/0x150
[Thu Aug 27 15:40:48 2020]  ? __kthread_create_on_node+0x190/0x190
[Thu Aug 27 15:40:48 2020]  ret_from_fork+0x22/0x30
[Thu Aug 27 15:40:48 2020] ---[ end trace e1a138f248609cd4 ]---
