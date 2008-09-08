From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 17484] New: lots of PGRAPH_ERROR/PROTECTION_ERROR
Date: Mon,  8 Sep 2008 10:42:44 -0700 (PDT)
Message-ID: <bug-17484-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=17484

           Summary: lots of PGRAPH_ERROR/PROTECTION_ERROR
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: drzeus-bugzilla-p3sGCRWkH8CeZLLa646FqQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


My NVS 140M gets lots and lots of these:

[  108.922348] [drm] Detected an NV50 generation card (0x086900a2)
[  108.922355] [drm] Initialized nouveau 0.0.11
drm-2.3.0-1592-gcd7d71f19cf2a1652 on minor 0
[  143.303142] [drm] Allocating FIFO number 1
[  143.309984] [drm] nouveau_fifo_alloc: initialised FIFO 1
[  143.310459] [drm] Allocating FIFO number 2
[  143.317236] [drm] nouveau_fifo_alloc: initialised FIFO 2
[  153.488984] [drm] nouveau_fifo_free: freeing fifo 2
[  153.489093] [drm] nouveau_fifo_free: freeing fifo 1
[  160.317313] mtrr: type mismatch for e0000000,8000000 old: write-back new:
write-combining
[  160.368174] [drm] Allocating FIFO number 1
[  160.374988] [drm] nouveau_fifo_alloc: initialised FIFO 1
[  160.375458] [drm] Allocating FIFO number 2
[  160.382237] [drm] nouveau_fifo_alloc: initialised FIFO 2
[  377.128234] [drm] nouveau_fifo_free: freeing fifo 2
[  377.128505] [drm] nouveau_fifo_free: freeing fifo 1
[  399.665636] mtrr: type mismatch for e0000000,8000000 old: write-back new:
write-combining
[  399.717150] [drm] Allocating FIFO number 1
[  399.723967] [drm] nouveau_fifo_alloc: initialised FIFO 1
[  399.724453] [drm] Allocating FIFO number 2
[  399.731293] [drm] nouveau_fifo_alloc: initialised FIFO 2
[  477.641541] [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
[  477.641561] [drm] PGRAPH_ERROR - Ch 2/0 Class 0x502d Mthd 0x0860 Data
0x00000000:0x00000000
[  477.641591] [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
[  477.641600] [drm] PGRAPH_ERROR - Ch 2/2 Class 0x8297 Mthd 0x15e0 Data
0x00000000:0x00000000
[  477.641635] [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
[  477.641644] [drm] PGRAPH_ERROR - Ch 2/2 Class 0x8297 Mthd 0x15e0 Data
0x00000000:0x00000000
[  477.641696] [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
[  477.641706] [drm] PGRAPH_ERROR - Ch 2/2 Class 0x8297 Mthd 0x15e0 Data
0x00000000:0x00000000
[  477.641758] [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
[  477.641767] [drm] PGRAPH_ERROR - Ch 2/2 Class 0x8297 Mthd 0x15e0 Data
0x00000000:0x00000000
[  477.641822] [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
[  477.641832] [drm] PGRAPH_ERROR - Ch 2/2 Class 0x8297 Mthd 0x15e0 Data
0x00000000:0x00000000
[  477.641881] [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
[  477.641890] [drm] PGRAPH_ERROR - Ch 2/2 Class 0x8297 Mthd 0x15e0 Data
0x00000000:0x00000000
[  477.641944] [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
[  477.641954] [drm] PGRAPH_ERROR - Ch 2/1 Class 0x5039 Mthd 0x0184 Data
0x00000000:0x00000e00
[  477.642004] [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
[  477.642013] [drm] PGRAPH_ERROR - Ch 2/1 Class 0x5039 Mthd 0x0184 Data
0x00000000:0x00000e00
[  477.642066] [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
[  477.642074] [drm] PGRAPH_ERROR - Ch 2/1 Class 0x5039 Mthd 0x0184 Data
0x00000000:0x00000e00
[  477.642126] [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
[  477.642135] [drm] PGRAPH_ERROR - Ch 2/1 Class 0x5039 Mthd 0x0184 Data
0x00000000:0x00000e00
[  477.642187] [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
[  477.642196] [drm] PGRAPH_ERROR - Ch 2/1 Class 0x5039 Mthd 0x0184 Data
0x00000000:0x00000e00
[  477.642244] [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
[  477.642253] [drm] PGRAPH_ERROR - Ch 2/1 Class 0x5039 Mthd 0x0100 Data
0x00000000:0x00000000
[  477.642281] [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
[  477.642290] [drm] PGRAPH_ERROR - Ch 2/2 Class 0x8297 Mthd 0x15e0 Data
0x00000000:0x00000000
[  477.642318] [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
[  477.642327] [drm] PGRAPH_ERROR - Ch 2/2 Class 0x8297 Mthd 0x15e0 Data
0x00000000:0x00000000
[  477.642356] [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
[  477.642365] [drm] PGRAPH_ERROR - Ch 2/2 Class 0x8297 Mthd 0x15e0 Data
0x00000000:0x00000000
[  477.642399] [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
[  477.642408] [drm] PGRAPH_ERROR - Ch 2/0 Class 0x502d Mthd 0x0100 Data
0x00000000:0x00000000

(I'd attach the entire log but it's 1.7 GiB ;))

nouveau: 6dd8ad4...
drm: cd7d71f...
xorg: 1.5.0


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
