From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 12805] New: error dma
Date: Mon, 15 Oct 2007 01:25:43 -0700 (PDT)
Message-ID: <bug-12805-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=12805

           Summary: error dma
           Product: xorg
           Version: unspecified
          Platform: PowerPC
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: kpietro-whZMOeQn8C0@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hello, my video crash (with long lines and white/black screen) when I start X

this is the kern log:

Oct 15 10:12:09 localhost kernel: [  175.781622] [drm] Initialized drm 1.1.0
20060810
Oct 15 10:12:15 localhost kernel: [  181.709641] PCI: Unable to reserve mem
region #2:8000000@98000000 for device 0000:00:10.0
Oct 15 10:12:15 localhost kernel: [  181.709798] [drm] Detected an NV17
generation card (0x018900a3)
Oct 15 10:12:15 localhost kernel: [  181.715353] [drm] Initialized nouveau
0.0.10 20060213 on minor 0
Oct 15 10:12:15 localhost kernel: [  181.715371] [drm] Used old pci detect:
framebuffer loaded
Oct 15 10:12:32 localhost kernel: [  199.122583] agpgart: Putting AGP V2 device
at 0000:00:0b.0 into 4x mode
Oct 15 10:12:32 localhost kernel: [  199.123223] agpgart: Putting AGP V2 device
at 0000:00:10.0 into 4x mode
Oct 15 10:12:32 localhost kernel: [  199.150400] [drm:nouveau_dma_channel_init]
*ERROR* Failed to allocate DMA push buffer


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
