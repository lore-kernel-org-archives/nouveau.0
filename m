From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92851] New: NV34: err: MEM_FAULT
Date: Sat, 07 Nov 2015 03:42:08 +0000
Message-ID: <bug-92851-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0436370826=="
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


--===============0436370826==
Content-Type: multipart/alternative; boundary="1446867728.2aBBe0dA1.2438"; charset="UTF-8"


--1446867728.2aBBe0dA1.2438
Date: Sat, 7 Nov 2015 03:42:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92851

            Bug ID: 92851
           Summary: NV34: err: MEM_FAULT
           Product: xorg
           Version: unspecified
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

NV34 / 4.2.5-201.fc22.i686

dmesg:
[   24.812240] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV34 (NV34)
[   24.812249] nouveau  [  DEVICE][0000:01:00.0] Family : NV30
...
[  178.486096] ACPI: Waking up from system sleep state S4
...
[  355.012379] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [Xorg[517]]
get 0x0003c528 put 0x00025618 state 0xc000fa40 (err: MEM_FAULT) push 0x00000000
[  355.012391] nouveau W[   PFIFO][0000:01:00.0] unknown intr 0x00010000
[  608.759016] nouveau E[Xorg[517]] failed to idle channel 0xcccc0001
[Xorg[517]]
[  638.934015] nouveau E[Xorg[517]] failed to idle channel 0xcccc0001
[Xorg[517]]
[  669.024015] nouveau E[Xorg[517]] failed to idle channel 0xcccc0000
[Xorg[517]]
[  699.220016] nouveau E[Xorg[517]] failed to idle channel 0xcccc0000
[Xorg[517]]
[  715.214259] nouveau  [     DRM] 0xDBBA: Parsing digital output script table
[  719.981109] nouveau E[  PGRAPH][0000:01:00.0]  (unknown bits 0x00000080)
nsource: nstatus:
[  719.981129] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [Xorg[1579]] subc 0 class
0x0039 mthd 0x0100 data 0x00000000
[  830.456017] nouveau E[Xorg[1579]] failed to idle channel 0xcccc0001
[Xorg[1579]]
[  860.514016] nouveau E[Xorg[1579]] failed to idle channel 0xcccc0001
[Xorg[1579]]
[  891.004014] nouveau E[Xorg[1579]] failed to idle channel 0xcccc0000
[Xorg[1579]]
[  902.422408] nouveau  [     DRM] 0xDB7C: Parsing digital output script table
[  902.518808] nouveau E[     DRM] GPU lockup - switching to software fbcon
[  921.324016] nouveau E[Xorg[1579]] failed to idle channel 0xcccc0000
[Xorg[1579]]
[  952.652018] nouveau E[Xorg[1579]] failed to idle channel 0xcccc0000
[Xorg[1579]]
[  982.702016] nouveau E[Xorg[1579]] failed to idle channel 0xcccc0000
[Xorg[1579]]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446867728.2aBBe0dA1.2438
Date: Sat, 7 Nov 2015 03:42:08 +0000
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
   title="NEW - NV34: err: MEM_FAULT"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92851">92851</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NV34: err: MEM_FAULT
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
          <td>x86 (IA32)
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
          <td>major
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
          <td>pomidorabelisima&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>NV34 / 4.2.5-201.fc22.i686

dmesg:
[   24.812240] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV34 (NV34)
[   24.812249] nouveau  [  DEVICE][0000:01:00.0] Family : NV30
...
[  178.486096] ACPI: Waking up from system sleep state S4
...
[  355.012379] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [Xorg[517]]
get 0x0003c528 put 0x00025618 state 0xc000fa40 (err: MEM_FAULT) push 0x00000000
[  355.012391] nouveau W[   PFIFO][0000:01:00.0] unknown intr 0x00010000
[  608.759016] nouveau E[Xorg[517]] failed to idle channel 0xcccc0001
[Xorg[517]]
[  638.934015] nouveau E[Xorg[517]] failed to idle channel 0xcccc0001
[Xorg[517]]
[  669.024015] nouveau E[Xorg[517]] failed to idle channel 0xcccc0000
[Xorg[517]]
[  699.220016] nouveau E[Xorg[517]] failed to idle channel 0xcccc0000
[Xorg[517]]
[  715.214259] nouveau  [     DRM] 0xDBBA: Parsing digital output script table
[  719.981109] nouveau E[  PGRAPH][0000:01:00.0]  (unknown bits 0x00000080)
nsource: nstatus:
[  719.981129] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [Xorg[1579]] subc 0 class
0x0039 mthd 0x0100 data 0x00000000
[  830.456017] nouveau E[Xorg[1579]] failed to idle channel 0xcccc0001
[Xorg[1579]]
[  860.514016] nouveau E[Xorg[1579]] failed to idle channel 0xcccc0001
[Xorg[1579]]
[  891.004014] nouveau E[Xorg[1579]] failed to idle channel 0xcccc0000
[Xorg[1579]]
[  902.422408] nouveau  [     DRM] 0xDB7C: Parsing digital output script table
[  902.518808] nouveau E[     DRM] GPU lockup - switching to software fbcon
[  921.324016] nouveau E[Xorg[1579]] failed to idle channel 0xcccc0000
[Xorg[1579]]
[  952.652018] nouveau E[Xorg[1579]] failed to idle channel 0xcccc0000
[Xorg[1579]]
[  982.702016] nouveau E[Xorg[1579]] failed to idle channel 0xcccc0000
[Xorg[1579]]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446867728.2aBBe0dA1.2438--

--===============0436370826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0436370826==--
