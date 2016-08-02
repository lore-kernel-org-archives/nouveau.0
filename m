From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97192] New: SuperTuxkart graphic errors [NVE4 -
	GK104]
Date: Tue, 02 Aug 2016 15:49:31 +0000
Message-ID: <bug-97192-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1178966217=="
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


--===============1178966217==
Content-Type: multipart/alternative; boundary="14701529710.FAcA2.3041";
 charset="UTF-8"


--14701529710.FAcA2.3041
Date: Tue, 2 Aug 2016 15:49:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97192

            Bug ID: 97192
           Summary: SuperTuxkart graphic errors [NVE4 - GK104]
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: other
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: alejandrohp-1Ww2luigxekRVMDPamJrIw@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

SuperTuxkart starts abd the menu is shown ok. But when the 3D environment is
running, everything goes dark and blinked.



The graphic card is NVE4 - GK104.



lspci -nnk:

02:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK104 [GeForce=
 GTX
680] [10de:1180] (rev a1)
        Subsystem: Gigabyte Technology Co., Ltd Device [1458:353c]
        Kernel driver in use: nouveau
        Kernel modules: nouveau


lspci-vmmnn:

Slot:   02:00.0
Class:  VGA compatible controller [0300]
Vendor: NVIDIA Corporation [10de]
Device: GK104 [GeForce GTX 680] [1180]
SVendor:        Gigabyte Technology Co., Ltd [1458]
SDevice:        Device [353c]
Rev:    a1

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14701529710.FAcA2.3041
Date: Tue, 2 Aug 2016 15:49:31 +0000
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
   title=3D"NEW - SuperTuxkart graphic errors [NVE4 - GK104]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97192">97192</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>SuperTuxkart graphic errors [NVE4 - GK104]
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
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
          <td>other
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>alejandrohp&#64;openmailbox.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>SuperTuxkart starts abd the menu is shown ok. But when the 3D =
environment is
running, everything goes dark and blinked.



The graphic card is NVE4 - GK104.



lspci -nnk:

02:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK104 [GeForce=
 GTX
680] [10de:1180] (rev a1)
        Subsystem: Gigabyte Technology Co., Ltd Device [1458:353c]
        Kernel driver in use: nouveau
        Kernel modules: nouveau


lspci-vmmnn:

Slot:   02:00.0
Class:  VGA compatible controller [0300]
Vendor: NVIDIA Corporation [10de]
Device: GK104 [GeForce GTX 680] [1180]
SVendor:        Gigabyte Technology Co., Ltd [1458]
SDevice:        Device [353c]
Rev:    a1</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14701529710.FAcA2.3041--

--===============1178966217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1178966217==--
