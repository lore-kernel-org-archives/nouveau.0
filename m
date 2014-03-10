From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] New: HDMI audio device only visible after
	rescan
Date: Mon, 10 Mar 2014 15:56:17 +0000
Message-ID: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0997799626=="
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


--===============0997799626==
Content-Type: multipart/alternative; boundary="1394466977.237c0A7D1.12831"; charset="us-ascii"


--1394466977.237c0A7D1.12831
Date: Mon, 10 Mar 2014 15:56:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75985

          Priority: medium
            Bug ID: 75985
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: HDMI audio device only visible after rescan
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: jean-louis-h84OYfGOAs2zQB+pC5nmwQ@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Hi

I have a Dell XPS 15 laptop with Optimus.
It has the following NVIDIA card:
01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT 540M]
(rev a1)

The HDMI output is working fine since some time now.
Only there is still an issue with the HDMI audio.

On Windows, and with `lspci -H1` it shows the following devices:
01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT 540M]
(rev a1)
01:00.1 Audio device: NVIDIA Corporation GF108 High Definition Audio Controller
(rev a1)

But by default, the audio device isn't visible after a clean boot. So the HDMI
audio ain't working.

Now I've found some workaround to get it working.

- Start the system, and stop the display manager (lightdm/gdm)
- Load the nouveau module
- Remove the Nvidia card from the PCI bus (echo 1 >
/sys/bus/pci/devices/0000\:01\:00.0/remove)
- Rescan the PCI bus (echo "1" > /sys/bus/pci/rescan)

And there it is, the Audio device is visible now:
01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT 540M]
(rev a1)
01:00.1 Audio device: NVIDIA Corporation GF108 High Definition Audio Controller
(rev a1)

Also dmesg shows the following:
[  152.360864] input: HDA NVidia HDMI/DP,pcm=9 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input18
[  152.361210] input: HDA NVidia HDMI/DP,pcm=8 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input17
[  152.361415] input: HDA NVidia HDMI/DP,pcm=7 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input16
[  152.361592] input: HDA NVidia HDMI/DP,pcm=3 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input15

So the device is loaded correctly.
Now if we start lightdm/gdm/whatever again, and login (which also starts
PulseAudio), the HDMI audio works correctly like it should :)

Some note:
If we do the rescan without nouveau module loaded, the workaround does not
work. So we need to have nouveau loaded to make the Audio device visible.

On first boot I get the following error:
[  121.872253] nouveau 0000:01:00.0: enabling device (0006 -> 0007)
[  121.872554] [drm] hdmi device  not found 1 0 1

This might be related?
After the rescan, it shows the following:
[  151.557038] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 1
[  151.557186] snd_hda_intel 0000:01:00.1: enabling device (0000 -> 0002)
[  151.557253] hda_intel: Disabling MSI
[  151.557274] hda-intel 0000:01:00.1: Handle VGA-switcheroo audio client
[  151.557349] hda-intel 0000:01:00.1: Disabling 64bit DMA
[  151.560778] hda-intel 0000:01:00.1: Enable delay in RIRB handling
[  152.360864] input: HDA NVidia HDMI/DP,pcm=9 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input18
[  152.361210] input: HDA NVidia HDMI/DP,pcm=8 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input17
[  152.361415] input: HDA NVidia HDMI/DP,pcm=7 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input16
[  152.361592] input: HDA NVidia HDMI/DP,pcm=3 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input15
[  156.801404] hda-intel 0000:01:00.1: Disabling via VGA-switcheroo

Hopefully this can help getting the issue fixed completely :)

Thanks!
Jean-Louis

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394466977.237c0A7D1.12831
Date: Mon, 10 Mar 2014 15:56:17 +0000
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
   title="NEW --- - HDMI audio device only visible after rescan"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75985">75985</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>HDMI audio device only visible after rescan
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
          <td>jean-louis&#64;dupond.be
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
        <pre>Hi

I have a Dell XPS 15 laptop with Optimus.
It has the following NVIDIA card:
01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT 540M]
(rev a1)

The HDMI output is working fine since some time now.
Only there is still an issue with the HDMI audio.

On Windows, and with `lspci -H1` it shows the following devices:
01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT 540M]
(rev a1)
01:00.1 Audio device: NVIDIA Corporation GF108 High Definition Audio Controller
(rev a1)

But by default, the audio device isn't visible after a clean boot. So the HDMI
audio ain't working.

Now I've found some workaround to get it working.

- Start the system, and stop the display manager (lightdm/gdm)
- Load the nouveau module
- Remove the Nvidia card from the PCI bus (echo 1 &gt;
/sys/bus/pci/devices/0000\:01\:00.0/remove)
- Rescan the PCI bus (echo &quot;1&quot; &gt; /sys/bus/pci/rescan)

And there it is, the Audio device is visible now:
01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT 540M]
(rev a1)
01:00.1 Audio device: NVIDIA Corporation GF108 High Definition Audio Controller
(rev a1)

Also dmesg shows the following:
[  152.360864] input: HDA NVidia HDMI/DP,pcm=9 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input18
[  152.361210] input: HDA NVidia HDMI/DP,pcm=8 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input17
[  152.361415] input: HDA NVidia HDMI/DP,pcm=7 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input16
[  152.361592] input: HDA NVidia HDMI/DP,pcm=3 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input15

So the device is loaded correctly.
Now if we start lightdm/gdm/whatever again, and login (which also starts
PulseAudio), the HDMI audio works correctly like it should :)

Some note:
If we do the rescan without nouveau module loaded, the workaround does not
work. So we need to have nouveau loaded to make the Audio device visible.

On first boot I get the following error:
[  121.872253] nouveau 0000:01:00.0: enabling device (0006 -&gt; 0007)
[  121.872554] [drm] hdmi device  not found 1 0 1

This might be related?
After the rescan, it shows the following:
[  151.557038] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 1
[  151.557186] snd_hda_intel 0000:01:00.1: enabling device (0000 -&gt; 0002)
[  151.557253] hda_intel: Disabling MSI
[  151.557274] hda-intel 0000:01:00.1: Handle VGA-switcheroo audio client
[  151.557349] hda-intel 0000:01:00.1: Disabling 64bit DMA
[  151.560778] hda-intel 0000:01:00.1: Enable delay in RIRB handling
[  152.360864] input: HDA NVidia HDMI/DP,pcm=9 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input18
[  152.361210] input: HDA NVidia HDMI/DP,pcm=8 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input17
[  152.361415] input: HDA NVidia HDMI/DP,pcm=7 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input16
[  152.361592] input: HDA NVidia HDMI/DP,pcm=3 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input15
[  156.801404] hda-intel 0000:01:00.1: Disabling via VGA-switcheroo

Hopefully this can help getting the issue fixed completely :)

Thanks!
Jean-Louis</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394466977.237c0A7D1.12831--

--===============0997799626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0997799626==--
