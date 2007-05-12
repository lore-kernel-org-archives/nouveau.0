From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 10858] glxgears with mesa-git on PCI 10de0322 (NV34)
	GeForce FX 5200 crashes X
Date: Fri, 11 May 2007 18:37:29 -0700 (PDT)
Message-ID: <20070512013729.53B8C130061@annarchy.freedesktop.org>
References: <bug-10858-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-10858-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=10858





------- Comment #13 from mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org  2007-05-11 18:37 PST -------
xf86-video-nouveau: d1b75251a3f225890f1e25b11038389d71b67611 2007-03-07
23:41:22
drm: 4f795a05f1f987491d85d5b9bdbf280451c7ed20 2007-03-10 12:11:10
mesa: 30b914e2ca28cd44eed57b34353e641793b38a6d 2007-03-10 12:19:1

May 12 13:20:03 daisy kernel: [  172.382038] [drm:nouveau_pgraph_irq_handler]
*ERROR* NV: PGRAPH error interrupt
May 12 13:20:03 daisy kernel: [  172.382059] [drm:nouveau_pgraph_irq_handler]
*ERROR* nsource:0x00040000^Instatus:0x01000000
May 12 13:20:03 daisy kernel: [  172.382067] [drm:nouveau_pgraph_irq_handler]
*ERROR* instance:0x00001d7c
May 12 13:20:03 daisy kernel: [  172.382077] [drm:nouveau_graph_dump_trap_info]
*ERROR* NV: nSource: 0x00040000, nStatus: 0x01000000
May 12 13:20:03 daisy kernel: [  172.382087] [drm:nouveau_graph_dump_trap_info]
*ERROR* NV: Channel 1/7 (class 0x0697) -Method 0x03b0, Data 0x00100000
May 12 13:20:03 daisy kernel: [  172.402132] [drm:drm_ioctl] pid=5007,
cmd=0x4008642a, nr=0x2a, dev 0xe201, auth=1
May 12 13:20:03 daisy kernel: [  172.402144] [drm:drm_lock] 1 (pid 5007)
requests lock (0x00000002), flags = 0x00000000
May 12 13:20:03 daisy kernel: [  172.402153] [drm:drm_lock] 1 has lock
May 12 13:20:48 daisy kernel: [  217.677871] [drm:nouveau_irq_handler] PMC
INTSTAT: 0x00001000
May 12 13:20:48 daisy kernel: [  217.677884] [drm:nouveau_pgraph_irq_handler]
*ERROR* NV: PGRAPH error interrupt
May 12 13:20:48 daisy kernel: [  217.677895] [drm:nouveau_pgraph_irq_handler]
*ERROR* nsource:0x00040000^Instatus:0x01000000
May 12 13:20:48 daisy kernel: [  217.677902] [drm:nouveau_pgraph_irq_handler]
*ERROR* instance:0x00001d7c
May 12 13:20:48 daisy kernel: [  217.677913] [drm:nouveau_graph_dump_trap_info]
*ERROR* NV: nSource: 0x00040000, nStatus: 0x01000000
May 12 13:20:48 daisy kernel: [  217.677923] [drm:nouveau_graph_dump_trap_info]
*ERROR* NV: Channel 1/7 (class 0x0697) -Method 0x1e98, Data 0x00000000

mesa: 440759c2cdfdd9a7fbc6500fca2afa519126c1a7 21/02/2007 11:17:09
drm: a253de2fcfa11abadd4697a9d89137adf3f35f78 18/02/2007 19:59:40 
xf86-video-nouveau: c85da5d8b346e17e68da68e57d62c3f77029b680 14/Feb/2007
12:35:50

May 12 12:29:32 daisy kernel: [  167.718390] [drm:nouveau_pgraph_irq_handler]
*ERROR* NV: PGRAPH error interrupt
May 12 12:29:32 daisy kernel: [  167.718402] [drm:nouveau_pgraph_irq_handler]
*ERROR* nsource:0x00040000^Instatus:0x01000000
May 12 12:29:32 daisy kernel: [  167.718409] [drm:nouveau_pgraph_irq_handler]
*ERROR* instance:0x00001d77
May 12 12:29:32 daisy kernel: [  167.718417] [drm:nouveau_pgraph_irq_handler]
NV: 0x400704 = 0x001703b0
May 12 12:29:32 daisy kernel: [  167.718426] [drm:nouveau_pgraph_irq_handler]
*ERROR* NV: Channel 1/7 (class 0x0697) -Method 0x03b0, Data 0x00100000
May 12 12:29:32 daisy kernel: [  167.718435] [drm:nouveau_irq_handler] *ERROR*
Unhandled PMC INTR status bits 0x80000000
May 12 12:29:32 daisy kernel: [  167.736385] [drm:drm_ioctl] pid=4999,
cmd=0x4008642a, nr=0x2a, dev 0xe201, auth=1
May 12 12:29:32 daisy kernel: [  167.736400] [drm:drm_lock] 1 (pid 4999)
requests lock (0x00000002), flags = 0x00000000
May 12 12:29:32 daisy kernel: [  167.736409] [drm:drm_lock] 1 has lock
May 12 12:30:39 daisy kernel: [  235.245792] [drm:nouveau_irq_handler] PMC
INTSTAT: 0x00001000
May 12 12:30:39 daisy kernel: [  235.245805] [drm:nouveau_pgraph_irq_handler]
*ERROR* NV: PGRAPH error interrupt
May 12 12:30:39 daisy kernel: [  235.245816] [drm:nouveau_pgraph_irq_handler]
*ERROR* nsource:0x00040000^Instatus:0x01000000
May 12 12:30:39 daisy kernel: [  235.245824] [drm:nouveau_pgraph_irq_handler]
*ERROR* instance:0x00001d77
May 12 12:30:39 daisy kernel: [  235.245831] [drm:nouveau_pgraph_irq_handler]
NV: 0x400704 = 0x00171e98
May 12 12:30:39 daisy kernel: [  235.245840] [drm:nouveau_pgraph_irq_handler]
*ERROR* NV: Channel 1/7 (class 0x0697) -Method 0x1e98, Data 0x00000000

Note that here mouse can be moved within one window boundary (and possibly out
to the root window), and as long as it does not leave a window boundary (which
changes the cursor) then x server lives, as soon as leave the window (cursor
changes from text select to big X) and then reenter original window (which I
presume tries to change the cursor back to text select) x crashes.

Suggestions;

1. Fix 440759c2cdfdd9a7fbc6500fca2afa519126c1a7 to work for nv34, TiNDC 15
(http://nouveau.freedesktop.org/wiki/Nouveau_Companion_15) shows a gear on nv3X
and an IRC window which marcheu identifies as being from Feb/24 (refer
http://lattice.u-strasbg.fr/irclogs/nouveau-2007-05-12)

2. Add a call to nv30WindowMoved from the end of nv30InitCard, once we can get
through nv30WindowMoved without crashing.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
