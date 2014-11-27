From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86794] New: Several nouveau related errors with
 xf86-video-nouveau with NVIDIA G92 [GeForce 9800 GT] and GF108 [GeForce GT
 620] (rev a1).
Date: Thu, 27 Nov 2014 16:47:27 +0000
Message-ID: <bug-86794-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0748018041=="
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


--===============0748018041==
Content-Type: multipart/alternative; boundary="1417106847.0fB7b1.7237"; charset="UTF-8"


--1417106847.0fB7b1.7237
Date: Thu, 27 Nov 2014 16:47:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86794

            Bug ID: 86794
           Summary: Several nouveau related errors with xf86-video-nouveau
                    with NVIDIA G92 [GeForce 9800 GT] and GF108 [GeForce
                    GT 620] (rev a1).
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: rose-L/08BfOuEgquzba0o+Ga+bNAH6kLmebB@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Almost once a day X11 hangs. An other issue is that the windows are moving more
ore randomly up and down (from foreground to background). Very often is at the
window position only a shadow of the window frame filled with the pattern of
the desktop background. 

If the desktop is hanging it is sometimes possible to switch to console with
ALT-CTL-F1, sometimes I have to login via ssh to check the log files. Often I
'dmesg' reports thne something like:
...
[175947.652266] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x00014a2000
[PAGE_NOT_PRESENT] from PGRAPH/GPC0/TEX on channel 0x003fb74000
[gnome-shell[27277]]
[175947.652281] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on
channel 5, recovering...
[175947.652315] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 5 [0x003fb74000
gnome-shell[27277]]
[175947.652331] nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC0/TEX: 0x80000049
[175947.652340] nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC1/TEX: 0x80000049
[176136.543763] nouveau E[Xorg[26420]] failed to idle channel 0xcccc0000
[Xorg[26420]]
[176151.552203] nouveau E[Xorg[26420]] failed to idle channel 0xcccc0000
[Xorg[26420]]
[176151.552337] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x000001b000
[PAGE_NOT_PRESENT] from PFIFO/BAR_READ on channel 0x003fc60000 [unknown]
[176153.985794] nouveau E[     DRM] GPU lockup - switching to software fbcon


'journalctl -xb | grep -A 6 "NVIDIA\|NOUVEAU\|nouveau E"' says:
...
Nov 01 08:32:51 impala gdm-Xorg-:0[26420]: (II) NOUVEAU(0): Monitor name:
W3000H
Nov 01 08:32:51 impala gdm-Xorg-:0[26420]: (II) NOUVEAU(0): Monitor name:
Nov 01 08:32:51 impala gdm-Xorg-:0[26420]: (II) NOUVEAU(0): EDID (in hex):
Nov 01 08:32:51 impala gdm-Xorg-:0[26420]: (II) NOUVEAU(0):        
00ffffffffffff001e6dea754d810600
...
Nov 02 23:54:39 impala kernel: nouveau E[   PFIFO][0000:01:00.0] read fault at
0x00014a2000 [PAGE_NOT_PRESENT] from PGRAPH/GPC0/TEX on channel 0x003fb74000
[gnome-shell[27277]]
Nov 02 23:54:39 impala kernel: nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine
fault on channel 5, recovering...
Nov 02 23:54:39 impala kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 5
[0x003fb74000 gnome-shell[27277]]
Nov 02 23:54:39 impala kernel: nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC0/TEX:
0x80000049
Nov 02 23:54:39 impala kernel: nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC1/TEX:
0x80000049


If the the window is randomly shifted randomly up and down 'journal -xb'
reports
...
Nov 26 08:16:45 impala gnome-session[31470]: Fensterverwalter-Warnung:Buggy
client sent a _NET_ACTIVE_WINDOW message with a timestamp of 0 for 0x320000d
(sshd_confi)
Nov 26 08:16:45 impala gnome-session[31470]:
Fensterverwalter-Warnung:meta_window_activate called by a pager with a 0
timestamp; the pager needs to be fixed.
...
Nov 26 08:22:57 impala gnome-session[31470]:
Fensterverwalter-Warnung:last_focus_time (49506834) is greater than comparison
timestamp (49506833).  This most likely represents a buggy client sending
inaccurate timestamps 
...



The errors are also file as gentoo bugs at
https://bugs.gentoo.org/show_bug.cgi?id=530780 and
https://bugs.gentoo.org/show_bug.cgi?id=528100.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1417106847.0fB7b1.7237
Date: Thu, 27 Nov 2014 16:47:27 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Several nouveau related errors with xf86-video-nouveau with NVIDIA G92 [GeForce 9800 GT] and GF108 [GeForce GT 620] (rev a1)."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86794">86794</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Several nouveau related errors with xf86-video-nouveau with NVIDIA G92 [GeForce 9800 GT] and GF108 [GeForce GT 620] (rev a1).
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
          <td>rose&#64;rz.uni-potsdam.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Almost once a day X11 hangs. An other issue is that the windows are moving more
ore randomly up and down (from foreground to background). Very often is at the
window position only a shadow of the window frame filled with the pattern of
the desktop background. 

If the desktop is hanging it is sometimes possible to switch to console with
ALT-CTL-F1, sometimes I have to login via ssh to check the log files. Often I
'dmesg' reports thne something like:
...
[175947.652266] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x00014a2000
[PAGE_NOT_PRESENT] from PGRAPH/GPC0/TEX on channel 0x003fb74000
[gnome-shell[27277]]
[175947.652281] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on
channel 5, recovering...
[175947.652315] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 5 [0x003fb74000
gnome-shell[27277]]
[175947.652331] nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC0/TEX: 0x80000049
[175947.652340] nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC1/TEX: 0x80000049
[176136.543763] nouveau E[Xorg[26420]] failed to idle channel 0xcccc0000
[Xorg[26420]]
[176151.552203] nouveau E[Xorg[26420]] failed to idle channel 0xcccc0000
[Xorg[26420]]
[176151.552337] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x000001b000
[PAGE_NOT_PRESENT] from PFIFO/BAR_READ on channel 0x003fc60000 [unknown]
[176153.985794] nouveau E[     DRM] GPU lockup - switching to software fbcon


'journalctl -xb | grep -A 6 &quot;NVIDIA\|NOUVEAU\|nouveau E&quot;' says:
...
Nov 01 08:32:51 impala gdm-Xorg-:0[26420]: (II) NOUVEAU(0): Monitor name:
W3000H
Nov 01 08:32:51 impala gdm-Xorg-:0[26420]: (II) NOUVEAU(0): Monitor name:
Nov 01 08:32:51 impala gdm-Xorg-:0[26420]: (II) NOUVEAU(0): EDID (in hex):
Nov 01 08:32:51 impala gdm-Xorg-:0[26420]: (II) NOUVEAU(0):        
00ffffffffffff001e6dea754d810600
...
Nov 02 23:54:39 impala kernel: nouveau E[   PFIFO][0000:01:00.0] read fault at
0x00014a2000 [PAGE_NOT_PRESENT] from PGRAPH/GPC0/TEX on channel 0x003fb74000
[gnome-shell[27277]]
Nov 02 23:54:39 impala kernel: nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine
fault on channel 5, recovering...
Nov 02 23:54:39 impala kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 5
[0x003fb74000 gnome-shell[27277]]
Nov 02 23:54:39 impala kernel: nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC0/TEX:
0x80000049
Nov 02 23:54:39 impala kernel: nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC1/TEX:
0x80000049


If the the window is randomly shifted randomly up and down 'journal -xb'
reports
...
Nov 26 08:16:45 impala gnome-session[31470]: Fensterverwalter-Warnung:Buggy
client sent a _NET_ACTIVE_WINDOW message with a timestamp of 0 for 0x320000d
(sshd_confi)
Nov 26 08:16:45 impala gnome-session[31470]:
Fensterverwalter-Warnung:meta_window_activate called by a pager with a 0
timestamp; the pager needs to be fixed.
...
Nov 26 08:22:57 impala gnome-session[31470]:
Fensterverwalter-Warnung:last_focus_time (49506834) is greater than comparison
timestamp (49506833).  This most likely represents a buggy client sending
inaccurate timestamps 
...



The errors are also file as gentoo bugs at
<a href="https://bugs.gentoo.org/show_bug.cgi?id=530780">https://bugs.gentoo.org/show_bug.cgi?id=530780</a> and
<a href="https://bugs.gentoo.org/show_bug.cgi?id=528100">https://bugs.gentoo.org/show_bug.cgi?id=528100</a>.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1417106847.0fB7b1.7237--

--===============0748018041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0748018041==--
