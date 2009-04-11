From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21124] New: nouveau: fonts "chipped" on NV44
Date: Sat, 11 Apr 2009 03:45:21 -0700 (PDT)
Message-ID: <bug-21124-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=21124

           Summary: nouveau: fonts "chipped" on NV44
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: marti-HlJQ7cSfIDjYtjvyW6yDsg@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=24711)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=24711)
Screenshot of the artifacts

I'm seeing chipped letters (see screenshot) when using the nouveau driver with
my Nvidia GeForce 6200; some of the rightmost pixels of letters are sometimes
made transparent. Screenshot: http://www.juffo.org/junk/nouveau-fonts.png

No relevant errors/warnings found in Xorg.0.log

Most, but not all programs exhibit this behavior. Exceptions that I have
observed include the URXVT and xterm terminal emulators, and also window
titlebars (using xfwm4). All fonts look normal with NVIDIA's proprietary
drivers.

Using xf86-video-nouveau from git revision
d8545e669aaa4362a236ba2e7231ca27ffdea1bd and libdrm revision
fef29358bb407f35b90e8c6ee913e4979786cfd5; compiled using packages from the
nouveau Portage overlay.

lspci reports this:
01:00.0 VGA compatible controller: nVidia Corporation NV44 [GeForce 6200
TurboCache(TM)] (rev a1) (prog-if 00 [VGA controller])

This is on a native AMD64 Gentoo system (no insane CFLAGS). Versions:
vanilla-sources-2.6.28.7
xorg-server-1.5.3-r5
cairo-1.8.6-r1
pango-1.22.4
gtk+-2.12.12


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
