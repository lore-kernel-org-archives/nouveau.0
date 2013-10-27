From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70931] New: Xv causes player segfaults when 4K is
	decoded
Date: Sun, 27 Oct 2013 19:22:26 +0000
Message-ID: <bug-70931-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1692392339=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1692392339==
Content-Type: multipart/alternative; boundary="1382901746.CBBBF1.8483"; charset="us-ascii"


--1382901746.CBBBF1.8483
Date: Sun, 27 Oct 2013 19:22:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70931

          Priority: medium
            Bug ID: 70931
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Xv causes player segfaults when 4K is decoded
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: nikoli-0UDz38MK/Mo@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 88194
  --> https://bugs.freedesktop.org/attachment.cgi?id=88194&action=edit
gdb output for 'mpv -vo xv sintel.mkv'

avprobe output:
Stream #0.0(eng): Video: h264 (High 4:4:4 Predictive), yuv444p10le, 4096x1744
[PAR 1:1 DAR 256:109], 24 fps, 24 tbr, 1k tbn, 48 tbc (default)

When trying to play 4K video with Xv video outputs mpv, mplayer2 and vlc
segfault.
https://github.com/mpv-player/mpv/issues/320
"the segfault is because the XvShmCreateImage API function returns a smaller
image than requested, which, if I read the manpage right, is not allowed."
My software:
Gentoo Linux amd64 stable, kernel 3.9.9-hardened, mesa-9.1.6,
xf86-video-nouveau-1.0.9, libXv-1.0.10, libdrm-2.4.46, xorg-server-1.14.3,
libav-9.10
Hardware:
01:00.0 VGA compatible controller: NVIDIA Corporation G86M [GeForce 8400M GS]
(rev a1)

Used this file for testing:
http://rutracker.org/forum/viewtopic.php?t=4131293
Can upload sample if required.
P.S. With radeon r600g this file works fine, is any 4K playable with nouveau
now?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382901746.CBBBF1.8483
Date: Sun, 27 Oct 2013 19:22:26 +0000
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
   title="NEW --- - Xv causes player segfaults when 4K is decoded"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70931">70931</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Xv causes player segfaults when 4K is decoded
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
          <td>nikoli&#64;gmx.us
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
        <pre>Created <span class=""><a href="attachment.cgi?id=88194" name="attach_88194" title="gdb output for 'mpv -vo xv sintel.mkv'">attachment 88194</a> <a href="attachment.cgi?id=88194&amp;action=edit" title="gdb output for 'mpv -vo xv sintel.mkv'">[details]</a></span>
gdb output for 'mpv -vo xv sintel.mkv'

avprobe output:
Stream #0.0(eng): Video: h264 (High 4:4:4 Predictive), yuv444p10le, 4096x1744
[PAR 1:1 DAR 256:109], 24 fps, 24 tbr, 1k tbn, 48 tbc (default)

When trying to play 4K video with Xv video outputs mpv, mplayer2 and vlc
segfault.
<a href="https://github.com/mpv-player/mpv/issues/320">https://github.com/mpv-player/mpv/issues/320</a>
&quot;the segfault is because the XvShmCreateImage API function returns a smaller
image than requested, which, if I read the manpage right, is not allowed.&quot;
My software:
Gentoo Linux amd64 stable, kernel 3.9.9-hardened, mesa-9.1.6,
xf86-video-nouveau-1.0.9, libXv-1.0.10, libdrm-2.4.46, xorg-server-1.14.3,
libav-9.10
Hardware:
01:00.0 VGA compatible controller: NVIDIA Corporation G86M [GeForce 8400M GS]
(rev a1)

Used this file for testing:
<a href="http://rutracker.org/forum/viewtopic.php?t=4131293">http://rutracker.org/forum/viewtopic.php?t=4131293</a>
Can upload sample if required.
P.S. With radeon r600g this file works fine, is any 4K playable with nouveau
now?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382901746.CBBBF1.8483--

--===============1692392339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1692392339==--
