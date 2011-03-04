From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35025] New: Serious compiler warnings
Date: Fri,  4 Mar 2011 15:45:50 -0800 (PST)
Message-ID: <bug-35025-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35025

           Summary: Serious compiler warnings
           Product: Mesa
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: johannesobermayr-Mmb7MZpHnFY@public.gmane.org


git20110304.1454

E: Mesa 64bit-portability-issue nouveau_texture.c:400, 489
E: Mesa 64bit-portability-issue nouveau_screen.c:254, 257


nouveau_texture.c: In function 'nouveau_teximage':
nouveau_texture.c:400:2: warning: implicit declaration of function
'_mesa_validate_pbo_teximage'
nouveau_texture.c:400:9: warning: assignment makes pointer from integer without
a cast
nouveau_texture.c:417:3: warning: implicit declaration of function
'_mesa_unmap_teximage_pbo'
nouveau_texture.c: In function 'nouveau_texsubimage':
nouveau_texture.c:489:9: warning: assignment makes pointer from integer without
a cast


nouveau_mm.c: In function 'mm_slab_new':
nouveau_mm.c:147:17: warning: format '%lu' expects type 'long unsigned int',
but argument 2 has type 'uint64_t'
nouveau_screen.c: In function 'nouveau_screen_init':
nouveau_screen.c:254:2: warning: implicit declaration of function
'nouveau_mm_create'
nouveau_screen.c:254:18: warning: assignment makes pointer from integer without
a cast
nouveau_screen.c:257:18: warning: assignment makes pointer from integer without
a cast
nouveau_screen.c: In function 'nouveau_screen_fini':
nouveau_screen.c:266:2: warning: implicit declaration of function
'nouveau_mm_destroy'

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
