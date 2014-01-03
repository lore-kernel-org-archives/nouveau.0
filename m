From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73267] New: Nouveau: corrupted laptop screen's EDID
	info
Date: Fri, 03 Jan 2014 21:11:42 +0000
Message-ID: <bug-73267-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1958658015=="
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


--===============1958658015==
Content-Type: multipart/alternative; boundary="1388783502.AEAD471.19282"; charset="us-ascii"


--1388783502.AEAD471.19282
Date: Fri, 3 Jan 2014 21:11:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73267

          Priority: medium
            Bug ID: 73267
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Nouveau: corrupted laptop screen's EDID info
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: ezelspinguin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 7.7 (2011)
         Component: Driver/nouveau
           Product: xorg

This is a reopen for #34554. If I'm wrong to report a new issue, please excuse
me.

On my Macbook Pro 6,2 (mid 2010) (coincidentally the same as in the above bug),
I was suddenly presented with an entirely black screen at a certain boot
(morning Dec 29th), and ever since. I did not make any system changes before
that cold boot. I do remember the system not shutting off properly the night
before.

Symptoms are the same (I have not tested other OSes):
Black internal screen (no backlight) all the way, even the grey EFI bootloader
screen is not there. PRAM reset works as normal (and should reset brightness so
that is not it). Looked at by Genius bar and they suspected a disconnected LVDS
cable, but that does not seem to be the problem.

External monitor works from the linux boot console kernel output on, but no
grey EFI bootloader screen. When external monitor is connected, the keyboard
lights up as well.

In the dmesg (with external monitor connected):
[    6.443945] Raw EDID:
[    6.443948]      00 00 00 00 00 07 4f 00 06 10 bb 9c 00 00 00 00
[    6.443950]      00 13 01 03 80 21 15 78 0a 50 c5 98 58 52 8e 27
[    6.443952]      25 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
[    6.443954]      01 01 01 01 01 01 7c 2e 90 a0 60 1a 1e 40 30 20
[    6.443956]      36 00 4b cf 10 00 00 18 00 00 00 01 00 06 10 30
[    6.443958]      00 00 00 00 00 00 00 00 0a 20 00 00 00 fe 00 4c
[    6.443960]      50 31 35 34 57 45 33 2d 54 4c 42 31 00 00 00 fe
[    6.443962]      00 43 6f 6c 6f 72 20 4c 43 44 0a 20 20 20 00 dd
[    6.478432] Raw EDID:
[    6.478434]      00 00 00 00 00 07 4f 00 06 10 bb 9c 00 00 00 00
[    6.478437]      00 13 01 03 80 21 15 78 0a 50 c5 98 58 52 8e 27
[    6.478439]      25 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
[    6.478441]      01 01 01 01 01 01 7c 2e 90 a0 60 1a 1e 40 30 20
[    6.478443]      36 00 4b cf 10 00 00 18 00 00 00 01 00 06 10 30
[    6.478445]      00 00 00 00 00 00 00 00 0a 20 00 00 00 fe 00 4c
[    6.478447]      50 31 35 34 57 45 33 2d 54 4c 42 31 00 00 00 fe
[    6.478449]      00 43 6f 6c 6f 72 20 4c 43 44 0a 20 20 20 00 dd
[    6.512977] Raw EDID:
[    6.512979]      00 00 00 00 00 07 4f 00 06 10 bb 9c 00 00 00 00
[    6.512981]      00 13 01 03 80 21 15 78 0a 50 c5 98 58 52 8e 27
[    6.512983]      25 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
[    6.512986]      01 01 01 01 01 01 7c 2e 90 a0 60 1a 1e 40 30 20
[    6.512988]      36 00 4b cf 10 00 00 18 00 00 00 01 00 06 10 30
[    6.512990]      00 00 00 00 00 00 00 00 0a 20 00 00 00 fe 00 4c
[    6.512992]      50 31 35 34 57 45 33 2d 54 4c 42 31 00 00 00 fe
[    6.512994]      00 43 6f 6c 6f 72 20 4c 43 44 0a 20 20 20 00 dd
[    6.547469] Raw EDID:
[    6.547471]      00 00 00 00 00 07 4f 00 06 10 bb 9c 00 00 00 00
[    6.547474]      00 13 01 03 80 21 15 78 0a 50 c5 98 58 52 8e 27
[    6.547476]      25 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
[    6.547478]      01 01 01 01 01 01 7c 2e 90 a0 60 1a 1e 40 30 20
[    6.547480]      36 00 4b cf 10 00 00 18 00 00 00 01 00 06 10 30
[    6.547482]      00 00 00 00 00 00 00 00 0a 20 00 00 00 fe 00 4c
[    6.547484]      50 31 35 34 57 45 33 2d 54 4c 42 31 00 00 00 fe
[    6.547486]      00 43 6f 6c 6f 72 20 4c 43 44 0a 20 20 20 00 dd
[    6.547490] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[    6.547493] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[    6.682213] nouveau  [     DRM] allocated 1920x1080 fb: 0x70000, bo
ffff88015e55b800

The line with "DDC responded, but no EDID for LVDS-1" repeats often.

Significant is that these long EDID reports only show up from the 29th onwards,
as well as on the last boot of the 28th (boot before the problematic boot).

That last boot shows:

Dec 28 20:47:08 defiant kernel: [19803.436112] Raw EDID:
Dec 28 20:47:08 defiant kernel: [19803.436119]      fb fb ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 28 20:47:08 defiant kernel: [19803.436121]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 28 20:47:08 defiant kernel: [19803.436122]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 28 20:47:08 defiant kernel: [19803.436123]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 28 20:47:08 defiant kernel: [19803.436124]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 28 20:47:08 defiant kernel: [19803.436125]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 28 20:47:08 defiant kernel: [19803.436126]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 28 20:47:08 defiant kernel: [19803.436127]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 28 20:47:08 defiant kernel: [19803.470773] Raw EDID:
Dec 28 20:47:08 defiant kernel: [19803.470781]      00 00 00 00 00 07 4f 00 06
10 bb 9c 00 00 00 00
Dec 28 20:47:08 defiant kernel: [19803.470783]      00 13 01 03 80 21 15 78 0a
50 c5 98 58 52 8e 27
Dec 28 20:47:08 defiant kernel: [19803.470784]      25 50 54 00 00 00 01 01 01
01 01 01 01 01 01 01
Dec 28 20:47:08 defiant kernel: [19803.470785]      01 01 01 01 01 01 7c 2e 90
a0 60 1a 1e 40 30 20
Dec 28 20:47:08 defiant kernel: [19803.470786]      36 00 4b cf 10 00 00 18 00
00 00 01 00 06 10 30
Dec 28 20:47:08 defiant kernel: [19803.470788]      00 00 00 00 00 00 00 00 0a
20 00 00 00 fe 00 4c
Dec 28 20:47:08 defiant kernel: [19803.470789]      50 31 35 34 57 45 33 2d 54
4c 42 31 00 00 00 fe
Dec 28 20:47:08 defiant kernel: [19803.470790]      00 43 6f 6c 6f 72 20 4c 43
44 0a 20 20 20 00 dd
Dec 28 20:47:08 defiant kernel: [19803.504839] Raw EDID:
Dec 28 20:47:08 defiant kernel: [19803.504847]      00 00 00 00 00 07 4f 00 06
10 bb 9c 00 00 00 00
Dec 28 20:47:08 defiant kernel: [19803.504848]      00 13 01 03 80 21 15 78 0a
50 c5 98 58 52 8e 27
Dec 28 20:47:08 defiant kernel: [19803.504849]      25 50 54 00 00 00 01 01 01
01 01 01 01 01 01 01
Dec 28 20:47:08 defiant kernel: [19803.504850]      01 01 01 01 01 01 7c 2e 90
a0 60 1a 1e 40 30 20
Dec 28 20:47:08 defiant kernel: [19803.504851]      36 00 4b cf 10 00 00 18 00
00 00 01 00 06 10 30
Dec 28 20:47:08 defiant kernel: [19803.504852]      00 00 00 00 00 00 00 00 0a
20 00 00 00 fe 00 4c
Dec 28 20:47:08 defiant kernel: [19803.504853]      50 31 35 34 57 45 33 2d 54
4c 42 31 00 00 00 fe
Dec 28 20:47:08 defiant kernel: [19803.504854]      00 43 6f 6c 6f 72 20 4c 43
44 0a 20 20 20 00 dd
Dec 28 20:47:08 defiant kernel: [19803.538901] Raw EDID:
Dec 28 20:47:08 defiant kernel: [19803.538909]      00 00 00 00 00 07 4f 00 06
10 bb 9c 00 00 00 00
Dec 28 20:47:08 defiant kernel: [19803.538910]      00 13 01 03 80 21 15 78 0a
50 c5 98 58 52 8e 27
Dec 28 20:47:08 defiant kernel: [19803.538911]      25 50 54 00 00 00 01 01 01
01 01 01 01 01 01 01
Dec 28 20:47:08 defiant kernel: [19803.538912]      01 01 01 01 01 01 7c 2e 90
a0 60 1a 1e 40 30 20
Dec 28 20:47:08 defiant kernel: [19803.538913]      36 00 4b cf 10 00 00 18 00
00 00 01 00 06 10 30
Dec 28 20:47:08 defiant kernel: [19803.538914]      00 00 00 00 00 00 00 00 0a
20 00 00 00 fe 00 4c
Dec 28 20:47:08 defiant kernel: [19803.538915]      50 31 35 34 57 45 33 2d 54
4c 42 31 00 00 00 fe
Dec 28 20:47:08 defiant kernel: [19803.538916]      00 43 6f 6c 6f 72 20 4c 43
44 0a 20 20 20 00 dd
Dec 28 20:47:08 defiant kernel: [19803.538921] nouveau 0000:01:00.0: LVDS-1:
EDID block 0 invalid.
Dec 28 20:47:08 defiant kernel: [19803.538926] nouveau E[     DRM] DDC
responded, but no EDID for LVDS-1


In earlier correct boots I regularly find:

Dec 24 12:37:49 defiant kernel: [ 7225.572415] [drm:drm_edid_block_valid]
*ERROR* EDID checksum is invalid, remainder is 92
Dec 24 12:37:49 defiant kernel: [ 7225.572421] Raw EDID:
Dec 24 12:37:49 defiant kernel: [ 7225.572426]      00 ff ff ff ff ff ff 00 06
10 bb 9c 00 00 00 00
Dec 24 12:37:49 defiant kernel: [ 7225.572428]      00 13 01 03 80 21 15 78 0a
50 c5 98 58 52 8e 21
Dec 24 12:37:49 defiant kernel: [ 7225.572430]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 24 12:37:49 defiant kernel: [ 7225.572433]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 24 12:37:49 defiant kernel: [ 7225.572435]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 24 12:37:49 defiant kernel: [ 7225.572437]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 24 12:37:49 defiant kernel: [ 7225.572439]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 24 12:37:49 defiant kernel: [ 7225.572441]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff


Dec 25 12:15:51 defiant kernel: [ 2707.066122] [drm:drm_edid_block_valid]
*ERROR* EDID checksum is invalid, remainder is 255
Dec 25 12:15:51 defiant kernel: [ 2707.066129] Raw EDID:
Dec 25 12:15:51 defiant kernel: [ 2707.066133]      00 ff ff ff ff ff ff 00 06
10 bb 9c 00 00 00 00
Dec 25 12:15:51 defiant kernel: [ 2707.066136]      00 13 01 03 80 20 15 78 0a
50 c5 98 58 52 8e 27
Dec 25 12:15:51 defiant kernel: [ 2707.066138]      25 50 54 00 00 00 01 01 01
01 01 01 01 01 01 01
Dec 25 12:15:51 defiant kernel: [ 2707.066140]      01 01 01 01 01 01 7c 2e 90
a0 60 1a 1e 40 30 20
Dec 25 12:15:51 defiant kernel: [ 2707.066142]      36 00 4b cf 10 00 00 18 00
00 00 01 00 06 10 30
Dec 25 12:15:51 defiant kernel: [ 2707.066145]      00 00 00 00 00 00 00 00 0a
20 00 00 00 fe 00 4c
Dec 25 12:15:51 defiant kernel: [ 2707.066147]      50 31 35 34 57 45 33 2d 54
4c 42 31 00 00 00 fe
Dec 25 12:15:51 defiant kernel: [ 2707.066149]      00 43 6f 6c 6f 72 20 4c 43
44 0a 20 20 20 00 dd


As to the recommendation to try the latest updates, my mint system is up to
date (slight updated after problem occurred). Versions:
xorg 1:7.7+1ubuntu4
xserver-xorg-video-nouveau 1:1.0.7+git20130516.bf72ae1f-0ubuntu0sarvatt~raring
libgl1-mesa-dri 9.2.0~git20130627.15085b47-0ubuntu0sarvatt~raring
kernel 3.8.0-25-generic
As you can see, neither kernel nor nouveau are at the requested highest
versions, but these do not seem easily available for my distro. With some
pointers I can try them but am not sure what they would fix as corruption has
already occurred.


I will now proceed and try to repair.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1388783502.AEAD471.19282
Date: Fri, 3 Jan 2014 21:11:42 +0000
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
   title="NEW --- - Nouveau: corrupted laptop screen's EDID info"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73267">73267</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau: corrupted laptop screen's EDID info
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
          <td>ezelspinguin&#64;gmail.com
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
          <td>7.7 (2011)
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
        <pre>This is a reopen for #34554. If I'm wrong to report a new issue, please excuse
me.

On my Macbook Pro 6,2 (mid 2010) (coincidentally the same as in the above bug),
I was suddenly presented with an entirely black screen at a certain boot
(morning Dec 29th), and ever since. I did not make any system changes before
that cold boot. I do remember the system not shutting off properly the night
before.

Symptoms are the same (I have not tested other OSes):
Black internal screen (no backlight) all the way, even the grey EFI bootloader
screen is not there. PRAM reset works as normal (and should reset brightness so
that is not it). Looked at by Genius bar and they suspected a disconnected LVDS
cable, but that does not seem to be the problem.

External monitor works from the linux boot console kernel output on, but no
grey EFI bootloader screen. When external monitor is connected, the keyboard
lights up as well.

In the dmesg (with external monitor connected):
[    6.443945] Raw EDID:
[    6.443948]      00 00 00 00 00 07 4f 00 06 10 bb 9c 00 00 00 00
[    6.443950]      00 13 01 03 80 21 15 78 0a 50 c5 98 58 52 8e 27
[    6.443952]      25 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
[    6.443954]      01 01 01 01 01 01 7c 2e 90 a0 60 1a 1e 40 30 20
[    6.443956]      36 00 4b cf 10 00 00 18 00 00 00 01 00 06 10 30
[    6.443958]      00 00 00 00 00 00 00 00 0a 20 00 00 00 fe 00 4c
[    6.443960]      50 31 35 34 57 45 33 2d 54 4c 42 31 00 00 00 fe
[    6.443962]      00 43 6f 6c 6f 72 20 4c 43 44 0a 20 20 20 00 dd
[    6.478432] Raw EDID:
[    6.478434]      00 00 00 00 00 07 4f 00 06 10 bb 9c 00 00 00 00
[    6.478437]      00 13 01 03 80 21 15 78 0a 50 c5 98 58 52 8e 27
[    6.478439]      25 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
[    6.478441]      01 01 01 01 01 01 7c 2e 90 a0 60 1a 1e 40 30 20
[    6.478443]      36 00 4b cf 10 00 00 18 00 00 00 01 00 06 10 30
[    6.478445]      00 00 00 00 00 00 00 00 0a 20 00 00 00 fe 00 4c
[    6.478447]      50 31 35 34 57 45 33 2d 54 4c 42 31 00 00 00 fe
[    6.478449]      00 43 6f 6c 6f 72 20 4c 43 44 0a 20 20 20 00 dd
[    6.512977] Raw EDID:
[    6.512979]      00 00 00 00 00 07 4f 00 06 10 bb 9c 00 00 00 00
[    6.512981]      00 13 01 03 80 21 15 78 0a 50 c5 98 58 52 8e 27
[    6.512983]      25 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
[    6.512986]      01 01 01 01 01 01 7c 2e 90 a0 60 1a 1e 40 30 20
[    6.512988]      36 00 4b cf 10 00 00 18 00 00 00 01 00 06 10 30
[    6.512990]      00 00 00 00 00 00 00 00 0a 20 00 00 00 fe 00 4c
[    6.512992]      50 31 35 34 57 45 33 2d 54 4c 42 31 00 00 00 fe
[    6.512994]      00 43 6f 6c 6f 72 20 4c 43 44 0a 20 20 20 00 dd
[    6.547469] Raw EDID:
[    6.547471]      00 00 00 00 00 07 4f 00 06 10 bb 9c 00 00 00 00
[    6.547474]      00 13 01 03 80 21 15 78 0a 50 c5 98 58 52 8e 27
[    6.547476]      25 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
[    6.547478]      01 01 01 01 01 01 7c 2e 90 a0 60 1a 1e 40 30 20
[    6.547480]      36 00 4b cf 10 00 00 18 00 00 00 01 00 06 10 30
[    6.547482]      00 00 00 00 00 00 00 00 0a 20 00 00 00 fe 00 4c
[    6.547484]      50 31 35 34 57 45 33 2d 54 4c 42 31 00 00 00 fe
[    6.547486]      00 43 6f 6c 6f 72 20 4c 43 44 0a 20 20 20 00 dd
[    6.547490] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[    6.547493] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[    6.682213] nouveau  [     DRM] allocated 1920x1080 fb: 0x70000, bo
ffff88015e55b800

The line with &quot;DDC responded, but no EDID for LVDS-1&quot; repeats often.

Significant is that these long EDID reports only show up from the 29th onwards,
as well as on the last boot of the 28th (boot before the problematic boot).

That last boot shows:

Dec 28 20:47:08 defiant kernel: [19803.436112] Raw EDID:
Dec 28 20:47:08 defiant kernel: [19803.436119]      fb fb ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 28 20:47:08 defiant kernel: [19803.436121]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 28 20:47:08 defiant kernel: [19803.436122]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 28 20:47:08 defiant kernel: [19803.436123]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 28 20:47:08 defiant kernel: [19803.436124]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 28 20:47:08 defiant kernel: [19803.436125]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 28 20:47:08 defiant kernel: [19803.436126]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 28 20:47:08 defiant kernel: [19803.436127]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 28 20:47:08 defiant kernel: [19803.470773] Raw EDID:
Dec 28 20:47:08 defiant kernel: [19803.470781]      00 00 00 00 00 07 4f 00 06
10 bb 9c 00 00 00 00
Dec 28 20:47:08 defiant kernel: [19803.470783]      00 13 01 03 80 21 15 78 0a
50 c5 98 58 52 8e 27
Dec 28 20:47:08 defiant kernel: [19803.470784]      25 50 54 00 00 00 01 01 01
01 01 01 01 01 01 01
Dec 28 20:47:08 defiant kernel: [19803.470785]      01 01 01 01 01 01 7c 2e 90
a0 60 1a 1e 40 30 20
Dec 28 20:47:08 defiant kernel: [19803.470786]      36 00 4b cf 10 00 00 18 00
00 00 01 00 06 10 30
Dec 28 20:47:08 defiant kernel: [19803.470788]      00 00 00 00 00 00 00 00 0a
20 00 00 00 fe 00 4c
Dec 28 20:47:08 defiant kernel: [19803.470789]      50 31 35 34 57 45 33 2d 54
4c 42 31 00 00 00 fe
Dec 28 20:47:08 defiant kernel: [19803.470790]      00 43 6f 6c 6f 72 20 4c 43
44 0a 20 20 20 00 dd
Dec 28 20:47:08 defiant kernel: [19803.504839] Raw EDID:
Dec 28 20:47:08 defiant kernel: [19803.504847]      00 00 00 00 00 07 4f 00 06
10 bb 9c 00 00 00 00
Dec 28 20:47:08 defiant kernel: [19803.504848]      00 13 01 03 80 21 15 78 0a
50 c5 98 58 52 8e 27
Dec 28 20:47:08 defiant kernel: [19803.504849]      25 50 54 00 00 00 01 01 01
01 01 01 01 01 01 01
Dec 28 20:47:08 defiant kernel: [19803.504850]      01 01 01 01 01 01 7c 2e 90
a0 60 1a 1e 40 30 20
Dec 28 20:47:08 defiant kernel: [19803.504851]      36 00 4b cf 10 00 00 18 00
00 00 01 00 06 10 30
Dec 28 20:47:08 defiant kernel: [19803.504852]      00 00 00 00 00 00 00 00 0a
20 00 00 00 fe 00 4c
Dec 28 20:47:08 defiant kernel: [19803.504853]      50 31 35 34 57 45 33 2d 54
4c 42 31 00 00 00 fe
Dec 28 20:47:08 defiant kernel: [19803.504854]      00 43 6f 6c 6f 72 20 4c 43
44 0a 20 20 20 00 dd
Dec 28 20:47:08 defiant kernel: [19803.538901] Raw EDID:
Dec 28 20:47:08 defiant kernel: [19803.538909]      00 00 00 00 00 07 4f 00 06
10 bb 9c 00 00 00 00
Dec 28 20:47:08 defiant kernel: [19803.538910]      00 13 01 03 80 21 15 78 0a
50 c5 98 58 52 8e 27
Dec 28 20:47:08 defiant kernel: [19803.538911]      25 50 54 00 00 00 01 01 01
01 01 01 01 01 01 01
Dec 28 20:47:08 defiant kernel: [19803.538912]      01 01 01 01 01 01 7c 2e 90
a0 60 1a 1e 40 30 20
Dec 28 20:47:08 defiant kernel: [19803.538913]      36 00 4b cf 10 00 00 18 00
00 00 01 00 06 10 30
Dec 28 20:47:08 defiant kernel: [19803.538914]      00 00 00 00 00 00 00 00 0a
20 00 00 00 fe 00 4c
Dec 28 20:47:08 defiant kernel: [19803.538915]      50 31 35 34 57 45 33 2d 54
4c 42 31 00 00 00 fe
Dec 28 20:47:08 defiant kernel: [19803.538916]      00 43 6f 6c 6f 72 20 4c 43
44 0a 20 20 20 00 dd
Dec 28 20:47:08 defiant kernel: [19803.538921] nouveau 0000:01:00.0: LVDS-1:
EDID block 0 invalid.
Dec 28 20:47:08 defiant kernel: [19803.538926] nouveau E[     DRM] DDC
responded, but no EDID for LVDS-1


In earlier correct boots I regularly find:

Dec 24 12:37:49 defiant kernel: [ 7225.572415] [drm:drm_edid_block_valid]
*ERROR* EDID checksum is invalid, remainder is 92
Dec 24 12:37:49 defiant kernel: [ 7225.572421] Raw EDID:
Dec 24 12:37:49 defiant kernel: [ 7225.572426]      00 ff ff ff ff ff ff 00 06
10 bb 9c 00 00 00 00
Dec 24 12:37:49 defiant kernel: [ 7225.572428]      00 13 01 03 80 21 15 78 0a
50 c5 98 58 52 8e 21
Dec 24 12:37:49 defiant kernel: [ 7225.572430]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 24 12:37:49 defiant kernel: [ 7225.572433]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 24 12:37:49 defiant kernel: [ 7225.572435]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 24 12:37:49 defiant kernel: [ 7225.572437]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 24 12:37:49 defiant kernel: [ 7225.572439]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
Dec 24 12:37:49 defiant kernel: [ 7225.572441]      ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff


Dec 25 12:15:51 defiant kernel: [ 2707.066122] [drm:drm_edid_block_valid]
*ERROR* EDID checksum is invalid, remainder is 255
Dec 25 12:15:51 defiant kernel: [ 2707.066129] Raw EDID:
Dec 25 12:15:51 defiant kernel: [ 2707.066133]      00 ff ff ff ff ff ff 00 06
10 bb 9c 00 00 00 00
Dec 25 12:15:51 defiant kernel: [ 2707.066136]      00 13 01 03 80 20 15 78 0a
50 c5 98 58 52 8e 27
Dec 25 12:15:51 defiant kernel: [ 2707.066138]      25 50 54 00 00 00 01 01 01
01 01 01 01 01 01 01
Dec 25 12:15:51 defiant kernel: [ 2707.066140]      01 01 01 01 01 01 7c 2e 90
a0 60 1a 1e 40 30 20
Dec 25 12:15:51 defiant kernel: [ 2707.066142]      36 00 4b cf 10 00 00 18 00
00 00 01 00 06 10 30
Dec 25 12:15:51 defiant kernel: [ 2707.066145]      00 00 00 00 00 00 00 00 0a
20 00 00 00 fe 00 4c
Dec 25 12:15:51 defiant kernel: [ 2707.066147]      50 31 35 34 57 45 33 2d 54
4c 42 31 00 00 00 fe
Dec 25 12:15:51 defiant kernel: [ 2707.066149]      00 43 6f 6c 6f 72 20 4c 43
44 0a 20 20 20 00 dd


As to the recommendation to try the latest updates, my mint system is up to
date (slight updated after problem occurred). Versions:
xorg 1:7.7+1ubuntu4
xserver-xorg-video-nouveau 1:1.0.7+git20130516.bf72ae1f-0ubuntu0sarvatt~raring
libgl1-mesa-dri 9.2.0~git20130627.15085b47-0ubuntu0sarvatt~raring
kernel 3.8.0-25-generic
As you can see, neither kernel nor nouveau are at the requested highest
versions, but these do not seem easily available for my distro. With some
pointers I can try them but am not sure what they would fix as corruption has
already occurred.


I will now proceed and try to repair.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1388783502.AEAD471.19282--

--===============1958658015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1958658015==--
