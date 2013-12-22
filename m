From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72978] New: nouveau E[ PFIFO][0000:01:00.0]
	CACHE_ERROR
Date: Sun, 22 Dec 2013 20:37:23 +0000
Message-ID: <bug-72978-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0221806419=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0221806419==
Content-Type: multipart/alternative; boundary="1387744643.2aFF81.18928"; charset="us-ascii"


--1387744643.2aFF81.18928
Date: Sun, 22 Dec 2013 20:37:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72978

          Priority: medium
            Bug ID: 72978
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: mikhail.v.gavrilov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 91136
  --> https://bugs.freedesktop.org/attachment.cgi?id=91136&action=edit
kernel log

uname -a
Linux localhost.localdomain 3.12.5-302.fc20.i686+PAE #1 SMP Tue Dec 17 20:51:40
UTC 2013 i686 i686 i386 GNU/Linux

[ 7080.782589] nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 7
[Anna[7914]] subc 0 mthd 0x0060 data 0xbeef0201
[ 7151.678580] warning: process `MetroLL' used the deprecated sysctl system
call with 10.1.
[ 7152.408808] MetroLL[8098]: segfault at 0 ip 08f1a809 sp bff37510 error 4 in
MetroLL[8048000+1336000]
[ 7208.835103] fm (8122): /proc/8177/oom_adj is deprecated, please use
/proc/8177/oom_score_adj instead.
[ 7283.219248] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 4
[gnome-shell[1368]] get 0x0020080cf4 put 0x0020081678 ib_get 0x000001c2 ib_put
0x000001c3 state 0x80000024 (err: INVALID_CMD) push 0x00406040
[ 7283.222138] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 0 - Unknown
fault at address 004a9e0000
[ 7283.222144] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 0 - e0c:
00000000, e18: 00000000, e1c: 00000000, e20: 00002a00, e24: 00030000
[ 7283.222155] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 1 - Unknown
fault at address 004a9e1200
[ 7283.222160] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 1 - e0c:
00000000, e18: 00000000, e1c: 00080010, e20: 00002a00, e24: 00030000
[ 7283.222170] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 2 - Unknown
fault at address 004a9e2000
[ 7283.222174] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 2 - e0c:
00000000, e18: 00000000, e1c: 00000020, e20: 00002a00, e24: 00030000
[ 7283.222184] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 3 - Unknown
fault at address 004a9e1400
[ 7283.222189] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 3 - e0c:
00000000, e18: 00000000, e1c: 0010001c, e20: 00002a00, e24: 00030000
[ 7283.222199] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 4 - Unknown
fault at address 004a9e2400
[ 7283.222203] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 4 - e0c:
00000000, e18: 00000000, e1c: 00100020, e20: 00002a00, e24: 00030000
[ 7283.222212] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 5 - Unknown
fault at address 004a9e3600
[ 7283.222216] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 5 - e0c:
00000000, e18: 00000000, e1c: 00180030, e20: 00002a00, e24: 00030000
[ 7283.222226] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 6 - Unknown
fault at address 004a9e4400
[ 7283.222230] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 6 - e0c:
00000000, e18: 00000000, e1c: 00100040, e20: 00002a00, e24: 00030000
[ 7283.222234] nouveau E[  PGRAPH][0000:01:00.0]  TRAP
[ 7283.222242] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x001fbe9000
gnome-shell[1368]] subc 3 class 0x8297 mthd 0x1ac4 data 0x24500001
[ 7283.222254] nouveau E[     PFB][0000:01:00.0] trapped write at 0x004a9e0000
on channel 0x0001fbe9 [gnome-shell[1368]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT
[ 7283.230968] nouveau E[     PFB][0000:01:00.0] trapped write at 0x004aa91900
on channel 0x0001fbe9 [gnome-shell[1368]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT
[ 7401.313131] usb 1-4.1.3: new high-speed USB device number 7 using ehci-pci
[ 7401.387876] usb 1-4.1.3: New USB device found, idVendor=1bbb, idProduct=019b
[ 7401.387883] usb 1-4.1.3: New USB device strings: Mfr=2, Product=3,
SerialNumber=4
[ 7401.387886] usb 1-4.1.3: Product: MegaFon_SP-AI
[ 7401.387890] usb 1-4.1.3: Manufacturer: MegaFon
[ 7401.387893] usb 1-4.1.3: SerialNumber: 0123456789ABCDE
[ 7401.462206] usb-storage 1-4.1.3:1.0: USB Mass Storage device detected
[ 7401.463564] scsi10 : usb-storage 1-4.1.3:1.0
[ 7401.463708] usbcore: registered new interface driver usb-storage
[ 7402.465797] scsi 10:0:0:0: Direct-Access     MegaFon  SP-AI            0000
PQ: 0 ANSI: 2
[ 7402.466166] scsi 10:0:0:1: Direct-Access     MegaFon  SP-AI            0000
PQ: 0 ANSI: 2
[ 7402.466708] sd 10:0:0:0: Attached scsi generic sg2 type 0
[ 7402.467252] sd 10:0:0:1: Attached scsi generic sg3 type 0
[ 7402.473287] sd 10:0:0:0: [sdc] Attached SCSI removable disk
[ 7402.475150] sd 10:0:0:1: [sdd] Attached SCSI removable disk
[28159.180118] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 7
[multiwinia.bin.[17032]] get 0x0020048fb0 put 0x0020049650 ib_get 0x000001a9
ib_put 0x000001aa state 0x80000024 (err: INVALID_CMD) push 0x00406040
[28161.317610] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 7
[multiwinia.bin.[17032]] get 0x002003ff68 put 0x00200405e8 ib_get 0x00000153
ib_put 0x00000154 state 0x80000024 (err: INVALID_CMD) push 0x00406040
[28164.156831] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 7
[multiwinia.bin.[17032]] get 0x0020164bc8 put 0x0020165248 ib_get 0x0000030e
ib_put 0x0000030f state 0x80000024 (err: INVALID_CMD) push 0x00406040
[28282.019598] SELinux: initialized (dev proc, type proc), uses genfs_contexts

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387744643.2aFF81.18928
Date: Sun, 22 Dec 2013 20:37:23 +0000
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
   title="NEW --- - nouveau E[ PFIFO][0000:01:00.0] CACHE_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72978">72978</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR
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
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>mikhail.v.gavrilov&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
        <pre>Created <span class=""><a href="attachment.cgi?id=91136" name="attach_91136" title="kernel log">attachment 91136</a> <a href="attachment.cgi?id=91136&amp;action=edit" title="kernel log">[details]</a></span>
kernel log

uname -a
Linux localhost.localdomain 3.12.5-302.fc20.i686+PAE #1 SMP Tue Dec 17 20:51:40
UTC 2013 i686 i686 i386 GNU/Linux

[ 7080.782589] nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 7
[Anna[7914]] subc 0 mthd 0x0060 data 0xbeef0201
[ 7151.678580] warning: process `MetroLL' used the deprecated sysctl system
call with 10.1.
[ 7152.408808] MetroLL[8098]: segfault at 0 ip 08f1a809 sp bff37510 error 4 in
MetroLL[8048000+1336000]
[ 7208.835103] fm (8122): /proc/8177/oom_adj is deprecated, please use
/proc/8177/oom_score_adj instead.
[ 7283.219248] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 4
[gnome-shell[1368]] get 0x0020080cf4 put 0x0020081678 ib_get 0x000001c2 ib_put
0x000001c3 state 0x80000024 (err: INVALID_CMD) push 0x00406040
[ 7283.222138] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 0 - Unknown
fault at address 004a9e0000
[ 7283.222144] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 0 - e0c:
00000000, e18: 00000000, e1c: 00000000, e20: 00002a00, e24: 00030000
[ 7283.222155] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 1 - Unknown
fault at address 004a9e1200
[ 7283.222160] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 1 - e0c:
00000000, e18: 00000000, e1c: 00080010, e20: 00002a00, e24: 00030000
[ 7283.222170] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 2 - Unknown
fault at address 004a9e2000
[ 7283.222174] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 2 - e0c:
00000000, e18: 00000000, e1c: 00000020, e20: 00002a00, e24: 00030000
[ 7283.222184] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 3 - Unknown
fault at address 004a9e1400
[ 7283.222189] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 3 - e0c:
00000000, e18: 00000000, e1c: 0010001c, e20: 00002a00, e24: 00030000
[ 7283.222199] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 4 - Unknown
fault at address 004a9e2400
[ 7283.222203] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 4 - e0c:
00000000, e18: 00000000, e1c: 00100020, e20: 00002a00, e24: 00030000
[ 7283.222212] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 5 - Unknown
fault at address 004a9e3600
[ 7283.222216] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 5 - e0c:
00000000, e18: 00000000, e1c: 00180030, e20: 00002a00, e24: 00030000
[ 7283.222226] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 6 - Unknown
fault at address 004a9e4400
[ 7283.222230] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 6 - e0c:
00000000, e18: 00000000, e1c: 00100040, e20: 00002a00, e24: 00030000
[ 7283.222234] nouveau E[  PGRAPH][0000:01:00.0]  TRAP
[ 7283.222242] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x001fbe9000
gnome-shell[1368]] subc 3 class 0x8297 mthd 0x1ac4 data 0x24500001
[ 7283.222254] nouveau E[     PFB][0000:01:00.0] trapped write at 0x004a9e0000
on channel 0x0001fbe9 [gnome-shell[1368]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT
[ 7283.230968] nouveau E[     PFB][0000:01:00.0] trapped write at 0x004aa91900
on channel 0x0001fbe9 [gnome-shell[1368]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT
[ 7401.313131] usb 1-4.1.3: new high-speed USB device number 7 using ehci-pci
[ 7401.387876] usb 1-4.1.3: New USB device found, idVendor=1bbb, idProduct=019b
[ 7401.387883] usb 1-4.1.3: New USB device strings: Mfr=2, Product=3,
SerialNumber=4
[ 7401.387886] usb 1-4.1.3: Product: MegaFon_SP-AI
[ 7401.387890] usb 1-4.1.3: Manufacturer: MegaFon
[ 7401.387893] usb 1-4.1.3: SerialNumber: 0123456789ABCDE
[ 7401.462206] usb-storage 1-4.1.3:1.0: USB Mass Storage device detected
[ 7401.463564] scsi10 : usb-storage 1-4.1.3:1.0
[ 7401.463708] usbcore: registered new interface driver usb-storage
[ 7402.465797] scsi 10:0:0:0: Direct-Access     MegaFon  SP-AI            0000
PQ: 0 ANSI: 2
[ 7402.466166] scsi 10:0:0:1: Direct-Access     MegaFon  SP-AI            0000
PQ: 0 ANSI: 2
[ 7402.466708] sd 10:0:0:0: Attached scsi generic sg2 type 0
[ 7402.467252] sd 10:0:0:1: Attached scsi generic sg3 type 0
[ 7402.473287] sd 10:0:0:0: [sdc] Attached SCSI removable disk
[ 7402.475150] sd 10:0:0:1: [sdd] Attached SCSI removable disk
[28159.180118] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 7
[multiwinia.bin.[17032]] get 0x0020048fb0 put 0x0020049650 ib_get 0x000001a9
ib_put 0x000001aa state 0x80000024 (err: INVALID_CMD) push 0x00406040
[28161.317610] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 7
[multiwinia.bin.[17032]] get 0x002003ff68 put 0x00200405e8 ib_get 0x00000153
ib_put 0x00000154 state 0x80000024 (err: INVALID_CMD) push 0x00406040
[28164.156831] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 7
[multiwinia.bin.[17032]] get 0x0020164bc8 put 0x0020165248 ib_get 0x0000030e
ib_put 0x0000030f state 0x80000024 (err: INVALID_CMD) push 0x00406040
[28282.019598] SELinux: initialized (dev proc, type proc), uses genfs_contexts</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387744643.2aFF81.18928--

--===============0221806419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0221806419==--
