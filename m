From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90486] New: Lockups on GTX 680
Date: Sat, 16 May 2015 20:53:45 +0000
Message-ID: <bug-90486-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1538795355=="
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


--===============1538795355==
Content-Type: multipart/alternative; boundary="1431809625.1bf6b1.8227"; charset="UTF-8"


--1431809625.1bf6b1.8227
Date: Sat, 16 May 2015 20:53:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90486

            Bug ID: 90486
           Summary: Lockups on GTX 680
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: tavianator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 115843
  --> https://bugs.freedesktop.org/attachment.cgi?id=115843&action=edit
dmesg output

Since installing Plasma 5, I'm getting a lot of lockups even with compositing
disabled.  As far as I can tell, the relevant part of dmesg is

[ 2043.225653] nouveau E[   PFIFO][0000:08:00.0] read fault at 0x0000490000
[PTE] from GR/S\
CC on channel 0x007edf8000 [kwin_x11[2256]]
[ 2043.225660] nouveau E[   PFIFO][0000:08:00.0] PGR engine fault on channel
12, recovering\
...
[ 2092.200410] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: SIGNATURE
[ 2092.200416] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: ch 13 [vlc[4136]] subc
0 mthd 0x00\
00 data 0x00000000
[ 2092.200430] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: SIGNATURE
[ 2092.200433] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: ch 13 [vlc[4136]] subc
0 mthd 0x00\
00 data 0x00000000
[ 2092.200446] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: GPPTR PBENTRY
SIGNATURE
[ 2092.200450] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: ch 13 [vlc[4136]] subc
0 mthd 0x00\
00 data 0x00000000
[ 2092.200463] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: GPPTR SIGNATURE
[ 2092.200465] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: ch 13 [vlc[4136]] subc
0 mthd 0x00\
00 data 0x00000000
[ 2092.200478] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: SIGNATURE
[ 2092.200481] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: ch 13 [vlc[4136]] subc
0 mthd 0x00\
00 data 0x00000000
[ 2092.200494] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: SIGNATURE
[ 2092.200496] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: ch 13 [vlc[4136]] subc
0 mthd 0x00\
00 data 0x00000000
[ 2092.200511] nouveau E[   PFIFO][0000:08:00.0] read fault at 0x0000000000
[PDE] from UNK0\
a/HOST on channel 0x007ecf9000 [unknown]
[ 2092.200706] nouveau 0000:08:00.0: Direct firmware load for
nouveau/nve4_fuc084 failed wi\
th error -2
[ 2092.200716] nouveau 0000:08:00.0: Direct firmware load for
nouveau/nve4_fuc084d failed w\
ith error -2
[ 2092.200718] nouveau E[  PMSVLD][0000:08:00.0] unable to load firmware data
[ 2092.200719] nouveau E[  PMSVLD][0000:08:00.0] init failed, -2
[ 2107.210428] nouveau E[vlc[4136]] failed to idle channel 0xcccc0001
[vlc[4136]]
[ 2122.222450] nouveau E[vlc[4136]] failed to idle channel 0xcccc0001
[vlc[4136]]
[ 2152.018150] nouveau 0000:08:00.0: Direct firmware load for
nouveau/nve4_fuc084 failed wi\
th error -2
[ 2152.018161] nouveau 0000:08:00.0: Direct firmware load for
nouveau/nve4_fuc084d failed w\
ith error -2

In this case vlc triggered it, but often it's some other process like Xorg.bin.
 Interestingly the machine was usable for a few minutes after this but then
locked up.  The display froze and ssh would prompt for a password but hang
before the shell started.  Rebooting with magic SysRq worked.

dmesg output attached.  Let me know what else I can do to collect debugging
information.

Hardware is

# lspci | grep VGA
01:01.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Graphics
Family (rev 10)
08:00.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 680]
(rev a1)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431809625.1bf6b1.8227
Date: Sat, 16 May 2015 20:53:45 +0000
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
   title="NEW - Lockups on GTX 680"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90486">90486</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Lockups on GTX 680
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
          <td>tavianator&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=115843" name="attach_115843" title="dmesg output">attachment 115843</a> <a href="attachment.cgi?id=115843&amp;action=edit" title="dmesg output">[details]</a></span>
dmesg output

Since installing Plasma 5, I'm getting a lot of lockups even with compositing
disabled.  As far as I can tell, the relevant part of dmesg is

[ 2043.225653] nouveau E[   PFIFO][0000:08:00.0] read fault at 0x0000490000
[PTE] from GR/S\
CC on channel 0x007edf8000 [kwin_x11[2256]]
[ 2043.225660] nouveau E[   PFIFO][0000:08:00.0] PGR engine fault on channel
12, recovering\
...
[ 2092.200410] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: SIGNATURE
[ 2092.200416] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: ch 13 [vlc[4136]] subc
0 mthd 0x00\
00 data 0x00000000
[ 2092.200430] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: SIGNATURE
[ 2092.200433] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: ch 13 [vlc[4136]] subc
0 mthd 0x00\
00 data 0x00000000
[ 2092.200446] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: GPPTR PBENTRY
SIGNATURE
[ 2092.200450] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: ch 13 [vlc[4136]] subc
0 mthd 0x00\
00 data 0x00000000
[ 2092.200463] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: GPPTR SIGNATURE
[ 2092.200465] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: ch 13 [vlc[4136]] subc
0 mthd 0x00\
00 data 0x00000000
[ 2092.200478] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: SIGNATURE
[ 2092.200481] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: ch 13 [vlc[4136]] subc
0 mthd 0x00\
00 data 0x00000000
[ 2092.200494] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: SIGNATURE
[ 2092.200496] nouveau E[   PFIFO][0000:08:00.0] PBDMA1: ch 13 [vlc[4136]] subc
0 mthd 0x00\
00 data 0x00000000
[ 2092.200511] nouveau E[   PFIFO][0000:08:00.0] read fault at 0x0000000000
[PDE] from UNK0\
a/HOST on channel 0x007ecf9000 [unknown]
[ 2092.200706] nouveau 0000:08:00.0: Direct firmware load for
nouveau/nve4_fuc084 failed wi\
th error -2
[ 2092.200716] nouveau 0000:08:00.0: Direct firmware load for
nouveau/nve4_fuc084d failed w\
ith error -2
[ 2092.200718] nouveau E[  PMSVLD][0000:08:00.0] unable to load firmware data
[ 2092.200719] nouveau E[  PMSVLD][0000:08:00.0] init failed, -2
[ 2107.210428] nouveau E[vlc[4136]] failed to idle channel 0xcccc0001
[vlc[4136]]
[ 2122.222450] nouveau E[vlc[4136]] failed to idle channel 0xcccc0001
[vlc[4136]]
[ 2152.018150] nouveau 0000:08:00.0: Direct firmware load for
nouveau/nve4_fuc084 failed wi\
th error -2
[ 2152.018161] nouveau 0000:08:00.0: Direct firmware load for
nouveau/nve4_fuc084d failed w\
ith error -2

In this case vlc triggered it, but often it's some other process like Xorg.bin.
 Interestingly the machine was usable for a few minutes after this but then
locked up.  The display froze and ssh would prompt for a password but hang
before the shell started.  Rebooting with magic SysRq worked.

dmesg output attached.  Let me know what else I can do to collect debugging
information.

Hardware is

# lspci | grep VGA
01:01.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Graphics
Family (rev 10)
08:00.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 680]
(rev a1)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431809625.1bf6b1.8227--

--===============1538795355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1538795355==--
