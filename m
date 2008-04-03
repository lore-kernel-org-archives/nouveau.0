From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15344] New: Gradual Performance Decline With Nouveau
	Driver
Date: Thu,  3 Apr 2008 11:49:08 -0700 (PDT)
Message-ID: <bug-15344-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15344

           Summary: Gradual Performance Decline With Nouveau Driver
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: dgoodwin-eRDYlh02QjtL43Ps8y5oD9BPR1lH4CV8@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=15661)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=15661)
My current xorg.conf.

Noticing a steady and significant decline in X performance when rendering large
changes to what's on screen. (eg. switching workspaces or Firefox tabs)

When X is first started everything behaves nicely with performance similar to
what I'm used to with the nvidia driver. However within an hour or two
significant lag starts to develop when navigating and CPU usage seems to be
spiking quite hard while the rendering is taking place. ('top' indicates the
process is X) Window borders are visible somewhat quickly but the contents of
those windows seems to be what takes the most time to appear.

Replicated using Openbox window manager and about 6 workspaces, although only 3
in use with approximately 4 Gnome terminals open and one Firefox instance. OS
is Fedora 9 beta.

Will attach xorg.conf and X log below.

Please let me know if there is any additional info I can provide or particular
things to test to help isolate the issue I'm seeing.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
