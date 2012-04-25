From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49148] New: nv20_state_fb.c:50: get_rt_format:
 Assertion `0' failed.
Date: Wed, 25 Apr 2012 16:40:51 +0000
Message-ID: <bug-49148-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=49148

             Bug #: 49148
           Summary: nv20_state_fb.c:50: get_rt_format: Assertion `0'
                    failed.
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: johndoe99-HPQIj1OAFZMvJsYlp49lxw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Lubuntu 11.10

0.0 VGA compatible controller: nVidia Corporation NV25 [GeForce4 Ti 4400] (rev
a3)
X.Org version: 1.11.2.902
  dimensions:    1024x768 pixels (270x203 millimeters)
  depth of root window:    24 planes
direct rendering: Yes
server glx vendor string: SGI
server glx version string: 1.4
--
OpenGL vendor string: Nouveau
OpenGL renderer string: Mesa DRI nv25 x86/MMX/SSE2
OpenGL version string: 1.2 Mesa 8.0.2
Linux 3.1.3-030103-generic
xserver-xorg-video-nouveau
1:0.0.16+git20120328.ab7291d3-0ubuntu0sarvatt~oneiric

Start of some 3D applications. Example 

SweetHome3D-3.3$ ./SweetHome3D
JAVA 3D: OpenGL 1.2 detected; will run with reduced functionality
JAVA 3D: OpenGL 1.2 detected; will run with reduced functionality
java: nv20_state_fb.c:50: get_rt_format: Assertion `0' failed.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
