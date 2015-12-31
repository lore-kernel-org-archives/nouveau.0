From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93547] New: Built failed for "Mesa (master):
 nouveau: remove use of deprecated nouveau_device:: drm_version"
Date: Thu, 31 Dec 2015 10:54:18 +0000
Message-ID: <bug-93547-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1804353460=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1804353460==
Content-Type: multipart/alternative; boundary="1451559258.c8D02EfA0.32648"; charset="UTF-8"


--1451559258.c8D02EfA0.32648
Date: Thu, 31 Dec 2015 10:54:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93547

            Bug ID: 93547
           Summary: Built failed for "Mesa (master): nouveau: remove use
                    of deprecated nouveau_device:: drm_version"
           Product: Mesa
           Version: git
          Hardware: x86 (IA32)
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: davidtecher-Qt13gs6zZMY@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

I was trying to rebuilt Mesa from Git (31-Dec-2015).

There were two errors.

1. The following file 

#include "...nouveau.h"

was missing in both

- src/gallium/drivers/nouveau/nouveau_screen.c

- src/mesa/drivers/dri/nouveau/nouveau_screen.c

Compiler complained that 'nouveau_drm_new', 'nouveau_device_new',
'nouveau_destroy_screen' were functions implicitly declared

So I had (Sorry I am not a programer :( )

#include "/usr/include/libdrm/nouveau/nouveau.h"

To fix the problem. And it was OK.

2. The second issue is for the commit provided on 22-Dec-2015

/bin/bash ../../../../libtool  --tag=CC   --mode=compile gcc
-DPACKAGE_NAME=\"Mesa\" -DPACKAGE_TARNAME=\"mesa\"
-DPACKAGE_VERSION=\"11.2.0-devel\" -DPACKAGE_STRING=\"Mesa\ 11.2.0-devel\"
-DPACKAGE_BUGREPORT=\"https://bugs.freedesktop.org/enter_bug.cgi\?product=Mesa\"
-DPA
KAGE_URL=\"\" -DPACKAGE=\"mesa\" -DVERSION=\"11.2.0-devel\"
-D_FILE_OFFSET_BITS=64 -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1
-DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1
-DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -D
AVE_DLFCN_H=1 -DLT_OBJDIR=\".libs/\" -DYYTEXT_POINTER=1
-DHAVE___BUILTIN_BSWAP32=1 -DHAVE___BUILTIN_BSWAP64=1 -DHAVE___BUILTIN_CLZ=1
-DHAVE___BUILTIN_CLZLL=1 -DHAVE___BUILTIN_CTZ=1 -DHAVE___BUILTIN_EXPECT=1
-DHAVE___BUILTIN_FFS=1 -DHAVE___BUILTIN_FFSLL=1 -DHAVE___BUILTIN_
OPCOUNT=1 -DHAVE___BUILTIN_POPCOUNTLL=1 -DHAVE___BUILTIN_UNREACHABLE=1
-DHAVE_FUNC_ATTRIBUTE_CONST=1 -DHAVE_FUNC_ATTRIBUTE_FLATTEN=1
-DHAVE_FUNC_ATTRIBUTE_FORMAT=1 -DHAVE_FUNC_ATTRIBUTE_MALLOC=1
-DHAVE_FUNC_ATTRIBUTE_PACKED=1 -DHAVE_FUNC_ATTRIBUTE_PURE=1 -DHAVE_FUNC_ATTRI
UTE_UNUSED=1 -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT=1 -DHAVE_DLADDR=1
-DHAVE_CLOCK_GETTIME=1 -DHAVE_PTHREAD=1 -DHAVE_SHA1_IN_LIBNETTLE=1 -I. 
-I./include -I../../../../src -I../../../../include
-I../../../../src/gallium/include -I../../../../src/gallium/auxiliary -I../.
/../../src/gallium/drivers -I../../../../src/gallium/winsys
-D__STDC_LIMIT_MACROS -D_GNU_SOURCE -DUSE_SSE41 -DDEBUG -DTEXTURE_FLOAT_ENABLED
-DUSE_X86_ASM -DUSE_MMX_ASM -DUSE_3DNOW_ASM -DUSE_SSE_ASM -DHAVE_XLOCALE_H
-DHAVE_SYS_SYSCTL_H -DHAVE_STRTOF -DHAVE_MKOSTEMP -DHAVE_
LOPEN -DHAVE_POSIX_MEMALIGN -DHAVE_LIBDRM -DHAVE_SHA1 -DGLX_USE_DRM
-DHAVE_LIBUDEV -DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_TLS
-DHAVE_ALIAS -DHAVE_DRI3 -DHAVE_MINCORE -DHAVE_LLVM=0x0308
-DMESA_LLVM_VERSION_PATCH=0 -fvisibility=hidden -I/usr/include/libdr
  -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/libdrm   
-Og -ggdb -g -gdwarf-2 -gstrict-dwarf -Wall -std=c99
-Werror=implicit-function-declaration -Werror=missing-prototypes
-fno-strict-aliasing -fno-math-errno -fno-trapping-math -fno-builtin-memcmp
 -MT nv50/nv50_push.lo -MD -MP -MF $depbase.Tpo -c -o nv50/nv50_push.lo
nv50/nv50_push.c &&\
mv -f $depbase.Tpo $depbase.Plo
nv50/nv50_miptree.c: In function 'nv50_miptree_create':
nv50/nv50_miptree.c:342:25: error: dereferencing pointer to incomplete type
    bool compressed = drm->version >= 0x01000101;
                         ^
Makefile:1251: recipe for target 'nv50/nv50_miptree.lo' failed
make[3]: *** [nv50/nv50_miptree.lo] Error 1

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1451559258.c8D02EfA0.32648
Date: Thu, 31 Dec 2015 10:54:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Built failed for &quot;Mesa (master): nouveau: remove use of deprecated nouveau_device:: drm_version&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93547">93547</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Built failed for &quot;Mesa (master): nouveau: remove use of deprecated nouveau_device:: drm_version&quot;
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>davidtecher&#64;yahoo.fr
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I was trying to rebuilt Mesa from Git (31-Dec-2015).

There were two errors.

1. The following file 

#include &quot;...nouveau.h&quot;

was missing in both

- src/gallium/drivers/nouveau/nouveau_screen.c

- src/mesa/drivers/dri/nouveau/nouveau_screen.c

Compiler complained that 'nouveau_drm_new', 'nouveau_device_new',
'nouveau_destroy_screen' were functions implicitly declared

So I had (Sorry I am not a programer :( )

#include &quot;/usr/include/libdrm/nouveau/nouveau.h&quot;

To fix the problem. And it was OK.

2. The second issue is for the commit provided on 22-Dec-2015

/bin/bash ../../../../libtool  --tag=CC   --mode=compile gcc
-DPACKAGE_NAME=\&quot;Mesa\&quot; -DPACKAGE_TARNAME=\&quot;mesa\&quot;
-DPACKAGE_VERSION=\&quot;11.2.0-devel\&quot; -DPACKAGE_STRING=\&quot;Mesa\ 11.2.0-devel\&quot;
-DPACKAGE_BUGREPORT=\&quot;<a href="https://bugs.freedesktop.org/enter_bug.cgi\?product=Mesa">https://bugs.freedesktop.org/enter_bug.cgi\?product=Mesa</a>\&quot;
-DPA
KAGE_URL=\&quot;\&quot; -DPACKAGE=\&quot;mesa\&quot; -DVERSION=\&quot;11.2.0-devel\&quot;
-D_FILE_OFFSET_BITS=64 -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1
-DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1
-DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -D
AVE_DLFCN_H=1 -DLT_OBJDIR=\&quot;.libs/\&quot; -DYYTEXT_POINTER=1
-DHAVE___BUILTIN_BSWAP32=1 -DHAVE___BUILTIN_BSWAP64=1 -DHAVE___BUILTIN_CLZ=1
-DHAVE___BUILTIN_CLZLL=1 -DHAVE___BUILTIN_CTZ=1 -DHAVE___BUILTIN_EXPECT=1
-DHAVE___BUILTIN_FFS=1 -DHAVE___BUILTIN_FFSLL=1 -DHAVE___BUILTIN_
OPCOUNT=1 -DHAVE___BUILTIN_POPCOUNTLL=1 -DHAVE___BUILTIN_UNREACHABLE=1
-DHAVE_FUNC_ATTRIBUTE_CONST=1 -DHAVE_FUNC_ATTRIBUTE_FLATTEN=1
-DHAVE_FUNC_ATTRIBUTE_FORMAT=1 -DHAVE_FUNC_ATTRIBUTE_MALLOC=1
-DHAVE_FUNC_ATTRIBUTE_PACKED=1 -DHAVE_FUNC_ATTRIBUTE_PURE=1 -DHAVE_FUNC_ATTRI
UTE_UNUSED=1 -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT=1 -DHAVE_DLADDR=1
-DHAVE_CLOCK_GETTIME=1 -DHAVE_PTHREAD=1 -DHAVE_SHA1_IN_LIBNETTLE=1 -I. 
-I./include -I../../../../src -I../../../../include
-I../../../../src/gallium/include -I../../../../src/gallium/auxiliary -I../.
/../../src/gallium/drivers -I../../../../src/gallium/winsys
-D__STDC_LIMIT_MACROS -D_GNU_SOURCE -DUSE_SSE41 -DDEBUG -DTEXTURE_FLOAT_ENABLED
-DUSE_X86_ASM -DUSE_MMX_ASM -DUSE_3DNOW_ASM -DUSE_SSE_ASM -DHAVE_XLOCALE_H
-DHAVE_SYS_SYSCTL_H -DHAVE_STRTOF -DHAVE_MKOSTEMP -DHAVE_
LOPEN -DHAVE_POSIX_MEMALIGN -DHAVE_LIBDRM -DHAVE_SHA1 -DGLX_USE_DRM
-DHAVE_LIBUDEV -DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_TLS
-DHAVE_ALIAS -DHAVE_DRI3 -DHAVE_MINCORE -DHAVE_LLVM=0x0308
-DMESA_LLVM_VERSION_PATCH=0 -fvisibility=hidden -I/usr/include/libdr
  -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/libdrm   
-Og -ggdb -g -gdwarf-2 -gstrict-dwarf -Wall -std=c99
-Werror=implicit-function-declaration -Werror=missing-prototypes
-fno-strict-aliasing -fno-math-errno -fno-trapping-math -fno-builtin-memcmp
 -MT nv50/nv50_push.lo -MD -MP -MF $depbase.Tpo -c -o nv50/nv50_push.lo
nv50/nv50_push.c &amp;&amp;\
mv -f $depbase.Tpo $depbase.Plo
nv50/nv50_miptree.c: In function 'nv50_miptree_create':
nv50/nv50_miptree.c:342:25: error: dereferencing pointer to incomplete type
    bool compressed = drm-&gt;version &gt;= 0x01000101;
                         ^
Makefile:1251: recipe for target 'nv50/nv50_miptree.lo' failed
make[3]: *** [nv50/nv50_miptree.lo] Error 1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1451559258.c8D02EfA0.32648--

--===============1804353460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1804353460==--
