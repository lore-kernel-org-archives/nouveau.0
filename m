From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31644] New: Nouveau driver with "Gigabyte nVidia
 9600GT" - black screen
Date: Mon, 15 Nov 2010 16:41:12 -0800 (PST)
Message-ID: <bug-31644-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31644

           Summary: Nouveau driver with "Gigabyte nVidia 9600GT" - black
                    screen
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: miko1992-UAhLvdtLeS4k+I/owrrOrA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=40293)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=40293)
lspci -vv output and logs

Hello friends,



I'm getting black screen when trying to use the Nouveau driver with my more
than 2 years old "Gigabyte nVidia 9600GT NX96T series" videocard (lspci -vv
output is attached).



My Linux OS is Arch x86_64 with all the updates and I also have tried the
latest Ubuntu 10.10 x86_64 - I get the same black screen and blinking led on
the monitor just when entering into kms mode.



When blacklisting the nouveau driver in Arch during the boot, I can boot the
system and run the X using nv driver. When trying to do "modprobe nouveau" I
get the same result - black screen, need to restart the computer by blindly
typeing "restart" at the console. Here I'm attaching also some parts related to
nouveau from the log files. (grep "drm\|nouveau"
 /var/everything.log ~/nouveau.log)


What I can I do else to help to fix this issue?



Thank you very much.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
