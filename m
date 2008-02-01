From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 10933] nouveau defaults to first graphics card in
 system even when xorg instructed differently
Date: Fri,  1 Feb 2008 15:09:40 -0800 (PST)
Message-ID: <20080201230940.B0D41130051@annarchy.freedesktop.org>
References: <bug-10933-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-10933-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=10933





--- Comment #6 from Mark Carey <mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-02-01 15:09:39 PST ---
Ubuntu 8.04 alpha
X.Org X Server 1.4.0.90
drm c77b0937f290568604961fa0013691349c5fcf3b
xf86-video-nouveau 5b79b0a9e54fe99eaae5b411f46a601b6944b773

with /etc/X11/xorg.conf instructing the server to start on pci 2:4:0
appears to work,

cat /var/log/messages

Feb  2 11:15:32 daisy syslogd 1.5.0#1ubuntu1: restart.
Feb  2 11:43:11 daisy -- MARK --
Feb  2 11:44:00 daisy kernel: [ 2605.976093] [drm] Initialized drm
1.1.0 20060810
Feb  2 11:44:15 daisy kernel: [ 2621.092922] [drm] Initialized drm
1.1.0 20060810
Feb  2 11:44:25 daisy kernel: [ 2631.198486] PCI: Enabling device
0000:01:00.0 (0004 -> 0006)
Feb  2 11:44:25 daisy kernel: [ 2631.198508] ACPI: PCI Interrupt
0000:01:00.0[A] -> GSI 18 (level, low) -> IRQ 19
Feb  2 11:44:25 daisy kernel: [ 2631.198653] [drm] Detected an NV4
generation card (0x20154000)
Feb  2 11:44:25 daisy kernel: [ 2631.198757] [drm] Initialized nouveau
0.0.10 20060213 on minor 0
Feb  2 11:44:25 daisy kernel: [ 2631.198796] ACPI: PCI Interrupt
0000:02:04.0[A] -> GSI 16 (level, low) -> IRQ 20
Feb  2 11:44:25 daisy kernel: [ 2631.198929] [drm] Detected an NV30
generation card (0x034200b1)
Feb  2 11:44:25 daisy kernel: [ 2631.199003] [drm] Initialized nouveau
0.0.10 20060213 on minor 1
Feb  2 11:51:06 daisy kernel: [ 3032.064186] [drm] Allocating FIFO number 0
Feb  2 11:51:06 daisy kernel: [ 3032.066462] [drm] nouveau_fifo_alloc:
initialised FIFO 0
Feb  2 11:51:06 daisy kernel: [ 3032.084842] [drm] Allocating FIFO number 1
Feb  2 11:51:06 daisy kernel: [ 3032.086085] [drm] nouveau_fifo_alloc:
initialised FIFO 1
Feb  2 11:51:15 daisy kernel: [ 3040.848176] [drm] nouveau_fifo_free:
freeing fifo 1
Feb  2 11:51:16 daisy kernel: [ 3041.544707] [drm] nouveau_fifo_free:
freeing fifo 0
Feb  2 11:51:18 daisy kernel: [ 3044.543767] [drm] Allocating FIFO number 0
Feb  2 11:51:18 daisy kernel: [ 3044.546051] [drm] nouveau_fifo_alloc:
initialised FIFO 0
Feb  2 11:51:18 daisy kernel: [ 3044.564260] [drm] Allocating FIFO number 1
Feb  2 11:51:18 daisy kernel: [ 3044.565471] [drm] nouveau_fifo_alloc:
initialised FIFO 1

will attach detailed kernel log and Xorg.0.log, but believe is fixed


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
