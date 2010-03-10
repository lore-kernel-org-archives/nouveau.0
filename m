From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26986] New: TNT2 crashed on startup with 2.6.34-rc1
Date: Tue,  9 Mar 2010 18:57:28 -0800 (PST)
Message-ID: <bug-26986-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26986

           Summary: TNT2 crashed on startup with 2.6.34-rc1
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: randrik-JGs/UdohzUI@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Well, i have nouveau_vieux_dri.so in my system.

But thing is ... exactly this setup works with 2.6.32-based nouveau kernel
tree.

Trees used:
mesa: commit e5923a1240d8b32f5af080b0b4191d3b9299a630 (Merge branch '7.8')
drm: commit 04fd3872ee8bd8d5e2c27740508c67c2d51dbc11 (nouveau: Small lighting
related addition to nouveau_class.h.)

kernel (good): commit 4b52473c354f7238afe0c78f50a6c84c40aa3478 ( drm/nv50: add
a memory barrier to pushbuf submission)

kernel (bad): commit 57d54889cd00db2752994b389ba714138652e60c ( Linux
2.6.34-rc1)

xf86-video-nouveau: commit 29647021044463768cbfa3eead1416ef1cf27fa1 ( remove
drm patchlevel check, libdrm checks this for us )

xserver: commit db4f676f25c6d8e58263d5151942be730592d444  ( xselinux: Bump
extension minor version.)

usual logs follow ....


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
