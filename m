From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91756] New: glean test vertProg1 segfaulting X
 server in exaHWCopyNtoN
Date: Tue, 25 Aug 2015 21:26:25 +0000
Message-ID: <bug-91756-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1722536390=="
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


--===============1722536390==
Content-Type: multipart/alternative; boundary="1440537985.EBbEac71.10955"; charset="UTF-8"


--1440537985.EBbEac71.10955
Date: Tue, 25 Aug 2015 21:26:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91756

            Bug ID: 91756
           Summary: glean test vertProg1 segfaulting X server in
                    exaHWCopyNtoN
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: stefan-Xd65/bSt805AfugRpC6u6w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Running piglit tests against mesa-11.0-rc1 package in debian experimental
https://tracker.debian.org/news/707424

i have one test segfaulting the X server consistently.

HW is Ivy Bridge laptop with an additional  GK107 (NVE7) kepler.

Xserver version: 1.17.2 (from debian sid)
mesa: 11.0-rc1 (from debian experimental)
libdrm: 2.4.64
kernel: 4.1.0

Test is ran via:
logging into X locally

then via ssh:
export DISPLAY=:0
xrandr --setprovideroffloadsink nouveau Intel
export DRI_PRIME=1
Verifying with
glxinfo | grep nouveau

# just run the problematic test
bin/glean -t vertProg1

That immediately crashes the X server with a segfault

an attached gdb show following backtrace:
#0  exaHWCopyNtoN (pSrcDrawable=pSrcDrawable@entry=0x55920c1fbb20, 
    pDstDrawable=pDstDrawable@entry=0x55920c262620,
pGC=pGC@entry=0x55920c2627b0, 
    pbox=pbox@entry=0x7ffdc7dee340, nbox=nbox@entry=1, dx=dx@entry=13, dy=31,
reverse=0, 
    upsidedown=0) at ../../exa/exa_accel.c:424
#1  0x00007fb5e5baedcf in exaCopyNtoN
(pSrcDrawable=pSrcDrawable@entry=0x55920c1fbb20, 
    pDstDrawable=0x55920c262620, pGC=0x55920c2627b0,
pbox=pbox@entry=0x7ffdc7dee340, 
    nbox=nbox@entry=1, dx=13, dy=31, reverse=0, upsidedown=0, bitplane=0,
closure=0x0)
    at ../../exa/exa_accel.c:581
#2  0x000055920b6eebbc in miCopyRegion
(pSrcDrawable=pSrcDrawable@entry=0x55920c1fbb20, 
    pDstDrawable=pDstDrawable@entry=0x55920c262620,
pGC=pGC@entry=0x55920c2627b0, 
    pDstRegion=pDstRegion@entry=0x7ffdc7dee340, dx=dx@entry=13, dy=dy@entry=31, 
    copyProc=0x7fb5e5baed00 <exaCopyNtoN>, bitPlane=0, closure=0x0) at
../../mi/micopy.c:121
#3  0x000055920b6ef236 in miDoCopy (pSrcDrawable=0x55920c1fbb20,
pDstDrawable=0x55920c262620, 
    pGC=0x55920c2627b0, xIn=13, yIn=31, widthSrc=100, heightSrc=100, xOut=0,
yOut=0, 
    copyProc=0x7fb5e5baed00 <exaCopyNtoN>, bitPlane=0, closure=0x0) at
../../mi/micopy.c:296
#4  0x00007fb5e5bad355 in exaCopyArea (pSrcDrawable=<optimized out>,
pDstDrawable=<optimized out>, 
    pGC=<optimized out>, srcx=<optimized out>, srcy=<optimized out>,
width=<optimized out>, 
    height=100, dstx=0, dsty=0) at ../../exa/exa_accel.c:608
#5  0x000055920b69a281 in damageCopyArea (pSrc=0x55920c1fbb20,
pDst=0x55920c262620, 
    pGC=0x55920c2627b0, srcx=0, srcy=<optimized out>, width=100, height=100,
dstx=0, dsty=0)
    at ../../../miext/damage/damage.c:764
#6  0x00007fb5e7e0966f in nouveau_dri2_copy_region2 (pScreen=<optimized out>,
pDraw=0x55920c1fbb20, 
    pRegion=0x7ffdc7dee5c0, pDstBuffer=0x55920c262050, pSrcBuffer=<optimized
out>)
    at ../../src/nouveau_dri2.c:202
#7  0x000055920b6e0059 in dri2_copy_region (pDraw=pDraw@entry=0x55920c1fbb20, 
    pRegion=pRegion@entry=0x7ffdc7dee5c0, pDest=0x55920c262050,
pSrc=0x55920c262080)
    at ../../../../hw/xfree86/dri2/dri2.c:869
#8  0x000055920b6e086e in DRI2CopyRegion (pDraw=pDraw@entry=0x55920c1fbb20, 
    pRegion=pRegion@entry=0x7ffdc7dee5c0, dest=dest@entry=7, src=src@entry=0)
    at ../../../../hw/xfree86/dri2/dri2.c:912
#9  0x000055920b6e0ba0 in do_get_buffers (pDraw=<optimized out>,
width=width@entry=0x7ffdc7dee648, 
    height=height@entry=0x7ffdc7dee650, attachments=<optimized out>, 
    attachments@entry=0x55920c23f1dc, count=2,
out_count=out_count@entry=0x7ffdc7dee658, 
    has_format=1) at ../../../../hw/xfree86/dri2/dri2.c:631
#10 0x000055920b6e0d7b in DRI2GetBuffersWithFormat (pDraw=<optimized out>, 
    width=width@entry=0x7ffdc7dee648, height=height@entry=0x7ffdc7dee650, 
    attachments=attachments@entry=0x55920c23f1dc, count=<optimized out>, 
    out_count=out_count@entry=0x7ffdc7dee658) at
../../../../hw/xfree86/dri2/dri2.c:671
#11 0x000055920b6e24f0 in ProcDRI2GetBuffersWithFormat (client=0x55920c243200)
    at ../../../../hw/xfree86/dri2/dri2ext.c:309
#12 ProcDRI2Dispatch (client=0x55920c243200) at
../../../../hw/xfree86/dri2/dri2ext.c:611
#13 0x000055920b5b307f in Dispatch () at ../../dix/dispatch.c:432
#14 0x000055920b5b71cb in dix_main (argc=10, argv=0x7ffdc7dee878,
envp=<optimized out>)
    at ../../dix/main.c:298
#15 0x00007fb5ec4d4b45 in __libc_start_main (main=0x55920b5a1590 <main>,
argc=10, 
    argv=0x7ffdc7dee878, init=<optimized out>, fini=<optimized out>,
rtld_fini=<optimized out>, 
    stack_end=0x7ffdc7dee868) at libc-start.c:287
#16 0x000055920b5a15be in _start ()

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1440537985.EBbEac71.10955
Date: Tue, 25 Aug 2015 21:26:25 +0000
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
   title="NEW - glean test vertProg1 segfaulting X server in exaHWCopyNtoN"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91756">91756</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>glean test vertProg1 segfaulting X server in exaHWCopyNtoN
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
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
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>stefan&#64;huehner.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Running piglit tests against mesa-11.0-rc1 package in debian experimental
<a href="https://tracker.debian.org/news/707424">https://tracker.debian.org/news/707424</a>

i have one test segfaulting the X server consistently.

HW is Ivy Bridge laptop with an additional  GK107 (NVE7) kepler.

Xserver version: 1.17.2 (from debian sid)
mesa: 11.0-rc1 (from debian experimental)
libdrm: 2.4.64
kernel: 4.1.0

Test is ran via:
logging into X locally

then via ssh:
export DISPLAY=:0
xrandr --setprovideroffloadsink nouveau Intel
export DRI_PRIME=1
Verifying with
glxinfo | grep nouveau

# just run the problematic test
bin/glean -t vertProg1

That immediately crashes the X server with a segfault

an attached gdb show following backtrace:
#0  exaHWCopyNtoN (pSrcDrawable=pSrcDrawable&#64;entry=0x55920c1fbb20, 
    pDstDrawable=pDstDrawable&#64;entry=0x55920c262620,
pGC=pGC&#64;entry=0x55920c2627b0, 
    pbox=pbox&#64;entry=0x7ffdc7dee340, nbox=nbox&#64;entry=1, dx=dx&#64;entry=13, dy=31,
reverse=0, 
    upsidedown=0) at ../../exa/exa_accel.c:424
#1  0x00007fb5e5baedcf in exaCopyNtoN
(pSrcDrawable=pSrcDrawable&#64;entry=0x55920c1fbb20, 
    pDstDrawable=0x55920c262620, pGC=0x55920c2627b0,
pbox=pbox&#64;entry=0x7ffdc7dee340, 
    nbox=nbox&#64;entry=1, dx=13, dy=31, reverse=0, upsidedown=0, bitplane=0,
closure=0x0)
    at ../../exa/exa_accel.c:581
#2  0x000055920b6eebbc in miCopyRegion
(pSrcDrawable=pSrcDrawable&#64;entry=0x55920c1fbb20, 
    pDstDrawable=pDstDrawable&#64;entry=0x55920c262620,
pGC=pGC&#64;entry=0x55920c2627b0, 
    pDstRegion=pDstRegion&#64;entry=0x7ffdc7dee340, dx=dx&#64;entry=13, dy=dy&#64;entry=31, 
    copyProc=0x7fb5e5baed00 &lt;exaCopyNtoN&gt;, bitPlane=0, closure=0x0) at
../../mi/micopy.c:121
#3  0x000055920b6ef236 in miDoCopy (pSrcDrawable=0x55920c1fbb20,
pDstDrawable=0x55920c262620, 
    pGC=0x55920c2627b0, xIn=13, yIn=31, widthSrc=100, heightSrc=100, xOut=0,
yOut=0, 
    copyProc=0x7fb5e5baed00 &lt;exaCopyNtoN&gt;, bitPlane=0, closure=0x0) at
../../mi/micopy.c:296
#4  0x00007fb5e5bad355 in exaCopyArea (pSrcDrawable=&lt;optimized out&gt;,
pDstDrawable=&lt;optimized out&gt;, 
    pGC=&lt;optimized out&gt;, srcx=&lt;optimized out&gt;, srcy=&lt;optimized out&gt;,
width=&lt;optimized out&gt;, 
    height=100, dstx=0, dsty=0) at ../../exa/exa_accel.c:608
#5  0x000055920b69a281 in damageCopyArea (pSrc=0x55920c1fbb20,
pDst=0x55920c262620, 
    pGC=0x55920c2627b0, srcx=0, srcy=&lt;optimized out&gt;, width=100, height=100,
dstx=0, dsty=0)
    at ../../../miext/damage/damage.c:764
#6  0x00007fb5e7e0966f in nouveau_dri2_copy_region2 (pScreen=&lt;optimized out&gt;,
pDraw=0x55920c1fbb20, 
    pRegion=0x7ffdc7dee5c0, pDstBuffer=0x55920c262050, pSrcBuffer=&lt;optimized
out&gt;)
    at ../../src/nouveau_dri2.c:202
#7  0x000055920b6e0059 in dri2_copy_region (pDraw=pDraw&#64;entry=0x55920c1fbb20, 
    pRegion=pRegion&#64;entry=0x7ffdc7dee5c0, pDest=0x55920c262050,
pSrc=0x55920c262080)
    at ../../../../hw/xfree86/dri2/dri2.c:869
#8  0x000055920b6e086e in DRI2CopyRegion (pDraw=pDraw&#64;entry=0x55920c1fbb20, 
    pRegion=pRegion&#64;entry=0x7ffdc7dee5c0, dest=dest&#64;entry=7, src=src&#64;entry=0)
    at ../../../../hw/xfree86/dri2/dri2.c:912
#9  0x000055920b6e0ba0 in do_get_buffers (pDraw=&lt;optimized out&gt;,
width=width&#64;entry=0x7ffdc7dee648, 
    height=height&#64;entry=0x7ffdc7dee650, attachments=&lt;optimized out&gt;, 
    attachments&#64;entry=0x55920c23f1dc, count=2,
out_count=out_count&#64;entry=0x7ffdc7dee658, 
    has_format=1) at ../../../../hw/xfree86/dri2/dri2.c:631
#10 0x000055920b6e0d7b in DRI2GetBuffersWithFormat (pDraw=&lt;optimized out&gt;, 
    width=width&#64;entry=0x7ffdc7dee648, height=height&#64;entry=0x7ffdc7dee650, 
    attachments=attachments&#64;entry=0x55920c23f1dc, count=&lt;optimized out&gt;, 
    out_count=out_count&#64;entry=0x7ffdc7dee658) at
../../../../hw/xfree86/dri2/dri2.c:671
#11 0x000055920b6e24f0 in ProcDRI2GetBuffersWithFormat (client=0x55920c243200)
    at ../../../../hw/xfree86/dri2/dri2ext.c:309
#12 ProcDRI2Dispatch (client=0x55920c243200) at
../../../../hw/xfree86/dri2/dri2ext.c:611
#13 0x000055920b5b307f in Dispatch () at ../../dix/dispatch.c:432
#14 0x000055920b5b71cb in dix_main (argc=10, argv=0x7ffdc7dee878,
envp=&lt;optimized out&gt;)
    at ../../dix/main.c:298
#15 0x00007fb5ec4d4b45 in __libc_start_main (main=0x55920b5a1590 &lt;main&gt;,
argc=10, 
    argv=0x7ffdc7dee878, init=&lt;optimized out&gt;, fini=&lt;optimized out&gt;,
rtld_fini=&lt;optimized out&gt;, 
    stack_end=0x7ffdc7dee868) at libc-start.c:287
#16 0x000055920b5a15be in _start ()</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1440537985.EBbEac71.10955--

--===============1722536390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1722536390==--
