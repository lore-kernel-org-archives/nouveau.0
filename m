From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71659] New: [NVD9] Hangs under load with ![
 PFIFO][0000:01:00.0] unhandled status 0x00800000
Date: Fri, 15 Nov 2013 20:14:42 +0000
Message-ID: <bug-71659-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1527352145=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1527352145==
Content-Type: multipart/alternative; boundary="1384546482.8Cedc60a1.31686"; charset="us-ascii"


--1384546482.8Cedc60a1.31686
Date: Fri, 15 Nov 2013 20:14:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71659

          Priority: medium
            Bug ID: 71659
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVD9] Hangs under load with ![   PFIFO][0000:01:00.0]
                    unhandled status 0x00800000
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: R.Palmer-mHdZ94l+r7K1Qrn1Bg8BZw@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

With the Nouveau driver selected, my NVS 4200M/Ubuntu 13.10 system frequently
hangs when under heavy graphics load (flightgear usually triggers this within a
few minutes) and/or on battery power.  This does not happen with the nvidia-319
binary driver.

The mouse pointer continues to move at first, but often freezes later; the
keyboard LEDs do not react.  Sounds already playing continue until finished,
but no new ones start (i.e. applications are frozen).  Alt+SysRq works.

The kernel log always has the error
nouveau ![   PFIFO][0000:01:00.0] unhandled status 0x00800000
usually preceded by several instances of the warning
nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
and followed by a wide range of other errors.

This happens with both the default (3.11.0) kernel (Ubuntu bug
https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1243557
) and the latest git kernel, with the default userspace (libdrm-nouveau
2.4.46/xserver-xorg-video-nouveau 1.0.9/mesa 9.2.1); the attached logs are with
the latter (crashes at Nov 15 18:05 and 18:42 in the kernel log, the Xorg log
is from the second of these).

With the latest git userspace (xorg/proto/dri3proto, mesa/drm, xcb/libxcb,
xorg/lib/libxshmfence, mesa/mesa, xorg/proto/presentproto, xcb/proto,
nouveau/xf86-video-nouveau), the system hangs on boot (at a correctly displayed
graphical splash screen), with Alt+SysRq not working and nothing recognisable
as an error in the logs.  I suspect this is due to an incompatible combination
of Ubuntu and latest-git (the recommended mesa/drm, nouveau/xf86-video-nouveau,
mesa/mesa wouldn't compile on its own, as it needs dri3 which isn't in Ubuntu
yet).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384546482.8Cedc60a1.31686
Date: Fri, 15 Nov 2013 20:14:42 +0000
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
   title="NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unhandled status 0x00800000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71659">71659</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVD9] Hangs under load with ![   PFIFO][0000:01:00.0] unhandled status 0x00800000
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
          <td>R.Palmer&#64;bham.ac.uk
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
        <pre>With the Nouveau driver selected, my NVS 4200M/Ubuntu 13.10 system frequently
hangs when under heavy graphics load (flightgear usually triggers this within a
few minutes) and/or on battery power.  This does not happen with the nvidia-319
binary driver.

The mouse pointer continues to move at first, but often freezes later; the
keyboard LEDs do not react.  Sounds already playing continue until finished,
but no new ones start (i.e. applications are frozen).  Alt+SysRq works.

The kernel log always has the error
nouveau ![   PFIFO][0000:01:00.0] unhandled status 0x00800000
usually preceded by several instances of the warning
nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
and followed by a wide range of other errors.

This happens with both the default (3.11.0) kernel (Ubuntu bug
<a href="https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1243557">https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1243557</a>
) and the latest git kernel, with the default userspace (libdrm-nouveau
2.4.46/xserver-xorg-video-nouveau 1.0.9/mesa 9.2.1); the attached logs are with
the latter (crashes at Nov 15 18:05 and 18:42 in the kernel log, the Xorg log
is from the second of these).

With the latest git userspace (xorg/proto/dri3proto, mesa/drm, xcb/libxcb,
xorg/lib/libxshmfence, mesa/mesa, xorg/proto/presentproto, xcb/proto,
nouveau/xf86-video-nouveau), the system hangs on boot (at a correctly displayed
graphical splash screen), with Alt+SysRq not working and nothing recognisable
as an error in the logs.  I suspect this is due to an incompatible combination
of Ubuntu and latest-git (the recommended mesa/drm, nouveau/xf86-video-nouveau,
mesa/mesa wouldn't compile on its own, as it needs dri3 which isn't in Ubuntu
yet).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384546482.8Cedc60a1.31686--

--===============1527352145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1527352145==--
