From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27603] New: [nouveau] Celestia 1.6.0 crashes with
 nv04_surface_copy_swizzle assertion
Date: Mon, 12 Apr 2010 07:10:44 -0700 (PDT)
Message-ID: <bug-27603-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=27603

           Summary: [nouveau] Celestia 1.6.0 crashes with
                    nv04_surface_copy_swizzle assertion
           Product: Mesa
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: alex.buell-XLQCo7u1tb3e9xe1eoZjHA@public.gmane.org


Hardware: NV34M 64MB on Dell Inspiron 5150 laptop

Software: 

Celestia 1.6.0
Linux 2.6.32 

(w/ the following installed out of tree)
libdrm 2.4.20
nouveau-drm 20100316
xf86-video-nouveau 0.0.15 pre 20100329
xorg-server 1.7.6

glxgears works, therefore novueau and dri2 up and running.

$ celestia 
Initializing ARB vertex programs . . .
Loading ARB vertex program: shaders/diffuse_arb.vp
Loading ARB vertex program: shaders/specular_arb.vp
Loading ARB vertex program: shaders/haze_arb.vp
Loading ARB vertex program: shaders/bumpdiffuse_arb.vp
Loading ARB vertex program: shaders/bumphaze_arb.vp
Loading ARB vertex program: shaders/shadowtex_arb.vp
Loading ARB vertex program: shaders/diffuse_texoff_arb.vp
Loading ARB vertex program: shaders/rings_arb.vp
Loading ARB vertex program: shaders/ringshadow_arb.vp
Loading ARB vertex program: shaders/night_arb.vp
Loading ARB vertex program: shaders/glossmap_arb.vp
Loading ARB vertex program: shaders/diffuse2_arb.vp
Loading ARB vertex program: shaders/haze2_arb.vp
Loading ARB vertex program: shaders/diffuse_texoff2_arb.vp
Loading ARB vertex program: shaders/specular2_arb.vp
Loading ARB vertex program: shaders/night2_arb.vp
Loading ARB vertex program: shaders/star_arb.vp
Loading ARB vertex program: shaders/multishadow_arb.vp
Loading ARB vertex program: shaders/texphong_arb.vp
Loading ARB vertex program: shaders/texphong_alpha_arb.vp
Loading ARB vertex program: shaders/ell_galaxy_arb.vp
All ARB vertex programs loaded successfully.
render path: 8
celestia: nv04_surface_2d.c:170: nv04_surface_copy_swizzle: Assertion
`!(dst->offset & 63)' failed.

Splash screen displayed perfectly then crashed out with this assertion error.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
