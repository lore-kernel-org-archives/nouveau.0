From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83587] New: 3.14.18: FAN control: none / external --
 3.16.2: FAN control: PWM
Date: Sun, 07 Sep 2014 15:33:39 +0000
Message-ID: <bug-83587-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0185888277=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0185888277==
Content-Type: multipart/alternative; boundary="1410104019.B56361.3858"; charset="us-ascii"


--1410104019.B56361.3858
Date: Sun, 7 Sep 2014 15:33:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D83587

          Priority: medium
            Bug ID: 83587
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: 3.14.18: FAN control: none / external -- 3.16.2: FAN
                    control: PWM
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: riesebie-xZYEWGoilGM@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 105861
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D105861&action=3Dedit
dmesg and vbios tared

My gpu:  NVIDIA Corporation GK104 [GeForce GTX 760]

Running kernel 3.14.18 I can't control fanspeed. There are no pwm1 files in
/sys as mentioned in
https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tree/D=
ocumentation/thermal/nouveau_thermal.
fan1 is always at maximum, while the temp1 is around 37=C2=B0C.

Running kernel 3.16.2 with the same .config everything runs smooth (fan1 720
RPM, temp1 +39=C2=B0C).

The most important difference in dmesg is:
3.14.18:=20
nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external

3.16.2:=20
nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM

dmesg | grep nouveau attached

Thanks in advance

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1410104019.B56361.3858
Date: Sun, 7 Sep 2014 15:33:39 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - 3.14.18: FAN control: none / external -- 3.16.2: FAN =
control: PWM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D83587">83587</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>3.14.18: FAN control: none / external -- 3.16.2: FAN control:=
 PWM
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>riesebie&#64;lxtec.de
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D105861=
" name=3D"attach_105861" title=3D"dmesg and vbios tared">attachment 105861<=
/a> <a href=3D"attachment.cgi?id=3D105861&amp;action=3Dedit" title=3D"dmesg=
 and vbios tared">[details]</a></span>
dmesg and vbios tared

My gpu:  NVIDIA Corporation GK104 [GeForce GTX 760]

Running kernel 3.14.18 I can't control fanspeed. There are no pwm1 files in
/sys as mentioned in
<a href=3D"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable=
.git/tree/Documentation/thermal/nouveau_thermal">https://git.kernel.org/cgi=
t/linux/kernel/git/stable/linux-stable.git/tree/Documentation/thermal/nouve=
au_thermal</a>.
fan1 is always at maximum, while the temp1 is around 37=C2=B0C.

Running kernel 3.16.2 with the same .config everything runs smooth (fan1 720
RPM, temp1 +39=C2=B0C).

The most important difference in dmesg is:
3.14.18:=20
nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external

3.16.2:=20
nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM

dmesg | grep nouveau attached

Thanks in advance</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1410104019.B56361.3858--

--===============0185888277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0185888277==--
