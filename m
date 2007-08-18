From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 12051] New: inserting nouveau.ko failed with kernel
	2.6.17 since commit 8a4d7f34d9c0182c466518c6f413d9a039db402d
Date: Sat, 18 Aug 2007 05:46:24 -0700 (PDT)
Message-ID: <bug-12051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

http://bugs.freedesktop.org/show_bug.cgi?id=12051

           Summary: inserting nouveau.ko failed with kernel 2.6.17 since
                    commit 8a4d7f34d9c0182c466518c6f413d9a039db402d
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: mjulien.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hi,

Since commit 8a4d7f34d9c0182c466518c6f413d9a039db402d, when I try to insert
nouveau.ko, it failed with unknown symbol, and dmesg say :

[drm] Initialized drm 1.1.0 20060810
nouveau: Unknown symbol pci_get_bus_and_slot

I get a warning at this place during the compilation

/home/jules/nouveau/drm/linux-core/nouveau_mem.o
/home/jules/nouveau/drm/linux-core/nouveau_mem.c: In function
'nouveau_mem_fb_amount_igp':
/home/jules/nouveau/drm/linux-core/nouveau_mem.c:230: warning: implicit
declaration of function 'pci_get_bus_and_slot'
/home/jules/nouveau/drm/linux-core/nouveau_mem.c:230: warning: assignment makes
pointer from integer without a cast


commenting out the body of the function nouveau_mem_fb_amount_igp, I can
compile without warning and insert the module (and Nouveau works).


I'm running linux mandriva 2007.1 with kernel 2.6.17, gcc 4.1.2, x86_64.

01:00.0 VGA compatible controller [0300]: nVidia Corporation NV35 [GeForce FX
5900XT] [10de:0332] (rev a1)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
