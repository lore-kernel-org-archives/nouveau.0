From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15206] [dualhead, randr12,
	ppc] Second head displays nothing
Date: Fri, 20 Jun 2008 19:41:32 -0700 (PDT)
Message-ID: <20080621024133.05FBF130056@annarchy.freedesktop.org>
References: <bug-15206-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15206-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15206


Robin Johnson <robbat2-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #15469|0                           |1
        is obsolete|                            |
  Attachment #15470|0                           |1
        is obsolete|                            |
  Attachment #15471|0                           |1
        is obsolete|                            |
  Attachment #17245|0                           |1
        is obsolete|                            |




--- Comment #11 from Robin Johnson <robbat2-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>  2008-06-20 19:41:29 PST ---
Created an attachment (id=17276)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=17276)
20080620_Xorg_nouveau.log

After forcibly changing the le{16,32}_to_cpu definitions to do the
bswap{16,32}, here's what happens.

The full Xorg.log is attached, but the snippet at the end that catches my eye
is:
(II) [drm] DRM interface version 1.3
(II) [drm] DRM open master succeeded.
(II) NOUVEAU(0): [drm] Using the DRM lock SAREA also for drawables.
(II) NOUVEAU(0): [drm] framebuffer handle = 0x98000000
(II) NOUVEAU(0): [drm] added 1 reserved context for kernel
(II) NOUVEAU(0): X context handle = 0x1
(II) NOUVEAU(0): [drm] installed DRM signal handler
(EE) NOUVEAU(0): Failed to allocate memory for framebuffer!


Kernel log:
[84617.583277] [drm] Initialized drm 1.1.0 20060810
[84620.167843] PCI: Unable to reserve mem region #2:10000000@90000000 for
device 0000:0b:00.0
[84620.168414] [drm] Detected an NV40 generation card (0x043100a4)
[84620.168423] [drm] Initialized nouveau 0.0.10
drm-2.3.0-1298-g8712f0a17bb135d4a on minor 0
[84620.168461] [drm] Used old pci detect: framebuffer loaded
[84621.597255] [drm] OF bios successfully copied (6447 bytes)
[84621.598177] [drm] OF bios successfully copied (6447 bytes)
[84622.202587] [drm] OF bios successfully copied (6447 bytes)
[84622.203405] [drm] OF bios successfully copied (6447 bytes)
[84622.204114] [drm] OF bios successfully copied (6447 bytes)
[84622.253426] [drm] Allocating FIFO number 0
[84622.266771] [drm] nouveau_fifo_alloc: initialised FIFO 0
[84622.266940] [drm:nouveau_ioctl_getparam] *ERROR* unknown parameter
-4611686003779437824
[84622.267055] [drm:nouveau_ioctl_getparam] *ERROR* unknown parameter
-4611686003779437824
[84622.267157] [drm:nouveau_ioctl_getparam] *ERROR* unknown parameter
-4611686003779437824
[84623.330948] [drm] nouveau_fifo_free: freeing fifo 0


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
