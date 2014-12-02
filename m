From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86935] New: unknown kepler chipset
Date: Tue, 02 Dec 2014 15:19:58 +0000
Message-ID: <bug-86935-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0889668166=="
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


--===============0889668166==
Content-Type: multipart/alternative; boundary="1417533598.87D04CfD1.7348"; charset="UTF-8"


--1417533598.87D04CfD1.7348
Date: Tue, 2 Dec 2014 15:19:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86935

            Bug ID: 86935
           Summary: unknown kepler chipset
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: sven.koehler-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

With Linux 3.17.4, I get the following errors in dmesg:

nouveau ![  DEVICE][0000:01:00.0] unknown Kepler chipset
nouveau E[  DEVICE][0000:01:00.0] unknown chipset, 0xb06070b1
nouveau E[     DRM] failed to create 0x00000080, -22
nouveau: probe of 0000:01:00.0 failed with error -22

Obviously, I don't have a framebuffer console during boot and of course
nouveau-based X also doesn't work. I'm currently using uvesafb as a workaround.

lspci -v output:

01:00.0 VGA compatible controller: NVIDIA Corporation GK208 [GeForce GT 730]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: CardExpert Technology Device 1287
    Flags: bus master, fast devsel, latency 0, IRQ 11
    Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
    Memory at e8000000 (64-bit, prefetchable) [size=128M]
    Memory at f0000000 (64-bit, prefetchable) [size=32M]
    I/O ports at e000 [size=128]
    Expansion ROM at f7000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Legacy Endpoint, MSI 00
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting <?>
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
    Kernel modules: nouveau

I have no additional details on the card. It came with an HP office PC.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1417533598.87D04CfD1.7348
Date: Tue, 2 Dec 2014 15:19:58 +0000
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
   title="NEW - unknown kepler chipset"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86935">86935</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>unknown kepler chipset
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
          <td>sven.koehler&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>With Linux 3.17.4, I get the following errors in dmesg:

nouveau ![  DEVICE][0000:01:00.0] unknown Kepler chipset
nouveau E[  DEVICE][0000:01:00.0] unknown chipset, 0xb06070b1
nouveau E[     DRM] failed to create 0x00000080, -22
nouveau: probe of 0000:01:00.0 failed with error -22

Obviously, I don't have a framebuffer console during boot and of course
nouveau-based X also doesn't work. I'm currently using uvesafb as a workaround.

lspci -v output:

01:00.0 VGA compatible controller: NVIDIA Corporation GK208 [GeForce GT 730]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: CardExpert Technology Device 1287
    Flags: bus master, fast devsel, latency 0, IRQ 11
    Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
    Memory at e8000000 (64-bit, prefetchable) [size=128M]
    Memory at f0000000 (64-bit, prefetchable) [size=32M]
    I/O ports at e000 [size=128]
    Expansion ROM at f7000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Legacy Endpoint, MSI 00
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting &lt;?&gt;
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 &lt;?&gt;
    Kernel modules: nouveau

I have no additional details on the card. It came with an HP office PC.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1417533598.87D04CfD1.7348--

--===============0889668166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0889668166==--
