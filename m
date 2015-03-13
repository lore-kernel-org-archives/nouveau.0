From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89572] New: [NV86] Video playback corruption with
 nouveau, vdpau
Date: Fri, 13 Mar 2015 18:36:41 +0000
Message-ID: <bug-89572-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0244319999=="
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


--===============0244319999==
Content-Type: multipart/alternative; boundary="1426271801.6FcEE1.16893"; charset="UTF-8"


--1426271801.6FcEE1.16893
Date: Fri, 13 Mar 2015 18:36:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89572

            Bug ID: 89572
           Summary: [NV86] Video playback corruption with nouveau, vdpau
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: matthias-eXl60zzu3X2b9/CCa1Sigw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 114290
  --> https://bugs.freedesktop.org/attachment.cgi?id=114290&action=edit
screenshot of corrupted video

Using archlinux x86_64 with the current mainline kernel (4.0rc3), xorg 1.17.1,
mesa-vdpau 10.4.6, nouveau-fw 325.15, xf86-video-nouveau 1.0.11.

Playing back a h264 video file (test file big buck bunny,
http://blender-mirror.kino3d.org/peach/bigbuckbunny_movies/big_buck_bunny_720p_h264.mov)
causes major graphical corruption in the video playback (see attachment).
Several errors appear in the kernel log. The playback is done using "mplayer
-vo vdpau -vc ffh264vdpau -fs".   (mplayer 37379)

Playing back the same file without acceleration ("mplayer -vo vdpau -fs") works
perfectly.

I have had similiar problems in the past, so this is (probably) not a new
problem of the current 4.0 development kernel.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1426271801.6FcEE1.16893
Date: Fri, 13 Mar 2015 18:36:41 +0000
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
   title="NEW - [NV86] Video playback corruption with nouveau, vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89572">89572</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV86] Video playback corruption with nouveau, vdpau
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
          <td>matthias&#64;blankertz.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=114290" name="attach_114290" title="screenshot of corrupted video">attachment 114290</a> <a href="attachment.cgi?id=114290&amp;action=edit" title="screenshot of corrupted video">[details]</a></span>
screenshot of corrupted video

Using archlinux x86_64 with the current mainline kernel (4.0rc3), xorg 1.17.1,
mesa-vdpau 10.4.6, nouveau-fw 325.15, xf86-video-nouveau 1.0.11.

Playing back a h264 video file (test file big buck bunny,
<a href="http://blender-mirror.kino3d.org/peach/bigbuckbunny_movies/big_buck_bunny_720p_h264.mov">http://blender-mirror.kino3d.org/peach/bigbuckbunny_movies/big_buck_bunny_720p_h264.mov</a>)
causes major graphical corruption in the video playback (see attachment).
Several errors appear in the kernel log. The playback is done using &quot;mplayer
-vo vdpau -vc ffh264vdpau -fs&quot;.   (mplayer 37379)

Playing back the same file without acceleration (&quot;mplayer -vo vdpau -fs&quot;) works
perfectly.

I have had similiar problems in the past, so this is (probably) not a new
problem of the current 4.0 development kernel.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426271801.6FcEE1.16893--

--===============0244319999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0244319999==--
