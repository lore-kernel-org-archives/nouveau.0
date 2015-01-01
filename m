From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87934] New: nouveau errors on archlinux while
 running War Thunder native (not via steam)
Date: Thu, 01 Jan 2015 14:59:51 +0000
Message-ID: <bug-87934-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1336567546=="
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


--===============1336567546==
Content-Type: multipart/alternative; boundary="1420124391.5E2060.19869"; charset="UTF-8"


--1420124391.5E2060.19869
Date: Thu, 1 Jan 2015 14:59:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87934

            Bug ID: 87934
           Summary: nouveau errors on archlinux while running War Thunder
                    native (not via steam)
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: elia.shreidler-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

Created attachment 111608
  --> https://bugs.freedesktop.org/attachment.cgi?id=111608&action=edit
dmesg dump

while executing: War Thunder (PC game) on Arch linux - 

$ uname -a
Linux *** 3.17.6-1-ARCH #1 SMP PREEMPT Sun Dec 7 23:43:32 UTC 2014 x86_64
GNU/Linux

with gnome 3.14 - 
$ gnome-shell --version
GNOME Shell 3.14.3

the game crashed (back to gnome) and I saw many nouveau errors in dmesg,
like:

$ less /tmp/kernel_log.txt
[15082.709700] nouveau E[aces[7473]] push 1 buffer not in list
[15083.028540] nouveau E[aces[7473]] Unknown handle 0x000000be
[15083.028544] nouveau E[aces[7473]] validate_init
[15083.028545] nouveau E[aces[7473]] validate: -2
[15459.888435] nouveau E[  PGRAPH][0000:06:00.0] DATA_ERROR [INVALID_BITFIELD]
ch 7 [0x003f97b000 aces[7473]] subc 0 class 0x9097 mthd 0x1b00 data 0x200308e0
[15459.888467] nouveau E[  PGRAPH][0000:06:00.0] DATA_ERROR [INVALID_BITFIELD]
ch 7 [0x003f97b000 aces[7473]] subc 0 class 0x9097 mthd 0x1b0c data 0x003a0000
[15459.916871] nouveau E[aces[7473]] push 1 buffer not in list
[15459.917151] nouveau E[   PFIFO][0000:06:00.0] PBDMA0: ILLEGAL_MTHD
[15459.917157] nouveau E[   PFIFO][0000:06:00.0] PBDMA0: ch 7 [aces[7473]] subc
0 mthd 0x000c data 0x39888889
[15459.917176] nouveau E[   PFIFO][0000:06:00.0] PBDMA0: (unknown bits
0x02000000)
[15459.917179] nouveau E[   PFIFO][0000:06:00.0] PBDMA0: ch 7 [aces[7473]] subc
0 mthd 0x0020 data 0x00000200
[15459.917200] nouveau E[   PFIFO][0000:06:00.0] PBDMA0: ILLEGAL_MTHD
[15459.917203] nouveau E[   PFIFO][0000:06:00.0] PBDMA0: ch 7 [aces[7473]] subc
0 mthd 0x0030 data 0x00000000
[15459.917222] nouveau E[   PFIFO][0000:06:00.0] PBDMA0: ILLEGAL_MTHD

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1420124391.5E2060.19869
Date: Thu, 1 Jan 2015 14:59:51 +0000
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
   title="NEW - nouveau errors on archlinux while running War Thunder native (not via steam)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87934">87934</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau errors on archlinux while running War Thunder native (not via steam)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>elia.shreidler&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=111608" name="attach_111608" title="dmesg dump">attachment 111608</a> <a href="attachment.cgi?id=111608&amp;action=edit" title="dmesg dump">[details]</a></span>
dmesg dump

while executing: War Thunder (PC game) on Arch linux - 

$ uname -a
Linux *** 3.17.6-1-ARCH #1 SMP PREEMPT Sun Dec 7 23:43:32 UTC 2014 x86_64
GNU/Linux

with gnome 3.14 - 
$ gnome-shell --version
GNOME Shell 3.14.3

the game crashed (back to gnome) and I saw many nouveau errors in dmesg,
like:

$ less /tmp/kernel_log.txt
[15082.709700] nouveau E[aces[7473]] push 1 buffer not in list
[15083.028540] nouveau E[aces[7473]] Unknown handle 0x000000be
[15083.028544] nouveau E[aces[7473]] validate_init
[15083.028545] nouveau E[aces[7473]] validate: -2
[15459.888435] nouveau E[  PGRAPH][0000:06:00.0] DATA_ERROR [INVALID_BITFIELD]
ch 7 [0x003f97b000 aces[7473]] subc 0 class 0x9097 mthd 0x1b00 data 0x200308e0
[15459.888467] nouveau E[  PGRAPH][0000:06:00.0] DATA_ERROR [INVALID_BITFIELD]
ch 7 [0x003f97b000 aces[7473]] subc 0 class 0x9097 mthd 0x1b0c data 0x003a0000
[15459.916871] nouveau E[aces[7473]] push 1 buffer not in list
[15459.917151] nouveau E[   PFIFO][0000:06:00.0] PBDMA0: ILLEGAL_MTHD
[15459.917157] nouveau E[   PFIFO][0000:06:00.0] PBDMA0: ch 7 [aces[7473]] subc
0 mthd 0x000c data 0x39888889
[15459.917176] nouveau E[   PFIFO][0000:06:00.0] PBDMA0: (unknown bits
0x02000000)
[15459.917179] nouveau E[   PFIFO][0000:06:00.0] PBDMA0: ch 7 [aces[7473]] subc
0 mthd 0x0020 data 0x00000200
[15459.917200] nouveau E[   PFIFO][0000:06:00.0] PBDMA0: ILLEGAL_MTHD
[15459.917203] nouveau E[   PFIFO][0000:06:00.0] PBDMA0: ch 7 [aces[7473]] subc
0 mthd 0x0030 data 0x00000000
[15459.917222] nouveau E[   PFIFO][0000:06:00.0] PBDMA0: ILLEGAL_MTHD</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420124391.5E2060.19869--

--===============1336567546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1336567546==--
