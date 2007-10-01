From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 10717] nouveau fails to start, waiting on dma
Date: Mon,  1 Oct 2007 12:59:30 -0700 (PDT)
Message-ID: <20071001195937.6ABC513006F@annarchy.freedesktop.org>
References: <bug-10717-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-10717-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=10717





------- Comment #10 from wingo-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org  2007-10-01 13:01 PST -------
Although I had insmod'd drm.ko with debug=1, all I have in the kernel log is
this:

Oct  1 21:48:47 localhost kernel: [  647.651041] [drm] Initialized drm 1.1.0
20060810
Oct  1 21:49:16 localhost kernel: [  676.361546] [drm] Initialized nouveau
0.0.10 20060213 on minor 0
Oct  1 21:49:16 localhost kernel: [  676.361656] [drm] Used old pci detect:
framebuffer loaded
Oct  1 21:50:31 localhost kernel: [  750.846137] appletouch: incomplete data
package (first byte: 0, length: 17).
Oct  1 21:51:03 localhost kernel: [  783.485325] agpgart: Putting AGP V2 device
at 0000:00:0b.0 into 4x mode
Oct  1 21:51:03 localhost kernel: [  783.485334] agpgart: Putting AGP V2 device
at 0000:00:10.0 into 4x mode
Oct  1 21:51:03 localhost kernel: [  783.508060] [drm] Allocating FIFO number 0
Oct  1 21:51:03 localhost kernel: [  783.508778] [drm] nouveau_fifo_alloc:
initialised FIFO 0
Oct  1 21:51:03 localhost kernel: [  783.528614] [drm] Allocating FIFO number 1
Oct  1 21:51:03 localhost kernel: [  783.529175] [drm] nouveau_fifo_alloc:
initialised FIFO 1
Oct  1 21:53:36 localhost syslogd 1.4.1#21ubuntu3: restart.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
