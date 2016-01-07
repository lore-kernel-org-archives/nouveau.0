From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93629] New: [NVE6] complete system freeze,
 PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
Date: Thu, 07 Jan 2016 14:01:25 +0000
Message-ID: <bug-93629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1557597883=="
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


--===============1557597883==
Content-Type: multipart/alternative; boundary="1452175285.Bb6ea51.9496"; charset="UTF-8"


--1452175285.Bb6ea51.9496
Date: Thu, 7 Jan 2016 14:01:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93629

            Bug ID: 93629
           Summary: [NVE6] complete system freeze, PGRAPH engine fault on
                    channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 120860
  --> https://bugs.freedesktop.org/attachment.cgi?id=120860&action=edit
dmesg output after crash

The system randomly freezes. I can still move the mouse but can't do anything
else. I cannot switch VT, the three-finger salute does not work and system shut
down via ACPI does not work either. The only way of recovery is a hard switch
off.

The crash seems to occur more frequently, if I play videos (mplayer or Flash),
but this is not a requirement.

The crash does not occur, if I use the blob firmware
(nouveau.config="NvGrUseFw=1").

Graphic card: "ASUS GeForce GTX 660 PCI 3.0 2GB DDR5"

uname: "Linux 4.1.12-gentoo #2 SMP Wed Dec 23 19:28:09 CET 2015 x86_64 Intel(R)
Xeon(R) CPU E3-1230 v3 @ 3.30GHz GenuineIntel GNU/Linux"

Beginning of dmesg:

Jan 06 16:04:24 matthias-pc kernel: nouveau E[   PFIFO][0000:01:00.0]
SCHED_ERROR [ CTXSW_TIMEOUT ]
Jan 06 16:04:24 matthias-pc kernel: nouveau E[   PFIFO][0000:01:00.0] PGRAPH
engine fault on channel 2, recovering...
Jan 06 16:04:31 matthias-pc kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 5
[0x023f926000 kwin[606]]
Jan 06 16:04:31 matthias-pc kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP0
0x80000000 0x80000001
Jan 06 16:04:31 matthias-pc kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP1
0x80000000 0x80000001
Jan 06 16:04:31 matthias-pc kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP2
0x80000000 0x80000001

For a complete log and more system information see the attached files.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1452175285.Bb6ea51.9496
Date: Thu, 7 Jan 2016 14:01:25 +0000
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
   title="NEW - [NVE6] complete system freeze, PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93629">93629</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE6] complete system freeze, PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
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
          <td>matthias.h.nagel&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=120860" name="attach_120860" title="dmesg output after crash">attachment 120860</a> <a href="attachment.cgi?id=120860&amp;action=edit" title="dmesg output after crash">[details]</a></span>
dmesg output after crash

The system randomly freezes. I can still move the mouse but can't do anything
else. I cannot switch VT, the three-finger salute does not work and system shut
down via ACPI does not work either. The only way of recovery is a hard switch
off.

The crash seems to occur more frequently, if I play videos (mplayer or Flash),
but this is not a requirement.

The crash does not occur, if I use the blob firmware
(nouveau.config=&quot;NvGrUseFw=1&quot;).

Graphic card: &quot;ASUS GeForce GTX 660 PCI 3.0 2GB DDR5&quot;

uname: &quot;Linux 4.1.12-gentoo #2 SMP Wed Dec 23 19:28:09 CET 2015 x86_64 Intel(R)
Xeon(R) CPU E3-1230 v3 &#64; 3.30GHz GenuineIntel GNU/Linux&quot;

Beginning of dmesg:

Jan 06 16:04:24 matthias-pc kernel: nouveau E[   PFIFO][0000:01:00.0]
SCHED_ERROR [ CTXSW_TIMEOUT ]
Jan 06 16:04:24 matthias-pc kernel: nouveau E[   PFIFO][0000:01:00.0] PGRAPH
engine fault on channel 2, recovering...
Jan 06 16:04:31 matthias-pc kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 5
[0x023f926000 kwin[606]]
Jan 06 16:04:31 matthias-pc kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP0
0x80000000 0x80000001
Jan 06 16:04:31 matthias-pc kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP1
0x80000000 0x80000001
Jan 06 16:04:31 matthias-pc kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP2
0x80000000 0x80000001

For a complete log and more system information see the attached files.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1452175285.Bb6ea51.9496--

--===============1557597883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1557597883==--
