From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84706] New: [NV94] HDMI Connected,
	but TV reports "no signal"
Date: Mon, 06 Oct 2014 08:04:28 +0000
Message-ID: <bug-84706-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0325958164=="
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


--===============0325958164==
Content-Type: multipart/alternative; boundary="1412582668.fC7d8Cb1.9635"; charset="UTF-8"


--1412582668.fC7d8Cb1.9635
Date: Mon, 6 Oct 2014 08:04:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84706

            Bug ID: 84706
           Summary: [NV94] HDMI Connected, but TV reports "no signal"
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jayvandam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 107397
  --> https://bugs.freedesktop.org/attachment.cgi?id=107397&action=edit
kernel log with nouveau.debug=trace and drm.debug=0xe

Hardware information: 
CPU: Intel Core2 Quad Q9400 
Graphics card: GeForce 9600 GS (output: 1x VGA, 1x DVI, 1x HDMI)

Version information
Distro: ArchLinux x86_64
Linux Kernel: 3.16.3 (compiled with CONFIG_DRM_NOUVEAU=m)
libdrm: 2.4.58
Mesa: 10.3.0
xf86-video-nouveau: 1.0.11

Issue: 
TV connected via HDMI reports "no signal" when system is booted. During boot
the HDMI display output works fine, but when selecting the kernel to load in
the bootloader the TV starts reporting "no signal". As the output is already
lost before any X

What I tried so far:
- Booting with HDMI cable connected
- Booting with HDMI and VGA cable connected
- Booting with no cables connected, following hotplugging HDMI and VGA
None of above actions resulted in a fix or any other results with the display
via the HDMI port, the display of the VGA port always is functional.  

Other findings:
- The NVIDIA proprietary drivers HDMI display output works fine with the TV
- Graphics card is GeForce 9600 GS, according to the CodeNames this should be a
NV96 (G96), though when quering the system it reports as G94. This seems to be
conflicting. 05:00.0 VGA compatible controller: NVIDIA Corporation G94 [GeForce
9600 GS] (rev a1)
- While having the HDMI and VGA connected, querying the status of all ports
report that the HDMI and the VGA are connected::
-- ~: for p in /sys/class/drm/*/status; do con=${p%/status}; echo -n
"${con#*/card?-}: "; cat $p; done
-- DVI-I-1: disconnected
-- HDMI-A-1: connected
-- VGA-1: connected

Similar bugs:
60680 - Same issue (bug marked RESOLVED FIXED)
63139 - Same issue (bug marked RESOLVED INVALID) due to missing response bug
reporter

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1412582668.fC7d8Cb1.9635
Date: Mon, 6 Oct 2014 08:04:28 +0000
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
   title="NEW - [NV94] HDMI Connected, but TV reports &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84706">84706</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV94] HDMI Connected, but TV reports &quot;no signal&quot;
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
          <td>jayvandam&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=107397" name="attach_107397" title="kernel log with nouveau.debug=trace and drm.debug=0xe">attachment 107397</a> <a href="attachment.cgi?id=107397&amp;action=edit" title="kernel log with nouveau.debug=trace and drm.debug=0xe">[details]</a></span>
kernel log with nouveau.debug=trace and drm.debug=0xe

Hardware information: 
CPU: Intel Core2 Quad Q9400 
Graphics card: GeForce 9600 GS (output: 1x VGA, 1x DVI, 1x HDMI)

Version information
Distro: ArchLinux x86_64
Linux Kernel: 3.16.3 (compiled with CONFIG_DRM_NOUVEAU=m)
libdrm: 2.4.58
Mesa: 10.3.0
xf86-video-nouveau: 1.0.11

Issue: 
TV connected via HDMI reports &quot;no signal&quot; when system is booted. During boot
the HDMI display output works fine, but when selecting the kernel to load in
the bootloader the TV starts reporting &quot;no signal&quot;. As the output is already
lost before any X

What I tried so far:
- Booting with HDMI cable connected
- Booting with HDMI and VGA cable connected
- Booting with no cables connected, following hotplugging HDMI and VGA
None of above actions resulted in a fix or any other results with the display
via the HDMI port, the display of the VGA port always is functional.  

Other findings:
- The NVIDIA proprietary drivers HDMI display output works fine with the TV
- Graphics card is GeForce 9600 GS, according to the CodeNames this should be a
NV96 (G96), though when quering the system it reports as G94. This seems to be
conflicting. 05:00.0 VGA compatible controller: NVIDIA Corporation G94 [GeForce
9600 GS] (rev a1)
- While having the HDMI and VGA connected, querying the status of all ports
report that the HDMI and the VGA are connected::
-- ~: for p in /sys/class/drm/*/status; do con=${p%/status}; echo -n
&quot;${con#*/card?-}: &quot;; cat $p; done
-- DVI-I-1: disconnected
-- HDMI-A-1: connected
-- VGA-1: connected

Similar bugs:
60680 - Same issue (bug marked RESOLVED FIXED)
63139 - Same issue (bug marked RESOLVED INVALID) due to missing response bug
reporter</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1412582668.fC7d8Cb1.9635--

--===============0325958164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0325958164==--
