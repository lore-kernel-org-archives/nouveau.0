From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25786] New: KMS turns off monitor on Asus A7N266-VM
 motherboard with onboard NVCrush11 [GeForce2 MX Integrated Graphics]
Date: Wed, 23 Dec 2009 18:35:58 -0800 (PST)
Message-ID: <bug-25786-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25786

           Summary: KMS turns off monitor on Asus A7N266-VM motherboard with
                    onboard NVCrush11 [GeForce2 MX Integrated Graphics]
           Product: xorg
           Version: 7.5
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: rajeevvp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=32268)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=32268)
dmesg output with KMS

All the nouveau kernel modules after the big merge on 2009-12-08
(id=69d47626b81fc1abf0e0e06ad623ead9be011341) turn off the LCD monitor because
it fails to detect connector connected with modes: "No connectors reported
connected with modes"

The X server, of course, does not start. Without KMS, X works ok (there are
some issues, but, nothing that makes X unusable), but the VGA fonts are totally
trashed during X init and not properly restored on exit.

$ uname -a
Linux athlon.localdomain 2.6.32.2 #1 PREEMPT Sat Dec 19 09:20:29 IST 2009 i686
GNU/Linux

X org: xorg-server-1.7.3.901

nouveau DDX: from git.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
