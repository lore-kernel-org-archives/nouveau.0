From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39099] New: two graphic cards and four monitors with
	Nouveau
Date: Sat,  9 Jul 2011 13:06:56 -0700 (PDT)
Message-ID: <bug-39099-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39099

           Summary: two graphic cards and four monitors with Nouveau
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: nowaker-qMBiBlq7xnnVItvQsEIGlw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


This bug is related to: https://bugs.freedesktop.org/show_bug.cgi?id=38759
I was trying to get a 2-cards-3-monitors set-up working. I finally did it after
updating to bleeding edge X and using ZaphodHeads option.

3 monitors xorg.conf: http://wklej.org/id/555276/txt/  (working)
4 monitors xorg.conf: http://wklej.org/id/559775/txt/  (failing)
The only difference between those two configs is making use of 4th monitor.

3 monitors Xorg.0.log: http://wklej.org/id/559778/txt/ (working)
4 monitors Xorg.0.log: http://wklej.org/id/559777/txt/ (failing)

Error message: Screen(s) found, but none have a usable configuration.
After `service gdm restart` main screen blinks 5 times and goes back to
console.

Ubuntu 11.04 - Linux ubuntu 2.6.38-8-generic #42-Ubuntu SMP Mon Apr 11 03:31:24
UTC 2011 x86_64 x86_64 x86_64 GNU/Linux
(this didn't work on Ubuntu 10.10 either)

Packages version:
libdrm-nouveau1a 2.4.26+git20110604.6dd804c5-0ubuntu0sarvatt~natty
xserver-xorg-video-nouveau 1:0.0.16+git20110623.ab89aa02-0ubuntu0sarvatt~natty
(from https://launchpad.net/~xorg-edgers/+archive/ppa)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
