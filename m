From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107964] New: [GTX970] system hang when using
 libreoffice
Date: Mon, 17 Sep 2018 19:20:09 +0000
Message-ID: <bug-107964-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0207988470=="
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


--===============0207988470==
Content-Type: multipart/alternative; boundary="15372120111.2714.6159"
Content-Transfer-Encoding: 7bit


--15372120111.2714.6159
Date: Mon, 17 Sep 2018 19:20:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107964

            Bug ID: 107964
           Summary: [GTX970] system hang when using libreoffice
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: fariouche-Qt13gs6zZMY@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Hello,

I'm facing an annoying crash with nouveau driver when using libreoffice,
particularly librecalc, when I try to display a submenu (properties of a ce=
ll
for example)

The relevant crash lines are:
kernel: nouveau 0000:03:00.0: fifo: fault 01 [WRITE] at 0000000078e02000 en=
gine
00 [GR] client 0f [GPC0/PROP_0] reason 82 [] on channel 2 [103fb01000 X[529=
5]]
kernel: nouveau 0000:03:00.0: fifo: channel 2: killed
kernel: nouveau 0000:03:00.0: fifo: runlist 0: scheduled for recovery
kernel: nouveau 0000:03:00.0: fifo: engine 0: scheduled for recovery
kernel: nouveau 0000:03:00.0: fifo: engine 7: scheduled for recovery
kernel: nouveau 0000:03:00.0: X[5295]: channel 2 killed!


After this, I can only reboot using the reset button (hard lock up?)

I'm using mesa 18.1.6, xf86-video-nouveau from git,kernel 4.18.8, firmwares
2018-09-13, Dual Monitor (4K p60 + 1080i) gtx970, this is a gentoo distro.

I can help debug if needed, just tell me where/what to investigate.
Unfortunately, I do not have any xorg log since the crash block the system
entirely

Thanks
regards

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15372120111.2714.6159
Date: Mon, 17 Sep 2018 19:20:11 +0000
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
   title=3D"NEW - [GTX970] system hang when using libreoffice"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107964">107964</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[GTX970] system hang when using libreoffice
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
          <td>fariouche&#64;yahoo.fr
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hello,

I'm facing an annoying crash with nouveau driver when using libreoffice,
particularly librecalc, when I try to display a submenu (properties of a ce=
ll
for example)

The relevant crash lines are:
kernel: nouveau 0000:03:00.0: fifo: fault 01 [WRITE] at 0000000078e02000 en=
gine
00 [GR] client 0f [GPC0/PROP_0] reason 82 [] on channel 2 [103fb01000 X[529=
5]]
kernel: nouveau 0000:03:00.0: fifo: channel 2: killed
kernel: nouveau 0000:03:00.0: fifo: runlist 0: scheduled for recovery
kernel: nouveau 0000:03:00.0: fifo: engine 0: scheduled for recovery
kernel: nouveau 0000:03:00.0: fifo: engine 7: scheduled for recovery
kernel: nouveau 0000:03:00.0: X[5295]: channel 2 killed!


After this, I can only reboot using the reset button (hard lock up?)

I'm using mesa 18.1.6, xf86-video-nouveau from git,kernel 4.18.8, firmwares
2018-09-13, Dual Monitor (4K p60 + 1080i) gtx970, this is a gentoo distro.

I can help debug if needed, just tell me where/what to investigate.
Unfortunately, I do not have any xorg log since the crash block the system
entirely

Thanks
regards</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15372120111.2714.6159--

--===============0207988470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0207988470==--
