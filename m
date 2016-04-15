From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94948] New: [NV117] Second external monitor not
	recognized
Date: Fri, 15 Apr 2016 11:41:02 +0000
Message-ID: <bug-94948-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1916977546=="
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


--===============1916977546==
Content-Type: multipart/alternative; boundary="14607204620.C4AcF5EC.17696";
 charset="UTF-8"


--14607204620.C4AcF5EC.17696
Date: Fri, 15 Apr 2016 11:41:02 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94948

            Bug ID: 94948
           Summary: [NV117] Second external monitor not recognized
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pfeiffer-RoXCvvDuEio@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 122966
  --> https://bugs.freedesktop.org/attachment.cgi?id=122966&action=edit
the full kernel log

I have a Lenovo P50 notebook with a docking station and two externally attached
monitors, but I won't get more than one external "connected" display (+ the
internal LCD). I tried to connect via DVI, DisplayPort and HDMI in all
combinations, but xrandr only shows
eDP-1 connected
DP-1 connected
DP-2 disconnected
DP-3 disconnected

Sometimes I manage to get both external monitors to display the same contents,
but I have never managed to use one as primary and the other as secondary
display.

01:00.0 VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M2000M]
(rev a2) (prog-if 00 [VGA controller])
01:00.1 Audio device: NVIDIA Corporation Device 0fbc (rev a1)

Linux nb 4.4.0-1-amd64 #1 SMP Debian 4.4.6-1 (2016-03-17) x86_64 GNU/Linux
xserver-xorg                   1:7.7+14
xserver-xorg-core              2:1.18.3-1
xserver-xorg-video-nouveau     1:1.0.12-1+b1
libdrm2:amd64                  2.4.67-1
libdrm-nouveau2:amd64          2.4.67-1

libegl1-mesa:amd64           11.1.2-1
libgl1-mesa-dri:amd64        11.1.2-1
libgl1-mesa-glx:amd64        11.1.2-1
libglapi-mesa:amd64          11.1.2-1
libgles1-mesa:amd64          11.1.2-1
libgles2-mesa:amd64          11.1.2-1
libglu1-mesa:amd64           9.0.0-2.1
libwayland-egl1-mesa:amd64   11.1.2-1
mesa-utils                   8.3.0-1
mesa-vdpau-drivers:amd64     11.1.2-1

Bios is the most recent one from 2016-04-1 (1.21).

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14607204620.C4AcF5EC.17696
Date: Fri, 15 Apr 2016 11:41:02 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV117] Second external monitor not recognized"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94948">94948</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV117] Second external monitor not recognized
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
          <td>pfeiffer&#64;kde.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=122966" name="attach_122966" title="the full kernel log">attachment 122966</a> <a href="attachment.cgi?id=122966&amp;action=edit" title="the full kernel log">[details]</a></span>
the full kernel log

I have a Lenovo P50 notebook with a docking station and two externally attached
monitors, but I won't get more than one external &quot;connected&quot; display (+ the
internal LCD). I tried to connect via DVI, DisplayPort and HDMI in all
combinations, but xrandr only shows
eDP-1 connected
DP-1 connected
DP-2 disconnected
DP-3 disconnected

Sometimes I manage to get both external monitors to display the same contents,
but I have never managed to use one as primary and the other as secondary
display.

01:00.0 VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M2000M]
(rev a2) (prog-if 00 [VGA controller])
01:00.1 Audio device: NVIDIA Corporation Device 0fbc (rev a1)

Linux nb 4.4.0-1-amd64 #1 SMP Debian 4.4.6-1 (2016-03-17) x86_64 GNU/Linux
xserver-xorg                   1:7.7+14
xserver-xorg-core              2:1.18.3-1
xserver-xorg-video-nouveau     1:1.0.12-1+b1
libdrm2:amd64                  2.4.67-1
libdrm-nouveau2:amd64          2.4.67-1

libegl1-mesa:amd64           11.1.2-1
libgl1-mesa-dri:amd64        11.1.2-1
libgl1-mesa-glx:amd64        11.1.2-1
libglapi-mesa:amd64          11.1.2-1
libgles1-mesa:amd64          11.1.2-1
libgles2-mesa:amd64          11.1.2-1
libglu1-mesa:amd64           9.0.0-2.1
libwayland-egl1-mesa:amd64   11.1.2-1
mesa-utils                   8.3.0-1
mesa-vdpau-drivers:amd64     11.1.2-1

Bios is the most recent one from 2016-04-1 (1.21).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14607204620.C4AcF5EC.17696--

--===============1916977546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1916977546==--
