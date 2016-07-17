From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96968] New: [NVC0] disp: ERROR 7 [INVALID_HANDLE] 00
 [] chid 0 mthd 0088 data f000000
Date: Sun, 17 Jul 2016 23:39:24 +0000
Message-ID: <bug-96968-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0295440020=="
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


--===============0295440020==
Content-Type: multipart/alternative; boundary="14687987650.9faf82eD.25407";
 charset="UTF-8"


--14687987650.9faf82eD.25407
Date: Sun, 17 Jul 2016 23:39:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96968

            Bug ID: 96968
           Summary: [NVC0] disp: ERROR 7 [INVALID_HANDLE] 00 [] chid 0
                    mthd 0088 data f000000
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 125122
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D125122&action=3Dedit
dmesg for "Arch Linux Nouveau" image from 11 July 2016 (4.7.0-rc5-lts+)

nouveau causes hangs and spits errors like (4.6.3-1-ARCH):
[    3.938340] nouveau 0000:01:00.0: disp: ERROR 7 [INVALID_HANDLE] 00 [] c=
hid
0 mthd 0088 data f0000000
[    3.944183] nouveau 0000:01:00.0: fifo: write fault at 0000001000 engine=
 04
[BAR1] client 08 [BAR_WRITE] reason 00 [PT_NOT_PRESENT] on channel -1
[001fe7f000 unknown]
[    3.944293] nouveau 0000:01:00.0: fifo: write fault at 0000000000 engine=
 05
[BAR3] client 08 [BAR_WRITE] reason 02 [PAGE_NOT_PRESENT] on channel -1
[001fe98000 unknown]
[    3.944460] nouveau 0000:01:00.0: fifo: INTR 08000000
[    3.971108] nouveau 0000:01:00.0: fifo: read fault at 0000005000 engine =
04
[BAR1] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT] on channel -1
[001fe7f000 unknown]
[    3.998097] nouveau 0000:01:00.0: fifo: read fault at 0000005000 engine =
04
[BAR1] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT] on channel -1
[001fe7f000 unknown]
[    3.998440] nouveau 0000:01:00.0: DRM: MM: using COPY0 for buffer copies
[    3.998527] nouveau 0000:01:00.0: disp: ERROR 5 [INVALID_STATE] 08 [] ch=
id 0
mthd 0080 data 00000000

On the v4.7-rc5-lts+ kernel it mentions "fifo: fifo engine fault on channel=
 1,
recovering...", but it blows up somewhere else. I can remember also having
(hang) issues with the kernel included with Arch Linux iso 2016.01.01. Hang=
ing
in the above cases means a slow down during boot, but eventually user input=
 is
possible. (Don't know what happens after that, I just used an older image).

lspci
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF108M [GeForc=
e GT
425M] [10de:0df0] (rev a1)
Laptop: Clevo B7130

Test image (for reproducibility) was taken from https://nouveau.pmoreau.org/
SHA256: 187af03d97c14ac9fed61f621eb659de0bd258f88aaee5dd0934e8ed507252f5

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14687987650.9faf82eD.25407
Date: Sun, 17 Jul 2016 23:39:25 +0000
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
   title=3D"NEW - [NVC0] disp: ERROR 7 [INVALID_HANDLE] 00 [] chid 0 mthd 0=
088 data f000000"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96968">96968</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVC0] disp: ERROR 7 [INVALID_HANDLE] 00 [] chid 0 mthd 0088 =
data f000000
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
          <td>peter&#64;lekensteyn.nl
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D125122=
" name=3D"attach_125122" title=3D"dmesg for &quot;Arch Linux Nouveau&quot; =
image from 11 July 2016 (4.7.0-rc5-lts+)">attachment 125122</a> <a href=3D"=
attachment.cgi?id=3D125122&amp;action=3Dedit" title=3D"dmesg for &quot;Arch=
 Linux Nouveau&quot; image from 11 July 2016 (4.7.0-rc5-lts+)">[details]</a=
></span>
dmesg for &quot;Arch Linux Nouveau&quot; image from 11 July 2016 (4.7.0-rc5=
-lts+)

nouveau causes hangs and spits errors like (4.6.3-1-ARCH):
[    3.938340] nouveau 0000:01:00.0: disp: ERROR 7 [INVALID_HANDLE] 00 [] c=
hid
0 mthd 0088 data f0000000
[    3.944183] nouveau 0000:01:00.0: fifo: write fault at 0000001000 engine=
 04
[BAR1] client 08 [BAR_WRITE] reason 00 [PT_NOT_PRESENT] on channel -1
[001fe7f000 unknown]
[    3.944293] nouveau 0000:01:00.0: fifo: write fault at 0000000000 engine=
 05
[BAR3] client 08 [BAR_WRITE] reason 02 [PAGE_NOT_PRESENT] on channel -1
[001fe98000 unknown]
[    3.944460] nouveau 0000:01:00.0: fifo: INTR 08000000
[    3.971108] nouveau 0000:01:00.0: fifo: read fault at 0000005000 engine =
04
[BAR1] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT] on channel -1
[001fe7f000 unknown]
[    3.998097] nouveau 0000:01:00.0: fifo: read fault at 0000005000 engine =
04
[BAR1] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT] on channel -1
[001fe7f000 unknown]
[    3.998440] nouveau 0000:01:00.0: DRM: MM: using COPY0 for buffer copies
[    3.998527] nouveau 0000:01:00.0: disp: ERROR 5 [INVALID_STATE] 08 [] ch=
id 0
mthd 0080 data 00000000

On the v4.7-rc5-lts+ kernel it mentions &quot;fifo: fifo engine fault on ch=
annel 1,
recovering...&quot;, but it blows up somewhere else. I can remember also ha=
ving
(hang) issues with the kernel included with Arch Linux iso 2016.01.01. Hang=
ing
in the above cases means a slow down during boot, but eventually user input=
 is
possible. (Don't know what happens after that, I just used an older image).

lspci
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF108M [GeForc=
e GT
425M] [10de:0df0] (rev a1)
Laptop: Clevo B7130

Test image (for reproducibility) was taken from <a href=3D"https://nouveau.=
pmoreau.org/">https://nouveau.pmoreau.org/</a>
SHA256: 187af03d97c14ac9fed61f621eb659de0bd258f88aaee5dd0934e8ed507252f5</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14687987650.9faf82eD.25407--

--===============0295440020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0295440020==--
