From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21273] Driver can't detect video output and xserver
 doesn't start
Date: Fri,  5 Jun 2009 23:57:01 -0700 (PDT)
Message-ID: <20090606065701.6BBA22DC002@annarchy.freedesktop.org>
References: <bug-21273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21273-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=21273





--- Comment #31 from Andrey Gusev <ronne-cmBhpYW9OiY@public.gmane.org>  2009-06-05 23:57:00 PST ---
Created an attachment (id=26485)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=26485)
Dump of registers with patch B when fonts are bad

>So are you saying that sometimes the fonts are ok when using patch A?
Yes, sometimes they are ok. I can say in most cases.

>Also, have you ever got corrupted fonts with patch B?

Yes, I got corrupted fonts with patch B. It was first initialization. I can see
in dmesg:

[  124.681630] pci 0000:00:10.0: Invalid ROM contents
[  128.584775] pci 0000:00:10.0: Invalid ROM contents
[  132.443573] pci 0000:00:10.0: Invalid ROM contents
[  216.017077] [drm] Initialized drm 1.1.0 20060810
[  226.226079] pci 0000:00:10.0: BAR 1: can't reserve mem region
[0x98000000-0x9fffffff]
[  226.234741] [drm] Detected an NV17 generation card (0x017200a5)
[  226.238082] [drm] Initialized nouveau 0.0.12
libdrm-2.4.9-2-ga1e3ab9e55047c08a on minor 0
[  226.246490] [drm] Used old pci detect: framebuffer loaded
[  267.394922] [drm] OF bios successfully copied (2701 bytes)
[  267.395735] [drm] OF bios successfully copied (2701 bytes)
[  267.396385] [drm] OF bios successfully copied (2701 bytes)
[  267.448771] [drm] Allocating FIFO number 0
[  267.449937] [drm] nouveau_fifo_alloc: initialised FIFO 0
[  267.867452] Process Xorg (pid:3561) mapped non-existing PCI legacy memory
for 00000:00
[  267.868387] [drm] Allocating FIFO number 1
[  267.869244] [drm] nouveau_fifo_alloc: initialised FIFO 1
[ 1779.522615] [drm] nouveau_fifo_free: freeing fifo 1
[ 1779.522645] [drm] cleanning a channel with graph in current context
[ 1779.553369] [drm] nouveau_fifo_free: freeing fifo 0
[ 1781.252878] [drm] OF bios successfully copied (2701 bytes)
[ 1781.253641] [drm] OF bios successfully copied (2701 bytes)
[ 1781.254242] [drm] OF bios successfully copied (2701 bytes)
[ 1781.301913] [drm] Allocating FIFO number 0
[ 1781.302997] [drm] nouveau_fifo_alloc: initialised FIFO 0
[ 1781.668603] Process Xorg (pid:5286) mapped non-existing PCI legacy memory
for 00000:00
[ 1781.669483] [drm] Allocating FIFO number 1
[ 1781.670341] [drm] nouveau_fifo_alloc: initialised FIFO 1


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
