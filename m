From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92991] New: Nouveau module loading regression in
 4.4-rc1 on optimus system
Date: Wed, 18 Nov 2015 12:01:51 +0000
Message-ID: <bug-92991-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1939576544=="
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


--===============1939576544==
Content-Type: multipart/alternative; boundary="1447848112.48bda3c1.4102"; charset="UTF-8"


--1447848112.48bda3c1.4102
Date: Wed, 18 Nov 2015 12:01:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92991

            Bug ID: 92991
           Summary: Nouveau module loading regression in 4.4-rc1 on
                    optimus system
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: oliver-GvhC2dPhHPQdnm+yROfE0A@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 119903
  --> https://bugs.freedesktop.org/attachment.cgi?id=119903&action=edit
lspci -vvv

I am seeing a short freeze of the system loading the nouveau module and then a
kernel error in syslog:

[  295.486823] nouveau 0000:01:00.0: enabling device (0000 -> 0003)
[  295.486851] nouveau 0000:01:00.0: NVIDIA GK104 (0e4360a2)
[  295.499666] nouveau 0000:01:00.0: bios: version 80.04.b1.00.03
[  295.499966] nouveau 0000:01:00.0: mxm: BIOS version 3.0
[  295.503015] ACPI Warning: \_SB_.PCI0.PEGP.DGFX._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-95)
[  295.746220] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
[  295.812103] [TTM] Zone  kernel: Available graphics memory: 12164158 kiB
[  295.812105] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[  295.812105] [TTM] Initializing pool allocator
[  295.812109] [TTM] Initializing DMA pool allocator
[  295.812116] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[  295.812117] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[  295.812120] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[  295.812121] nouveau 0000:01:00.0: DRM: DCB version 4.0
[  295.812122] nouveau 0000:01:00.0: DRM: DCB outp 03: 01075fd6 0f420020
[  295.812123] nouveau 0000:01:00.0: DRM: DCB outp 04: 01075f92 00020020
[  295.812124] nouveau 0000:01:00.0: DRM: DCB outp 05: 08014fc6 0f420010
[  295.812125] nouveau 0000:01:00.0: DRM: DCB outp 06: 08014f82 00020010
[  295.812126] nouveau 0000:01:00.0: DRM: DCB outp 08: 04038fb6 0f420010
[  295.812127] nouveau 0000:01:00.0: DRM: DCB outp 09: 04038f72 00020010
[  295.812128] nouveau 0000:01:00.0: DRM: DCB conn 04: 01000446
[  295.812129] nouveau 0000:01:00.0: DRM: DCB conn 05: 02000546
[  295.812130] nouveau 0000:01:00.0: DRM: DCB conn 07: 00010747
[  295.812131] nouveau 0000:01:00.0: DRM: DCB conn 08: 00020846
[  295.812132] nouveau 0000:01:00.0: DRM: DCB conn 09: 00000900
[  295.830519] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[  295.830521] [drm] Driver supports precise vblank timestamp query.
[  296.026589] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[  297.565049] SFW2-INext-DROP-DEFLT IN=enp0s25 OUT=
MAC=6c:3b:e5:8c:99:ec:00:1c:4a:86:25:6a:08:00 SRC=192.168.234.1
DST=192.168.234.102 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=6751 DF PROTO=TCP
SPT=4739 DPT=14013 WINDOW=5840 RES=0x00 SYN URGP=0 OPT
(020405B40402080A020ABC300000000001030301) 
[  298.474076] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[  300.473977] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[  302.473878] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[  304.473781] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[  306.473761] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.c:1365/gf100_grctx_generate()!
[  306.473775] nouveau 0000:01:00.0: gr: failed to construct context
[  306.473778] nouveau 0000:01:00.0: gr: init failed, -16
[  306.476140] nouveau 0000:01:00.0: DRM: allocated 1680x1050 fb: 0x60000, bo
ffff88068c051400
[  306.476221] nouveau 0000:01:00.0: fb1: nouveaufb frame buffer device
[  306.476226] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447848112.48bda3c1.4102
Date: Wed, 18 Nov 2015 12:01:52 +0000
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
   title="NEW - Nouveau module loading regression in 4.4-rc1 on optimus system"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92991">92991</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau module loading regression in 4.4-rc1 on optimus system
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
          <td>oliver&#64;neukum.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=119903" name="attach_119903" title="lspci -vvv">attachment 119903</a> <a href="attachment.cgi?id=119903&amp;action=edit" title="lspci -vvv">[details]</a></span>
lspci -vvv

I am seeing a short freeze of the system loading the nouveau module and then a
kernel error in syslog:

[  295.486823] nouveau 0000:01:00.0: enabling device (0000 -&gt; 0003)
[  295.486851] nouveau 0000:01:00.0: NVIDIA GK104 (0e4360a2)
[  295.499666] nouveau 0000:01:00.0: bios: version 80.04.b1.00.03
[  295.499966] nouveau 0000:01:00.0: mxm: BIOS version 3.0
[  295.503015] ACPI Warning: \_SB_.PCI0.PEGP.DGFX._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-95)
[  295.746220] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
[  295.812103] [TTM] Zone  kernel: Available graphics memory: 12164158 kiB
[  295.812105] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[  295.812105] [TTM] Initializing pool allocator
[  295.812109] [TTM] Initializing DMA pool allocator
[  295.812116] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[  295.812117] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[  295.812120] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[  295.812121] nouveau 0000:01:00.0: DRM: DCB version 4.0
[  295.812122] nouveau 0000:01:00.0: DRM: DCB outp 03: 01075fd6 0f420020
[  295.812123] nouveau 0000:01:00.0: DRM: DCB outp 04: 01075f92 00020020
[  295.812124] nouveau 0000:01:00.0: DRM: DCB outp 05: 08014fc6 0f420010
[  295.812125] nouveau 0000:01:00.0: DRM: DCB outp 06: 08014f82 00020010
[  295.812126] nouveau 0000:01:00.0: DRM: DCB outp 08: 04038fb6 0f420010
[  295.812127] nouveau 0000:01:00.0: DRM: DCB outp 09: 04038f72 00020010
[  295.812128] nouveau 0000:01:00.0: DRM: DCB conn 04: 01000446
[  295.812129] nouveau 0000:01:00.0: DRM: DCB conn 05: 02000546
[  295.812130] nouveau 0000:01:00.0: DRM: DCB conn 07: 00010747
[  295.812131] nouveau 0000:01:00.0: DRM: DCB conn 08: 00020846
[  295.812132] nouveau 0000:01:00.0: DRM: DCB conn 09: 00000900
[  295.830519] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[  295.830521] [drm] Driver supports precise vblank timestamp query.
[  296.026589] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[  297.565049] SFW2-INext-DROP-DEFLT IN=enp0s25 OUT=
MAC=6c:3b:e5:8c:99:ec:00:1c:4a:86:25:6a:08:00 SRC=192.168.234.1
DST=192.168.234.102 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=6751 DF PROTO=TCP
SPT=4739 DPT=14013 WINDOW=5840 RES=0x00 SYN URGP=0 OPT
(020405B40402080A020ABC300000000001030301) 
[  298.474076] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[  300.473977] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[  302.473878] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[  304.473781] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[  306.473761] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.c:1365/gf100_grctx_generate()!
[  306.473775] nouveau 0000:01:00.0: gr: failed to construct context
[  306.473778] nouveau 0000:01:00.0: gr: init failed, -16
[  306.476140] nouveau 0000:01:00.0: DRM: allocated 1680x1050 fb: 0x60000, bo
ffff88068c051400
[  306.476221] nouveau 0000:01:00.0: fb1: nouveaufb frame buffer device
[  306.476226] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447848112.48bda3c1.4102--

--===============1939576544==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1939576544==--
