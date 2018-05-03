From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106391] New: Noveau fails to compile when using
 meson and LLVM without RTTI
Date: Thu, 03 May 2018 20:08:13 +0000
Message-ID: <bug-106391-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1061914667=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1061914667==
Content-Type: multipart/alternative; boundary="15253780930.dc8C.9171"
Content-Transfer-Encoding: 7bit


--15253780930.dc8C.9171
Date: Thu, 3 May 2018 20:08:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106391

            Bug ID: 106391
           Summary: Noveau fails to compile when using meson and LLVM
                    without RTTI
           Product: Mesa
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: cogitri-k5O9xmZG+kVAfugRpC6u6w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

When building mesa without RTTI support nouveau fails to compile because ND=
BUG
isn't defined by meson. src/gallium/drivers/nouveau/codegen/nv50_ir.cpp has=
 the
following snippet in it:

#ifndef NDEBUG // non-conformant assert, so this is required
  assert(typeid(*i) =3D=3D typeid(*this));
#endif

which results in:

[1581/1667] x86_64-pc-linux-gnu-c++
-Isrc/gallium/drivers/nouveau/src@gallium@drivers@nouveau@@nouveau@sta
-Isrc/gallium/drivers/nouveau -I../mesa-18.0.2/src/gallium/drivers/nouveau
-Isrc -I../mesa-18.0.2/src -Iinclude -I../mesa-18.0.2/include
-I../mesa-18.0.2/src/gallium/include -Isrc/gallium/auxiliary
-I../mesa-18.0.2/src/gallium/auxiliary
-I/usr/x86_64-pc-linux-gnu/include/libdrm
-I/usr/x86_64-pc-linux-gnu/include/libdrm/nouveau -fdiagnostics-color=3Dalw=
ays
-pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wnon-virtual-dtor -std=
=3Dc++11
-O2 -g -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
'-DVERSION=3D"18.0.2"' -DPACKAGE_VERSION=3DVERSION
'-DPACKAGE_BUGREPORT=3D"https://bugs.freedesktop.org/enter_bug.cgi?product=
=3DMesa"'
-DTEXTURE_FLOAT_ENABLED -DGLX_USE_TLS -DHAVE_X11_PLATFORM
-DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM
-DHAVE_DRM_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DENABLE_SHADER_CACHE
-DHAVE___BUILTIN_BSWAP32 -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ
-DHAVE___BUILTIN_CLZLL -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT
-DHAVE___BUILTIN_FFS -DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT
-DHAVE___BUILTIN_POPCOUNTLL -DHAVE___BUILTIN_UNREACHABLE
-DHAVE_FUNC_ATTRIBUTE_CONST -DHAVE_FUNC_ATTRIBUTE_FLATTEN
-DHAVE_FUNC_ATTRIBUTE_MALLOC -DHAVE_FUNC_ATTRIBUTE_PURE
-DHAVE_FUNC_ATTRIBUTE_UNUSED -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT
-DHAVE_FUNC_ATTRIBUTE_WEAK -DHAVE_FUNC_ATTRIBUTE_FORMAT
-DHAVE_FUNC_ATTRIBUTE_PACKED -DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL
-DHAVE_FUNC_ATTRIBUTE_VISIBILITY -DHAVE_FUNC_ATTRIBUTE_ALIAS
-DHAVE_FUNC_ATTRIBUTE_NORETURN -D_GNU_SOURCE -DUSE_SSE41
-DUSE_GCC_ATOMIC_BUILTINS -DUSE_X86_64_ASM -DMAJOR_IN_SYSMACROS
-DHAVE_SYS_SYSCTL_H -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_STRTOF
-DHAVE_MKOSTEMP -DHAVE_POSIX_MEMALIGN -DHAVE_TIMESPEC_GET -DHAVE_MEMFD_CREA=
TE
-DHAVE_STRTOD_L -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DHAVE_LIBDRM -DHAVE_Z=
LIB
-DHAVE_PTHREAD -DHAVE_LLVM=3D0x0500 -DMESA_LLVM_VERSION_PATCH=3D1
-DHAVE_WAYLAND_PLATFORM -DWL_HIDE_DEPRECATED -DHAVE_DRI3 -Wall -fno-math-er=
rno
-fno-trapping-math -Wno-non-virtual-dtor -fno-rtti -march=3Dnative -O2
-march=3Dnative -O2 -fPIC -fvisibility=3Dhidden  -MD -MQ
'src/gallium/drivers/nouveau/src@gallium@drivers@nouveau@@nouveau@sta/codeg=
en_nv50_ir.cpp.o'
-MF
'src/gallium/drivers/nouveau/src@gallium@drivers@nouveau@@nouveau@sta/codeg=
en_nv50_ir.cpp.o.d'
-o
'src/gallium/drivers/nouveau/src@gallium@drivers@nouveau@@nouveau@sta/codeg=
en_nv50_ir.cpp.o'
-c ../mesa-18.0.2/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp
FAILED:
src/gallium/drivers/nouveau/src@gallium@drivers@nouveau@@nouveau@sta/codege=
n_nv50_ir.cpp.o=20
x86_64-pc-linux-gnu-c++
-Isrc/gallium/drivers/nouveau/src@gallium@drivers@nouveau@@nouveau@sta
-Isrc/gallium/drivers/nouveau -I../mesa-18.0.2/src/gallium/drivers/nouveau
-Isrc -I../mesa-18.0.2/src -Iinclude -I../mesa-18.0.2/include
-I../mesa-18.0.2/src/gallium/include -Isrc/gallium/auxiliary
-I../mesa-18.0.2/src/gallium/auxiliary
-I/usr/x86_64-pc-linux-gnu/include/libdrm
-I/usr/x86_64-pc-linux-gnu/include/libdrm/nouveau -fdiagnostics-color=3Dalw=
ays
-pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wnon-virtual-dtor -std=
=3Dc++11
-O2 -g -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
'-DVERSION=3D"18.0.2"' -DPACKAGE_VERSION=3DVERSION
'-DPACKAGE_BUGREPORT=3D"https://bugs.freedesktop.org/enter_bug.cgi?product=
=3DMesa"'
-DTEXTURE_FLOAT_ENABLED -DGLX_USE_TLS -DHAVE_X11_PLATFORM
-DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM
-DHAVE_DRM_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DENABLE_SHADER_CACHE
-DHAVE___BUILTIN_BSWAP32 -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ
-DHAVE___BUILTIN_CLZLL -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT
-DHAVE___BUILTIN_FFS -DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT
-DHAVE___BUILTIN_POPCOUNTLL -DHAVE___BUILTIN_UNREACHABLE
-DHAVE_FUNC_ATTRIBUTE_CONST -DHAVE_FUNC_ATTRIBUTE_FLATTEN
-DHAVE_FUNC_ATTRIBUTE_MALLOC -DHAVE_FUNC_ATTRIBUTE_PURE
-DHAVE_FUNC_ATTRIBUTE_UNUSED -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT
-DHAVE_FUNC_ATTRIBUTE_WEAK -DHAVE_FUNC_ATTRIBUTE_FORMAT
-DHAVE_FUNC_ATTRIBUTE_PACKED -DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL
-DHAVE_FUNC_ATTRIBUTE_VISIBILITY -DHAVE_FUNC_ATTRIBUTE_ALIAS
-DHAVE_FUNC_ATTRIBUTE_NORETURN -D_GNU_SOURCE -DUSE_SSE41
-DUSE_GCC_ATOMIC_BUILTINS -DUSE_X86_64_ASM -DMAJOR_IN_SYSMACROS
-DHAVE_SYS_SYSCTL_H -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_STRTOF
-DHAVE_MKOSTEMP -DHAVE_POSIX_MEMALIGN -DHAVE_TIMESPEC_GET -DHAVE_MEMFD_CREA=
TE
-DHAVE_STRTOD_L -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DHAVE_LIBDRM -DHAVE_Z=
LIB
-DHAVE_PTHREAD -DHAVE_LLVM=3D0x0500 -DMESA_LLVM_VERSION_PATCH=3D1
-DHAVE_WAYLAND_PLATFORM -DWL_HIDE_DEPRECATED -DHAVE_DRI3 -Wall -fno-math-er=
rno
-fno-trapping-math -Wno-non-virtual-dtor -fno-rtti -march=3Dnative -O2
-march=3Dnative -O2 -fPIC -fvisibility=3Dhidden  -MD -MQ
'src/gallium/drivers/nouveau/src@gallium@drivers@nouveau@@nouveau@sta/codeg=
en_nv50_ir.cpp.o'
-MF
'src/gallium/drivers/nouveau/src@gallium@drivers@nouveau@@nouveau@sta/codeg=
en_nv50_ir.cpp.o.d'
-o
'src/gallium/drivers/nouveau/src@gallium@drivers@nouveau@@nouveau@sta/codeg=
en_nv50_ir.cpp.o'
-c ../mesa-18.0.2/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp
In file included from ../mesa-18.0.2/src/util/bitscan.h:32:0,
                 from ../mesa-18.0.2/src/gallium/auxiliary/util/u_math.h:49,
                 from ../mesa-18.0.2/src/gallium/auxiliary/util/u_box.h:5,
                 from ../mesa-18.0.2/src/gallium/auxiliary/util/u_inlines.h=
:40,
                 from
../mesa-18.0.2/src/gallium/drivers/nouveau/codegen/nv50_ir_util.h:36,
                 from
../mesa-18.0.2/src/gallium/drivers/nouveau/codegen/nv50_ir.h:34,
                 from
../mesa-18.0.2/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp:23:
../mesa-18.0.2/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp: In member
function 'virtual nv50_ir::Instruction*
nv50_ir::Instruction::clone(nv50_ir::ClonePolicy<nv50_ir::Function>&,
nv50_ir::Instruction*) const':
../mesa-18.0.2/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp:740:19: erro=
r:
cannot use typeid with -fno-rtti
    assert(typeid(*i) =3D=3D typeid(*this));
                   ^
../mesa-18.0.2/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp:740:33: erro=
r:
cannot use typeid with -fno-rtti
    assert(typeid(*i) =3D=3D typeid(*this));
                                 ^

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15253780930.dc8C.9171
Date: Thu, 3 May 2018 20:08:13 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Noveau fails to compile when using meson and LLVM without=
 RTTI"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106391">106391</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Noveau fails to compile when using meson and LLVM without RTTI
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
          <td>cogitri&#64;exherbo.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When building mesa without RTTI support nouveau fails to compi=
le because NDBUG
isn't defined by meson. src/gallium/drivers/nouveau/codegen/nv50_ir.cpp has=
 the
following snippet in it:

#ifndef NDEBUG // non-conformant assert, so this is required
  assert(typeid(*i) =3D=3D typeid(*this));
#endif

which results in:

[1581/1667] x86_64-pc-linux-gnu-c++
-Isrc/gallium/drivers/nouveau/src&#64;gallium&#64;drivers&#64;nouveau&#64;&=
#64;nouveau&#64;sta
-Isrc/gallium/drivers/nouveau -I../mesa-18.0.2/src/gallium/drivers/nouveau
-Isrc -I../mesa-18.0.2/src -Iinclude -I../mesa-18.0.2/include
-I../mesa-18.0.2/src/gallium/include -Isrc/gallium/auxiliary
-I../mesa-18.0.2/src/gallium/auxiliary
-I/usr/x86_64-pc-linux-gnu/include/libdrm
-I/usr/x86_64-pc-linux-gnu/include/libdrm/nouveau -fdiagnostics-color=3Dalw=
ays
-pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wnon-virtual-dtor -std=
=3Dc++11
-O2 -g -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
'-DVERSION=3D&quot;18.0.2&quot;' -DPACKAGE_VERSION=3DVERSION
'-DPACKAGE_BUGREPORT=3D&quot;<a href=3D"https://bugs.freedesktop.org/enter_=
bug.cgi?product=3DMesa">https://bugs.freedesktop.org/enter_bug.cgi?product=
=3DMesa</a>&quot;'
-DTEXTURE_FLOAT_ENABLED -DGLX_USE_TLS -DHAVE_X11_PLATFORM
-DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM
-DHAVE_DRM_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DENABLE_SHADER_CACHE
-DHAVE___BUILTIN_BSWAP32 -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ
-DHAVE___BUILTIN_CLZLL -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT
-DHAVE___BUILTIN_FFS -DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT
-DHAVE___BUILTIN_POPCOUNTLL -DHAVE___BUILTIN_UNREACHABLE
-DHAVE_FUNC_ATTRIBUTE_CONST -DHAVE_FUNC_ATTRIBUTE_FLATTEN
-DHAVE_FUNC_ATTRIBUTE_MALLOC -DHAVE_FUNC_ATTRIBUTE_PURE
-DHAVE_FUNC_ATTRIBUTE_UNUSED -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT
-DHAVE_FUNC_ATTRIBUTE_WEAK -DHAVE_FUNC_ATTRIBUTE_FORMAT
-DHAVE_FUNC_ATTRIBUTE_PACKED -DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL
-DHAVE_FUNC_ATTRIBUTE_VISIBILITY -DHAVE_FUNC_ATTRIBUTE_ALIAS
-DHAVE_FUNC_ATTRIBUTE_NORETURN -D_GNU_SOURCE -DUSE_SSE41
-DUSE_GCC_ATOMIC_BUILTINS -DUSE_X86_64_ASM -DMAJOR_IN_SYSMACROS
-DHAVE_SYS_SYSCTL_H -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_STRTOF
-DHAVE_MKOSTEMP -DHAVE_POSIX_MEMALIGN -DHAVE_TIMESPEC_GET -DHAVE_MEMFD_CREA=
TE
-DHAVE_STRTOD_L -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DHAVE_LIBDRM -DHAVE_Z=
LIB
-DHAVE_PTHREAD -DHAVE_LLVM=3D0x0500 -DMESA_LLVM_VERSION_PATCH=3D1
-DHAVE_WAYLAND_PLATFORM -DWL_HIDE_DEPRECATED -DHAVE_DRI3 -Wall -fno-math-er=
rno
-fno-trapping-math -Wno-non-virtual-dtor -fno-rtti -march=3Dnative -O2
-march=3Dnative -O2 -fPIC -fvisibility=3Dhidden  -MD -MQ
'src/gallium/drivers/nouveau/src&#64;gallium&#64;drivers&#64;nouveau&#64;&#=
64;nouveau&#64;sta/codegen_nv50_ir.cpp.o'
-MF
'src/gallium/drivers/nouveau/src&#64;gallium&#64;drivers&#64;nouveau&#64;&#=
64;nouveau&#64;sta/codegen_nv50_ir.cpp.o.d'
-o
'src/gallium/drivers/nouveau/src&#64;gallium&#64;drivers&#64;nouveau&#64;&#=
64;nouveau&#64;sta/codegen_nv50_ir.cpp.o'
-c ../mesa-18.0.2/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp
FAILED:
src/gallium/drivers/nouveau/src&#64;gallium&#64;drivers&#64;nouveau&#64;&#6=
4;nouveau&#64;sta/codegen_nv50_ir.cpp.o=20
x86_64-pc-linux-gnu-c++
-Isrc/gallium/drivers/nouveau/src&#64;gallium&#64;drivers&#64;nouveau&#64;&=
#64;nouveau&#64;sta
-Isrc/gallium/drivers/nouveau -I../mesa-18.0.2/src/gallium/drivers/nouveau
-Isrc -I../mesa-18.0.2/src -Iinclude -I../mesa-18.0.2/include
-I../mesa-18.0.2/src/gallium/include -Isrc/gallium/auxiliary
-I../mesa-18.0.2/src/gallium/auxiliary
-I/usr/x86_64-pc-linux-gnu/include/libdrm
-I/usr/x86_64-pc-linux-gnu/include/libdrm/nouveau -fdiagnostics-color=3Dalw=
ays
-pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wnon-virtual-dtor -std=
=3Dc++11
-O2 -g -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
'-DVERSION=3D&quot;18.0.2&quot;' -DPACKAGE_VERSION=3DVERSION
'-DPACKAGE_BUGREPORT=3D&quot;<a href=3D"https://bugs.freedesktop.org/enter_=
bug.cgi?product=3DMesa">https://bugs.freedesktop.org/enter_bug.cgi?product=
=3DMesa</a>&quot;'
-DTEXTURE_FLOAT_ENABLED -DGLX_USE_TLS -DHAVE_X11_PLATFORM
-DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM
-DHAVE_DRM_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DENABLE_SHADER_CACHE
-DHAVE___BUILTIN_BSWAP32 -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ
-DHAVE___BUILTIN_CLZLL -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT
-DHAVE___BUILTIN_FFS -DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT
-DHAVE___BUILTIN_POPCOUNTLL -DHAVE___BUILTIN_UNREACHABLE
-DHAVE_FUNC_ATTRIBUTE_CONST -DHAVE_FUNC_ATTRIBUTE_FLATTEN
-DHAVE_FUNC_ATTRIBUTE_MALLOC -DHAVE_FUNC_ATTRIBUTE_PURE
-DHAVE_FUNC_ATTRIBUTE_UNUSED -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT
-DHAVE_FUNC_ATTRIBUTE_WEAK -DHAVE_FUNC_ATTRIBUTE_FORMAT
-DHAVE_FUNC_ATTRIBUTE_PACKED -DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL
-DHAVE_FUNC_ATTRIBUTE_VISIBILITY -DHAVE_FUNC_ATTRIBUTE_ALIAS
-DHAVE_FUNC_ATTRIBUTE_NORETURN -D_GNU_SOURCE -DUSE_SSE41
-DUSE_GCC_ATOMIC_BUILTINS -DUSE_X86_64_ASM -DMAJOR_IN_SYSMACROS
-DHAVE_SYS_SYSCTL_H -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_STRTOF
-DHAVE_MKOSTEMP -DHAVE_POSIX_MEMALIGN -DHAVE_TIMESPEC_GET -DHAVE_MEMFD_CREA=
TE
-DHAVE_STRTOD_L -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DHAVE_LIBDRM -DHAVE_Z=
LIB
-DHAVE_PTHREAD -DHAVE_LLVM=3D0x0500 -DMESA_LLVM_VERSION_PATCH=3D1
-DHAVE_WAYLAND_PLATFORM -DWL_HIDE_DEPRECATED -DHAVE_DRI3 -Wall -fno-math-er=
rno
-fno-trapping-math -Wno-non-virtual-dtor -fno-rtti -march=3Dnative -O2
-march=3Dnative -O2 -fPIC -fvisibility=3Dhidden  -MD -MQ
'src/gallium/drivers/nouveau/src&#64;gallium&#64;drivers&#64;nouveau&#64;&#=
64;nouveau&#64;sta/codegen_nv50_ir.cpp.o'
-MF
'src/gallium/drivers/nouveau/src&#64;gallium&#64;drivers&#64;nouveau&#64;&#=
64;nouveau&#64;sta/codegen_nv50_ir.cpp.o.d'
-o
'src/gallium/drivers/nouveau/src&#64;gallium&#64;drivers&#64;nouveau&#64;&#=
64;nouveau&#64;sta/codegen_nv50_ir.cpp.o'
-c ../mesa-18.0.2/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp
In file included from ../mesa-18.0.2/src/util/bitscan.h:32:0,
                 from ../mesa-18.0.2/src/gallium/auxiliary/util/u_math.h:49,
                 from ../mesa-18.0.2/src/gallium/auxiliary/util/u_box.h:5,
                 from ../mesa-18.0.2/src/gallium/auxiliary/util/u_inlines.h=
:40,
                 from
../mesa-18.0.2/src/gallium/drivers/nouveau/codegen/nv50_ir_util.h:36,
                 from
../mesa-18.0.2/src/gallium/drivers/nouveau/codegen/nv50_ir.h:34,
                 from
../mesa-18.0.2/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp:23:
../mesa-18.0.2/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp: In member
function 'virtual nv50_ir::Instruction*
nv50_ir::Instruction::clone(nv50_ir::ClonePolicy&lt;nv50_ir::Function&gt;&a=
mp;,
nv50_ir::Instruction*) const':
../mesa-18.0.2/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp:740:19: erro=
r:
cannot use typeid with -fno-rtti
    assert(typeid(*i) =3D=3D typeid(*this));
                   ^
../mesa-18.0.2/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp:740:33: erro=
r:
cannot use typeid with -fno-rtti
    assert(typeid(*i) =3D=3D typeid(*this));
                                 ^</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15253780930.dc8C.9171--

--===============1061914667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1061914667==--
