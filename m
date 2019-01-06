From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109230] New: [crash] Xorg is crashing on startup
 with enabled xinerama
Date: Sun, 06 Jan 2019 11:29:09 +0000
Message-ID: <bug-109230-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1079912549=="
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


--===============1079912549==
Content-Type: multipart/alternative; boundary="15467741500.9894b2f5.23818"
Content-Transfer-Encoding: 7bit


--15467741500.9894b2f5.23818
Date: Sun, 6 Jan 2019 11:29:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109230

            Bug ID: 109230
           Summary: [crash] Xorg is crashing on startup with enabled
                    xinerama
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: All
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: manio-RFXG7K41k5GsTnJN9+BGXg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Dual gpu configuration: radeon + nouveau.
When xinerama is enabled xorg is crashing with the following backtrace:

[1208755.149] (EE) Backtrace:
[1208755.159] (EE) 0: /usr/lib/xorg/Xorg (OsLookupColor+0x139) [0x55b646b6a=
fc9]
[1208755.160] (EE) 1: /lib/x86_64-linux-gnu/libpthread.so.0 (funlockfile+0x=
50)
[0x7f7d21b486ff]
[1208755.162] (EE) 2: /lib/x86_64-linux-gnu/libc.so.6 (gsignal+0x10b)
[0x7f7d219aa85b]
[1208755.163] (EE) 3: /lib/x86_64-linux-gnu/libc.so.6 (abort+0x121)
[0x7f7d21995535]
[1208755.164] (EE) unw_get_proc_name failed: no unwind info found [-10]
[1208755.164] (EE) 4: /lib/x86_64-linux-gnu/libc.so.6 (?+0x0) [0x7f7d219954=
00]
[1208755.165] (EE) 5: /lib/x86_64-linux-gnu/libc.so.6 (__assert_fail+0x42)
[0x7f7d219a30a2]
[1208755.166] (EE) 6: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(_init+0x433b3) [0x7f7d1ff2e743]
[1208755.167] (EE) 7: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(_init+0x4430a) [0x7f7d1ff304ea]
[1208755.168] (EE) 8: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(_init+0x48b20) [0x7f7d1ff39480]
[1208755.169] (EE) 9: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(_init+0x3b581) [0x7f7d1ff1ea81]
[1208755.175] (EE) 10: /usr/lib/xorg/Xorg (InitExtensions+0x63e)
[0x55b646a7affe]
[1208755.176] (EE) 11: /usr/lib/xorg/Xorg (InitFonts+0x279) [0x55b646a10839]
[1208755.178] (EE) 12: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0=
xeb)
[0x7f7d2199709b]
[1208755.178] (EE) 13: /usr/lib/xorg/Xorg (_start+0x2a) [0x55b6469fa68a]

Related with?
https://bugs.freedesktop.org/show_bug.cgi?id=3D108495

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15467741500.9894b2f5.23818
Date: Sun, 6 Jan 2019 11:29:10 +0000
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
   title=3D"NEW - [crash] Xorg is crashing on startup with enabled xinerama"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109230">109230</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[crash] Xorg is crashing on startup with enabled xinerama
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
          <td>manio&#64;skyboo.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Dual gpu configuration: radeon + nouveau.
When xinerama is enabled xorg is crashing with the following backtrace:

[1208755.149] (EE) Backtrace:
[1208755.159] (EE) 0: /usr/lib/xorg/Xorg (OsLookupColor+0x139) [0x55b646b6a=
fc9]
[1208755.160] (EE) 1: /lib/x86_64-linux-gnu/libpthread.so.0 (funlockfile+0x=
50)
[0x7f7d21b486ff]
[1208755.162] (EE) 2: /lib/x86_64-linux-gnu/libc.so.6 (gsignal+0x10b)
[0x7f7d219aa85b]
[1208755.163] (EE) 3: /lib/x86_64-linux-gnu/libc.so.6 (abort+0x121)
[0x7f7d21995535]
[1208755.164] (EE) unw_get_proc_name failed: no unwind info found [-10]
[1208755.164] (EE) 4: /lib/x86_64-linux-gnu/libc.so.6 (?+0x0) [0x7f7d219954=
00]
[1208755.165] (EE) 5: /lib/x86_64-linux-gnu/libc.so.6 (__assert_fail+0x42)
[0x7f7d219a30a2]
[1208755.166] (EE) 6: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(_init+0x433b3) [0x7f7d1ff2e743]
[1208755.167] (EE) 7: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(_init+0x4430a) [0x7f7d1ff304ea]
[1208755.168] (EE) 8: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(_init+0x48b20) [0x7f7d1ff39480]
[1208755.169] (EE) 9: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(_init+0x3b581) [0x7f7d1ff1ea81]
[1208755.175] (EE) 10: /usr/lib/xorg/Xorg (InitExtensions+0x63e)
[0x55b646a7affe]
[1208755.176] (EE) 11: /usr/lib/xorg/Xorg (InitFonts+0x279) [0x55b646a10839]
[1208755.178] (EE) 12: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0=
xeb)
[0x7f7d2199709b]
[1208755.178] (EE) 13: /usr/lib/xorg/Xorg (_start+0x2a) [0x55b6469fa68a]

Related with?
<a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [patch][crash] Xorg is crashing on startup in =
xinerama configuration"
   href=3D"show_bug.cgi?id=3D108495">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108495</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15467741500.9894b2f5.23818--

--===============1079912549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1079912549==--
