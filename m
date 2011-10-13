From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 41750] New: Driver sometimes freezes X - mouse still
 works. Symptom: Event Queue overflow
Date: Thu, 13 Oct 2011 09:18:38 -0700 (PDT)
Message-ID: <bug-41750-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=41750

           Summary: Driver sometimes freezes X - mouse still works.
                    Symptom: Event Queue overflow
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: christianasseburg-/E1597aS9LT10XsdtD+oqA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=52305)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=52305)
Xorg.0.log.old

Hi. Using xorg-server-1.10.4 with xf86-video-nouveau-0.0.16_pre20110801.

Sometimes my X server freezes. Then the mouse pointer still moves with the
mouse, but keyboard does not work and display does not update any more. I have
to switch off the machine with the power button. The problem can be caused by
e.g. PDF viewer or Flash player or a photo viewer, but it only happens
occasionally.

Xorg.0.log.old then contains the information that the EQ overflow occurred. I
have compiled the relevant packages with debug symbols, but not all of the
symbols are shown. I looked up some additional symbols using gdb. If I can
provide additional information, please let me know how. Thanks!

Xorg.0.log.old attached. Also attaching a text file where I added debug symbols
manually. That file contains two instances of the "freeze", the second one is
the one in the Xorg.0.log.old. The other one was earlier, but I think it's the
same issue.

Also attaching the dmesg output of the current session (which has not crashed
yet). I cannot get dmesg output after the crash because the keyboard doesn't
work.

Thanks!

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
