From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37894] New: After sleep/hibernate,
 X crashes after a few minutes
Date: Fri,  3 Jun 2011 14:01:36 -0700 (PDT)
Message-ID: <bug-37894-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37894

           Summary: After sleep/hibernate, X crashes after a few minutes
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: pablo-3clbbMySrdFF6kxbq+BtvQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=47492)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=47492)
tar-ball with the initial files 

[ I originally filed this bug against "openSUSE" [1] and tried the recommended
fix:  install latest Nouveau GIT builds [2] ]

Howdy,

I have an issue where resuming from a "suspend", X will crash.  I have had this
issue with both the Nvidia and nouveau driver.  Given the nouveau driver is
OSS, I figure it's easier to debug so it's currently installed on my laptop
[3].

Per Johannes Obermayr, I'm uploading a tar-ball with the following:

o dmesg
o /var/log/messages
o Xorg.0.log
o Xorg.0.log.old

Please note the crash occurred at 15:29:10 - see the following message in
`messages':

    Jun  3 15:29:10 zoom kdm[1581]: X server for display :0 terminated
unexpectedly

When I say X crashes, what happens after a resumption is I end up in the login
screen.

I'm marking this ticket as "critical" because when X crashes, any unsaved work
is lost.  :(

Please let me know if you need any additional forensics.

References
==========
[1] - https://bugzilla.novell.com/show_bug.cgi?id=696987
[2] - 0.0.16.get20110530.0010-1.1
[3] - M4300 - Quadro FX 360M

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
