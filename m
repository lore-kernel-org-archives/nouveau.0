From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14921] NV25 doesn' t work after commit
 71adbfc874517efbba8b9f7c3f90baad0d7fb707
Date: Mon, 10 Mar 2008 09:17:05 -0700 (PDT)
Message-ID: <20080310161705.DBC11130092@annarchy.freedesktop.org>
References: <bug-14921-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14921-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14921





--- Comment #3 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2008-03-10 09:17:05 PST ---
Any change by doing either or both of these blocks of changes?

diff --git a/shared-core/nv04_mc.c b/shared-core/nv04_mc.c
index 766f3a3..43131f1 100644
--- a/shared-core/nv04_mc.c
+++ b/shared-core/nv04_mc.c
@@ -12,6 +12,10 @@ nv04_mc_init(struct drm_device *dev)
        saved_pci_nv_1 = NV_READ(NV04_PBUS_PCI_NV_1);
        saved_pci_nv_19 = NV_READ(NV04_PBUS_PCI_NV_19);

+       NV_WRITE(0x108c, 0x51);
+       NV_WRITE(0x1830, 0);
+       NV_WRITE(0x180c, 0xf800);
+
        /* clear busmaster bit */
        NV_WRITE(NV04_PBUS_PCI_NV_1, saved_pci_nv_1 & ~(0x00000001 << 2));
        /* clear SBA and AGP bits */
@@ -20,6 +24,8 @@ nv04_mc_init(struct drm_device *dev)
        /* Power up everything, resetting each individual unit will
         * be done later if needed.
         */
+       NV_WRITE(NV03_PMC_ENABLE, 0xFFFF0FFF);
+       udelay(400);
        NV_WRITE(NV03_PMC_ENABLE, 0xFFFFFFFF);

        /* and restore (gives effect of resetting AGP) */


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
