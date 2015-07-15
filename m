From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91355] New: [Quadro K610M] nouveau fills the kernel
 log when a video is played
Date: Wed, 15 Jul 2015 23:53:41 +0000
Message-ID: <bug-91355-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1312251706=="
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


--===============1312251706==
Content-Type: multipart/alternative; boundary="1437004421.7BC4BdEB1.32175"; charset="UTF-8"


--1437004421.7BC4BdEB1.32175
Date: Wed, 15 Jul 2015 23:53:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91355

            Bug ID: 91355
           Summary: [Quadro K610M] nouveau fills the kernel log when a
                    video is played
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: vincent-fdt-buymaDBGzMOsTnJN9+BGXg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

When a video is played, either by VLC or by MPlayer, the kernel log
/var/log/kern.log is filled with lines like:

Jul 16 01:44:30 zira kernel: [81562.247407] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ch 2 [Xorg[1209]] subc 5 mthd 0x0000 data 0x0000906e
Jul 16 01:44:30 zira kernel: [81562.280793] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: LBREQ
Jul 16 01:44:30 zira kernel: [81562.280801] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ch 2 [Xorg[1209]] subc 5 mthd 0x0000 data 0x0000906e
Jul 16 01:44:30 zira kernel: [81562.314152] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: LBREQ
Jul 16 01:44:30 zira kernel: [81562.314161] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ch 2 [Xorg[1209]] subc 5 mthd 0x0000 data 0x0000906e
Jul 16 01:44:30 zira kernel: [81562.347434] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: LBREQ
Jul 16 01:44:30 zira kernel: [81562.347443] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ch 2 [Xorg[1209]] subc 5 mthd 0x0000 data 0x0000906e
Jul 16 01:44:30 zira kernel: [81562.380791] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: LBREQ
Jul 16 01:44:30 zira kernel: [81562.380800] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ch 2 [Xorg[1209]] subc 5 mthd 0x0000 data 0x0000906e
Jul 16 01:44:30 zira kernel: [81562.414181] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: LBREQ
Jul 16 01:44:30 zira kernel: [81562.414189] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ch 2 [Xorg[1209]] subc 5 mthd 0x0000 data 0x0000906e
Jul 16 01:44:30 zira kernel: [81562.447591] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: LBREQ
Jul 16 01:44:30 zira kernel: [81562.447600] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ch 2 [Xorg[1209]] subc 5 mthd 0x0000 data 0x0000906e

also completely filling dmesg output.

Someone else has the same kind of problem:
  https://bugs.launchpad.net/ubuntu/+source/linux-lts-vivid/+bug/1474538

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1437004421.7BC4BdEB1.32175
Date: Wed, 15 Jul 2015 23:53:41 +0000
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
   title="NEW - [Quadro K610M] nouveau fills the kernel log when a video is played"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91355">91355</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[Quadro K610M] nouveau fills the kernel log when a video is played
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
          <td>vincent-fdt&#64;vinc17.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When a video is played, either by VLC or by MPlayer, the kernel log
/var/log/kern.log is filled with lines like:

Jul 16 01:44:30 zira kernel: [81562.247407] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ch 2 [Xorg[1209]] subc 5 mthd 0x0000 data 0x0000906e
Jul 16 01:44:30 zira kernel: [81562.280793] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: LBREQ
Jul 16 01:44:30 zira kernel: [81562.280801] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ch 2 [Xorg[1209]] subc 5 mthd 0x0000 data 0x0000906e
Jul 16 01:44:30 zira kernel: [81562.314152] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: LBREQ
Jul 16 01:44:30 zira kernel: [81562.314161] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ch 2 [Xorg[1209]] subc 5 mthd 0x0000 data 0x0000906e
Jul 16 01:44:30 zira kernel: [81562.347434] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: LBREQ
Jul 16 01:44:30 zira kernel: [81562.347443] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ch 2 [Xorg[1209]] subc 5 mthd 0x0000 data 0x0000906e
Jul 16 01:44:30 zira kernel: [81562.380791] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: LBREQ
Jul 16 01:44:30 zira kernel: [81562.380800] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ch 2 [Xorg[1209]] subc 5 mthd 0x0000 data 0x0000906e
Jul 16 01:44:30 zira kernel: [81562.414181] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: LBREQ
Jul 16 01:44:30 zira kernel: [81562.414189] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ch 2 [Xorg[1209]] subc 5 mthd 0x0000 data 0x0000906e
Jul 16 01:44:30 zira kernel: [81562.447591] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: LBREQ
Jul 16 01:44:30 zira kernel: [81562.447600] nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ch 2 [Xorg[1209]] subc 5 mthd 0x0000 data 0x0000906e

also completely filling dmesg output.

Someone else has the same kind of problem:
  <a href="https://bugs.launchpad.net/ubuntu/+source/linux-lts-vivid/+bug/1474538">https://bugs.launchpad.net/ubuntu/+source/linux-lts-vivid/+bug/1474538</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1437004421.7BC4BdEB1.32175--

--===============1312251706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1312251706==--
