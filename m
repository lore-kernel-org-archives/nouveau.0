From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 11918] drmMap of framebuffer failed
Date: Thu,  9 Aug 2007 12:53:41 -0700 (PDT)
Message-ID: <20070809195342.00E9F130070@annarchy.freedesktop.org>
References: <bug-11918-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-11918-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=11918





------- Comment #2 from pq-X3B1VOXEql0@public.gmane.org  2007-08-09 12:53 PST -------
I hit this too, all DRM, DDX and DRI from today.

There seems to be a collision of mappings (as noticed by cmn) in the DRM:

[ 3024.352588] [drm:drm_addmap_core] offset = 0xf0000000, size = 0x04000000,
type = 0
...
[ 3024.368286] [drm:nouveau_dma_channel_init] 
[ 3024.368291] [drm:drm_addmap_core] offset = 0xf0000000, size = 0x00008000,
type = 0
[ 3024.368295] [drm:drm_addmap_core] Matching maps of type 0 with mismatched
sizes, (32768 vs 67108864)
[ 3024.368299] [drm] allocated 0x0
[ 3024.368303] [drm] Allocating FIFO number 0
[ 3024.368306] [drm:nouveau_notifier_init_channel] Allocating notifier block in
262
[ 3024.368310] [drm:drm_addmap_core] offset = 0x00000000, size = 0x00001000,
type = 3
[ 3024.368314] [drm:drm_addmap_core] AGP offset = 0xe8000000, size = 0x00001000
[ 3024.368317] [drm] allocated 0x0

Notice how at the address 0xf0000000, which is the start of my VRAM, first is
allocated the FB block of 64MB, and then a block of 32kB, which overwrites the
previous 64MB mapping. I.e., creating the FIFO for the DRM messes things up,
but perhaps just triggers a bug elsewhere, in DRI parameter communication.

Later in the log:
[ 3024.370650] [drm:drm_addmap_core] offset = 0xf0008000, size = 0x04000000,
type = 0

Now, the DDX seems to be ok with this, because /proc/<Xserver>/maps contains
the line:
2b95ab8ed000-2b95af8ed000 rw-s f0008000 00:0b 41226                     
/dev/dri/card0

But however, glxinfo tries to do the following syscall:
mmap(NULL, 67108864, PROT_READ|PROT_WRITE, MAP_SHARED, 4, 0xf0000000) = -1
EINVAL (Invalid argument)
which leads to the "drmMap of framebuffer failed" error message.

cmn therefore inferred that libGL does not get the correct information for
mapping the framebuffer, but tries it with a wrong address. A quote:
< cmn> glxext knows the offset at which it should request the FB memory from
XF86DRIGetDeviceInfo(), but I haven't been able to see where we tell it the
address


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
