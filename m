From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26521] Bug in kernel module - ttm_bo_pci_offset
Date: Wed,  9 Jun 2010 13:20:58 -0700 (PDT)
Message-ID: <20100609202058.6D402130148@annarchy.freedesktop.org>
References: <bug-26521-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26521-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=26521

--- Comment #10 from Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-06-09 13:20:58 PDT ---
it's not:

PM: resume of devices complete after 5330.459 msecs
[drm] nouveau 0000:02:00.0: PGRAPH_DATA_ERROR - Ch 1/0 Class 0x5039 Mthd 0x0318
Data 0x00001000:0x00084814
[drm] nouveau 0000:02:00.0: PGRAPH_DATA_ERROR - INVALID_VALUE
BUG: unable to handle kernel NULL pointer dereference at 0000000000000028
IP: [<ffffffffa00a4faf>] nouveau_ttm_io_mem_reserve+0x8f/0xba [nouveau]
PGD 1bf29d067 PUD 1bf290067 PMD 0 
CPU 3 
Modules linked in: nouveau ttm drm_kms_helper snd_hda_codec_realtek
snd_hda_intel snd_hda_codec

Pid: 2546, comm: X Not tainted 2.6.35-rc2+ #362 P6T SE/System Product Name
RIP: 0010:[<ffffffffa00a4faf>]  [<ffffffffa00a4faf>]
nouveau_ttm_io_mem_reserve+0x8f/0xba [nouveau]
RSP: 0018:ffff8801be7cf908  EFLAGS: 00010246
RAX: ffff8801be5eb000 RBX: ffff8801be7cfb58 RCX: ffff8801b7180000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff8801b7180118
RBP: ffff8801be7cf918 R08: 800000000000016b R09: 0000000000000001
R10: 00000000012e0001 R11: ffff8800d12ee000 R12: ffff8801b7180118
R13: 0000000000000000 R14: ffff8801be7cfa18 R15: 0000000000000000
FS:  00007f857faf4840(0000) GS:ffff8800026c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000028 CR3: 00000001be7a8000 CR4: 00000000000006e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
Process X (pid: 2546, threadinfo ffff8801be7ce000, task ffff8801bdc69f20)
 ffff8801be7cfa20 ffff8801be7cfb58 ffff8801be7cf928 ffffffffa0084761
<0> 0000000000000000 ffff8801b7180118 ffff8801be7cfa58 ffffffffa0084f18
 [<ffffffffa0084761>] ttm_mem_io_reserve+0x17/0x19 [ttm]
 [<ffffffffa008482f>] ttm_mem_reg_ioremap+0x20/0x81 [ttm]
 [<ffffffffa0084f18>] ttm_bo_move_memcpy+0x6e/0x40a [ttm]
 [<ffffffffa00a64f8>] ? nouveau_fence_wait+0x4f/0xaf [nouveau]
 [<ffffffffa00a630f>] ? nouveau_fence_unref+0x24/0x2f [nouveau]
 [<ffffffffa0082caf>] ? ttm_bo_reserve+0x33/0xf3 [ttm]
 [<ffffffffa00a5a9a>] nouveau_bo_move+0x183/0x207 [nouveau]
 [<ffffffffa0082121>] ttm_bo_handle_move_mem+0x1b4/0x2c0 [ttm]
 [<ffffffffa0083fe6>] ttm_bo_move_buffer+0xe6/0x13f [ttm]
 [<ffffffffa00840ea>] ttm_bo_validate+0xab/0xf4 [ttm]
 [<ffffffffa00a6c3a>] validate_list+0x145/0x28e [nouveau]
 [<ffffffffa00a7dde>] nouveau_gem_ioctl_pushbuf+0xf0d/0xf39 [nouveau]
 [<ffffffff8129a4e2>] drm_ioctl+0x27b/0x347
 [<ffffffffa00a6ed1>] ? nouveau_gem_ioctl_pushbuf+0x0/0xf39 [nouveau]
 [<ffffffff8110c001>] vfs_ioctl+0x2d/0xa1
 [<ffffffff8110c54d>] do_vfs_ioctl+0x454/0x48d
 [<ffffffff810fef91>] ? fget_light+0xa4/0x289
 [<ffffffff8110c5c8>] sys_ioctl+0x42/0x65
 [<ffffffff8102fd6b>] system_call_fastpath+0x16/0x1b
RIP  [<ffffffffa00a4faf>] nouveau_ttm_io_mem_reserve+0x8f/0xba [nouveau]
 RSP <ffff8801be7cf908>

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
