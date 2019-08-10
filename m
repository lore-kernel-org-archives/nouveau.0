From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111213] VA-API nouveau SIGSEGV and asserts
Date: Sat, 10 Aug 2019 18:08:49 +0000
Message-ID: <bug-111213-8800-nZUNH7KYtp@http.bugs.freedesktop.org/>
References: <bug-111213-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1215615333=="
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


--===============1215615333==
Content-Type: multipart/alternative; boundary="15654605290.D159EE5.17887"
Content-Transfer-Encoding: 7bit


--15654605290.D159EE5.17887
Date: Sat, 10 Aug 2019 18:08:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111213

--- Comment #14 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to KJ Liew from comment #13)
> Both VA-API and VDPAU do not play video on GK208B using mpv. There was on=
ly
> sound and black screen.
>=20
> Linux 5.2.7-arch1-1-ARCH
> local/libva-mesa-driver 19.1.4-1
> local/mesa 19.1.4-1
> local/mesa-demos 8.4.0-1
> local/mesa-vdpau 19.1.4-1
>=20
> $ LIBVA_DRIVER_NAME=3Dnouveau mpv --hwdec=3Dvaapi -vo=3Dvaapi /path/to/MP4
> Playing: /path/to/MP4
>  (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
>  (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
> Using hardware decoding (vaapi).
> AO: [pulse] 44100Hz stereo 2ch float
> VO: [vaapi] 1280x720 vaapi[nv12]
> nve4_set_surface_info:969 - unsupported surface format, try
> is_format_supported() !
> nve4_set_surface_info:969 - unsupported surface format, try
> is_format_supported() !
> nve4_set_surface_info:969 - unsupported surface format, try
> is_format_supported() !
> nve4_set_surface_info:969 - unsupported surface format, try
> is_format_supported() !
> nve4_set_surface_info:969 - unsupported surface format, try
> is_format_supported() !

Yep, I know about this. Needs yet another change... just need to figure out=
 how
to best resolve it.

>=20
> $ VDPAU_DRIVER=3Dnouveau mpv --hwdec=3Dvdpau -vo=3Dopengl /path/to/MP4=20
> Driver 'opengl' has been replaced with 'gpu'!
> Playing: /path/to/MP4
>  (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
>  (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
> Cannot load libcuda.so.1
> Using hardware decoding (vdpau).
> VO: [gpu] 1280x720 vdpau[yuv420p]
> AO: [pulse] 44100Hz stereo 2ch float
> AV: 00:00:12 / 00:02:03 (10%) A-V:  0.000

mpv doesn't seem to work, yeah. FWIW I'd expect -vo vdpau to work (not -vo
opengl, which is unlikely to work with vdpau decoding). But it doesn't, I g=
et
some kind of error (something is trying to submit a batch with an unregiste=
red
bo or something).

mplayer works fine though. See
https://nouveau.freedesktop.org/wiki/VideoAcceleration/ for instructions on=
 how
to use it.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15654605290.D159EE5.17887
Date: Sat, 10 Aug 2019 18:08:49 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213">bug 11121=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to KJ Liew from <a href=3D"show_bug.cgi?id=3D111213#=
c13">comment #13</a>)
<span class=3D"quote">&gt; Both VA-API and VDPAU do not play video on GK208=
B using mpv. There was only
&gt; sound and black screen.
&gt;=20
&gt; Linux 5.2.7-arch1-1-ARCH
&gt; local/libva-mesa-driver 19.1.4-1
&gt; local/mesa 19.1.4-1
&gt; local/mesa-demos 8.4.0-1
&gt; local/mesa-vdpau 19.1.4-1
&gt;=20
&gt; $ LIBVA_DRIVER_NAME=3Dnouveau mpv --hwdec=3Dvaapi -vo=3Dvaapi /path/to=
/MP4
&gt; Playing: /path/to/MP4
&gt;  (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
&gt;  (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
&gt; Using hardware decoding (vaapi).
&gt; AO: [pulse] 44100Hz stereo 2ch float
&gt; VO: [vaapi] 1280x720 vaapi[nv12]
&gt; nve4_set_surface_info:969 - unsupported surface format, try
&gt; is_format_supported() !
&gt; nve4_set_surface_info:969 - unsupported surface format, try
&gt; is_format_supported() !
&gt; nve4_set_surface_info:969 - unsupported surface format, try
&gt; is_format_supported() !
&gt; nve4_set_surface_info:969 - unsupported surface format, try
&gt; is_format_supported() !
&gt; nve4_set_surface_info:969 - unsupported surface format, try
&gt; is_format_supported() !</span >

Yep, I know about this. Needs yet another change... just need to figure out=
 how
to best resolve it.

<span class=3D"quote">&gt;=20
&gt; $ VDPAU_DRIVER=3Dnouveau mpv --hwdec=3Dvdpau -vo=3Dopengl /path/to/MP4=
=20
&gt; Driver 'opengl' has been replaced with 'gpu'!
&gt; Playing: /path/to/MP4
&gt;  (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
&gt;  (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
&gt; Cannot load libcuda.so.1
&gt; Using hardware decoding (vdpau).
&gt; VO: [gpu] 1280x720 vdpau[yuv420p]
&gt; AO: [pulse] 44100Hz stereo 2ch float
&gt; AV: 00:00:12 / 00:02:03 (10%) A-V:  0.000</span >

mpv doesn't seem to work, yeah. FWIW I'd expect -vo vdpau to work (not -vo
opengl, which is unlikely to work with vdpau decoding). But it doesn't, I g=
et
some kind of error (something is trying to submit a batch with an unregiste=
red
bo or something).

mplayer works fine though. See
<a href=3D"https://nouveau.freedesktop.org/wiki/VideoAcceleration/">https:/=
/nouveau.freedesktop.org/wiki/VideoAcceleration/</a> for instructions on how
to use it.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15654605290.D159EE5.17887--

--===============1215615333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1215615333==--
