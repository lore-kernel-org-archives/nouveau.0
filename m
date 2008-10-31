From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 17357] NV4B 10DE:0393 funny stripes in video flash
 when using nouveau
Date: Fri, 31 Oct 2008 13:30:38 -0700 (PDT)
Message-ID: <20081031203038.C306C130141@annarchy.freedesktop.org>
References: <bug-17357-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-17357-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=17357





--- Comment #15 from Mark Carey <mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-10-31 13:30:37 PST ---
havent done the drm debug=1 thing as yet, but note that the same behaviour
persists in ubuntu 8.10 

kernel 2.6.27
xorg xserver 1.5.2

[  125.225131] Symbol init_mm is marked as UNUSED, however this module is using
it.
[  125.225139] This symbol will go away in the future.
[  125.225142] Please evalute if this is the right api to use and if it really
is, submit a report the linux kernel mailinglist together with submitting your
code for inclusion.
[  125.241684] [drm] Initialized drm 1.1.0 20060810
[  125.257724] nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[  125.257734] nouveau 0000:01:00.0: setting latency timer to 64
[  125.259034] [drm] Detected an NV40 generation card (0x04b300a2)
[  125.259042] [drm] Initialized nouveau 0.0.11 libdrm-2.4.1 on minor 0
[  125.686046] [drm] Allocating FIFO number 0
[  125.688809] [drm] nouveau_fifo_alloc: initialised FIFO 0
[  125.690011] [drm] Allocating FIFO number 1
[  125.692352] [drm] nouveau_fifo_alloc: initialised FIFO 1


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
