From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99420] New: After few days,
 nouveau crashes - Xorg and kernel crashing next.
Date: Sun, 15 Jan 2017 16:35:11 +0000
Message-ID: <bug-99420-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0916002328=="
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


--===============0916002328==
Content-Type: multipart/alternative; boundary="14844981111.CCc6A12.2479";
 charset="UTF-8"


--14844981111.CCc6A12.2479
Date: Sun, 15 Jan 2017 16:35:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99420

            Bug ID: 99420
           Summary: After few days, nouveau crashes - Xorg and kernel
                    crashing next.
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: quelque_ri1-Qt13gs6zZMY@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 128967
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D128967&action=3Dedit
Journal when bug crashes

After a few days of normal usage, without reboot, nouveau crashes. It happe=
ned
more than once, but no clear pattern emerge to know how to reproduce it. To=
 my
knowledge, it could be as much as a video memory overflow than anything els=
e.

I attached the journal. (No dmesg, because it was a complete crash - no
possible switch to tty). What seems to be interesting is the line 660 and
below. I joined a bit more detail before (it is not the complete log) becau=
se
some error from nouveau may be interesting before, even though it didn't re=
sult
in any crashes before.

I think it is the right place to commit this message. Please tell me if I am
wrong.

More details on my setup
I am running archlinux - 4.8.13-1-ARCH #1
xf86-video-nouveau Version : 1.0.13-1
mesa : 13.0.3-1
xorg-server : 1.18.4-1

lspci -vv:
01:00.0 VGA compatible controller: NVIDIA Corporation GT216M [GeForce GT 32=
0M]
(rev a2) (prog-if 00 [VGA controller])
        Subsystem: Acer Incorporated [ALI] Device 036d
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 28
        Region 0: Memory at b2000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at a0000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at b0000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at 3000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: <access denied>
        Kernel driver in use: nouveau
        Kernel modules: nouveau


You can ask for any missing information!

Cheers! :o)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14844981111.CCc6A12.2479
Date: Sun, 15 Jan 2017 16:35:11 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - After few days, nouveau crashes - Xorg and kernel crashin=
g next."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99420">99420</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>After few days, nouveau crashes - Xorg and kernel crashing ne=
xt.
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
          <td>quelque_ri1&#64;yahoo.fr
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D128967=
" name=3D"attach_128967" title=3D"Journal when bug crashes">attachment 1289=
67</a> <a href=3D"attachment.cgi?id=3D128967&amp;action=3Dedit" title=3D"Jo=
urnal when bug crashes">[details]</a></span>
Journal when bug crashes

After a few days of normal usage, without reboot, nouveau crashes. It happe=
ned
more than once, but no clear pattern emerge to know how to reproduce it. To=
 my
knowledge, it could be as much as a video memory overflow than anything els=
e.

I attached the journal. (No dmesg, because it was a complete crash - no
possible switch to tty). What seems to be interesting is the line 660 and
below. I joined a bit more detail before (it is not the complete log) becau=
se
some error from nouveau may be interesting before, even though it didn't re=
sult
in any crashes before.

I think it is the right place to commit this message. Please tell me if I am
wrong.

More details on my setup
I am running archlinux - 4.8.13-1-ARCH #1
xf86-video-nouveau Version : 1.0.13-1
mesa : 13.0.3-1
xorg-server : 1.18.4-1

lspci -vv:
01:00.0 VGA compatible controller: NVIDIA Corporation GT216M [GeForce GT 32=
0M]
(rev a2) (prog-if 00 [VGA controller])
        Subsystem: Acer Incorporated [ALI] Device 036d
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast &gt;TAbort-=
 &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 28
        Region 0: Memory at b2000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at a0000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at b0000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at 3000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: &lt;access denied&gt;
        Kernel driver in use: nouveau
        Kernel modules: nouveau


You can ask for any missing information!

Cheers! :o)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14844981111.CCc6A12.2479--

--===============0916002328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0916002328==--
