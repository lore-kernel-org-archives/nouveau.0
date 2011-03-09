From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35133] New: nouveaufb messing UTF-8 characters on tty
Date: Wed,  9 Mar 2011 01:31:10 -0800 (PST)
Message-ID: <bug-35133-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35133

           Summary: nouveaufb messing UTF-8 characters on tty
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: appzer0-GANU6spQydw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=44263)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=44263)
dmesg log

Since I started using nouveau, nouveaufb is loaded automatically and the UTF-8
characters on my tty are messed up. I notice that while I'm going
shutdown/reboot, every accented character are strangely encoded.

I tried with AND without the kernel line parameter 'vt.default_utf8=1'. No
resolution is specified at boot. KMS is enabled, though I don't see any high
resolution before X has launched. tty is in classic VGA (80x25) then switch to
X in high and correct reso.

locale is "fr_FR.UTF-8". See the dmesg log attached.
Video card is NV40 geforce 9500GT.

I guess this is the moment where characters are messed up:
---
Console: switching to colour frame buffer device 128x48
fb0: nouveaufb frame buffer device
---

I can bring more info if needed.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
