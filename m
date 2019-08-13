From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111392] New: [NV110] bus: MMIO read of 00000000
 FAULT at 619444 [ IBUS ]
Date: Tue, 13 Aug 2019 09:59:46 +0000
Message-ID: <bug-111392-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0738860106=="
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


--===============0738860106==
Content-Type: multipart/alternative; boundary="15656903860.4Bc6FD.4048"
Content-Transfer-Encoding: 7bit


--15656903860.4Bc6FD.4048
Date: Tue, 13 Aug 2019 09:59:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111392

            Bug ID: 111392
           Summary: [NV110] bus: MMIO read of 00000000 FAULT at 619444 [
                    IBUS ]
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gius-italy-oA6aJsjdrIk@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 145046
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145046&action=3Dedit
Dmesg - Full

Hi, everything looks like working fine on my system but I noticed some error
messages by Nouveau on dmesg.=20


[    1.963196] nouveau: detected PR support, will not use DSM
[    1.964517] nouveau 0000:01:00.0: NVIDIA GM107 (1171b0a2)
[    2.009352] nouveau 0000:01:00.0: bios: version 82.07.79.00.1e
[    2.115174] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[    2.115188] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 02=
2554
[ IBUS ]
[    2.125653] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10=
ac08
[ IBUS ]
[    2.786164] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    2.786164] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    2.786167] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[    2.786167] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    2.786508] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    2.786711] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1
[   13.593658] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]
[   21.216350] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]
[   31.437080] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]
[ 3506.842157] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]


For read error on addresses 022544 and 10ac08 two bug reports already exists
(bug 100423 and bug 104835).

More info
Notebook model: ASUS N551JW
Kernel version: 5.2.6-200.fc30.x86_64 (Fedora 30)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15656903860.4Bc6FD.4048
Date: Tue, 13 Aug 2019 09:59:46 +0000
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
   title=3D"NEW - [NV110] bus: MMIO read of 00000000 FAULT at 619444 [ IBUS=
 ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111392">111392</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV110] bus: MMIO read of 00000000 FAULT at 619444 [ IBUS ]
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
          <td>gius-italy&#64;live.it
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145046=
" name=3D"attach_145046" title=3D"Dmesg - Full">attachment 145046</a> <a hr=
ef=3D"attachment.cgi?id=3D145046&amp;action=3Dedit" title=3D"Dmesg - Full">=
[details]</a></span>
Dmesg - Full

Hi, everything looks like working fine on my system but I noticed some error
messages by Nouveau on dmesg.=20


[    1.963196] nouveau: detected PR support, will not use DSM
[    1.964517] nouveau 0000:01:00.0: NVIDIA GM107 (1171b0a2)
[    2.009352] nouveau 0000:01:00.0: bios: version 82.07.79.00.1e
[    2.115174] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[    2.115188] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 02=
2554
[ IBUS ]
[    2.125653] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10=
ac08
[ IBUS ]
[    2.786164] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    2.786164] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    2.786167] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[    2.786167] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    2.786508] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    2.786711] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1
[   13.593658] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]
[   21.216350] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]
[   31.437080] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]
[ 3506.842157] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]


For read error on addresses 022544 and 10ac08 two bug reports already exists
(<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"show_bug.cgi?id=3D100423">bug 100423</a> and <a class=3D"bz_bug_=
link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]"
   href=3D"show_bug.cgi?id=3D104835">bug 104835</a>).

More info
Notebook model: ASUS N551JW
Kernel version: 5.2.6-200.fc30.x86_64 (Fedora 30)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15656903860.4Bc6FD.4048--

--===============0738860106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0738860106==--
