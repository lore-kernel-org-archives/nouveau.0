From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23058] New: Intersting info with the Nouveau driver
Date: Fri, 31 Jul 2009 04:44:08 -0700 (PDT)
Message-ID: <bug-23058-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23058

           Summary: Intersting info with the Nouveau driver
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: STEVENWARD666-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=28219)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=28219)
A snapshot of my current desktop

Hi to all,
         Here is some info regarding the nouveau D.R.M and the driver.
When I was running the 2.6.31.103.rc4 kernel with Rawhide,and previously the
2.6.31.86 kernel,which I reported previously that I couldn't get to the K.D.E
Desktop.When I got the 2.6.31.103.rc4 kernel via yum,I re-booted into it,but
the kernel would just lock-up on me.After a lot of recompiling and searching on
the web,I just decided to change the A.G.P speed from 8X which I've always had
it running down to 4X and turned off Fast-Writes in my B.I.O.S.I then saved the
settings and rebooted into the 2.6.31.103.rc4 at that time.

And to my great surprise,the kernel booted fine! I got as far as K.D.M and
selected K.D.E.The strange thing is,the desktop doesn't look like a normal
K.D.E desktop.I'll try and upload an image of the desktop and the additional
info with this report.Also with this desktop I've got,there is no shutdown
option in the Kmenu I have to press Ctrl+Alt+F2 or F3 to get to that tty,log
into it and type in init 0 to shutdown or init 6 to restart.

I hope you'll find the information useful.

Regards,
       STEVE555


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
