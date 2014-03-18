From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76319] New: [NVE6] MMIO FAULT, black screen on K2100M
Date: Tue, 18 Mar 2014 13:39:05 +0000
Message-ID: <bug-76319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1371379089=="
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


--===============1371379089==
Content-Type: multipart/alternative; boundary="1395149946.EBaA01.5509"; charset="us-ascii"


--1395149946.EBaA01.5509
Date: Tue, 18 Mar 2014 13:39:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76319

          Priority: medium
            Bug ID: 76319
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVE6] MMIO FAULT, black screen on K2100M
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: blocker
    Classification: Unclassified
                OS: Linux (All)
          Reporter: d-bugzilla-vUpi/VKO0VA@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 95999
  --> https://bugs.freedesktop.org/attachment.cgi?id=95999&action=edit
# grep -n -i nouveau messages.out > messages.filtered

Experiencing a black screen when starting X on a Dell Precision M4800 QHD+
laptop (NVE6).
The internal screen size is 3200x1800 ; the DP-attached Dell UP2414Q measures
3840x2160.

The system is fully functional (ssh-enabled) and responds to VT switches
(CTRL-ALT-Fx), but all screens (X & VT) are black.

Sometimes (after a couple of minutes), I do notice a change in screen
brightness (power saving function ?).


- Fedora rawhide :
kernel-3.14.0-0.rc7.git0.1.fc21.x86_64
xorg-x11-server-Xorg-1.15.0-5.fc21.x86_64
xorg-x11-drv-nouveau-1.0.10-1.fc21.x86_64

- lscpi :
01:00.0 VGA compatible controller: NVIDIA Corporation GK106GLM [Quadro K2100M]
(rev a1)

- Kernel command line:
BOOT_IMAGE=/vmlinuz-rawhide-nouveau root=/dev/mapper/vg01-rootfs4 ro
rd.lvm.lv=vg01/rootfs4 vconsole.font=latarcyrheb-sun16 LANG=en_US.UTF-8
nouveau.debug=PDISP=debug,VBIOS=trace drm.debug=0xe

- Recompiled latest http://cgit.freedesktop.org/~darktama/nouveau/ as of
2014-03-18.



In the attached messages.filtered, X is started at line 1170.

As I am trying for several weeks now to get this system in a usable shape (Dell
disabled Optimus in the BIOS, and there are VT issues with the nVidia binary
blob), I am fully willing to recompile & test whatever you can possibly throw
at me.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395149946.EBaA01.5509
Date: Tue, 18 Mar 2014 13:39:06 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] MMIO FAULT, black screen on K2100M"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76319">76319</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE6] MMIO FAULT, black screen on K2100M
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>blocker
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
          <td>d-bugzilla&#64;moens.cc
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
          <td>git
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
        <pre>Created <span class=""><a href="attachment.cgi?id=95999" name="attach_95999" title="# grep -n -i nouveau messages.out &gt; messages.filtered">attachment 95999</a> <a href="attachment.cgi?id=95999&amp;action=edit" title="# grep -n -i nouveau messages.out &gt; messages.filtered">[details]</a></span>
# grep -n -i nouveau messages.out &gt; messages.filtered

Experiencing a black screen when starting X on a Dell Precision M4800 QHD+
laptop (NVE6).
The internal screen size is 3200x1800 ; the DP-attached Dell UP2414Q measures
3840x2160.

The system is fully functional (ssh-enabled) and responds to VT switches
(CTRL-ALT-Fx), but all screens (X &amp; VT) are black.

Sometimes (after a couple of minutes), I do notice a change in screen
brightness (power saving function ?).


- Fedora rawhide :
kernel-3.14.0-0.rc7.git0.1.fc21.x86_64
xorg-x11-server-Xorg-1.15.0-5.fc21.x86_64
xorg-x11-drv-nouveau-1.0.10-1.fc21.x86_64

- lscpi :
01:00.0 VGA compatible controller: NVIDIA Corporation GK106GLM [Quadro K2100M]
(rev a1)

- Kernel command line:
BOOT_IMAGE=/vmlinuz-rawhide-nouveau root=/dev/mapper/vg01-rootfs4 ro
rd.lvm.lv=vg01/rootfs4 vconsole.font=latarcyrheb-sun16 LANG=en_US.UTF-8
nouveau.debug=PDISP=debug,VBIOS=trace drm.debug=0xe

- Recompiled latest <a href="http://cgit.freedesktop.org/~darktama/nouveau/">http://cgit.freedesktop.org/~darktama/nouveau/</a> as of
2014-03-18.



In the attached messages.filtered, X is started at line 1170.

As I am trying for several weeks now to get this system in a usable shape (Dell
disabled Optimus in the BIOS, and there are VT issues with the nVidia binary
blob), I am fully willing to recompile &amp; test whatever you can possibly throw
at me.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395149946.EBaA01.5509--

--===============1371379089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1371379089==--
