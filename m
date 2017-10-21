From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103383] New: "xset dpms force on" does not unblank
 laptop screen after "xset dpms force off" is run (or system enters sleep
 mode)
Date: Sat, 21 Oct 2017 06:32:22 +0000
Message-ID: <bug-103383-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0006822867=="
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


--===============0006822867==
Content-Type: multipart/alternative; boundary="15085675421.57f7F9D.31644";
 charset="UTF-8"


--15085675421.57f7F9D.31644
Date: Sat, 21 Oct 2017 06:32:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103383

            Bug ID: 103383
           Summary: "xset dpms force on" does not unblank laptop screen
                    after "xset dpms force off" is run (or system enters
                    sleep mode)
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: techau-sFbbPxZDHXw0n/F98K4Iww@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 134966
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D134966&action=3Dedit
dmesg-xorg.log

Hi all,

Graphics Card: NVIDIA GTX 1060=20
nouveau driver: 1.0.15
Xorg version: 1.19.3
dmesg.log and Xorg.0.log attached.
Distribution: XUbuntu 17.10 (the only one that I know of that includes upda=
ted
nouveau drivers that support my laptop's graphics card)
File: dmesg-xorg.log 0 xorg log starts on line 1116.

I have been chasing this for a few days and I finally managed to successful=
ly
reproduce the issue consistently.

I have a 3-ple screen system - Laptop Display + HDMI + DP (set to mirroring=
).=20

When the screens are asked to blank by using the "xset dpms force off" comm=
and
and when you press a key on the keyboard to unblank them, only the HDMI and=
 the
DP screens get unblanked and the laptop screen remains off / blanked out.=20

This is a major pain as the laptop is right in front of me as my main displ=
ay .=20

I've tried:=20

- Running "xset dpms force on"=20
- Running "sudo systemctl stop lightdm" and then "sudo systemctl start ligh=
tdm"=20
- Entering the console via "Ctrl+Alt+F1" and then "Ctrl+Alt+F7"=20

but my laptop screen remains off. Only a full reboot resolves the issue.=20

I can confirm that this does *not* happen with the proprietary NVIDIA drive=
rs
(v384).

To reproduce the issue:

- Either wait for Xfce to blank the displays after 5-10 minutes or
- Enter the command "xset dpms force off" via the terminal
- Hit a key to wake up the displays and the laptop screen remains off

The issue also happens when Live ISOs boot to Xorg where the laptop screens
remains turned off.=20

Something interesting I found in dmesg, not sure if this is related:

[   35.439645] nouveau 0000:01:00.0: disp: 0x0000643b[0]:
INIT_GENERIC_CONDITON: unknown 0x07
[   36.965444] nouveau 0000:01:00.0: disp: 0x00005fcc[2]:
INIT_GENERIC_CONDITON: unknown 0x07


I hope this can be resolved.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15085675421.57f7F9D.31644
Date: Sat, 21 Oct 2017 06:32:22 +0000
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
   title=3D"NEW - &quot;xset dpms force on&quot; does not unblank laptop sc=
reen after &quot;xset dpms force off&quot; is run (or system enters sleep m=
ode)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103383">103383</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>&quot;xset dpms force on&quot; does not unblank laptop screen=
 after &quot;xset dpms force off&quot; is run (or system enters sleep mode)
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
          <td>techau&#64;optusnet.com.au
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D134966=
" name=3D"attach_134966" title=3D"dmesg-xorg.log">attachment 134966</a> <a =
href=3D"attachment.cgi?id=3D134966&amp;action=3Dedit" title=3D"dmesg-xorg.l=
og">[details]</a></span>
dmesg-xorg.log

Hi all,

Graphics Card: NVIDIA GTX 1060=20
nouveau driver: 1.0.15
Xorg version: 1.19.3
dmesg.log and Xorg.0.log attached.
Distribution: XUbuntu 17.10 (the only one that I know of that includes upda=
ted
nouveau drivers that support my laptop's graphics card)
File: dmesg-xorg.log 0 xorg log starts on line 1116.

I have been chasing this for a few days and I finally managed to successful=
ly
reproduce the issue consistently.

I have a 3-ple screen system - Laptop Display + HDMI + DP (set to mirroring=
).=20

When the screens are asked to blank by using the &quot;xset dpms force off&=
quot; command
and when you press a key on the keyboard to unblank them, only the HDMI and=
 the
DP screens get unblanked and the laptop screen remains off / blanked out.=20

This is a major pain as the laptop is right in front of me as my main displ=
ay .=20

I've tried:=20

- Running &quot;xset dpms force on&quot;=20
- Running &quot;sudo systemctl stop lightdm&quot; and then &quot;sudo syste=
mctl start lightdm&quot;=20
- Entering the console via &quot;Ctrl+Alt+F1&quot; and then &quot;Ctrl+Alt+=
F7&quot;=20

but my laptop screen remains off. Only a full reboot resolves the issue.=20

I can confirm that this does *not* happen with the proprietary NVIDIA drive=
rs
(v384).

To reproduce the issue:

- Either wait for Xfce to blank the displays after 5-10 minutes or
- Enter the command &quot;xset dpms force off&quot; via the terminal
- Hit a key to wake up the displays and the laptop screen remains off

The issue also happens when Live ISOs boot to Xorg where the laptop screens
remains turned off.=20

Something interesting I found in dmesg, not sure if this is related:

[   35.439645] nouveau 0000:01:00.0: disp: 0x0000643b[0]:
INIT_GENERIC_CONDITON: unknown 0x07
[   36.965444] nouveau 0000:01:00.0: disp: 0x00005fcc[2]:
INIT_GENERIC_CONDITON: unknown 0x07


I hope this can be resolved.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15085675421.57f7F9D.31644--

--===============0006822867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0006822867==--
