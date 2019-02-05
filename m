From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109556] New: [NV50/GT200] fifo: DMA_PUSHER ... (err:
 INVALID_CMD) push 00400040
Date: Tue, 05 Feb 2019 10:32:38 +0000
Message-ID: <bug-109556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0507834636=="
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


--===============0507834636==
Content-Type: multipart/alternative; boundary="15493627600.aEa1.19301"
Content-Transfer-Encoding: 7bit


--15493627600.aEa1.19301
Date: Tue, 5 Feb 2019 10:32:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109556

            Bug ID: 109556
           Summary: [NV50/GT200] fifo: DMA_PUSHER ... (err: INVALID_CMD)
                    push 00400040
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: bastian.beischer-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 143301
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D143301&action=3Dedit
dmesg log

I'm using Arch Linux with Linux 4.20.6, X11 and the modesetting driver toge=
ther
with the KDE plasma desktop (5.14.5). After using the desktop for a while (=
in
particular, after causing some graphics load) visual artifacts appear and
plasma-desktop often hangs up. Sometimes the hanging process can be restart=
ed,
other times X is completely frozen (but can still be ssh'ed into).

The dmesg log shows these lines, although only the fifo DMA_PUSHER lines se=
em
to consistently appear every time the problem is triggered:

[  227.576711] nouveau 0000:04:00.0: fifo: DMA_PUSHER - ch 6 [Xorg[751]] get
00000eb764 put 00000ec8ec ib_get 00000167 ib_put 0000016a state 80006eac (e=
rr:
INVALID_CMD) push 00400040
[  227.630897] nouveau 0000:04:00.0: gr: DATA_ERROR 00000005 [INVALID_ENUM]
[  227.630904] nouveau 0000:04:00.0: gr: 00100000 [] ch 6 [007f437000
Xorg[751]] subc 3 class 8397 mthd 1348 data 00046da0
[  227.630916] nouveau 0000:04:00.0: fifo: DMA_PUSHER - ch 6 [Xorg[751]] get
00000fcb8c put 0000102f84 ib_get 00000178 ib_put 0000017c state 80007354 (e=
rr:
INVALID_CMD) push 00400040
[  227.630926] nouveau 0000:04:00.0: gr: DATA_ERROR 00000005 [INVALID_ENUM]
[  227.630929] nouveau 0000:04:00.0: gr: 00100000 [] ch 6 [007f437000
Xorg[751]] subc 3 class 8397 mthd 134c data 00000000
[  227.630938] nouveau 0000:04:00.0: gr: DATA_ERROR 00000005 [INVALID_ENUM]
[  227.630941] nouveau 0000:04:00.0: gr: 00100000 [] ch 6 [007f437000
Xorg[751]] subc 3 class 8397 mthd 1350 data 000479d0
[  227.630950] nouveau 0000:04:00.0: gr: DATA_ERROR 00000005 [INVALID_ENUM]
[  227.630953] nouveau 0000:04:00.0: gr: 00100000 [] ch 6 [007f437000
Xorg[751]] subc 3 class 8397 mthd 1348 data 00046da0
[  227.630964] nouveau 0000:04:00.0: fifo: DMA_PUSHER - ch 6 [Xorg[751]] get
00000fcb8c put 0000102f84 ib_get 0000017a ib_put 0000017c state 80007354 (e=
rr:
INVALID_CMD) push 00400040
[  227.630975] nouveau 0000:04:00.0: gr: DATA_ERROR 00000005 [INVALID_ENUM]
[  227.630978] nouveau 0000:04:00.0: gr: 00100000 [] ch 6 [007f437000
Xorg[751]] subc 3 class 8397 mthd 134c data 00000000
[  227.630988] nouveau 0000:04:00.0: gr: DATA_ERROR 00000005 [INVALID_ENUM]
[  227.630991] nouveau 0000:04:00.0: gr: 00100000 [] ch 6 [007f437000
Xorg[751]] subc 3 class 8397 mthd 1350 data 000479d0
[  227.665017] nouveau 0000:04:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFI=
ELD]
[  227.665022] nouveau 0000:04:00.0: gr: 00100000 [] ch 6 [007f437000
Xorg[751]] subc 3 class 8397 mthd 135c data 000472e8
[  227.847944] nouveau 0000:04:00.0: fifo: DMA_PUSHER - ch 6 [Xorg[751]] get
0000138e10 put 000013b454 ib_get 000001ad ib_put 000001b0 state 40000004 (e=
rr:
INVALID_MTHD) push 00400040
[  227.850171] nouveau 0000:04:00.0: fifo: CACHE_ERROR - ch 6 [Xorg[751]] s=
ubc
0 mthd 0000 data 00146200
[  227.889579] nouveau 0000:04:00.0: Xorg[751]: multiple instances of buffe=
r 4
on validation list
[  227.889588] nouveau 0000:04:00.0: Xorg[751]: validate_init
[  227.889590] nouveau 0000:04:00.0: Xorg[751]: validate: -22
[  227.891472] nouveau 0000:04:00.0: fifo: DMA_PUSHER - ch 6 [Xorg[751]] get
0000141bf0 put 00001479b8 ib_get 000001b4 ib_put 000001b5 state 80007418 (e=
rr:
INVALID_CMD) push 00400040

(the full dmesg.log is attached)

This problem is rather new. It was introduced with a package upgrade in Arch
Linux that happened within the last few days (I will attach the pacman upgr=
ade
log for those who want to know.)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15493627600.aEa1.19301
Date: Tue, 5 Feb 2019 10:32:40 +0000
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
   title=3D"NEW - [NV50/GT200] fifo: DMA_PUSHER ... (err: INVALID_CMD) push=
 00400040"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109556">109556</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV50/GT200] fifo: DMA_PUSHER ... (err: INVALID_CMD) push 004=
00040
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
          <td>bastian.beischer&#64;rwth-aachen.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D143301=
" name=3D"attach_143301" title=3D"dmesg log">attachment 143301</a> <a href=
=3D"attachment.cgi?id=3D143301&amp;action=3Dedit" title=3D"dmesg log">[deta=
ils]</a></span>
dmesg log

I'm using Arch Linux with Linux 4.20.6, X11 and the modesetting driver toge=
ther
with the KDE plasma desktop (5.14.5). After using the desktop for a while (=
in
particular, after causing some graphics load) visual artifacts appear and
plasma-desktop often hangs up. Sometimes the hanging process can be restart=
ed,
other times X is completely frozen (but can still be ssh'ed into).

The dmesg log shows these lines, although only the fifo DMA_PUSHER lines se=
em
to consistently appear every time the problem is triggered:

[  227.576711] nouveau 0000:04:00.0: fifo: DMA_PUSHER - ch 6 [Xorg[751]] get
00000eb764 put 00000ec8ec ib_get 00000167 ib_put 0000016a state 80006eac (e=
rr:
INVALID_CMD) push 00400040
[  227.630897] nouveau 0000:04:00.0: gr: DATA_ERROR 00000005 [INVALID_ENUM]
[  227.630904] nouveau 0000:04:00.0: gr: 00100000 [] ch 6 [007f437000
Xorg[751]] subc 3 class 8397 mthd 1348 data 00046da0
[  227.630916] nouveau 0000:04:00.0: fifo: DMA_PUSHER - ch 6 [Xorg[751]] get
00000fcb8c put 0000102f84 ib_get 00000178 ib_put 0000017c state 80007354 (e=
rr:
INVALID_CMD) push 00400040
[  227.630926] nouveau 0000:04:00.0: gr: DATA_ERROR 00000005 [INVALID_ENUM]
[  227.630929] nouveau 0000:04:00.0: gr: 00100000 [] ch 6 [007f437000
Xorg[751]] subc 3 class 8397 mthd 134c data 00000000
[  227.630938] nouveau 0000:04:00.0: gr: DATA_ERROR 00000005 [INVALID_ENUM]
[  227.630941] nouveau 0000:04:00.0: gr: 00100000 [] ch 6 [007f437000
Xorg[751]] subc 3 class 8397 mthd 1350 data 000479d0
[  227.630950] nouveau 0000:04:00.0: gr: DATA_ERROR 00000005 [INVALID_ENUM]
[  227.630953] nouveau 0000:04:00.0: gr: 00100000 [] ch 6 [007f437000
Xorg[751]] subc 3 class 8397 mthd 1348 data 00046da0
[  227.630964] nouveau 0000:04:00.0: fifo: DMA_PUSHER - ch 6 [Xorg[751]] get
00000fcb8c put 0000102f84 ib_get 0000017a ib_put 0000017c state 80007354 (e=
rr:
INVALID_CMD) push 00400040
[  227.630975] nouveau 0000:04:00.0: gr: DATA_ERROR 00000005 [INVALID_ENUM]
[  227.630978] nouveau 0000:04:00.0: gr: 00100000 [] ch 6 [007f437000
Xorg[751]] subc 3 class 8397 mthd 134c data 00000000
[  227.630988] nouveau 0000:04:00.0: gr: DATA_ERROR 00000005 [INVALID_ENUM]
[  227.630991] nouveau 0000:04:00.0: gr: 00100000 [] ch 6 [007f437000
Xorg[751]] subc 3 class 8397 mthd 1350 data 000479d0
[  227.665017] nouveau 0000:04:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFI=
ELD]
[  227.665022] nouveau 0000:04:00.0: gr: 00100000 [] ch 6 [007f437000
Xorg[751]] subc 3 class 8397 mthd 135c data 000472e8
[  227.847944] nouveau 0000:04:00.0: fifo: DMA_PUSHER - ch 6 [Xorg[751]] get
0000138e10 put 000013b454 ib_get 000001ad ib_put 000001b0 state 40000004 (e=
rr:
INVALID_MTHD) push 00400040
[  227.850171] nouveau 0000:04:00.0: fifo: CACHE_ERROR - ch 6 [Xorg[751]] s=
ubc
0 mthd 0000 data 00146200
[  227.889579] nouveau 0000:04:00.0: Xorg[751]: multiple instances of buffe=
r 4
on validation list
[  227.889588] nouveau 0000:04:00.0: Xorg[751]: validate_init
[  227.889590] nouveau 0000:04:00.0: Xorg[751]: validate: -22
[  227.891472] nouveau 0000:04:00.0: fifo: DMA_PUSHER - ch 6 [Xorg[751]] get
0000141bf0 put 00001479b8 ib_get 000001b4 ib_put 000001b5 state 80007418 (e=
rr:
INVALID_CMD) push 00400040

(the full dmesg.log is attached)

This problem is rather new. It was introduced with a package upgrade in Arch
Linux that happened within the last few days (I will attach the pacman upgr=
ade
log for those who want to know.)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15493627600.aEa1.19301--

--===============0507834636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0507834636==--
