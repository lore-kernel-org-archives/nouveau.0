From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94725] New: Nouveau driver fails to load on GM204
Date: Sun, 27 Mar 2016 16:28:08 +0000
Message-ID: <bug-94725-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1666683221=="
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


--===============1666683221==
Content-Type: multipart/alternative; boundary="14590960880.2F0d.17777";
 charset="UTF-8"


--14590960880.2F0d.17777
Date: Sun, 27 Mar 2016 16:28:08 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94725

            Bug ID: 94725
           Summary: Nouveau driver fails to load on GM204
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: rashed-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 122587
  --> https://bugs.freedesktop.org/attachment.cgi?id=122587&action=edit
dmesg from boot

Booting Linux 4.6-rc1 and Mesa 11.2/11.3 fails to load the nouveau driver on a
GTX 970M (6GB) on an MSI GS60 Ghost Pro 4K (i7-6700HQ). It spews out wonderful
messages like
[    2.146398] nouveau 0000:01:00.0: priv: HUB0: 10ecc0 ffffffff (1940822c)
[    2.154362] vga_switcheroo: enabled
[    2.154567] [TTM] Zone  kernel: Available graphics memory: 8170764 kiB
[    2.154568] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    2.154569] [TTM] Initializing pool allocator
[    2.154572] [TTM] Initializing DMA pool allocator
[    2.154577] nouveau 0000:01:00.0: DRM: VRAM: 6144 MiB
[    2.154578] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    2.154580] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[    2.154582] nouveau 0000:01:00.0: DRM: DCB version 4.1
[    2.154583] nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid

Attached is a dmesg from boot. The driver does just drop to the i915 driver so
the machine is usable, but whenever I run lspci or lshw or try to logout of the
X session, it hangs when it switches back to the nVidia GPU (the laptop has an
LED indicator showing which GPU is in use)

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14590960880.2F0d.17777
Date: Sun, 27 Mar 2016 16:28:08 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver fails to load on GM204"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94725">94725</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau driver fails to load on GM204
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
          <td>Linux (All)
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
          <td>rashed&#64;linux.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=122587" name="attach_122587" title="dmesg from boot">attachment 122587</a> <a href="attachment.cgi?id=122587&amp;action=edit" title="dmesg from boot">[details]</a></span>
dmesg from boot

Booting Linux 4.6-rc1 and Mesa 11.2/11.3 fails to load the nouveau driver on a
GTX 970M (6GB) on an MSI GS60 Ghost Pro 4K (i7-6700HQ). It spews out wonderful
messages like
[    2.146398] nouveau 0000:01:00.0: priv: HUB0: 10ecc0 ffffffff (1940822c)
[    2.154362] vga_switcheroo: enabled
[    2.154567] [TTM] Zone  kernel: Available graphics memory: 8170764 kiB
[    2.154568] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    2.154569] [TTM] Initializing pool allocator
[    2.154572] [TTM] Initializing DMA pool allocator
[    2.154577] nouveau 0000:01:00.0: DRM: VRAM: 6144 MiB
[    2.154578] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    2.154580] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[    2.154582] nouveau 0000:01:00.0: DRM: DCB version 4.1
[    2.154583] nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid

Attached is a dmesg from boot. The driver does just drop to the i915 driver so
the machine is usable, but whenever I run lspci or lshw or try to logout of the
X session, it hangs when it switches back to the nVidia GPU (the laptop has an
LED indicator showing which GPU is in use)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14590960880.2F0d.17777--

--===============1666683221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1666683221==--
