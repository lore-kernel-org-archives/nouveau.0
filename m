From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40485] New: PGRAPH - ERROR nsource: LIMIT_COLOR
 nstatus: PROTECTION_FAULT
Date: Tue, 30 Aug 2011 03:15:18 -0700 (PDT)
Message-ID: <bug-40485-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40485

           Summary: PGRAPH - ERROR nsource: LIMIT_COLOR nstatus:
                    PROTECTION_FAULT
           Product: Mesa
           Version: 7.11
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: devurandom-hi6Y0CQ0nG0@public.gmane.org


Created an attachment (id=50680)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=50680)
dmesg

I am not sure whether this is the correct location to report this bug. If not
please direct me to the right one.

My X happens to hang regularly recently. It is then impossible to switch to a
VT (the screen just stays the same) or recover from that in any way. Restarting
X ("rc-service xdm restart" on Gentoo) will not work, but notify me that it was
impossible to stop X. I cannot kill it using SIGTERM and using SIGKILL also
seems to only react after tens of seconds up to some minutes. The computer
stays responsive via SSH for the whole time. htop shows no extraordinary CPU
(load 0.05) or memory (1G, not growing) usage. Swap is disabled and free still
shows about 3G of free memory (+2G currently used for caches).

This time I was playing a DVD using MPlayer and while doing so looked at a
website in Chromium, marking a text. Today I was able to get to a VT once, but
then I tried to restart X (s.a.) and screen locked completely. I now also
looked at dmesg and found a line which might be related:
[drm] nouveau 0000:03:00.0: PGRAPH - ERROR nsource: LIMIT_COLOR nstatus:
PROTECTION_FAULT
[drm] nouveau 0000:03:00.0: PGRAPH - ch 6 (0x001bf000) subc 5 class 0x009f mthd
0x0308 data 0x002f0400

More about my system:
AMD Athlon 64 X2 5000+, NVidia GeForce 7900GS
Linux 3.0.3
KDE 4.7.0
xorg-server-1.10.4
mesa-7.11
mplayer-1.0_rc4_p20110322
chromium-14.0.835.109

Attached is the dmesg.log, emerge-info (Gentoo system info) and Xorg.0.log (for
completeness, though it shows nothing of interest to me).

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
