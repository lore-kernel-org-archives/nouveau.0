From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98677] New: [NVAC] iMac9,
 1 effective backlight brightness range changes after S3
Date: Thu, 10 Nov 2016 17:33:18 +0000
Message-ID: <bug-98677-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2043519868=="
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


--===============2043519868==
Content-Type: multipart/alternative; boundary="14787991981.b2e577be.7374";
 charset="UTF-8"


--14787991981.b2e577be.7374
Date: Thu, 10 Nov 2016 17:33:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98677

            Bug ID: 98677
           Summary: [NVAC] iMac9,1 effective backlight brightness range
                    changes after S3
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jefferym-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 127900
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D127900&action=3Dedit
dmesg output after the resume with some nouveau trace options

I have an iMac 9,1 where the behaviour of the backlight of the built in scr=
een
works differently between the first boot and after a suspend to ram.
It appears to be darker at lower values before a suspend than after.

kernel: 4.8.6-300.fc25.x86_64
lspci adapter: VGA adapter NVIDIA Corporation C79 [GeForce 9400] [10de:0867]
DMI: Apple Inc. iMac9,1/Mac-F2218EA9
I've been booting in EFI mode.
I do not know of a regression. I've only tried 4.4 and this 4.8 kernels.
I've observed this with X running but I've been testing this without starti=
ng a
graphical environment.

I've been testing by setting setting backlight values via the
/sys/backlight/nv_backlight/brightness interface.
Before a suspend I can set values such as 40, 70, 100 and the brightness se=
ems
to be reasonable on the screen.

I then suspend to ram via the /sys/power/state interface.
Upon resuming the backlight appears to be at 100 percent. If I set the
brightness to values such as 30 and 60 the screen remains dark. It is barely
visible as a flicker at 70. At 100 it is visible.

I've observed that the value of NV50_PDISP_SOR_PWM_DIV (0x0061c080) is 0x1
after a boot but is set to 0x84 after a resume.
It appears there's an init script in the bios dump which sets it to the val=
ue
of 0x84. I have confirmed if I use the nouveau option
nouveau.config=3DNvForcePost=3D1 that the behavior after booting is the sam=
e as
after a resume. The value of 0x61c080 is 0x84.

If I `nvapoke 0x061c080 0x1` after a resume the backlight seems to work fai=
rly
well. I created patch to test this. I expect it isn't the proper solution.

I'm attaching the dmesg which includes a resume with the nouveau driver.
I'll also attach the vbios dump, acpidump, dmidecode, lspci,=20

I've gathered an mmiotrace of the binary driver as it sets a few brightness
values as well.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14787991981.b2e577be.7374
Date: Thu, 10 Nov 2016 17:33:18 +0000
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
   title=3D"NEW - [NVAC] iMac9,1 effective backlight brightness range chang=
es after S3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98677">98677</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVAC] iMac9,1 effective backlight brightness range changes a=
fter S3
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
          <td>jefferym&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D127900=
" name=3D"attach_127900" title=3D"dmesg output after the resume with some n=
ouveau trace options">attachment 127900</a> <a href=3D"attachment.cgi?id=3D=
127900&amp;action=3Dedit" title=3D"dmesg output after the resume with some =
nouveau trace options">[details]</a></span>
dmesg output after the resume with some nouveau trace options

I have an iMac 9,1 where the behaviour of the backlight of the built in scr=
een
works differently between the first boot and after a suspend to ram.
It appears to be darker at lower values before a suspend than after.

kernel: 4.8.6-300.fc25.x86_64
lspci adapter: VGA adapter NVIDIA Corporation C79 [GeForce 9400] [10de:0867]
DMI: Apple Inc. iMac9,1/Mac-F2218EA9
I've been booting in EFI mode.
I do not know of a regression. I've only tried 4.4 and this 4.8 kernels.
I've observed this with X running but I've been testing this without starti=
ng a
graphical environment.

I've been testing by setting setting backlight values via the
/sys/backlight/nv_backlight/brightness interface.
Before a suspend I can set values such as 40, 70, 100 and the brightness se=
ems
to be reasonable on the screen.

I then suspend to ram via the /sys/power/state interface.
Upon resuming the backlight appears to be at 100 percent. If I set the
brightness to values such as 30 and 60 the screen remains dark. It is barely
visible as a flicker at 70. At 100 it is visible.

I've observed that the value of NV50_PDISP_SOR_PWM_DIV (0x0061c080) is 0x1
after a boot but is set to 0x84 after a resume.
It appears there's an init script in the bios dump which sets it to the val=
ue
of 0x84. I have confirmed if I use the nouveau option
nouveau.config=3DNvForcePost=3D1 that the behavior after booting is the sam=
e as
after a resume. The value of 0x61c080 is 0x84.

If I `nvapoke 0x061c080 0x1` after a resume the backlight seems to work fai=
rly
well. I created patch to test this. I expect it isn't the proper solution.

I'm attaching the dmesg which includes a resume with the nouveau driver.
I'll also attach the vbios dump, acpidump, dmidecode, lspci,=20

I've gathered an mmiotrace of the binary driver as it sets a few brightness
values as well.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14787991981.b2e577be.7374--

--===============2043519868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2043519868==--
