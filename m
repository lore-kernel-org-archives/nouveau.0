From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86006] New: [NV84] Nvidia GeForce 8600 GT VDPAU h264
 hardware acceleration
Date: Fri, 07 Nov 2014 14:59:33 +0000
Message-ID: <bug-86006-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1842183360=="
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


--===============1842183360==
Content-Type: multipart/alternative; boundary="1415372373.7d176bD1.30020"; charset="UTF-8"


--1415372373.7d176bD1.30020
Date: Fri, 7 Nov 2014 14:59:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86006

            Bug ID: 86006
           Summary: [NV84] Nvidia GeForce 8600 GT VDPAU h264 hardware
                    acceleration
           Product: xorg
           Version: 7.6 (2010.12)
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: 13ilya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 109089
  --> https://bugs.freedesktop.org/attachment.cgi?id=109089&action=edit
mplayer2 -vo vdpau -vc ffmpeg12vdpau,ffh264vdpau,
/ILYA/Video/Documentaries/Space/Through\ the\ Wormhole/Through\ the\ Wormhole\
3.03\ -\ Is\ The\ Universe\ Alive.mkv

Nvidia GeForce 8600 GT don't correct decode h264 video via VDPAU on MPlayer2
and mpv.(See Attachment)
Firmware I got from Nvidia 340.58 as written on this site
http://nouveau.freedesktop.org/wiki/VideoAcceleration
Without firmware h264 don't work. With proprietary blob h264 decoding work
fine, but with green flash during (re)initialization video.
openSUSE 12.3 x86_64 | Kernel 3.17.2-desktop | XOrg 7.6 1.16.1 | Mesa 10.3.2 |
nouveau 1.0.11 | Firmware from Nvidia 340.58

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1415372373.7d176bD1.30020
Date: Fri, 7 Nov 2014 14:59:33 +0000
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
   title="NEW - [NV84] Nvidia GeForce 8600 GT VDPAU h264 hardware acceleration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86006">86006</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV84] Nvidia GeForce 8600 GT VDPAU h264 hardware acceleration
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.6 (2010.12)
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
          <td>13ilya&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=109089" name="attach_109089" title="mplayer2 -vo vdpau -vc ffmpeg12vdpau,ffh264vdpau, /ILYA/Video/Documentaries/Space/Through\ the\ Wormhole/Through\ the\ Wormhole\ 3.03\ -\ Is\ The\ Universe\ Alive.mkv">attachment 109089</a> <a href="attachment.cgi?id=109089&amp;action=edit" title="mplayer2 -vo vdpau -vc ffmpeg12vdpau,ffh264vdpau, /ILYA/Video/Documentaries/Space/Through\ the\ Wormhole/Through\ the\ Wormhole\ 3.03\ -\ Is\ The\ Universe\ Alive.mkv">[details]</a></span>
mplayer2 -vo vdpau -vc ffmpeg12vdpau,ffh264vdpau,
/ILYA/Video/Documentaries/Space/Through\ the\ Wormhole/Through\ the\ Wormhole\
3.03\ -\ Is\ The\ Universe\ Alive.mkv

Nvidia GeForce 8600 GT don't correct decode h264 video via VDPAU on MPlayer2
and mpv.(See Attachment)
Firmware I got from Nvidia 340.58 as written on this site
<a href="http://nouveau.freedesktop.org/wiki/VideoAcceleration">http://nouveau.freedesktop.org/wiki/VideoAcceleration</a>
Without firmware h264 don't work. With proprietary blob h264 decoding work
fine, but with green flash during (re)initialization video.
openSUSE 12.3 x86_64 | Kernel 3.17.2-desktop | XOrg 7.6 1.16.1 | Mesa 10.3.2 |
nouveau 1.0.11 | Firmware from Nvidia 340.58</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1415372373.7d176bD1.30020--

--===============1842183360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1842183360==--
