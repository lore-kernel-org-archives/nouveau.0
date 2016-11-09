From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98657] New: Reproducible freeze when changing volume
 amplification in kodi
Date: Wed, 09 Nov 2016 12:42:58 +0000
Message-ID: <bug-98657-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1690828687=="
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


--===============1690828687==
Content-Type: multipart/alternative; boundary="14786953781.3EB8.20484";
 charset="UTF-8"


--14786953781.3EB8.20484
Date: Wed, 9 Nov 2016 12:42:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98657

            Bug ID: 98657
           Summary: Reproducible freeze when changing volume amplification
                    in kodi
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: wolfgang.kde-zdKOYOBJ9IsPyMaTEpOvjQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Sound goes out as Surround 5.1 over the HDMI cable on an Nvidia GT 630.

Volume amplification is at minimum 0dB - if I increase it, the screen freez=
es.

lspci:
01:00.0 VGA compatible controller: NVIDIA Corporation GK208 [GeForce GT 630
Rev. 2] (rev a1)
01:00.1 Audio device: NVIDIA Corporation GK208 HDMI/DP Audio Controller (rev
a1)

Kubuntu 16.04.1 with self compiled standard kernel 4.8.6
kodi version 15.2

Xorg.0.log says:=20
[     4.645] (II) Module nouveau: vendor=3D"X.Org Foundation"
[     4.645]    compiled for 1.18.1, module version =3D 1.0.12

kern.log:
Nov  9 13:18:51 s5 kernel: [  599.178480] nouveau 0000:01:00.0: fifo: PBDMA=
0:
00040000 [PBENTRY] ch 8 [003f902000 kodi.bin[2449]] subc 0 mthd 0000 data
00000000
Nov  9 13:18:51 s5 kernel: [  599.178502] nouveau 0000:01:00.0: fifo: PBDMA=
0:
00040000 [PBENTRY] ch 8 [003f902000 kodi.bin[2449]] subc 0 mthd 0000 data
00000000
Nov  9 13:18:51 s5 kernel: [  599.178515] nouveau 0000:01:00.0: gr: DATA_ER=
ROR
0000000c [INVALID_BITFIELD] ch 8 [003f902000 kodi.bin[2449]] subc 0 class a=
197
mthd 114c data 05000000
Nov  9 13:18:51 s5 kernel: [  599.178522] nouveau 0000:01:00.0: fifo: PBDMA=
0:
00040000 [PBENTRY] ch 8 [003f902000 kodi.bin[2449]] subc 0 mthd 0000 data
00000000
Nov  9 13:18:51 s5 kernel: [  599.178533] nouveau 0000:01:00.0: gr: DATA_ER=
ROR
00000003 [INVALID_OPERATION] ch 8 [003f902000 kodi.bin[2449]] subc 0 class =
a197
mthd 1158 data 3f800000
Nov  9 13:18:51 s5 kernel: [  599.178540] nouveau 0000:01:00.0: fifo: PBDMA=
0:
00040000 [PBENTRY] ch 8 [003f902000 kodi.bin[2449]] subc 0 mthd 0000 data
00000000

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14786953781.3EB8.20484
Date: Wed, 9 Nov 2016 12:42:58 +0000
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
   title=3D"NEW - Reproducible freeze when changing volume amplification in=
 kodi"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98657">98657</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Reproducible freeze when changing volume amplification in kodi
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
          <td>wolfgang.kde&#64;rohdewald.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Sound goes out as Surround 5.1 over the HDMI cable on an Nvidi=
a GT 630.

Volume amplification is at minimum 0dB - if I increase it, the screen freez=
es.

lspci:
01:00.0 VGA compatible controller: NVIDIA Corporation GK208 [GeForce GT 630
Rev. 2] (rev a1)
01:00.1 Audio device: NVIDIA Corporation GK208 HDMI/DP Audio Controller (rev
a1)

Kubuntu 16.04.1 with self compiled standard kernel 4.8.6
kodi version 15.2

Xorg.0.log says:=20
[     4.645] (II) Module nouveau: vendor=3D&quot;X.Org Foundation&quot;
[     4.645]    compiled for 1.18.1, module version =3D 1.0.12

kern.log:
Nov  9 13:18:51 s5 kernel: [  599.178480] nouveau 0000:01:00.0: fifo: PBDMA=
0:
00040000 [PBENTRY] ch 8 [003f902000 kodi.bin[2449]] subc 0 mthd 0000 data
00000000
Nov  9 13:18:51 s5 kernel: [  599.178502] nouveau 0000:01:00.0: fifo: PBDMA=
0:
00040000 [PBENTRY] ch 8 [003f902000 kodi.bin[2449]] subc 0 mthd 0000 data
00000000
Nov  9 13:18:51 s5 kernel: [  599.178515] nouveau 0000:01:00.0: gr: DATA_ER=
ROR
0000000c [INVALID_BITFIELD] ch 8 [003f902000 kodi.bin[2449]] subc 0 class a=
197
mthd 114c data 05000000
Nov  9 13:18:51 s5 kernel: [  599.178522] nouveau 0000:01:00.0: fifo: PBDMA=
0:
00040000 [PBENTRY] ch 8 [003f902000 kodi.bin[2449]] subc 0 mthd 0000 data
00000000
Nov  9 13:18:51 s5 kernel: [  599.178533] nouveau 0000:01:00.0: gr: DATA_ER=
ROR
00000003 [INVALID_OPERATION] ch 8 [003f902000 kodi.bin[2449]] subc 0 class =
a197
mthd 1158 data 3f800000
Nov  9 13:18:51 s5 kernel: [  599.178540] nouveau 0000:01:00.0: fifo: PBDMA=
0:
00040000 [PBENTRY] ch 8 [003f902000 kodi.bin[2449]] subc 0 mthd 0000 data
00000000</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14786953781.3EB8.20484--

--===============1690828687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1690828687==--
