From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14941] ioremap leak/oddity in DRM
Date: Mon, 10 Mar 2008 12:24:54 -0700 (PDT)
Message-ID: <20080310192454.7F68E130168@annarchy.freedesktop.org>
References: <bug-14941-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14941-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14941


Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|ioremap leak in DRM         |ioremap leak/oddity in DRM




--- Comment #2 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>  2008-03-10 12:24:53 PST ---
Patch applied and it does now properly unmap the kernel fifo.

But, this is weird:

[ 3570.805372] kmmio: __ioremap(0xfb000000, 0x1000000, 0x0) = ffffc20002500000
[ 3570.838376] kmmio: __ioremap(0xfb700000, 0x100000, 0x0) = ffffc20003580000
[ 3571.491843] [drm:nouveau_mem_init] *ERROR* Error initialising AGP: 1
[ 3571.523846] [drm] Allocating FIFO number 0
[ 3571.589003] [drm] nouveau_fifo_alloc: initialised FIFO 0
[ 3571.589016] kmmio: __ioremap(0xf4000000, 0x8000, 0x0) = ffffc200024e0000
[ 3571.590088] [drm] Allocating FIFO number 1
[ 3571.660816] [drm] nouveau_fifo_alloc: initialised FIFO 1
[ 3571.660831] kmmio: __ioremap(0xfb810000, 0x10000, 0x0) = ffffc20003520000
[ 3575.667748] [drm] nouveau_fifo_free: freeing fifo 1
[ 3575.668822] kmmio: Unmapping ffffc200024e0000.
[ 3575.668900] [drm] nouveau_fifo_free: freeing fifo 0
[ 3575.670486] kmmio: Unmapping ffffc20003520000.
[ 3575.670814] kmmio: Unmapping ffffc20003580000.
[ 3575.671003] kmmio: Unmapping ffffc20002500000.
[ 3583.159104] ACPI: PCI interrupt for device 0000:01:00.0 disabled
[ 3583.160275] [drm] Module unloaded
[ 3594.912672] kmmio: unload...

And also the respective parts of mmiotrace log:

MAP 52.192110 34 0xfb000000 0xffffc20002500000 0x1000000 0x0 0
MAP 52.225075 35 0xfb700000 0xffffc20003580000 0x100000 0x0 0
MAP 52.975927 36 0xf4000000 0xffffc200024e0000 0x8000 0x0 0
MAP 53.047763 37 0xfb810000 0xffffc20003520000 0x10000 0x0 0
UNMAP 57.056969 36 0x0 0
UNMAP 57.058877 37 0x0 0
UNMAP 57.058991 35 0x0 0
UNMAP 57.059153 34 0x0 0

What we see here is that DRM says it is freeing first fifo 1, then fifo 0.
Mmiotrace is saying that the fifo 0's mapping is removed first, and fifo 1's
mapping second. This does not match, hence looks suspicous.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
