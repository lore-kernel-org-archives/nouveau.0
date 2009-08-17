From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23382] New: Nouveau DRM module out-of-tree compile
	errors
Date: Mon, 17 Aug 2009 16:07:01 -0700 (PDT)
Message-ID: <bug-23382-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23382

           Summary: Nouveau DRM module out-of-tree compile errors
           Product: xorg
           Version: git
          Platform: All
        OS/Version: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: high
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: tavianator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=28717)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=28717)
Patch to fix drm_encoder_slave.h includes.

When doing an out-of-tree compile on the nouveau kernel module, recent GIT
versions fail to compile without patching for a couple reasons.  The first can
be fixed with the attached patch.

The second has to do with the fact that drivers/gpu/drm/nouveau/nouveau_drv.h
declares the prototype for nouveau_encoder_connector_get, which relies on the
type `struct nouveau_encoder*', defined in
drivers/gpu/drm/nouveau/nouveau_encoder.h.  However, nouveau_encoder.h needs
nouveau_drv.h for the type `struct nv04_output_reg'.  This circular dependency
causes compilation of nouveau_drv.c to fail.

Also, any reason the include guard for nouveau_encoder.h is called
__NOUVEAU_OUTPUT_H__?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
