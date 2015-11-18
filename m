From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92991] Nouveau module loading regression in 4.4-rc1
 on optimus system
Date: Wed, 18 Nov 2015 22:12:34 +0000
Message-ID: <bug-92991-8800-U6HZjzjmDL@http.bugs.freedesktop.org/>
References: <bug-92991-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2008062682=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92991-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2008062682==
Content-Type: multipart/alternative; boundary="1447884754.8cB31.30020"; charset="UTF-8"


--1447884754.8cB31.30020
Date: Wed, 18 Nov 2015 22:12:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92991

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Oliver Neukum from comment #2)
> (In reply to Karol Herbst from comment #1)
> > try to add nouveau.config=War00C800_0=1 to the kernel command line
> 
> [ 4169.807962] nouveau 0000:01:00.0: enabling device (0000 -> 0003)
> [ 4169.808016] nouveau 0000:01:00.0: NVIDIA GK104 (0e4360a2)
> [ 4169.821387] nouveau 0000:01:00.0: bios: version 80.04.b1.00.03
> [ 4169.821709] nouveau 0000:01:00.0: mxm: BIOS version 3.0
> [ 4169.824803] ACPI Warning: \_SB_.PCI0.PEGP.DGFX._DSM: Argument #4 type
> mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-95)
> [ 4170.068054] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
> [ 4170.134338] [TTM] Zone  kernel: Available graphics memory: 12164158 kiB
> [ 4170.134340] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
> [ 4170.134341] [TTM] Initializing pool allocator
> [ 4170.134344] [TTM] Initializing DMA pool allocator
> [ 4170.134355] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
> [ 4170.134356] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
> [ 4170.134358] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
> [ 4170.134359] nouveau 0000:01:00.0: DRM: DCB version 4.0
> [ 4170.134361] nouveau 0000:01:00.0: DRM: DCB outp 03: 01075fd6 0f420020
> [ 4170.134362] nouveau 0000:01:00.0: DRM: DCB outp 04: 01075f92 00020020
> [ 4170.134363] nouveau 0000:01:00.0: DRM: DCB outp 05: 08014fc6 0f420010
> [ 4170.134364] nouveau 0000:01:00.0: DRM: DCB outp 06: 08014f82 00020010
> [ 4170.134364] nouveau 0000:01:00.0: DRM: DCB outp 08: 04038fb6 0f420010
> [ 4170.134365] nouveau 0000:01:00.0: DRM: DCB outp 09: 04038f72 00020010
> [ 4170.134367] nouveau 0000:01:00.0: DRM: DCB conn 04: 01000446
> [ 4170.134367] nouveau 0000:01:00.0: DRM: DCB conn 05: 02000546
> [ 4170.134368] nouveau 0000:01:00.0: DRM: DCB conn 07: 00010747
> [ 4170.134369] nouveau 0000:01:00.0: DRM: DCB conn 08: 00020846
> [ 4170.134370] nouveau 0000:01:00.0: DRM: DCB conn 09: 00000900
> [ 4170.149535] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [ 4170.149536] [drm] Driver supports precise vblank timestamp query.
> [ 4170.321600] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
> [ 4170.616221] nouveau 0000:01:00.0: pmu: hw bug workaround enabled
> [ 4170.728193] nouveau 0000:01:00.0: pmu: hw bug workaround enabled
> [ 4170.799274] nouveau 0000:01:00.0: DRM: allocated 1680x1050 fb: 0x60000,
> bo ffff8805dc47ec00
> [ 4170.799409] nouveau 0000:01:00.0: fb1: nouveaufb frame buffer device
> [ 4170.799415] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
> minor 1

That seems much happier. Mind providing the output of lspci -nnv -d 10de::300 ?
The lspci you attached is missing the id's, we're whitelisting stuff for now.
Eventually we'll flip this on by default.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447884754.8cB31.30020
Date: Wed, 18 Nov 2015 22:12:34 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau module loading regression in 4.4-rc1 on optimus system"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92991#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau module loading regression in 4.4-rc1 on optimus system"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92991">bug 92991</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Oliver Neukum from <a href="show_bug.cgi?id=92991#c2">comment #2</a>)
<span class="quote">&gt; (In reply to Karol Herbst from <a href="show_bug.cgi?id=92991#c1">comment #1</a>)
&gt; &gt; try to add nouveau.config=War00C800_0=1 to the kernel command line
&gt; 
&gt; [ 4169.807962] nouveau 0000:01:00.0: enabling device (0000 -&gt; 0003)
&gt; [ 4169.808016] nouveau 0000:01:00.0: NVIDIA GK104 (0e4360a2)
&gt; [ 4169.821387] nouveau 0000:01:00.0: bios: version 80.04.b1.00.03
&gt; [ 4169.821709] nouveau 0000:01:00.0: mxm: BIOS version 3.0
&gt; [ 4169.824803] ACPI Warning: \_SB_.PCI0.PEGP.DGFX._DSM: Argument #4 type
&gt; mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-95)
&gt; [ 4170.068054] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
&gt; [ 4170.134338] [TTM] Zone  kernel: Available graphics memory: 12164158 kiB
&gt; [ 4170.134340] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
&gt; [ 4170.134341] [TTM] Initializing pool allocator
&gt; [ 4170.134344] [TTM] Initializing DMA pool allocator
&gt; [ 4170.134355] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
&gt; [ 4170.134356] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
&gt; [ 4170.134358] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
&gt; [ 4170.134359] nouveau 0000:01:00.0: DRM: DCB version 4.0
&gt; [ 4170.134361] nouveau 0000:01:00.0: DRM: DCB outp 03: 01075fd6 0f420020
&gt; [ 4170.134362] nouveau 0000:01:00.0: DRM: DCB outp 04: 01075f92 00020020
&gt; [ 4170.134363] nouveau 0000:01:00.0: DRM: DCB outp 05: 08014fc6 0f420010
&gt; [ 4170.134364] nouveau 0000:01:00.0: DRM: DCB outp 06: 08014f82 00020010
&gt; [ 4170.134364] nouveau 0000:01:00.0: DRM: DCB outp 08: 04038fb6 0f420010
&gt; [ 4170.134365] nouveau 0000:01:00.0: DRM: DCB outp 09: 04038f72 00020010
&gt; [ 4170.134367] nouveau 0000:01:00.0: DRM: DCB conn 04: 01000446
&gt; [ 4170.134367] nouveau 0000:01:00.0: DRM: DCB conn 05: 02000546
&gt; [ 4170.134368] nouveau 0000:01:00.0: DRM: DCB conn 07: 00010747
&gt; [ 4170.134369] nouveau 0000:01:00.0: DRM: DCB conn 08: 00020846
&gt; [ 4170.134370] nouveau 0000:01:00.0: DRM: DCB conn 09: 00000900
&gt; [ 4170.149535] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
&gt; [ 4170.149536] [drm] Driver supports precise vblank timestamp query.
&gt; [ 4170.321600] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
&gt; [ 4170.616221] nouveau 0000:01:00.0: pmu: hw bug workaround enabled
&gt; [ 4170.728193] nouveau 0000:01:00.0: pmu: hw bug workaround enabled
&gt; [ 4170.799274] nouveau 0000:01:00.0: DRM: allocated 1680x1050 fb: 0x60000,
&gt; bo ffff8805dc47ec00
&gt; [ 4170.799409] nouveau 0000:01:00.0: fb1: nouveaufb frame buffer device
&gt; [ 4170.799415] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
&gt; minor 1</span >

That seems much happier. Mind providing the output of lspci -nnv -d 10de::300 ?
The lspci you attached is missing the id's, we're whitelisting stuff for now.
Eventually we'll flip this on by default.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447884754.8cB31.30020--

--===============2008062682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2008062682==--
