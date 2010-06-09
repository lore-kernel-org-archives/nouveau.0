From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28470] New: Cannot set AGP rate - system unstable.
Date: Wed,  9 Jun 2010 12:36:35 -0700 (PDT)
Message-ID: <bug-28470-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=28470

           Summary: Cannot set AGP rate - system unstable.
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: a51473-FaFVXakVy0NBDgjK7y7TUQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I have gigabyte 7nf-rz motherboard. It is nforce2 based.
Problem is that chipset or particular board or bios or whatever... is unstable
when AGP rate is set to x8.
During heavy use (3d or even flash/mplayer video play) it tends to lock system
hard. So hard, that even played sound is looped inside soundcard buffers.
This problem is persistent over many windows xp installations, various linux
distros, many nvidia blob drivers. My card is nv7600gs, but even amd radeon
9200 suffer same problem.

Solution is simple: set agp to x4 - problem solved 100%.
Nvidia blob allowed me to do it.

Now I'm using fedora13 with nouveau.
Is there any way to set agp rate to x4?

My setup:
xorg-x11-drv-nouveau-0.0.16-6.20100423git13c1043.fc13.i686
libdrm-2.4.20-1.fc13.i686
kernel-PAE-2.6.33.5-112.fc13.i686

Yes, this problem is a blocker for me to became nouveau user in long term.

Have nice day.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
