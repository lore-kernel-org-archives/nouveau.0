From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39866] New: Incorrectly detects Analog outputs as TV
 out on Apple Cards
Date: Fri,  5 Aug 2011 14:13:40 -0700 (PDT)
Message-ID: <bug-39866-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=39866

           Summary: Incorrectly detects Analog outputs as TV out on Apple
                    Cards
           Product: xorg
           Version: git
          Platform: PowerPC
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: jasturm002-YDxpq3io04c@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=49974)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=49974)
Dmesg from working boot with video=TV-1:d 

When KMS is enabled the Nouveau kernel driver detects any DVI to VGA adapters
as TV outputs even though the card lacks any native TV connectors. If I append
video=TV-1:d to the kernel cmdline it properly detects the VGA adapter and
output on the monitor works correctly. According to the radeon devs the DVI to
TV adapter Apple sells provides its own EDID that can be used to detect it.
(bug 19491 has this output and relates to properly detecting it.)

My system is a PowerMac 7,2 Dual 2Ghz G5 and the video card is nVidia
Corporation NV34 [GeForce FX 5200 Ultra] (rev a1)

I will attach the dmesg from a working boot and I can get a non working boot in
a second.

I have also seen reports of the TV out being mis detected on an Apple g4
machine with a geforce mx 400 and it's an integrated iLamp panel and I can get
working and non working dmesg's from that user as well if you think it is
related.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
