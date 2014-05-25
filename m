From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79211] New: [VP4.2] Video playback using vdpau
	unusably slow
Date: Sun, 25 May 2014 13:56:58 +0000
Message-ID: <bug-79211-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2089030123=="
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


--===============2089030123==
Content-Type: multipart/alternative; boundary="1401026218.a71271.11398"; charset="us-ascii"


--1401026218.a71271.11398
Date: Sun, 25 May 2014 13:56:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79211

          Priority: medium
            Bug ID: 79211
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [VP4.2] Video playback using vdpau unusably slow
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: mdop-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 99768
  --> https://bugs.freedesktop.org/attachment.cgi?id=99768&action=edit
dmesg

Hardware: Motherboard Asus P8Z77 Pro Thunderbolt, CPU Intel i7-3770K, GPU
Gigabyte GTX 560 Ti Ultra Durable, RAM 32 GB, SSD Intel
Software: EFISTUB booting, Arch Linux 3.14.4 x64, XFCE

$ pacman -Q | grep nouveau
lib32-nouveau-dri 10.1.4-1
nouveau-dri 10.1.4-1
nouveau-fw 325.15-1
xf86-video-nouveau 1.0.10-2

I noticed slight performance issue when playing recorded TV show (720x576 MPEG2
in TS) and also deinterlacing and display compositing (Compton because of
vsync) turned on. Because of that I decided to try using vdpau which I noticed
is somehow supported (http://nouveau.freedesktop.org/wiki/VideoAcceleration/).

While vdpau works for some videos, it fails to play smoothly higher
quality/bitrate streams. Vdpau output is choppy and with artifacts in both
mplayer and VLC. (Display compositing is turned off)

I used Nvidia libs for vdpau from AUR package nouveau-fw but I experienced the
same result when extracting manualy with extract_firmware.py and Nvidia drivers
version 331.67.

Videos play fine when using first party nvidia drivers and using vdpau (ok in
both mplayer/VLC).
Videos also run flawlessly on Windows when using vdpau (CPU stays at 1% when
playing).
(Other video drivers such as xv, gl play videos fine.)

Here're samples where chopping is clearly visible. First few second from Lord
of the rings and Blender Foundation "Sintel.2010.1080p.mkv".

http://smartmadsoft.com/temp/video/sample-lotr.mkv
http://smartmadsoft.com/temp/video/sample-sintel.mkv

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401026218.a71271.11398
Date: Sun, 25 May 2014 13:56:58 +0000
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
   title="NEW --- - [VP4.2] Video playback using vdpau unusably slow"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79211">79211</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[VP4.2] Video playback using vdpau unusably slow
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
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>mdop&#64;seznam.cz
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
        <pre>Created <span class=""><a href="attachment.cgi?id=99768" name="attach_99768" title="dmesg">attachment 99768</a> <a href="attachment.cgi?id=99768&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

Hardware: Motherboard Asus P8Z77 Pro Thunderbolt, CPU Intel i7-3770K, GPU
Gigabyte GTX 560 Ti Ultra Durable, RAM 32 GB, SSD Intel
Software: EFISTUB booting, Arch Linux 3.14.4 x64, XFCE

$ pacman -Q | grep nouveau
lib32-nouveau-dri 10.1.4-1
nouveau-dri 10.1.4-1
nouveau-fw 325.15-1
xf86-video-nouveau 1.0.10-2

I noticed slight performance issue when playing recorded TV show (720x576 MPEG2
in TS) and also deinterlacing and display compositing (Compton because of
vsync) turned on. Because of that I decided to try using vdpau which I noticed
is somehow supported (<a href="http://nouveau.freedesktop.org/wiki/VideoAcceleration/">http://nouveau.freedesktop.org/wiki/VideoAcceleration/</a>).

While vdpau works for some videos, it fails to play smoothly higher
quality/bitrate streams. Vdpau output is choppy and with artifacts in both
mplayer and VLC. (Display compositing is turned off)

I used Nvidia libs for vdpau from AUR package nouveau-fw but I experienced the
same result when extracting manualy with extract_firmware.py and Nvidia drivers
version 331.67.

Videos play fine when using first party nvidia drivers and using vdpau (ok in
both mplayer/VLC).
Videos also run flawlessly on Windows when using vdpau (CPU stays at 1% when
playing).
(Other video drivers such as xv, gl play videos fine.)

Here're samples where chopping is clearly visible. First few second from Lord
of the rings and Blender Foundation &quot;Sintel.2010.1080p.mkv&quot;.

<a href="http://smartmadsoft.com/temp/video/sample-lotr.mkv">http://smartmadsoft.com/temp/video/sample-lotr.mkv</a>
<a href="http://smartmadsoft.com/temp/video/sample-sintel.mkv">http://smartmadsoft.com/temp/video/sample-sintel.mkv</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401026218.a71271.11398--

--===============2089030123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2089030123==--
