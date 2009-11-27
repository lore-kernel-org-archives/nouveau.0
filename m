From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25319] New: KSnapshot in allocation mode crashes X
Date: Fri, 27 Nov 2009 10:56:58 -0800 (PST)
Message-ID: <bug-25319-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25319

           Summary: KSnapshot in allocation mode crashes X
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: cpp.fou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


KSnapshot (from KDE 4.3.3) crashes X, when trying to allocate screen area (to
make snapshot of this area). The system freezes for 2-3 seconds, and then X
restarts.  

Steps to Reproduce: 
1) open KSnapShot, choose 'Screen Area' (I've got "Screen area" and latency for
2 s.)
2) Press "Make SnapShot"(i've got non-english locale, so some names may differ,
but it is not important)
3) When KSnapshot switches to  allocation mode, try to allocate  an area - 
short freeze and then blackscreen for 1-2 seconds, then  KDE login screen(X's
pid changes).

nvidia proprietary driver works fine, problems when using nouveau(Fedora 12).

Installed Packages
Name       : xorg-x11-drv-nouveau
Arch       : i686
Epoch      : 1
Version    : 0.0.15
Release    : 17.20091105gite1c2efd.fc12

Name       : xorg-x11-server-Xorg
Arch       : i686
Version    : 1.7.1
Release    : 7.fc12


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
