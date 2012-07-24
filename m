From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 52449] New: nouveau_vbo_t.c compilation broken due
 to implicit declaration
Date: Tue, 24 Jul 2012 23:20:55 +0000
Message-ID: <bug-52449-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=52449

             Bug #: 52449
           Summary: nouveau_vbo_t.c compilation broken due to implicit
                    declaration
    Classification: Unclassified
           Product: Mesa
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: joe.konno-VuQAYsv1563Yd54FQh9/CA@public.gmane.org


Looks like the glformats.c work has resulted in a broken build. This is what I
get when building 7e18a039ee7a402bac4882ae793824d6523061fa:

libtool: compile:  gcc -DPACKAGE_NAME=\"Mesa\" -DPACKAGE_TARNAME=\"mesa\"
-DPACKAGE_VERSION=\"8.1.0\" "-DPACKAGE_STRING=\"Mesa 8.1.0\""
"-DPACKAGE_BUGREPORT=\"https://bugs.freedesktop.org/enter_bug.cgi?product=Mesa\""
-DPACKAGE_URL=\"\" -DPACKAGE=\"mesa\" -DVERSION=\"8.1.0\" -DSTDC_HEADERS=1
-DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1
-DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1
-DHAVE_UNISTD_H=1 -DHAVE_DLFCN_H=1 -DLT_OBJDIR=\".libs/\" -DYYTEXT_POINTER=1
-DHAVE_LIBEXPAT=1 -DHAVE_LIBXCB_DRI2=1 -I. -I../../../../../include
-I../../../../../src/ -I../../../../../src/mapi -I../../../../../src/mesa/
-I../../../../../src/mesa/drivers/dri/common -D_GNU_SOURCE -DPTHREADS
-DUSE_X86_64_ASM -DHAVE_POSIX_MEMALIGN -DIN_DRI_DRIVER -DUSE_XCB
-DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DUSE_EXTERNAL_DXTN_LIB=1
-DIN_DRI_DRIVER -DHAVE_ALIAS -DHAVE_MINCORE -DHAVE_LIBUDEV -DHAVE_LLVM=0x0209
-DFEATURE_GL=1 -DFEATURE_ES2=1 -I/home/joe/wayland/install/include
-I/home/joe/wayland/install/include/libdrm
-I/home/joe/wayland/install/include/nouveau -g -O2 -Wall -std=c99
-Werror=implicit-function-declaration -Werror=missing-prototypes
-fno-strict-aliasing -fno-builtin-memcmp -g -O2 -MT nv10_state_fb.lo -MD -MP
-MF .deps/nv10_state_fb.Tpo -c nv10_state_fb.c  -fPIC -DPIC -o
.libs/nv10_state_fb.o
In file included from nv10_render.c:199:0:
nouveau_vbo_t.c: In function 'get_array_stride':
nouveau_vbo_t.c:48:3: error: implicit declaration of function
'_mesa_sizeof_type' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
make[6]: *** [nv10_render.lo] Error 1

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
