From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23817] New: x11-drm build fails - struct agp_memory
 has no member named memory
Date: Wed,  9 Sep 2009 10:39:46 -0700 (PDT)
Message-ID: <bug-23817-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23817

           Summary: x11-drm build fails - struct agp_memory has no member
                    named memory
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: fourstar10_2000-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


emerging x11-drm fails with new kernel....

kernel = linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31


/var/tmp/portage/x11-base/x11-drm-20090320/work/drm/linux-core/drm_vm.c: In
function 'drm_do_vm_fault':
/var/tmp/portage/x11-base/x11-drm-20090320/work/drm/linux-core/drm_vm.c:153:
error: 'struct agp_memory' has no member named 'memory'
/var/tmp/portage/x11-base/x11-drm-20090320/work/drm/linux-core/drm_vm.c:157:
error: 'struct agp_memory' has no member named 'memory'
/var/tmp/portage/x11-base/x11-drm-20090320/work/drm/linux-core/drm_vm.c: In
function 'drm_vm_shm_close':
/var/tmp/portage/x11-base/x11-drm-20090320/work/drm/linux-core/drm_vm.c:252:
warning: enumeration value '_DRM_GEM' not handled in switch
make[2]: ***
[/var/tmp/portage/x11-base/x11-drm-20090320/work/drm/linux-core/drm_vm.o] Error
1
make[2]: *** Waiting for unfinished jobs....
/var/tmp/portage/x11-base/x11-drm-20090320/work/drm/linux-core/drm_memory.c: In
function 'agp_remap':
/var/tmp/portage/x11-base/x11-drm-20090320/work/drm/linux-core/drm_memory.c:286:
error: 'struct agp_memory' has no member named 'memory'
make[2]: ***
[/var/tmp/portage/x11-base/x11-drm-20090320/work/drm/linux-core/drm_memory.o]
Error 1
/var/tmp/portage/x11-base/x11-drm-20090320/work/drm/linux-core/drm_agpsupport.c:
In function 'drm_agp_bind_pages':
/var/tmp/portage/x11-base/x11-drm-20090320/work/drm/linux-core/drm_agpsupport.c:486:
error: 'struct agp_memory' has no member named 'memory'
/var/tmp/portage/x11-base/x11-drm-20090320/work/drm/linux-core/drm_agpsupport.c:
In function 'drm_agp_populate':
/var/tmp/portage/x11-base/x11-drm-20090320/work/drm/linux-core/drm_agpsupport.c:547:
error: 'struct agp_memory' has no member named 'memory'
make[2]: ***
[/var/tmp/portage/x11-base/x11-drm-20090320/work/drm/linux-core/drm_agpsupport.o]
Error 1
make[1]: ***
[_module_/var/tmp/portage/x11-base/x11-drm-20090320/work/drm/linux-core] Error
2
make[1]: Leaving directory
`/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31'
make: *** [modules] Error 2


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
