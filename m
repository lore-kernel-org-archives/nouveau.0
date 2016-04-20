From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89558] [NV118] GM108 not supported by nouveau
Date: Wed, 20 Apr 2016 04:02:02 +0000
Message-ID: <bug-89558-8800-LWYMhITJl0@http.bugs.freedesktop.org/>
References: <bug-89558-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0797744726=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89558-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0797744726==
Content-Type: multipart/alternative; boundary="14611249213.61e6.22537";
 charset="UTF-8"


--14611249213.61e6.22537
Date: Wed, 20 Apr 2016 04:02:01 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=89558

--- Comment #46 from Marco Trevisan (Treviño) <mail-DXHccXIHLaFeoWH0uzbU5w@public.gmane.org> ---
Created attachment 123084
  --> https://bugs.freedesktop.org/attachment.cgi?id=123084&action=edit
kernel 4.4 - dmesg: 950MX SMF 108 path

Trying the patch by SMF gives out more or less the same output:

[34924.970827] pci 0000:02:00.0: optimus capabilities: enabled, status dynamic
power, hda bios codec supported
[34924.970830] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG2.PEGP
handle
[34924.970935] nouveau 0000:02:00.0: NVIDIA GM108 (1180d0a2)
[34924.995153] nouveau 0000:02:00.0: bios: version 82.08.57.00.22
[34925.039282] nouveau 0000:02:00.0: fb: 2048 MiB DDR3
[34925.039291] nouveau 0000:02:00.0: priv: HUB0: 1200a0 00000001 (19408217)
[34925.039333] nouveau 0000:02:00.0: priv: HUB0: 10ecc0 ffffffff (1e40822c)
[34926.318695] vga_switcheroo: enabled
[34926.318863] [TTM] Zone  kernel: Available graphics memory: 16119644 kiB
[34926.318880] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[34926.318881] [TTM] Initializing pool allocator
[34926.318892] [TTM] Initializing DMA pool allocator
[34926.318899] nouveau 0000:02:00.0: DRM: VRAM: 2048 MiB
[34926.318900] nouveau 0000:02:00.0: DRM: GART: 1048576 MiB
[34926.318902] nouveau 0000:02:00.0: DRM: Pointer to TMDS table invalid
[34926.318904] nouveau 0000:02:00.0: DRM: DCB version 4.0
[34926.318905] nouveau 0000:02:00.0: DRM: Pointer to flat panel table invalid
[34926.435387] nouveau 0000:02:00.0: DRM: MM: using COPY for buffer copies
[34926.435394] [drm] Initialized nouveau 1.3.1 20120801 for 0000:02:00.0 on
minor 

See also attached dmesg

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14611249213.61e6.22537
Date: Wed, 20 Apr 2016 04:02:01 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558#c46">Comment # 46</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558">bug 89558</a>
              from <span class="vcard"><a class="email" href="mailto:mail&#64;3v1n0.net" title="Marco Trevisan (Treviño) &lt;mail&#64;3v1n0.net&gt;"> <span class="fn">Marco Trevisan (Treviño)</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=123084" name="attach_123084" title="kernel 4.4 - dmesg: 950MX SMF 108 path">attachment 123084</a> <a href="attachment.cgi?id=123084&amp;action=edit" title="kernel 4.4 - dmesg: 950MX SMF 108 path">[details]</a></span>
kernel 4.4 - dmesg: 950MX SMF 108 path

Trying the patch by SMF gives out more or less the same output:

[34924.970827] pci 0000:02:00.0: optimus capabilities: enabled, status dynamic
power, hda bios codec supported
[34924.970830] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG2.PEGP
handle
[34924.970935] nouveau 0000:02:00.0: NVIDIA GM108 (1180d0a2)
[34924.995153] nouveau 0000:02:00.0: bios: version 82.08.57.00.22
[34925.039282] nouveau 0000:02:00.0: fb: 2048 MiB DDR3
[34925.039291] nouveau 0000:02:00.0: priv: HUB0: 1200a0 00000001 (19408217)
[34925.039333] nouveau 0000:02:00.0: priv: HUB0: 10ecc0 ffffffff (1e40822c)
[34926.318695] vga_switcheroo: enabled
[34926.318863] [TTM] Zone  kernel: Available graphics memory: 16119644 kiB
[34926.318880] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[34926.318881] [TTM] Initializing pool allocator
[34926.318892] [TTM] Initializing DMA pool allocator
[34926.318899] nouveau 0000:02:00.0: DRM: VRAM: 2048 MiB
[34926.318900] nouveau 0000:02:00.0: DRM: GART: 1048576 MiB
[34926.318902] nouveau 0000:02:00.0: DRM: Pointer to TMDS table invalid
[34926.318904] nouveau 0000:02:00.0: DRM: DCB version 4.0
[34926.318905] nouveau 0000:02:00.0: DRM: Pointer to flat panel table invalid
[34926.435387] nouveau 0000:02:00.0: DRM: MM: using COPY for buffer copies
[34926.435394] [drm] Initialized nouveau 1.3.1 20120801 for 0000:02:00.0 on
minor 

See also attached dmesg</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14611249213.61e6.22537--

--===============0797744726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0797744726==--
