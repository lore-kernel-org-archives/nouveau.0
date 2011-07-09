From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39098] New: X segfaults when running a Wine program
 while 2 screens are, or have been, in use.
Date: Sat,  9 Jul 2011 11:25:34 -0700 (PDT)
Message-ID: <bug-39098-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39098

           Summary: X segfaults when running a Wine program while 2
                    screens are, or have been, in use.
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: albertpool-2BgBnwcziRhmR6Xm/wNWPw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


When I'm running on 2 screens (extended desktop via XRandR) or had a 2nd screen
connected during the same X session, X segfaults when running a Wine program.
It can take a minute before anything strange happens, but it can also happen
immediately. Sometimes X locks up, and sometimes X restarts suddenly.
On Ubuntu Maverick it happens sometimes, but on Natty it happens always. And I
don't like to downgrade just for using my Wine programs on 2 screens.

Xorg.0.log: http://pastebin.com/AzVruT8d

dmesg shows absolutely nothing about the crash. The only thing that appears in
dmesg after the crash, is that I've pushed Alt-SysRq and K, and that the kernel
had killed X because of that sysrq magic key.

It happens when running Nouveau, but does not happen with the proprietary
driver. Probably this is because the proprietary driver does not use XRandR.
I cannot use that driver; it contains a bug which makes it impossible to run
some of my Wine programs on 2 screens.

It happens with all Wine programs I've tried. When there has not been a 2nd
screen connected during the whole X session, it just works.

lspci: http://pastebin.com/Ks3ri3jZ
Intel Core 2 Duo 1667 MHz, 3GB RAM.

HP Pavilion dv6730ed laptop. The second screen, connected via VGA, is an ADI
Microscan LM-1564 CRT monitor, with resolution 1024x768@75Hz set. It is capable
of 1280x1024 but I don't like that resolution; with this one, the text is just
as big as on my laptop screen.

I hope that I've given enough information. Note that this may also be an XRandR
or X server bug.

By the way. If it happens that X does not segfault, I am not able to extend a
window from Wine over the second screen. There's also a Wine bug involved here,
but as it works with the blob I think there's something wrong with Nouveau that
prevents me from extending that window. Native Linux (GTK and Qt) windows just
extend without problem.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
