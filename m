From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103946] New: [nouveau] Slowish and rough graphical
 interface with GTX 1060
Date: Tue, 28 Nov 2017 00:50:22 +0000
Message-ID: <bug-103946-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1352168836=="
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


--===============1352168836==
Content-Type: multipart/alternative; boundary="15118302220.8eA4106f.29663";
 charset="UTF-8"


--15118302220.8eA4106f.29663
Date: Tue, 28 Nov 2017 00:50:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103946

            Bug ID: 103946
           Summary: [nouveau] Slowish and rough graphical interface with
                    GTX 1060
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: nazgalist-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 135741
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D135741&action=3Dedit
dmesg

I have an eVGA geforce gtx 1060 6gb graphics card, I'm using nouveau drivers
(1.0.15-2), I'm on kernel 4.13.12-1 and I run Wayland (echo $XDG_SESSION_TY=
PE
prints wayland). I don't know if you need something else :(

Starts with a freeze, immediately following a slowish and rough/rude mouse
pointer movement and graphical interface. Describing what and when happens =
in
graphical interface:=20
-Gnome-shell's activities menu lasts a lot to appear, and scrolling between=
 the
list of applications is slowish and rough
-Switching between virtual desktops that has programs running into lasts (to
draw) too, but not between those that hasn't.
-Movies aren't playing. Movie player's taskbar indicator appears but no app=
ears
the movie player per se, it doesn't show up. Audio is playing without
interrupts fluently.
-Menus are displaying with slowness too.

It happens every time I boot on linux from a power off, but if I came from a
restart from Windows 10 it boots ok.
It apparently affects only mouse. When writing the keyboard its fluent and =
it
doesn't stops drawing on screen what i'm writing for 1 or 2 seconds after
showing everything I've written, like it does with the mouse device.
It happens in gdm and within gnome-shell session.

Bug appears on any of these two cases:

Steps to reproduce #1:
1. switch on from a previous power off.
2. select linux on grub.
3. boot.

Steps to reproduce #2:
1. switch on from a previous power off.
2. select windows 10 on grub.
3. power off from windows 10.
4. switch on.
5. select linux on grub.
6. boot.

Before gdm starts it's printed:
nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid
nouveau 0000:01:00.0: secboot: error during falcon reset: -110
nouveau 0000:01:00.0: gr: init failed, -110

Bug doesn't show up when:
1. switch on
2. select windows 10 on grub.
3. restart from windows 10.
4. select linux from grub.
5. boot

dmesg attached as a file.

lsblk -f:
NAME   FSTYPE LABEL        UUID                                 MOUNTPOINT
sda=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
=E2=94=9C=E2=94=80sda1 ntfs   Recuperaci=C3=B3n F6E6FC90E6FC51FB=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
=E2=94=9C=E2=94=80sda2 vfat                B200-9D56=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
=E2=94=9C=E2=94=80sda3=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
=E2=94=9C=E2=94=80sda4 ntfs                1C1615131614F00E=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
=E2=94=94=E2=94=80sda5 ntfs   STEAM        E61E74281E73F043=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
sdb=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
=E2=94=9C=E2=94=80sdb1 vfat                5B15-98FD                       =
     /boot
=E2=94=9C=E2=94=80sdb2 ext4                e7c2fde7-8120-4720-940a-a7b788bb=
d365 /
=E2=94=94=E2=94=80sdb3 ext4                8d5f5ffe-38fb-4889-9887-c59a9716=
77f6 /home
sdc=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
=E2=94=94=E2=94=80sdc1 ntfs   XTRA         4010750510750368=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
sdd=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
sr0    udf    WD Unlocker  57b20d3800000000=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
/run/media/uri/WD Unlocker


Thanks in advance.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15118302220.8eA4106f.29663
Date: Tue, 28 Nov 2017 00:50:22 +0000
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
   title=3D"NEW - [nouveau] Slowish and rough graphical interface with GTX =
1060"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103946">103946</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nouveau] Slowish and rough graphical interface with GTX 1060
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
          <td>nazgalist&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D135741=
" name=3D"attach_135741" title=3D"dmesg">attachment 135741</a> <a href=3D"a=
ttachment.cgi?id=3D135741&amp;action=3Dedit" title=3D"dmesg">[details]</a><=
/span>
dmesg

I have an eVGA geforce gtx 1060 6gb graphics card, I'm using nouveau drivers
(1.0.15-2), I'm on kernel 4.13.12-1 and I run Wayland (echo $XDG_SESSION_TY=
PE
prints wayland). I don't know if you need something else :(

Starts with a freeze, immediately following a slowish and rough/rude mouse
pointer movement and graphical interface. Describing what and when happens =
in
graphical interface:=20
-Gnome-shell's activities menu lasts a lot to appear, and scrolling between=
 the
list of applications is slowish and rough
-Switching between virtual desktops that has programs running into lasts (to
draw) too, but not between those that hasn't.
-Movies aren't playing. Movie player's taskbar indicator appears but no app=
ears
the movie player per se, it doesn't show up. Audio is playing without
interrupts fluently.
-Menus are displaying with slowness too.

It happens every time I boot on linux from a power off, but if I came from a
restart from Windows 10 it boots ok.
It apparently affects only mouse. When writing the keyboard its fluent and =
it
doesn't stops drawing on screen what i'm writing for 1 or 2 seconds after
showing everything I've written, like it does with the mouse device.
It happens in gdm and within gnome-shell session.

Bug appears on any of these two cases:

Steps to reproduce #1:
1. switch on from a previous power off.
2. select linux on grub.
3. boot.

Steps to reproduce #2:
1. switch on from a previous power off.
2. select windows 10 on grub.
3. power off from windows 10.
4. switch on.
5. select linux on grub.
6. boot.

Before gdm starts it's printed:
nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid
nouveau 0000:01:00.0: secboot: error during falcon reset: -110
nouveau 0000:01:00.0: gr: init failed, -110

Bug doesn't show up when:
1. switch on
2. select windows 10 on grub.
3. restart from windows 10.
4. select linux from grub.
5. boot

dmesg attached as a file.

lsblk -f:
NAME   FSTYPE LABEL        UUID                                 MOUNTPOINT
sda=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
=E2=94=9C=E2=94=80sda1 ntfs   Recuperaci=C3=B3n F6E6FC90E6FC51FB=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
=E2=94=9C=E2=94=80sda2 vfat                B200-9D56=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
=E2=94=9C=E2=94=80sda3=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
=E2=94=9C=E2=94=80sda4 ntfs                1C1615131614F00E=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
=E2=94=94=E2=94=80sda5 ntfs   STEAM        E61E74281E73F043=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
sdb=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
=E2=94=9C=E2=94=80sdb1 vfat                5B15-98FD                       =
     /boot
=E2=94=9C=E2=94=80sdb2 ext4                e7c2fde7-8120-4720-940a-a7b788bb=
d365 /
=E2=94=94=E2=94=80sdb3 ext4                8d5f5ffe-38fb-4889-9887-c59a9716=
77f6 /home
sdc=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
=E2=94=94=E2=94=80sdc1 ntfs   XTRA         4010750510750368=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
sdd=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
sr0    udf    WD Unlocker  57b20d3800000000=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
/run/media/uri/WD Unlocker


Thanks in advance.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15118302220.8eA4106f.29663--

--===============1352168836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1352168836==--
