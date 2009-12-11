From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25589] New: compiling nouveau kernel without AGP=y
	fails
Date: Fri, 11 Dec 2009 07:59:12 -0800 (PST)
Message-ID: <bug-25589-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25589

           Summary: compiling nouveau kernel without AGP=y fails
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: xake-ca8b1Tj3MiseIZ0/mPfg9Q@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Check out a nouveau kernel tree.
make allnoconfig
make *config and enable only the necessary things to enable DRM_NOUVEAU
make all

This will fail with:
  CC      drivers/gpu/drm/nouveau/nouveau_bo.o
drivers/gpu/drm/nouveau/nouveau_bo.c: In function
'nouveau_bo_create_ttm_backend_entry':
drivers/gpu/drm/nouveau/nouveau_bo.c:315: error: implicit declaration of
function 'ttm_agp_backend_init'
drivers/gpu/drm/nouveau/nouveau_bo.c:315: warning: return makes pointer from
integer without a cast
make[4]: *** [drivers/gpu/drm/nouveau/nouveau_bo.o] Error 1


To make ttm_agp_backend_init avaible and nouveau to actually compile you have
to enable AGP in the kernel also.

Should AGP be a reuirment or should the module just not try to use
ttm_agp_backend_init if AGP is unset?

I have currently no idea which role AGP plays in todays modern PCI-E computers
(or old PCI card) if any at all?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
