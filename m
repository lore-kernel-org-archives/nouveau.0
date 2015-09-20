From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92057] New: nouveau hard crash seems to poke
 arbitrary mmio address
Date: Sun, 20 Sep 2015 15:29:21 +0000
Message-ID: <bug-92057-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2129243626=="
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


--===============2129243626==
Content-Type: multipart/alternative; boundary="1442762962.7Bd5b1.12538"; charset="UTF-8"


--1442762962.7Bd5b1.12538
Date: Sun, 20 Sep 2015 15:29:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92057

            Bug ID: 92057
           Summary: nouveau hard crash seems to poke arbitrary mmio
                    address
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: roucaries.bastien+bugs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 118373
  --> https://bugs.freedesktop.org/attachment.cgi?id=118373&action=edit
crash image

Hi,

Nouveau hard crash with recent kernel
01:00.0 3D controller: NVIDIA Corporation GM107M [GeForce GTX 860M] (rev a2)
        Subsystem: Micro-Star International Co., Ltd. [MSI] Device 1107
        Flags: bus master, fast devsel, latency 0, IRQ 255
        Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
        Memory at e0000000 (64-bit, prefetchable) [size=256M]
        Memory at f0000000 (64-bit, prefetchable) [size=32M]
        I/O ports at e000 [disabled] [size=128]
        Expansion ROM at f7000000 [disabled] [size=512K]
        Capabilities: <access denied>

I can only get a photo of the crash

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1442762962.7Bd5b1.12538
Date: Sun, 20 Sep 2015 15:29:22 +0000
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
   title="NEW - nouveau hard crash seems to poke arbitrary mmio address"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92057">92057</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau hard crash seems to poke arbitrary mmio address
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
          <td>critical
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
          <td>roucaries.bastien+bugs&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=118373" name="attach_118373" title="crash image">attachment 118373</a> <a href="attachment.cgi?id=118373&amp;action=edit" title="crash image">[details]</a></span>
crash image

Hi,

Nouveau hard crash with recent kernel
01:00.0 3D controller: NVIDIA Corporation GM107M [GeForce GTX 860M] (rev a2)
        Subsystem: Micro-Star International Co., Ltd. [MSI] Device 1107
        Flags: bus master, fast devsel, latency 0, IRQ 255
        Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
        Memory at e0000000 (64-bit, prefetchable) [size=256M]
        Memory at f0000000 (64-bit, prefetchable) [size=32M]
        I/O ports at e000 [disabled] [size=128]
        Expansion ROM at f7000000 [disabled] [size=512K]
        Capabilities: &lt;access denied&gt;

I can only get a photo of the crash</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1442762962.7Bd5b1.12538--

--===============2129243626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2129243626==--
