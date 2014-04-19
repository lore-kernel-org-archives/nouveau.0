From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77674] New: "failed to read DPCD" on wake up with
 external monitor
Date: Sat, 19 Apr 2014 17:25:10 +0000
Message-ID: <bug-77674-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1831136004=="
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


--===============1831136004==
Content-Type: multipart/alternative; boundary="1397928310.F0CC1.2946"; charset="us-ascii"


--1397928310.F0CC1.2946
Date: Sat, 19 Apr 2014 17:25:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77674

          Priority: medium
            Bug ID: 77674
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: "failed to read DPCD" on wake up with external monitor
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: dlazerka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Hi folks,
I have:

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK107GLM [Quadro
K1000M] [10de:0ffc] (rev a1)
(one year old thinkpad laptop)

and I'm unable to wake up. Well, not be, but my "Linux 3.11-2-amd64 #1 SMP
Debian 3.11.8-1 (2013-11-13) x86_64 GNU/Linux" (Mint, Debian Edition,
"testing").
Optimus is disabled in BIOS (only discrete is used). On waking up I see four
lines:

[ 8618.926501] mei_me 0000:00:16.0: suspend
[ 8623.309085] nouveau E[  PDISP][000:01:00.0] DP:0006:0f48: failed to read
DPCD
[ 8625.220708] dpm_run_callback(): usb_dev_resume+0x0/0x10 [usbcore] returns
-32
[ 8625.220712] PM: Device 4-1.8.1.1.1 failed to resume async: error -32


Reproducible only with external monitors (via dock station).


Sorry, not sure how to get Nouveau version.
$ apt-cache showpkg xserver-xorg-video-nouveau
...
Dependencies:
1:1.0.10-1 - libc6 (2 2.15) libdrm-nouveau2 (2 2.4.38) libdrm2 (2 2.4.25)
libudev1 (2 183) xorg-video-abi-14 (0 (null)) xserver-xorg-core (2
2:1.13.99.901) libgl1-mesa-dri (2 9.0) xserver-xorg-video-nouveau:i386 (0
(null)) " if that helps.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397928310.F0CC1.2946
Date: Sat, 19 Apr 2014 17:25:10 +0000
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
   title="NEW --- - &quot;failed to read DPCD&quot; on wake up with external monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77674">77674</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>&quot;failed to read DPCD&quot; on wake up with external monitor
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
          <td>dlazerka&#64;gmail.com
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
        <pre>Hi folks,
I have:

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK107GLM [Quadro
K1000M] [10de:0ffc] (rev a1)
(one year old thinkpad laptop)

and I'm unable to wake up. Well, not be, but my &quot;Linux 3.11-2-amd64 #1 SMP
Debian 3.11.8-1 (2013-11-13) x86_64 GNU/Linux&quot; (Mint, Debian Edition,
&quot;testing&quot;).
Optimus is disabled in BIOS (only discrete is used). On waking up I see four
lines:

[ 8618.926501] mei_me 0000:00:16.0: suspend
[ 8623.309085] nouveau E[  PDISP][000:01:00.0] DP:0006:0f48: failed to read
DPCD
[ 8625.220708] dpm_run_callback(): usb_dev_resume+0x0/0x10 [usbcore] returns
-32
[ 8625.220712] PM: Device 4-1.8.1.1.1 failed to resume async: error -32


Reproducible only with external monitors (via dock station).


Sorry, not sure how to get Nouveau version.
$ apt-cache showpkg xserver-xorg-video-nouveau
...
Dependencies:
1:1.0.10-1 - libc6 (2 2.15) libdrm-nouveau2 (2 2.4.38) libdrm2 (2 2.4.25)
libudev1 (2 183) xorg-video-abi-14 (0 (null)) xserver-xorg-core (2
2:1.13.99.901) libgl1-mesa-dri (2 9.0) xserver-xorg-video-nouveau:i386 (0
(null)) &quot; if that helps.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397928310.F0CC1.2946--

--===============1831136004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1831136004==--
