From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34487] New: Troubleshooting GeForce 6150LE
Date: Sat, 19 Feb 2011 12:46:37 -0800 (PST)
Message-ID: <bug-34487-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34487

           Summary: Troubleshooting GeForce 6150LE
           Product: xorg
           Version: 7.6
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: diptongo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=43556)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=43556)
Tarball with kernel config, dmesg output, xorg log, and other system
information.

A bit before than kernel 2.6.36, nouveau kernel driver stopped working in my
GeForce 6150LE (10de:0241) integrated graphics card (from a Dell Dimension
C521):

00:05.0 VGA compatible controller: nVidia Corporation C51 [GeForce 6150 LE]
(rev a2)

I was trying to bisect it, but someone at IRC (#nouevau on freenode) told me
that it was better to just get the 2.6.38-rc5 dmesg and Xorg outputs and fill a
bug with them.

The only images obtained are residual from previous boot with garbage.  There
seem to be also a keyboard and mouse interaction when Xorg starts, as it leaves
them completely off.  I'm currently running 2.6.35.7 with a very similar kernel
configuration and works fine with software cursor.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
