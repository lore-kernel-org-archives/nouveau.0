From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 48464] New: Crash when GLXVBlank set to true
Date: Mon, 09 Apr 2012 12:32:41 +0000
Message-ID: <bug-48464-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=48464

             Bug #: 48464
           Summary: Crash when GLXVBlank set to true
    Classification: Unclassified
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: mdop-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 59674
  --> https://bugs.freedesktop.org/attachment.cgi?id=59674
xorg log

I want to get rid of screen tearing when playing videos so my intention is to
set GLXVBlank to true in 20-nouveau.conf.

Monitor: Dell U2711 with resolution of 2560x1440
Graphic card: GTX 560 Ti

Arch Linux 64-bit
nouveau-dri 8.0.2-1
xf86-video-nouveau 0.0.16_git20120210-1
xorg-server-common 1.12.0.901-1
xorg-server-utils 7.6-3
kde-meta-kdebase 4.8-2

I used Xorg to generate my conf file and saved it as 20-nouveau.conf. I enabled
the "GLXVBlank" option and set it to "True". With that configuration I can
start graphical interface of X. KDM works too, however KDE crashes during
loading.
KDE loads when GLXVBlank is set to False.
I also tried simplier xorg config with only Device Section but the result was
the same.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
