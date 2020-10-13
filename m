From: Byron Stanoszek <gandalf@winds.org>
Subject: Re: Nouveau DRM failure on 5120x1440 screen with 5.8/5.9 kernel
Date: Tue, 13 Oct 2020 19:54:18 -0400 (EDT)
Message-ID: <alpine.LNX.2.23.451.2010131951560.14680@winds.org>
References: <alpine.LNX.2.23.451.2010130939140.14680@winds.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.23.451.2010130939140.14680@winds.org>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Tue, 13 Oct 2020, Byron Stanoszek wrote:

> I'm having a problem with both the 5.8 and 5.9 kernels using the nouveau DRM
> driver. I have a laptop with a VGA card (specs below) connected to a
> 5120x1440 screen. At boot time, the card correctly detects the screen, tries
> to allocate fbdev fb0, then the video hangs completely for 15-30 seconds
> until it goes blank.

This message eventually displays after a while:

Workqueue: nvkm-disp nv50_disp_super
RIP: 0010:nv50_disp_super_2_2+0x1b0/0x470
Code: 69 00 00 48 69 c0 d3 4d 62 10 48 c1 e8 26 49 89 c5 0f b7 43 40 44 89 e9 8d 44 02 f9 0f b7 53 46 29 d0 31 d2 48 98 49 0f af c4 <48> f7 f1 48 89 c6 0f b7 43 4e 0f b7 53 4c 83 e8 19 29 d0 31 d2 48
RSP: 0018:ffffc900005e3e08 EFLAGS: 00010206
RAX: 0000000000000000 RBX: ffff88841b08ed20 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffc90003614200 RDI: ffffffff820c1140
RBP: ffff88841b202060 R08: 0000000000000000 R09: 00000000000061ce
R10: 0000000000000018 R11: 0000000000000018 R12: 0000000000000000
R13: 0000000000000000 R14: ffff88841b96b800 R15: ffff88841b975000
FS:  0000000000000000(0000) GS:ffff88841dc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f922e61e000 CR3: 000000000240a004 CR4: 00000000001706b0
Call Trace:
  ? nvkm_dp_disable+0x5d/0x70
  ? nv50_disp_super+0x137/0x220
  ? process_one_work+0x19c/0x2c0
  ? worker_thread+0x48/0x350
  ? process_one_work+0x2c0/0x2c0
  ? kthread+0x129/0x150
  ? __kthread_create_worker+0x100/0x100
  ? ret_from_fork+0x22/0x30
---[ end trace dbb0d14fd1ddb445 ]---
nouveau 0000:01:00.0: DRM: core notifier timeout

Thanks,
  -Byron
