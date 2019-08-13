From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111213] VA-API nouveau SIGSEGV and asserts
Date: Tue, 13 Aug 2019 22:17:17 +0000
Message-ID: <bug-111213-8800-MEbqnHX4t2@http.bugs.freedesktop.org/>
References: <bug-111213-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1273795762=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111213-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1273795762==
Content-Type: multipart/alternative; boundary="15657346371.0cB67e8b.29280"
Content-Transfer-Encoding: 7bit


--15657346371.0cB67e8b.29280
Date: Tue, 13 Aug 2019 22:17:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111213

--- Comment #17 from KJ Liew <liewkj-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> ---
On GeForce 9400, mpv works with both VA-API and VDPAU. This is on GNOME/Xor=
g, I
can't checkout GNOME/Wayland on this machine.

Linux 5.2.8-arch1-1-ARCH
local/libva-mesa-driver 19.1.4-1
local/mesa 19.1.4-1
local/mesa-vdpau 19.1.4-1

$ lspci | grep VGA
04:00.0 VGA compatible controller: NVIDIA Corporation C79 [GeForce 9400] (r=
ev
b1)

$ mpv --hwdec=3Dvaapi -vo=3Dvaapi /path/to/MP4
Playing: /path/to/MP4
 (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
 (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
Using hardware decoding (vaapi).
AO: [pulse] 44100Hz stereo 2ch float
VO: [vaapi] 1280x720 vaapi[nv12]
AV: 00:00:24 / 00:02:03 (20%) A-V:  0.000

$ mpv --hwdec=3Dvdpau -vo=3Dvdpau /path/to/MP4
Playing: /path/to/MP4
 (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
 (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
Using hardware decoding (vdpau).
AO: [pulse] 44100Hz stereo 2ch float
VO: [vdpau] 1280x720 vdpau[yuv420p]
[vo/vdpau] Compositing window manager detected. Assuming timing info is
inaccurate.
AV: 00:00:16 / 00:02:03 (13%) A-V:  0.000

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15657346371.0cB67e8b.29280
Date: Tue, 13 Aug 2019 22:17:17 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213#c17">Comme=
nt # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213">bug 11121=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
liewkj&#64;yahoo.com" title=3D"KJ Liew &lt;liewkj&#64;yahoo.com&gt;"> <span=
 class=3D"fn">KJ Liew</span></a>
</span></b>
        <pre>On GeForce 9400, mpv works with both VA-API and VDPAU. This is=
 on GNOME/Xorg, I
can't checkout GNOME/Wayland on this machine.

Linux 5.2.8-arch1-1-ARCH
local/libva-mesa-driver 19.1.4-1
local/mesa 19.1.4-1
local/mesa-vdpau 19.1.4-1

$ lspci | grep VGA
04:00.0 VGA compatible controller: NVIDIA Corporation C79 [GeForce 9400] (r=
ev
b1)

$ mpv --hwdec=3Dvaapi -vo=3Dvaapi /path/to/MP4
Playing: /path/to/MP4
 (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
 (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
Using hardware decoding (vaapi).
AO: [pulse] 44100Hz stereo 2ch float
VO: [vaapi] 1280x720 vaapi[nv12]
AV: 00:00:24 / 00:02:03 (20%) A-V:  0.000

$ mpv --hwdec=3Dvdpau -vo=3Dvdpau /path/to/MP4
Playing: /path/to/MP4
 (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
 (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
Using hardware decoding (vdpau).
AO: [pulse] 44100Hz stereo 2ch float
VO: [vdpau] 1280x720 vdpau[yuv420p]
[vo/vdpau] Compositing window manager detected. Assuming timing info is
inaccurate.
AV: 00:00:16 / 00:02:03 (13%) A-V:  0.000</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15657346371.0cB67e8b.29280--

--===============1273795762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1273795762==--
