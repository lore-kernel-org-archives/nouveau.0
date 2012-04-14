From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 48701] New: lodbias demo displays garbage on nv43
 with new driver
Date: Sat, 14 Apr 2012 22:06:31 +0000
Message-ID: <bug-48701-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=48701

             Bug #: 48701
           Summary: lodbias demo displays garbage on nv43 with new  driver
    Classification: Unclassified
           Product: Mesa
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: randrik-JGs/UdohzUI@public.gmane.org


I have this software setup:

kernel: commit 965a47fb8ec0a72324aad8b9c0bd1c8b98cc7ca1 (3.4.0-rc2 nouveau,
master branch up to "drm/nouveau/bios: fix regression on some nv4x board")

mesa: commit b2df031a959f36743527b9abc89913ce4f895de3 ("r300/compiler: Fix
nested flow control in r500 vertex shaders")

libdrm: master branch commit 292da616fe1f936ca78a3fa8e1b1b19883e343b6
("nouveau: pull in major libdrm rewrite")

ddx: master up to commit fb3a36b1e5af0f81bb266da894d3442eed8e4e55 ("nve0:
initial exa/xv acceleration for kepler chipsets")

X server - 1.10.4

Hardware:
01:00.0 VGA compatible controller: NVIDIA Corporation NV43 [GeForce 6600 GT]
(rev a2) - AGP version.

With this cobination at least demo program "lodbias" from mesa demos seems
broken. It  displays  mostly random garbage, you can only very briefly see
original image when LOD factor become negative. 

Logs and screenshots will follow

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
