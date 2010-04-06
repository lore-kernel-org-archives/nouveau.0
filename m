From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] New: nVidia 9600M GT (Macbook Pro current
 model) is unable to boot
Date: Tue,  6 Apr 2010 15:43:45 -0700 (PDT)
Message-ID: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

https://bugs.freedesktop.org/show_bug.cgi?id=27501

           Summary: nVidia 9600M GT (Macbook Pro current model) is unable
                    to boot
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: cdotv.mail-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hello, I like to raise attention on this very important bug over here:

https://bugs.launchpad.net/ubuntu/+source/linux/+bug/546393

The Ubuntu Lucid Beta 1 onwards is unable to boot into the desktop because the
nouveau driver has a "pramin flush timeout" (check the video in post #12).

Since Ubuntu is the most popular Linux distribution, this bug is very
important, since all MacBook Pro 5,x Models are unable to boot into the desktop
because nouveau is unable to load.

Further testing found out that adding "nouveau.noaccel=1 blacklist=vga16fb" as
kernel options helps booting the system.

Maybe you could fix this bug and enable nouveau.noaccel=1 as a standard if the
9600M GT nVidia card is detected.

Any other fix would be nice too, this is very important.

Thanks.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
