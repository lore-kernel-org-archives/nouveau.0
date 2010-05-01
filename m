From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27928] New: Nouveau / Mesa sometimes gets libraries
	overwritten
Date: Sat,  1 May 2010 10:15:42 -0700 (PDT)
Message-ID: <bug-27928-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

https://bugs.freedesktop.org/show_bug.cgi?id=27928

           Summary: Nouveau / Mesa sometimes gets libraries overwritten
           Product: Mesa
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: alex.buell-XLQCo7u1tb3e9xe1eoZjHA@public.gmane.org


Created an attachment (id=35366)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=35366)
Excerpt from /var/log/messages

As this has now happened twice in the last two weeks, I thought I'd
write this up.

This morning I came back to my laptop to find it had locked up, even ssh
couldn't gain access to the machine. I rebooted the machine and tried to
start X. X refused to start, so I looked at the logs where it locked up
before I'd even woken up and found the following:

May  1 08:37:16 lithium kernel: __ratelimit: 60 callbacks suppressed
May  1 08:37:16 lithium kernel: X: page allocation failure. order:1,
mode:0x10d0
May  1 08:37:16 lithium kernel: Pid: 11594, comm: X Not tainted
2.6.32-gentoo-r7 #4
May  1 08:37:16 lithium kernel: Call Trace:
May  1 08:37:16 lithium kernel: [<c1050e9f>] ? __alloc_pages_nodemask
+0x439/0x47b
May  1 08:37:16 lithium kernel: [<c106a52e>] ? cache_alloc_refill
+0x240/0x411
May  1 08:37:16 lithium kernel: [<c106a765>] ? __kmalloc+0x66/0x9d
May  1 08:37:16 lithium kernel: [<f91ee2b5>] ? agp_alloc_page_array
+0x22/0x3c [agpgart]
May  1 08:37:16 lithium kernel: [<f91ee330>] ? agp_generic_alloc_user
+0x61/0xc3 [agpgart]
May  1 08:37:16 lithium kernel: [<f91ee45a>] ? agp_allocate_memory
+0x35/0xb3 [agpgart]
May  1 08:37:16 lithium kernel: [<f89e00a6>] ? 0xf89e00a6
May  1 08:37:16 lithium kernel: [<f89e0b9b>] ? ttm_tt_populate
+0x4d/0x382 [ttm]
May  1 08:37:16 lithium kernel: [<f89e0bc6>] ? ttm_tt_populate
+0x78/0x382 [ttm]
May  1 08:37:16 lithium kernel: [<f89e1c67>] ? ttm_bo_unmap_virtual
+0x124/0x455 [ttm]
May  1 08:37:16 lithium kernel: [<f89e2db1>] ? ttm_bo_mem_space
+0x7a3/0x88b [ttm]
May  1 08:37:16 lithium kernel: [<c1022a7f>] ? select_task_rq_fair
+0x4c8/0x81d
May  1 08:37:16 lithium kernel: [<f89e29a8>] ? ttm_bo_mem_space
+0x39a/0x88b [ttm]
May  1 08:37:16 lithium kernel: [<f89e31f2>] ? ttm_bo_move_buffer
+0x84/0xda [ttm]
May  1 08:37:16 lithium kernel: [<f89e32c7>] ? ttm_bo_validate+0x7f/0xc1
[ttm]
May  1 08:37:16 lithium kernel: [<f8bc78b0>] ?
nouveau_gem_ioctl_cpu_prep+0x23f/0x42c [nouveau]
May  1 08:37:16 lithium kernel: [<f8bc8654>] ? nouveau_gem_ioctl_pushbuf
+0xbb7/0xbd2 [nouveau]
May  1 08:37:16 lithium kernel: [<f93ad46e>] ? drm_ioctl+0x200/0x282
[drm]
May  1 08:37:16 lithium kernel: [<f8bc7a9d>] ? nouveau_gem_ioctl_pushbuf
+0x0/0xbd2 [nouveau]
May  1 08:37:16 lithium kernel: [<f93ad26e>] ? drm_ioctl+0x0/0x282 [drm]
May  1 08:37:16 lithium kernel: [<c1078967>] ? vfs_ioctl+0x1c/0x5f
May  1 08:37:16 lithium kernel: [<c1078ea2>] ? do_vfs_ioctl+0x451/0x488
May  1 08:37:16 lithium kernel: [<c12e1db8>] ? _spin_unlock_irq+0xd/0x20
May  1 08:37:16 lithium kernel: [<c1029fc1>] ? do_setitimer+0x15c/0x18a
May  1 08:37:16 lithium kernel: [<c102a034>] ? sys_setitimer+0x45/0x6f
May  1 08:37:16 lithium kernel: [<c1078f05>] ? sys_ioctl+0x2c/0x42
May  1 08:37:16 lithium kernel: [<c10028f4>] ? sysenter_do_call
+0x12/0x26

There are about 8 different instances of this, there's a copy of the
part I cut out of the logs attached with this e-mail.

On trying to start X, I subsequently observed the following in the logs

May  1 09:46:27 lithium kernel: [drm] nouveau 0000:01:00.0: Allocating
FIFO number 1
May  1 09:46:27 lithium kernel: [drm] nouveau 0000:01:00.0:
nouveau_channel_alloc: initialised FIFO 1
May  1 09:46:27 lithium kernel: [drm] nouveau 0000:01:00.0: Setting dpms
mode 3 on vga encoder (output 0)
May  1 09:46:27 lithium kernel: [drm] DAC-7: set mode 1600x1200 44
May  1 09:46:27 lithium kernel: [drm] nouveau 0000:01:00.0: Setting dpms
mode 0 on vga encoder (output 0)
May  1 09:46:27 lithium kernel: [drm] nouveau 0000:01:00.0: Output VGA-1
is running on CRTC 0 using output A
May  1 09:46:27 lithium kernel: [drm] nouveau 0000:01:00.0: Allocating
FIFO number 2
May  1 09:46:27 lithium kernel: [drm] nouveau 0000:01:00.0:
nouveau_channel_alloc: initialised FIFO 2
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/2 Mthd 0x0000 Data 0x88000001
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/2 Mthd 0x0180 Data 0x88000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/3 Mthd 0x0000 Data 0x88000002
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/3 Mthd 0x0184 Data 0xbeef0201
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/3 Mthd 0x0188 Data 0xbeef0201
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/4 Mthd 0x0000 Data 0x88000003
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/4 Mthd 0x0180 Data 0x88000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/4 Mthd 0x019c Data 0x88000002
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/4 Mthd 0x02fc Data 0x00000003
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/5 Mthd 0x0000 Data 0x88000004
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
nouveau_channel_free: freeing fifo 2
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/5 Mthd 0x0180 Data 0x88000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/5 Mthd 0x0198 Data 0x88000002
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/5 Mthd 0x02fc Data 0x00000003
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/5 Mthd 0x0304 Data 0x00000002
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/6 Mthd 0x0000 Data 0x88000005
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x0000 Data 0x88000006
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x0000 Data 0xbeef3097
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x0180 Data 0xbeef0301
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x0184 Data 0xbeef0201
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x0188 Data 0xbeef0202
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x018c Data 0xbeef0201
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x0194 Data 0xbeef0201
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x0198 Data 0xbeef0201
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x019c Data 0xbeef0201
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x01a0 Data 0xbeef0202
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x01a4 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x01a8 Data 0xbeef0302
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x01ac Data 0xbeef0201
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x01b0 Data 0xbeef0201
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x02c8 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x02cc Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x02d0 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x02d4 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x02d8 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x02dc Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x02e0 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x02e4 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x02e8 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x02ec Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x02f0 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x02f4 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x02f8 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x02fc Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x0220 Data 0x00000001
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x03b0 Data 0x00100000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1454 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1d80 Data 0x00000003
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1450 Data 0x00030004
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1e98 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x17e0 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x17e4 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x17e8 Data 0x3f800000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1f80 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1f84 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1f88 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1f8c Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1f90 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1f94 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1f98 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1f9c Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1fa0 Data 0x0000ffff
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1fa4 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1fa8 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1fac Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1fb0 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1fb4 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1fb8 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1fbc Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x0120 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x0124 Data 0x00000001
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x0128 Data 0x00000002
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1d88 Data 0x00001200
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x08fc Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x0394 Data 0x00000000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x0398 Data 0x3f800000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1d7c Data 0xffff0000
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/7 Mthd 0x1e94 Data 0x00000013
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0:
nouveau_channel_free: freeing fifo 1
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0: Setting dpms
mode 3 on vga encoder (output 0)
May  1 09:46:31 lithium kernel: [drm] DAC-7: set mode 2048x1536 42
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0: Setting dpms
mode 0 on vga encoder (output 0)
May  1 09:46:31 lithium kernel: [drm] nouveau 0000:01:00.0: Output VGA-1
is running on CRTC 0 using output A

I then booted into a different kernel, put back the Nvidia orignal
driver, tried to start X, with no joy.

In the logs was this:

ay  1 10:30:44 lithium kernel: NVRM: Xid (0001:00): 1, Channel 00000000
Method 00000000 Data 01014700
May  1 10:30:44 lithium kernel: NVRM: Xid (0001:00): 36,  L1 -> L0

Hmm. Then I had an idea, I tried to run a X11 program (evolution)
through a ssh session from another of my machines.

At this point I realised what the problem was. One of the X11 libraries
had got overwritten somehow. After sshing into the machine from another
machine, I ran evolution and it said that libXi was corrupted.

The last time this happened, libdl-2.10.1.so got corrupted, which needed
a recovery by booting a rescue CD and copying back a new libdl.

I'm thinking the interaction between the GART, buffers and the memory on
the card itself may, sometimes, overwrite something on rare occasions.
This only happens with the Nouveau driver, I have never seen this happen
before I switched over.

Any ideas this is happening?

I'm running the following:

nouveau-drm 20100316
xf86-video-nouveau 0.0.15_pre20100329
mesa.git (mesa branch instead of master)
linux kernel 2.6.32.8

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
