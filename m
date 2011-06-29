From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 38759] New: three monitors,
 two graphic cards and Xinerama - almost working
Date: Tue, 28 Jun 2011 19:39:38 -0700 (PDT)
Message-ID: <bug-38759-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=38759

           Summary: three monitors, two graphic cards and Xinerama -
                    almost working
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: nowaker-qMBiBlq7xnnVItvQsEIGlw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


My goal is to achieve one huge X screen on three monitors and two graphics
cards. I got a working solution without Xinerama (one X screen on front+right
and one X screen on the left) but this of course won't let me drag the windows.
Enabling Xinerama makes something really strange to the right monitor, just see
the video: http://upload.nowaker.net/nwkr/xinerama-fail.3gp As you can see,
it's almost working. 

lspci:
01:00.0 VGA compatible controller: nVidia Corporation G73 [GeForce 7600 GT]
(rev a1)
07:01.0 VGA compatible controller: nVidia Corporation NV44A [GeForce 6200] (rev
a1)
(PCI-E x16 and old 32-bit PCI)

My xorg.conf: http://wklej.org/id/554292/txt/

Using Ubuntu 10.10, amd64.
Nouveau package version 2.4.21-1ubuntu2.1.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
