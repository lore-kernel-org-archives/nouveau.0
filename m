From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 38149] New: nouveau + GeForce 9600M GT +
 xorg/vbetest (or similar) = distorted image on the screen
Date: Fri, 10 Jun 2011 05:24:35 -0700 (PDT)
Message-ID: <bug-38149-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=38149

           Summary: nouveau + GeForce 9600M GT + xorg/vbetest (or similar)
                    = distorted image on the screen
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: ripper-tm-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=47807)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=47807)
As you can see, I failed at setting up wifi driver too :)

As the log says, I'm using Linux version 2.6.38-gentoo-r6 on Acer Aspire 7730G
(laptop).
I've installed nouveau using this guide ->
http://en.gentoo-wiki.com/wiki/Nouveau .
After starting xorg or vbetest (with -m MODE), I get strange noise on the
display (Like this -> http://img256.imageshack.us/img256/8364/image002qp.jpg).
It doesn't disappear even when vbetest is finished.
But console is working. If I type "dmesg > kernel_log.txt", I will see
kernel_log.txt after reboot. And after reboot the image on the screen is
normal.

Thanks in advance.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
