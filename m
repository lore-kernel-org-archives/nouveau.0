From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33668] New: [regression] [nv4c] Screen corruption
Date: Fri, 28 Jan 2011 11:54:47 -0800 (PST)
Message-ID: <bug-33668-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=33668

           Summary: [regression] [nv4c] Screen corruption
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: tjwasiak-wo4oW1Pw1HF3vZ0LZ0W7Rg@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=42666)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=42666)
X server log with ShadowFB option set

You can not use X Window System unless you use ShadowFB option because of
massive screen corruption. ShadowFB means no acceloration at all.

Hardware: nVidia GeForce 6100 nForce 430 - integrated graphics @ GigaByte
GA-M61PM-S2 mainboard
Software: kernel 2.6.38-rc2-git7 with nouveau drm driver snapshot fetched from
http://people.freedesktop.org/~pq/nouveau-drm (dated 20110128), libdrm, mesa
(both dated 20110128) and whole X system fetched from GIT and compiled from
sources locally.

I had been running drm driver, libdrm, mesa and xf86-video-nouveau driver
fetched from GIT in late November 2009 (on top of stable xorg-server) before
hard disk crash on that machine and it was working without bigger issues.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
