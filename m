From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 46533] New: Firefox WebGL with Nouveau 3D;
 user claims it came installed by default on OpenSuse 12.1
Date: Thu, 23 Feb 2012 19:25:17 +0000
Message-ID: <bug-46533-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=46533

             Bug #: 46533
           Summary: Firefox WebGL with Nouveau 3D; user claims it came
                    installed by default on OpenSuse 12.1
    Classification: Unclassified
           Product: Mesa
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: bjacob-4eJtQOnFJqFBDgjK7y7TUQ@public.gmane.org


Please see this Mozilla bug report:

https://bugzilla.mozilla.org/show_bug.cgi?id=729817

it has some Nouveau_dri crashes with call stacks, like:

https://crash-stats.mozilla.com/report/index/bp-ec695c14-0f53-49c6-a78c-ddaf22120221

The GL strings are:
  nouveau -- Gallium 0.4 on NV84 -- 2.1 Mesa 7.11

We don't blacklist Nouveau 3D because it's officially experimental, so we
expect that its users are aware of that. But this user says that he gets this
on a fresh OpenSuse 12.1 install without special attention paid to drivers. Do
you know if OpenSuse started installing Nouveau 3D by default? If yes, we would
need to blacklist at least that version of it. Should we then blacklist Nouveau
3D altogether, or do you think that the Mesa 8.0 version has made enough
progress over 7.11 that it's worth blacklisting only versions <= 7.11 ?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
