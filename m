From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 45454] New: Compilation failure: nouveau_dri.so.tmp:
 undefined reference to `st_gl_api_create'
Date: Tue, 31 Jan 2012 18:34:31 +0000
Message-ID: <bug-45454-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=45454

             Bug #: 45454
           Summary: Compilation failure: nouveau_dri.so.tmp: undefined
                    reference to `st_gl_api_create'
    Classification: Unclassified
           Product: Mesa
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: jojo170387-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


Mesa compilation fails if configured with:

./configure --with-dri-drivers=,swrast,nouveau
--with-gallium-drivers=,swrast,nouveau

Error message:

/bin/sh ../../../../bin/mklib -o nouveau_dri.so.tmp -noprefix -linker 'g++'
-ldflags ' -L/usr/lib64/llvm  -lpthread -lffi -ldl -lm ' \
        target.o ../../../../src/mesa/drivers/dri/common/utils.o
../../../../src/mesa/drivers/dri/common/dri_util.o
../../../../src/mesa/drivers/dri/common/xmlconfig.o  
../../../../src/gallium/state_trackers/dri/drm/libdridrm.a
../../../../src/gallium/winsys/nouveau/drm/libnouveaudrm.a
../../../../src/gallium/drivers/trace/libtrace.a
../../../../src/gallium/drivers/rbug/librbug.a
../../../../src/gallium/drivers/nvfx/libnvfx.a
../../../../src/gallium/drivers/nv50/libnv50.a
../../../../src/gallium/drivers/nvc0/libnvc0.a
../../../../src/gallium/drivers/nouveau/libnouveau.a \
                -Wl,--start-group ../../../../src/mesa/libmesagallium.a
../../../../src/gallium/auxiliary/libgallium.a -Wl,--end-group \
                  -L../../../../lib -Wl,-R/usr/local/lib/dri -ldricore -lglsl 
-ldrm   -lexpat -lm -lpthread -ldl -ldrm_nouveau   -lLLVMBitWriter
-lLLVMX86Disassembler -lLLVMX86AsmParser -lLLVMX86CodeGen -lLLVMX86Desc
-lLLVMSelectionDAG -lLLVMAsmPrinter -lLLVMMCParser -lLLVMX86AsmPrinter
-lLLVMX86Utils -lLLVMX86Info -lLLVMJIT -lLLVMExecutionEngine -lLLVMCodeGen
-lLLVMScalarOpts -lLLVMInstCombine -lLLVMTransformUtils -lLLVMipa
-lLLVMAnalysis -lLLVMTarget -lLLVMMC -lLLVMCore -lLLVMSupport
mklib: Making Linux shared library:  nouveau_dri.so.tmp
g++ -g -O2 -Wall -std=c99 -Werror=implicit-function-declaration
-Werror=missing-prototypes -fno-strict-aliasing -fno-builtin-memcmp -g -O2 
-fPIC  -DUSE_X86_64_ASM -D_GNU_SOURCE -DPTHREADS -DHAVE_POSIX_MEMALIGN
-DUSE_XCB -DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING
-DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DHAVE_ALIAS -DHAVE_MINCORE
-DHAVE_LIBUDEV -DHAVE_XCB_DRI2 -D__STDC_CONSTANT_MACROS -DHAVE_LLVM=0x0300
-fvisibility=hidden -o nouveau_dri.so.test
../../../../src/mesa/drivers/dri/common/dri_test.o nouveau_dri.so.tmp 
-L../../../../lib -Wl,-R/usr/local/lib/dri -ldricore -lglsl  -ldrm   -lexpat
-lm -lpthread -ldl -ldrm_nouveau    -L/usr/lib64/llvm  -lpthread -lffi -ldl -lm
;
nouveau_dri.so.tmp: undefined reference to `st_gl_api_create'

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
