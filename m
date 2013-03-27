From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62835] New: Screen freezes after resume from s2ram
Date: Wed, 27 Mar 2013 20:39:13 +0000
Message-ID: <bug-62835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1658740864=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1658740864==
Content-Type: multipart/alternative; boundary="1364416754.aeE78B8F1.6319"; charset="us-ascii"


--1364416754.aeE78B8F1.6319
Date: Wed, 27 Mar 2013 20:39:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62835

          Priority: medium
            Bug ID: 62835
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Screen freezes after resume from s2ram
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: pontus.fuchs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 77123
  --> https://bugs.freedesktop.org/attachment.cgi?id=77123&action=edit
Kernel logs with drm.debug=2 nouveau.debug=trace

With 3.9-rc kernels X freezes after resume from s2ram. After ~10 seconds X is
restarted.

When this happens the following is printed in the kernel logs:

nouveau E[Xorg[1218]] failed to idle channel 0xcccc0000 [Xorg[1218]]
nouveau E[     PFB][0000:01:00.0] trapped read at 0x002001e020 on channel
0x00007b23 [unknown] SEMAPHORE_BG/PFIFO_READ/00 reason: PAGE_NOT_PRESENT
nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 2 [Xorg[1218]] subc 7 mthd
0x1280 data 0x00000000
nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA - TP0: Unhandled ustatus
0x00000004
nouveau E[  PGRAPH][0000:01:00.0]  TRAP
nouveau E[  PGRAPH][0000:01:00.0] ch 2 [0x0007b23000 Xorg[1218]] subc 7 class
0x8297 mthd 0x15e0 data 0x00000000
nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_2D - TP 0 - Unknown fault at
address 0020339000
nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_2D - TP 0 - e0c: 00000000, e18:
00000000, e1c: 00000000, e20: 00000011, e24: 0c030000
...

Full log attached.

Hardware is GeForce 8400M GS (10de:0427).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1364416754.aeE78B8F1.6319
Date: Wed, 27 Mar 2013 20:39:14 +0000
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
   title="NEW --- - Screen freezes after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62835">62835</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Screen freezes after resume from s2ram
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
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
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>pontus.fuchs&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
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
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=77123" name="attach_77123" title="Kernel logs with drm.debug=2 nouveau.debug=trace">attachment 77123</a> <a href="attachment.cgi?id=77123&amp;action=edit" title="Kernel logs with drm.debug=2 nouveau.debug=trace">[details]</a></span>
Kernel logs with drm.debug=2 nouveau.debug=trace

With 3.9-rc kernels X freezes after resume from s2ram. After ~10 seconds X is
restarted.

When this happens the following is printed in the kernel logs:

nouveau E[Xorg[1218]] failed to idle channel 0xcccc0000 [Xorg[1218]]
nouveau E[     PFB][0000:01:00.0] trapped read at 0x002001e020 on channel
0x00007b23 [unknown] SEMAPHORE_BG/PFIFO_READ/00 reason: PAGE_NOT_PRESENT
nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 2 [Xorg[1218]] subc 7 mthd
0x1280 data 0x00000000
nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA - TP0: Unhandled ustatus
0x00000004
nouveau E[  PGRAPH][0000:01:00.0]  TRAP
nouveau E[  PGRAPH][0000:01:00.0] ch 2 [0x0007b23000 Xorg[1218]] subc 7 class
0x8297 mthd 0x15e0 data 0x00000000
nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_2D - TP 0 - Unknown fault at
address 0020339000
nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_2D - TP 0 - e0c: 00000000, e18:
00000000, e1c: 00000000, e20: 00000011, e24: 0c030000
...

Full log attached.

Hardware is GeForce 8400M GS (10de:0427).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1364416754.aeE78B8F1.6319--

--===============1658740864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1658740864==--
