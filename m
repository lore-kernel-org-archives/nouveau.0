From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76376] New: mesa does not build after nouveau loader
	changes
Date: Thu, 20 Mar 2014 02:18:28 +0000
Message-ID: <bug-76376-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1728304591=="
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


--===============1728304591==
Content-Type: multipart/alternative; boundary="1395281908.AFebe0.8070"; charset="us-ascii"


--1395281908.AFebe0.8070
Date: Thu, 20 Mar 2014 02:18:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76376

          Priority: medium
            Bug ID: 76376
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: mesa does not build after nouveau loader changes
          Severity: normal
    Classification: Unclassified
                OS: OpenBSD
          Reporter: jsg-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

After commit 51989817e6767d8ef469708c69d7ce38b87e9b6e mesa does not build here
when configured with

--with-gallium-drivers=r300,r600,swrast \
--with-dri-drivers=i915,i965,r200,radeon,swrast \

libtool: compile:  gcc -DPACKAGE_NAME=\"Mesa\" -DPACKAGE_TARNAME=\"mesa\"
-DPACKAGE_VERSION=\"10.2.0-devel\" "-DPACKAGE_STRING=\"Mesa 10.2.0-devel\""
"-DPACKAGE_BUGREPORT=\"https://bugs.freedesktop.org/enter_bug.cgi?product=Mesa\""
-DPACKAGE_URL=\"\" -DPACKAGE=\"mesa\" -DVERSION=\"10.2.0-devel\"
-DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1
-DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1
-DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_DLFCN_H=1 -DLT_OBJDIR=\".libs/\"
-DYYTEXT_POINTER=1 -DHAVE_CLOCK_GETTIME=1 -DHAVE_PTHREAD_PRIO_INHERIT=1
-DHAVE_PTHREAD=1 -I. -DDEBUG -DUSE_X86_64_ASM -DHAVE_DLOPEN
-DHAVE_POSIX_MEMALIGN -DHAVE_LIBDRM -DGLX_INDIRECT_RENDERING
-DGLX_DIRECT_RENDERING -DHAVE_PTHREAD -DUSE_EXTERNAL_DXTN_LIB=1 -DHAVE_ALIAS
-DHAVE_MINCORE -I../../include -fvisibility=hidden -I/usr/X11R6/include
-I/usr/include/dev/pci/drm -I/usr/local/include -I/usr/local/include/libelf -g
-O2 -Wall -std=c99 -Werror=implicit-function-declaration
-Werror=missing-prototypes -fno-strict-aliasing -fno-builtin-memcmp -g -O0 -MT
libloader_la-pci_id_driver_map.lo -MD -MP -MF
.deps/libloader_la-pci_id_driver_map.Tpo -c pci_id_driver_map.c  -fPIC -DPIC -o
.libs/libloader_la-pci_id_driver_map.o
pci_id_driver_map.c:29:25: error: nouveau_drm.h: No such file or directory
pci_id_driver_map.c: In function 'nouveau_chipset':
pci_id_driver_map.c:34: error: variable 'gp' has initializer but incomplete
type
pci_id_driver_map.c:34: error: 'NOUVEAU_GETPARAM_CHIPSET_ID' undeclared (first
use in this function)
pci_id_driver_map.c:34: error: (Each undeclared identifier is reported only
once
pci_id_driver_map.c:34: error: for each function it appears in.)
pci_id_driver_map.c:34: warning: excess elements in struct initializer
pci_id_driver_map.c:34: warning: (near initialization for 'gp')
pci_id_driver_map.c:34: warning: excess elements in struct initializer
pci_id_driver_map.c:34: warning: (near initialization for 'gp')
pci_id_driver_map.c:34: error: storage size of 'gp' isn't known
pci_id_driver_map.c:37: error: 'DRM_NOUVEAU_GETPARAM' undeclared (first use in
this function)
pci_id_driver_map.c:34: warning: unused variable 'gp'
pci_id_driver_map.c:42: warning: control reaches end of non-void function
Makefile:512: recipe for target 'libloader_la-pci_id_driver_map.lo' failed

nouveau headers should not be included unless nouveau is being built.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395281908.AFebe0.8070
Date: Thu, 20 Mar 2014 02:18:28 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - mesa does not build after nouveau loader changes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76376">76376</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>mesa does not build after nouveau loader changes
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>OpenBSD
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>jsg&#64;openbsd.org
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>After commit 51989817e6767d8ef469708c69d7ce38b87e9b6e mesa does not build here
when configured with

--with-gallium-drivers=r300,r600,swrast \
--with-dri-drivers=i915,i965,r200,radeon,swrast \

libtool: compile:  gcc -DPACKAGE_NAME=\&quot;Mesa\&quot; -DPACKAGE_TARNAME=\&quot;mesa\&quot;
-DPACKAGE_VERSION=\&quot;10.2.0-devel\&quot; &quot;-DPACKAGE_STRING=\&quot;Mesa 10.2.0-devel\&quot;&quot;
&quot;-DPACKAGE_BUGREPORT=\&quot;<a href="https://bugs.freedesktop.org/enter_bug.cgi?product=Mesa">https://bugs.freedesktop.org/enter_bug.cgi?product=Mesa</a>\&quot;&quot;
-DPACKAGE_URL=\&quot;\&quot; -DPACKAGE=\&quot;mesa\&quot; -DVERSION=\&quot;10.2.0-devel\&quot;
-DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1
-DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1
-DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_DLFCN_H=1 -DLT_OBJDIR=\&quot;.libs/\&quot;
-DYYTEXT_POINTER=1 -DHAVE_CLOCK_GETTIME=1 -DHAVE_PTHREAD_PRIO_INHERIT=1
-DHAVE_PTHREAD=1 -I. -DDEBUG -DUSE_X86_64_ASM -DHAVE_DLOPEN
-DHAVE_POSIX_MEMALIGN -DHAVE_LIBDRM -DGLX_INDIRECT_RENDERING
-DGLX_DIRECT_RENDERING -DHAVE_PTHREAD -DUSE_EXTERNAL_DXTN_LIB=1 -DHAVE_ALIAS
-DHAVE_MINCORE -I../../include -fvisibility=hidden -I/usr/X11R6/include
-I/usr/include/dev/pci/drm -I/usr/local/include -I/usr/local/include/libelf -g
-O2 -Wall -std=c99 -Werror=implicit-function-declaration
-Werror=missing-prototypes -fno-strict-aliasing -fno-builtin-memcmp -g -O0 -MT
libloader_la-pci_id_driver_map.lo -MD -MP -MF
.deps/libloader_la-pci_id_driver_map.Tpo -c pci_id_driver_map.c  -fPIC -DPIC -o
.libs/libloader_la-pci_id_driver_map.o
pci_id_driver_map.c:29:25: error: nouveau_drm.h: No such file or directory
pci_id_driver_map.c: In function 'nouveau_chipset':
pci_id_driver_map.c:34: error: variable 'gp' has initializer but incomplete
type
pci_id_driver_map.c:34: error: 'NOUVEAU_GETPARAM_CHIPSET_ID' undeclared (first
use in this function)
pci_id_driver_map.c:34: error: (Each undeclared identifier is reported only
once
pci_id_driver_map.c:34: error: for each function it appears in.)
pci_id_driver_map.c:34: warning: excess elements in struct initializer
pci_id_driver_map.c:34: warning: (near initialization for 'gp')
pci_id_driver_map.c:34: warning: excess elements in struct initializer
pci_id_driver_map.c:34: warning: (near initialization for 'gp')
pci_id_driver_map.c:34: error: storage size of 'gp' isn't known
pci_id_driver_map.c:37: error: 'DRM_NOUVEAU_GETPARAM' undeclared (first use in
this function)
pci_id_driver_map.c:34: warning: unused variable 'gp'
pci_id_driver_map.c:42: warning: control reaches end of non-void function
Makefile:512: recipe for target 'libloader_la-pci_id_driver_map.lo' failed

nouveau headers should not be included unless nouveau is being built.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395281908.AFebe0.8070--

--===============1728304591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1728304591==--
