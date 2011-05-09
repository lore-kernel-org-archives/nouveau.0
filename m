From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37042] New: the blur effect in kwin does not work
 with the git version of the 3-d nouveau driver
Date: Mon,  9 May 2011 16:26:47 -0700 (PDT)
Message-ID: <bug-37042-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37042

           Summary: the blur effect in kwin does not work with the git
                    version of the 3-d nouveau driver
           Product: Mesa
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: jsardid-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


Hi,

I'm using libgl1-mesa-dri-experimental
7.11.0+git20110509.7074801e-0ubuntu0sarvatt from the [xorg-edgers] ppa
(https://edge.launchpad.net/~xorg-edgers/+archive/ppa) because it works great
in kubuntu natty (when using the default stable version of the driver I suffer
from random lockups and performance is also worse). I'm very happy using the
git version to remove all these problems, but on the other side there is an
issue with the blur desktop effect which is not working anymore in kwin when
using the git version (it works with the default stable version). This is
especially bad when transparency is enabled, which is my case. I wouldn't like
to have to renounce to nouveau by nvidia, nor to the benefits of the git
version and I really enjoy transparency when the blur effect is working
properly, so please let me know if there is any way I can help to solve this
issue.

Thanks in advance,
Salva

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
