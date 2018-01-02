From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104448] New: [NV106/GK208B] Multiple issues / hangs
 with nouveau driver
Date: Tue, 02 Jan 2018 08:20:25 +0000
Message-ID: <bug-104448-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0108700981=="
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


--===============0108700981==
Content-Type: multipart/alternative; boundary="15148812250.EcAeA3A.8069";
 charset="UTF-8"


--15148812250.EcAeA3A.8069
Date: Tue, 2 Jan 2018 08:20:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104448

            Bug ID: 104448
           Summary: [NV106/GK208B] Multiple issues / hangs with nouveau
                    driver
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: awilfox-EG4NeYC890/CfDggNXIi3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 136481
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D136481&action=3Dedit
dmesg from the affected computer

I am the project lead of the Ad=C3=A9lie distribution, a new desktop distri=
bution
based on musl libc.  I'm trying to ensure stability on different sets of
hardware.  Everything is going well, except for nouveau.

On my Tesla cards (NV92 and NV94), all seems well.  However, my test NV94 c=
ard
just died, so I replaced it with an NV106:

07:00.0 VGA compatible controller: NVIDIA Corporation GK208 [GeForce GT 730]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: Device 196e:1119
        Flags: bus master, fast devsel, latency 0, IRQ 27
        Memory at b0000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at b8000000 (64-bit, prefetchable) [size=3D128M]
        Memory at c0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at 1000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Kernel driver in use: nouveau

This is a PNY card, PCI-e x8, in x16 slot (only free slot left) on an Intel
S5000XVN.

We were tracking this bug on our own bug tracker, as we originally thought =
it
could be due to musl or out-of-date packages.  That was back in the kernel =
4.4
days.  It seems that it probably isn't, though, since no updates seem to ha=
ve
helped.

I will now share what we have there.


Kernel 4.14.8-mc2
libdrm 2.4.85
Mesa 17.3.1-r1
xf86-video-nouveau 1.0.15


Card ID:

[    8.851747] nouveau 0000:07:00.0: NVIDIA GK208B (b06070b1)
[    8.962115] nouveau 0000:07:00.0: bios: version 80.28.78.00.4e
[    8.963575] nouveau 0000:07:00.0: fb: 2048 MiB DDR3


Attempting to switch from Firefox playing a YouTube video in 1080p
(https://www.youtube.com/watch?v=3DpOlWbSUQASs) to TigerVNC Viewer (which w=
as
minimised) using composited icon task manager in Plasma 5 (with live
thumbnails), the machine locked up:


[ 4718.271933] nouveau 0000:07:00.0: gr: TRAP ch 2 [007fb31000 X[2141]]
[ 4718.271944] nouveau 0000:07:00.0: gr: GPC0/TPC0/TEX: 80000049
[ 4718.271948] nouveau 0000:07:00.0: gr: GPC0/TPC1/TEX: 80000049
[ 4718.271960] nouveau 0000:07:00.0: fifo: read fault at 0000260000 engine =
00
[GR] client 01 [GPC0/T1_0] reason 02 [PTE] on channel 2 [007fb31000 X[2141]]
[ 4718.271971] nouveau 0000:07:00.0: fifo: channel 2: killed
[ 4718.271974] nouveau 0000:07:00.0: fifo: runlist 0: scheduled for recovery
[ 4718.271978] nouveau 0000:07:00.0: fifo: engine 0: scheduled for recovery
[ 4718.271990] nouveau 0000:07:00.0: X[2141]: channel 2 killed!


Screen stuck with a picture.  No input is accepted.  Information must be
gathered over SSH.

After some debugging and writing all this down, my attempt to `pkill -9 X`
yielded ssh locking up for 15 seconds, then the screen showing "No signal" =
and
ssh responding again with the following additional messages:


[ 5250.030144] nouveau 0000:07:00.0: kwin_x11[2212]: failed to idle channel=
 7
[kwin_x11[2212]]
[ 5265.030142] nouveau 0000:07:00.0: kwin_x11[2212]: failed to idle channel=
 7
[kwin_x11[2212]]
[ 5265.030232] nouveau 0000:07:00.0: fifo: read fault at 0000130000 engine =
07
[HOST0] client 07 [HOST_CPU] reason 02 [PTE] on channel 2 [007f8e2000
kwin_x11[2212]]
[ 5265.030241] nouveau 0000:07:00.0: fifo: channel 7: killed
[ 5265.030244] nouveau 0000:07:00.0: fifo: runlist 0: scheduled for recovery
[ 5265.030871] nouveau 0000:07:00.0: kwin_x11[2212]: channel 7 killed!


TTYs no longer worked.  Running `startx` from SSH brought up a new Plasma
session on X display :1.  After restarting X11, TTYs work correctly again.

While scrolling through https://bugs.freedesktop.org/show_bug.cgi?id=3D9207=
7 (in
the middle of comment 17), I noticed that while I still had mouse button 0 =
down
and was moving the cursor over Firefox's scroll bar, the scroll bar was no
longer moving and neither was the content of the page.  The mouse was still
accepting input, but I could not switch to a TTY.  Everything else was lock=
ed.


New messages in dmesg:

[ 7474.808501] nouveau 0000:07:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 7474.808514] nouveau 0000:07:00.0: fifo: runlist 0: scheduled for recovery
[ 7474.808523] nouveau 0000:07:00.0: fifo: channel 8: killed
[ 7474.808532] nouveau 0000:07:00.0: fifo: engine 0: scheduled for recovery
[ 7474.808632] nouveau 0000:07:00.0: plasmashell[3872]: channel 8 killed!


`pkill -9 X` was a very simple fix this time.  It threw me back to "No sign=
al"
on the monitor, but then when I ran `startx` again, I was immediately greet=
ed
with my normal desktop.  Now there is a Plasma session on X display :2.  FW=
IW,
there aren't any other X servers running.


Software that is always running when this happens (I don't know if one of t=
hem
is the culprit):

pidgin-2.12.0-r0
konsole-17.08.2-r0
firefox-esr-52.3.0-r0
All the KDE Plasma components at 5.8.7.
tigervnc-1.8.0-r0

One time, Quaternion (0.0.5-r0) was open, but it happened the second time
without Quaternion open, so I doubt it is the cause.

It only seems to take about half an hour to make this happen under my curre=
nt
workflow, so I think debugging may be easy.  I just don't know what to do to
debug further.

Attached is entire dmesg, and Xorg.*.log.  Sorry, I don't have debugfs enab=
led
here, so I can't grab VBIOS yet.  I will do that if needed, but it will nee=
d a
reboot.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15148812250.EcAeA3A.8069
Date: Tue, 2 Jan 2018 08:20:25 +0000
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
   title=3D"NEW - [NV106/GK208B] Multiple issues / hangs with nouveau drive=
r"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104448">104448</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV106/GK208B] Multiple issues / hangs with nouveau driver
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
          <td>awilfox&#64;adelielinux.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D136481=
" name=3D"attach_136481" title=3D"dmesg from the affected computer">attachm=
ent 136481</a> <a href=3D"attachment.cgi?id=3D136481&amp;action=3Dedit" tit=
le=3D"dmesg from the affected computer">[details]</a></span>
dmesg from the affected computer

I am the project lead of the Ad=C3=A9lie distribution, a new desktop distri=
bution
based on musl libc.  I'm trying to ensure stability on different sets of
hardware.  Everything is going well, except for nouveau.

On my Tesla cards (NV92 and NV94), all seems well.  However, my test NV94 c=
ard
just died, so I replaced it with an NV106:

07:00.0 VGA compatible controller: NVIDIA Corporation GK208 [GeForce GT 730]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: Device 196e:1119
        Flags: bus master, fast devsel, latency 0, IRQ 27
        Memory at b0000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at b8000000 (64-bit, prefetchable) [size=3D128M]
        Memory at c0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at 1000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Kernel driver in use: nouveau

This is a PNY card, PCI-e x8, in x16 slot (only free slot left) on an Intel
S5000XVN.

We were tracking this bug on our own bug tracker, as we originally thought =
it
could be due to musl or out-of-date packages.  That was back in the kernel =
4.4
days.  It seems that it probably isn't, though, since no updates seem to ha=
ve
helped.

I will now share what we have there.


Kernel 4.14.8-mc2
libdrm 2.4.85
Mesa 17.3.1-r1
xf86-video-nouveau 1.0.15


Card ID:

[    8.851747] nouveau 0000:07:00.0: NVIDIA GK208B (b06070b1)
[    8.962115] nouveau 0000:07:00.0: bios: version 80.28.78.00.4e
[    8.963575] nouveau 0000:07:00.0: fb: 2048 MiB DDR3


Attempting to switch from Firefox playing a YouTube video in 1080p
(<a href=3D"https://www.youtube.com/watch?v=3DpOlWbSUQASs">https://www.yout=
ube.com/watch?v=3DpOlWbSUQASs</a>) to TigerVNC Viewer (which was
minimised) using composited icon task manager in Plasma 5 (with live
thumbnails), the machine locked up:


[ 4718.271933] nouveau 0000:07:00.0: gr: TRAP ch 2 [007fb31000 X[2141]]
[ 4718.271944] nouveau 0000:07:00.0: gr: GPC0/TPC0/TEX: 80000049
[ 4718.271948] nouveau 0000:07:00.0: gr: GPC0/TPC1/TEX: 80000049
[ 4718.271960] nouveau 0000:07:00.0: fifo: read fault at 0000260000 engine =
00
[GR] client 01 [GPC0/T1_0] reason 02 [PTE] on channel 2 [007fb31000 X[2141]]
[ 4718.271971] nouveau 0000:07:00.0: fifo: channel 2: killed
[ 4718.271974] nouveau 0000:07:00.0: fifo: runlist 0: scheduled for recovery
[ 4718.271978] nouveau 0000:07:00.0: fifo: engine 0: scheduled for recovery
[ 4718.271990] nouveau 0000:07:00.0: X[2141]: channel 2 killed!


Screen stuck with a picture.  No input is accepted.  Information must be
gathered over SSH.

After some debugging and writing all this down, my attempt to `pkill -9 X`
yielded ssh locking up for 15 seconds, then the screen showing &quot;No sig=
nal&quot; and
ssh responding again with the following additional messages:


[ 5250.030144] nouveau 0000:07:00.0: kwin_x11[2212]: failed to idle channel=
 7
[kwin_x11[2212]]
[ 5265.030142] nouveau 0000:07:00.0: kwin_x11[2212]: failed to idle channel=
 7
[kwin_x11[2212]]
[ 5265.030232] nouveau 0000:07:00.0: fifo: read fault at 0000130000 engine =
07
[HOST0] client 07 [HOST_CPU] reason 02 [PTE] on channel 2 [007f8e2000
kwin_x11[2212]]
[ 5265.030241] nouveau 0000:07:00.0: fifo: channel 7: killed
[ 5265.030244] nouveau 0000:07:00.0: fifo: runlist 0: scheduled for recovery
[ 5265.030871] nouveau 0000:07:00.0: kwin_x11[2212]: channel 7 killed!


TTYs no longer worked.  Running `startx` from SSH brought up a new Plasma
session on X display :1.  After restarting X11, TTYs work correctly again.

While scrolling through <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engi=
ne fault"
   href=3D"show_bug.cgi?id=3D92077">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D92077</a> (in
the middle of <a href=3D"show_bug.cgi?id=3D104448#c17">comment 17</a>), I n=
oticed that while I still had mouse button 0 down
and was moving the cursor over Firefox's scroll bar, the scroll bar was no
longer moving and neither was the content of the page.  The mouse was still
accepting input, but I could not switch to a TTY.  Everything else was lock=
ed.


New messages in dmesg:

[ 7474.808501] nouveau 0000:07:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 7474.808514] nouveau 0000:07:00.0: fifo: runlist 0: scheduled for recovery
[ 7474.808523] nouveau 0000:07:00.0: fifo: channel 8: killed
[ 7474.808532] nouveau 0000:07:00.0: fifo: engine 0: scheduled for recovery
[ 7474.808632] nouveau 0000:07:00.0: plasmashell[3872]: channel 8 killed!


`pkill -9 X` was a very simple fix this time.  It threw me back to &quot;No=
 signal&quot;
on the monitor, but then when I ran `startx` again, I was immediately greet=
ed
with my normal desktop.  Now there is a Plasma session on X display :2.  FW=
IW,
there aren't any other X servers running.


Software that is always running when this happens (I don't know if one of t=
hem
is the culprit):

pidgin-2.12.0-r0
konsole-17.08.2-r0
firefox-esr-52.3.0-r0
All the KDE Plasma components at 5.8.7.
tigervnc-1.8.0-r0

One time, Quaternion (0.0.5-r0) was open, but it happened the second time
without Quaternion open, so I doubt it is the cause.

It only seems to take about half an hour to make this happen under my curre=
nt
workflow, so I think debugging may be easy.  I just don't know what to do to
debug further.

Attached is entire dmesg, and Xorg.*.log.  Sorry, I don't have debugfs enab=
led
here, so I can't grab VBIOS yet.  I will do that if needed, but it will nee=
d a
reboot.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15148812250.EcAeA3A.8069--

--===============0108700981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0108700981==--
