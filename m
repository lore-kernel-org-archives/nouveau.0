From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101676] New: kmail hangs or causes desktop to hang
 when used with Nouveau graphics driver
Date: Mon, 03 Jul 2017 14:22:58 +0000
Message-ID: <bug-101676-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2058272097=="
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


--===============2058272097==
Content-Type: multipart/alternative; boundary="14990917780.416051D4C.29789";
 charset="UTF-8"


--14990917780.416051D4C.29789
Date: Mon, 3 Jul 2017 14:22:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101676

            Bug ID: 101676
           Summary: kmail hangs or causes desktop to hang when used with
                    Nouveau graphics driver
           Product: Mesa
           Version: unspecified
          Hardware: Other
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: nick.craig.law-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 132409
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D132409&action=3Dedit
syslog output when kmail causes kmail/desktop to hang

System Config, KDE Neon LTS 5.8.7, Nouveau driver 1:1.0.12-2 as described by
Ubuntu 16.04.1 LTS. Nvidia GeForce GTX570M, kmail 5.5.2.

Kmail will become unresponsive when attempting to scroll or click left on an
email. Sometimes just the controls/buttons in kmail will be unreponsive but
sometimes the whole desktop will become unreponsive and freeze, requiring a
ALT-SYSRq RSEIUB command to reboot system, ALT-F1 not working. If instead I=
 use
the Nvidia 375 driver the problem disappears, so this problem seems to be
related to the use of the Nouveau driver. syslog reports the following erro=
rs..


Jul  2 23:02:30 nick-X681X kernel: [12787.488155] nouveau 0000:01:00.0:
kmail[8229]: Unknown handle 0x0000002c
Jul  2 23:02:30 nick-X681X kernel: [12787.488159] nouveau 0000:01:00.0:
kmail[8229]: validate_init
Jul  2 23:02:30 nick-X681X kernel: [12787.488161] nouveau 0000:01:00.0:
kmail[8229]: validate: -2
Jul  2 23:02:33 nick-X681X kernel: [12790.327435] nouveau 0000:01:00.0: gr:
TRAP ch 17 [005f1f4000 kmail[8229]]
Jul  2 23:02:33 nick-X681X kernel: [12790.327448] nouveau 0000:01:00.0: gr:
GPC0/TPC0/TEX: 80000041
Jul  2 23:02:33 nick-X681X kernel: [12790.327456] nouveau 0000:01:00.0: gr:
GPC0/TPC1/TEX: 80000041
Jul  2 23:02:33 nick-X681X kernel: [12790.327464] nouveau 0000:01:00.0: gr:
GPC0/TPC2/TEX: 80000041
Jul  2 23:02:33 nick-X681X kernel: [12790.327472] nouveau 0000:01:00.0: gr:
GPC0/TPC3/TEX: 80000041
Jul  2 23:02:33 nick-X681X kernel: [12790.327481] nouveau 0000:01:00.0: gr:
GPC1/TPC0/TEX: 80000041
Jul  2 23:02:33 nick-X681X kernel: [12790.327489] nouveau 0000:01:00.0: gr:
GPC1/TPC1/TEX: 80000041
Jul  2 23:02:33 nick-X681X kernel: [12790.327498] nouveau 0000:01:00.0: gr:
GPC1/TPC2/TEX: 80000041
Jul  2 23:02:33 nick-X681X kernel: [12790.327513] nouveau 0000:01:00.0: fif=
o:
read fault at 0002a0a000 engine 00 [PGRAPH] client 01 [GPC1/TEX] reason 02
[PAGE_NOT_PRESENT] on channel 17 [005f1f4000 kmail[8229]]
Jul  2 23:02:33 nick-X681X kernel: [12790.327516] nouveau 0000:01:00.0: fif=
o:
gr engine fault on channel 17, recovering...
Jul  2 23:03:33 nick-X681X kernel: [12850.755747] nouveau 0000:01:00.0:
kmail[8229]: failed to idle channel 17 [kmail[8229]]
Jul  2 23:03:48 nick-X681X kernel: [12865.757800] nouveau 0000:01:00.0:
kmail[8229]: failed to idle channel 17 [kmail[8229]]

It also generates a second different error on some occasions ie a FIFO read
fault at 0001afa00 engine 00 [PGRAPH] client 01 [GPC1/TEX] reason 02 [Page =
not
present] on channel 5.

This error tends to hang the entire desktop, hence why I have attached a ph=
oto
of the tail -f /var/log/syslog output.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14990917780.416051D4C.29789
Date: Mon, 3 Jul 2017 14:22:58 +0000
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
   title=3D"NEW - kmail hangs or causes desktop to hang when used with Nouv=
eau graphics driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101676">101676</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>kmail hangs or causes desktop to hang when used with Nouveau =
graphics driver
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
          <td>Other
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
          <td>critical
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
          <td>nick.craig.law&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D132409=
" name=3D"attach_132409" title=3D"syslog output when kmail causes kmail/des=
ktop to hang">attachment 132409</a> <a href=3D"attachment.cgi?id=3D132409&a=
mp;action=3Dedit" title=3D"syslog output when kmail causes kmail/desktop to=
 hang">[details]</a></span>
syslog output when kmail causes kmail/desktop to hang

System Config, KDE Neon LTS 5.8.7, Nouveau driver 1:1.0.12-2 as described by
Ubuntu 16.04.1 LTS. Nvidia GeForce GTX570M, kmail 5.5.2.

Kmail will become unresponsive when attempting to scroll or click left on an
email. Sometimes just the controls/buttons in kmail will be unreponsive but
sometimes the whole desktop will become unreponsive and freeze, requiring a
ALT-SYSRq RSEIUB command to reboot system, ALT-F1 not working. If instead I=
 use
the Nvidia 375 driver the problem disappears, so this problem seems to be
related to the use of the Nouveau driver. syslog reports the following erro=
rs..


Jul  2 23:02:30 nick-X681X kernel: [12787.488155] nouveau 0000:01:00.0:
kmail[8229]: Unknown handle 0x0000002c
Jul  2 23:02:30 nick-X681X kernel: [12787.488159] nouveau 0000:01:00.0:
kmail[8229]: validate_init
Jul  2 23:02:30 nick-X681X kernel: [12787.488161] nouveau 0000:01:00.0:
kmail[8229]: validate: -2
Jul  2 23:02:33 nick-X681X kernel: [12790.327435] nouveau 0000:01:00.0: gr:
TRAP ch 17 [005f1f4000 kmail[8229]]
Jul  2 23:02:33 nick-X681X kernel: [12790.327448] nouveau 0000:01:00.0: gr:
GPC0/TPC0/TEX: 80000041
Jul  2 23:02:33 nick-X681X kernel: [12790.327456] nouveau 0000:01:00.0: gr:
GPC0/TPC1/TEX: 80000041
Jul  2 23:02:33 nick-X681X kernel: [12790.327464] nouveau 0000:01:00.0: gr:
GPC0/TPC2/TEX: 80000041
Jul  2 23:02:33 nick-X681X kernel: [12790.327472] nouveau 0000:01:00.0: gr:
GPC0/TPC3/TEX: 80000041
Jul  2 23:02:33 nick-X681X kernel: [12790.327481] nouveau 0000:01:00.0: gr:
GPC1/TPC0/TEX: 80000041
Jul  2 23:02:33 nick-X681X kernel: [12790.327489] nouveau 0000:01:00.0: gr:
GPC1/TPC1/TEX: 80000041
Jul  2 23:02:33 nick-X681X kernel: [12790.327498] nouveau 0000:01:00.0: gr:
GPC1/TPC2/TEX: 80000041
Jul  2 23:02:33 nick-X681X kernel: [12790.327513] nouveau 0000:01:00.0: fif=
o:
read fault at 0002a0a000 engine 00 [PGRAPH] client 01 [GPC1/TEX] reason 02
[PAGE_NOT_PRESENT] on channel 17 [005f1f4000 kmail[8229]]
Jul  2 23:02:33 nick-X681X kernel: [12790.327516] nouveau 0000:01:00.0: fif=
o:
gr engine fault on channel 17, recovering...
Jul  2 23:03:33 nick-X681X kernel: [12850.755747] nouveau 0000:01:00.0:
kmail[8229]: failed to idle channel 17 [kmail[8229]]
Jul  2 23:03:48 nick-X681X kernel: [12865.757800] nouveau 0000:01:00.0:
kmail[8229]: failed to idle channel 17 [kmail[8229]]

It also generates a second different error on some occasions ie a FIFO read
fault at 0001afa00 engine 00 [PGRAPH] client 01 [GPC1/TEX] reason 02 [Page =
not
present] on channel 5.

This error tends to hang the entire desktop, hence why I have attached a ph=
oto
of the tail -f /var/log/syslog output.</pre>
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

--14990917780.416051D4C.29789--

--===============2058272097==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2058272097==--
