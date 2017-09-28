From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103033] New: nouveau can't start my discrete nvidia
 card (BIOS / ACPI error)
Date: Thu, 28 Sep 2017 22:07:27 +0000
Message-ID: <bug-103033-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1369022959=="
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


--===============1369022959==
Content-Type: multipart/alternative; boundary="15066364471.55f20.7196";
 charset="UTF-8"


--15066364471.55f20.7196
Date: Thu, 28 Sep 2017 22:07:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103033

            Bug ID: 103033
           Summary: nouveau can't start my discrete nvidia card (BIOS /
                    ACPI error)
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: alexandre.dutriaux-GANU6spQydw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 134558
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D134558&action=3Dedit
dmesg with nouveau.debug=3Dtrace + acpidump + xorg.conf

I've got a portable computer with an Intel graphic card and a nvidia discre=
te
card (G 105M).
I've installed Fedora 26.=20
Everything should run fine with nouveau and Prime.

However, xrandr --listproviders only send me 1 provider, which is the Intel
card.=20

I've seen a problem with the BIOS and the nvidia card :=20

[    2.777871] nouveau 0000:01:00.0: Invalid PCI ROM header signature:
expecting 0xaa55, got 0x0000
[    2.777887] nouveau 0000:01:00.0: bios: unable to locate usable image
[    2.777895] nouveau 0000:01:00.0: bios ctor failed, -22

-----------
$ lspci |grep -E "3D|VGA"
00:02.0 VGA compatible controller: Intel Corporation Mobile 4 Series Chipset
Integrated Graphics Controller (rev 07)
01:00.0 VGA compatible controller: NVIDIA Corporation GT218M [GeForce G 105=
M]
(rev a2)

$ xrandr --listproviders
Providers: number : 1
Provider 0: id: 0x46 cap: 0xb, Source Output, Sink Output, Sink Offload crt=
cs:
3 outputs: 4 associated providers: 0 name:Intel

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15066364471.55f20.7196
Date: Thu, 28 Sep 2017 22:07:27 +0000
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
   title=3D"NEW - nouveau can't start my discrete nvidia card (BIOS / ACPI =
error)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103033">103033</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau can't start my discrete nvidia card (BIOS / ACPI erro=
r)
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
          <td>alexandre.dutriaux&#64;free.fr
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D134558=
" name=3D"attach_134558" title=3D"dmesg with nouveau.debug=3Dtrace + acpidu=
mp + xorg.conf">attachment 134558</a> <a href=3D"attachment.cgi?id=3D134558=
&amp;action=3Dedit" title=3D"dmesg with nouveau.debug=3Dtrace + acpidump + =
xorg.conf">[details]</a></span>
dmesg with nouveau.debug=3Dtrace + acpidump + xorg.conf

I've got a portable computer with an Intel graphic card and a nvidia discre=
te
card (G 105M).
I've installed Fedora 26.=20
Everything should run fine with nouveau and Prime.

However, xrandr --listproviders only send me 1 provider, which is the Intel
card.=20

I've seen a problem with the BIOS and the nvidia card :=20

[    2.777871] nouveau 0000:01:00.0: Invalid PCI ROM header signature:
expecting 0xaa55, got 0x0000
[    2.777887] nouveau 0000:01:00.0: bios: unable to locate usable image
[    2.777895] nouveau 0000:01:00.0: bios ctor failed, -22

-----------
$ lspci |grep -E &quot;3D|VGA&quot;
00:02.0 VGA compatible controller: Intel Corporation Mobile 4 Series Chipset
Integrated Graphics Controller (rev 07)
01:00.0 VGA compatible controller: NVIDIA Corporation GT218M [GeForce G 105=
M]
(rev a2)

$ xrandr --listproviders
Providers: number : 1
Provider 0: id: 0x46 cap: 0xb, Source Output, Sink Output, Sink Offload crt=
cs:
3 outputs: 4 associated providers: 0 name:Intel</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15066364471.55f20.7196--

--===============1369022959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1369022959==--
