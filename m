From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 13796] New: tnt2 16Mb agp, corrupted image
Date: Sun, 23 Dec 2007 08:13:58 -0800 (PST)
Message-ID: <bug-13796-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=13796

           Summary: tnt2 16Mb agp, corrupted image
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: randrik-JGs/UdohzUI@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


hwinfo:

01:00.0 VGA compatible controller: nVidia Corporation NV5 [RIVA TNT2/TNT2 Pro]
(rev 15) (prog-if 00 [VGA])
        Subsystem: ASUSTeK Computer Inc. AGP-V3800PRO
        Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 19
        Memory at de000000 (32-bit, non-prefetchable) [size=16M]
        Memory at da000000 (32-bit, prefetchable) [size=32M]
        Expansion ROM at dfef0000 [disabled] [size=64K]
        Capabilities: [60] Power Management version 1
        Capabilities: [44] AGP version 2.0

Subsystem: 1043:4000

Software:
Linux slax 2.6.23.11 #2 Sun Dec 16 08:33:34 GMT 2007 i686 unknown unknown
GNU/Linux

drm from git (~12 dec 2007)
x server from git (~6 dec 2007)
nouveau (II) NOUVEAU driver Date:   Sun Dec 23 15:48:24 2007 +0100

right after x server startup i have very corrupted image, all gtk2 apps have no
text in menus. But Eterm (text inside it) works.

Options 

#Option "EXANoDownloadFromScreen" "1"                                   
#Option  "EXANoUploadToScreen" "1"                                      
#Option         "EXANoComposite" "1"

has no positive effect.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
