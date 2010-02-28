From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26799] New: (EE) AIGLX error: dlopen of
 /usr/lib/dri/nouveau_dri.so failed
Date: Sun, 28 Feb 2010 10:49:20 -0800 (PST)
Message-ID: <bug-26799-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26799

           Summary: (EE) AIGLX error: dlopen of /usr/lib/dri/nouveau_dri.so
                    failed
           Product: xorg
           Version: unspecified
          Platform: Other
               URL: https://bugs.edge.launchpad.net/ubuntu/+source/xserver-
                    xorg-video-nouveau/+bug/529590
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: caravena-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=33646)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=33646)
EE_AIGLX_nouveau-dri.so_failed-DriverNouveau_Xorg.0.log

Open bug in Laundhpad.net:
https://bugs.edge.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/529590


Not load AIGLX:

(EE) AIGLX error: dlopen of /usr/lib/dri/nouveau_dri.so failed
(/usr/lib/dri/nouveau_dri.so: cannot open shared object file: No such file or
directory)
(EE) AIGLX: reverting to software rendering


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
