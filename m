From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109952] nv106 nv108 confusion
Date: Mon, 11 Mar 2019 14:16:34 +0000
Message-ID: <bug-109952-8800-3w0AOd0tTq@http.bugs.freedesktop.org/>
References: <bug-109952-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1636595367=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-109952-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1636595367==
Content-Type: multipart/alternative; boundary="15523137940.c1F572D7a.6306"
Content-Transfer-Encoding: 7bit


--15523137940.c1F572D7a.6306
Date: Mon, 11 Mar 2019 14:16:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109952

--- Comment #4 from moebius <moebius1-GANU6spQydw@public.gmane.org> ---
thank for your answer,
I've tried to open several files with same results : black screen
Using mplayer -vo vdpau -vc
ffmpeg12vdpau,ffwmv3vdpau,ffvc1vdpau,ffh264vdpau,ffodivxvdpau, <file>


with a mpeg file :

Starting playback...
Movie-Aspect is undefined - no prescaling applied.
VO: [vdpau] 720x576 =3D> 720x576 MPEG2 VDPAU acceleration=20
[mpegvideo @ 0x7eff23048840]Image too small, temporary buffers cannot funct=
ion
[mpegvideo @ 0x7eff23048840]get_buffer() failed to allocate context scratch
buffers.
Error while decoding frame!
[mpegvideo @ 0x7eff23048840]Image too small, temporary buffers cannot funct=
ion
[mpegvideo @ 0x7eff23048840]get_buffer() failed to allocate context scratch
buffers.
Error while decoding frame!
[mpegvideo @ 0x7eff23048840]Image too small, temporary buffers cannot funct=
ion
[mpegvideo @ 0x7eff23048840]get_buffer() failed to allocate context scratch
buffers.
-------------------------------
with a mp4 one :

libavformat version 58.20.100 (external)
Mismatching header version 58.12.100
libavformat file format detected.
[mov,mp4,m4a,3gp,3g2,mj2 @ 0x7fcb1faa7e00]Protocol name not provided, cannot
determine if input is local or a network protocol, buffers and access patte=
rns
cannot be configured optimally without knowing the protocol
[lavf] stream 0: video (h264), -vid 0
[lavf] stream 1: audio (aac), -aid 0, -alang und
VIDEO:  [H264]  720x406  24bpp  25.000 fps  1590.0 kbps (194.1 kbyte/s)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Forced video codec: ffmpeg12vdpau
Forced video codec: ffwmv3vdpau
Forced video codec: ffvc1vdpau
Forced video codec: ffh264vdpau
Opening video decoder: [ffmpeg] FFmpeg's libavcodec codec family
libavcodec version 58.35.100 (external)
Mismatching header version 58.18.100
Selected video codec: [ffh264vdpau] vfm: ffmpeg (FFmpeg H.264 (VDPAU))
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Clip info:
 major_brand: mp42
 minor_version: 0
 compatible_brands: isommp42
 creation_time: 2019-02-13T04:17:07.000000Z
Load subtitles in /disque4/espace11/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Opening audio decoder: [ffmpeg] FFmpeg/libavcodec audio decoders
AUDIO: 48000 Hz, 2 ch, floatle, 125.4 kbit/4.08% (ratio: 15679->384000)
Selected audio codec: [ffaac] afm: ffmpeg (FFmpeg AAC (MPEG-2/MPEG-4 Audio))
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
AO: [pulse] 48000Hz 2ch floatle (4 bytes per sample)
Starting playback...
Movie-Aspect is 1.77:1 - prescaling to correct movie aspect.
VO: [vdpau] 720x406 =3D> 720x406 H.264 VDPAU acceleration=20
Movie-Aspect is 1.77:1 - prescaling to correct movie aspect.
VO: [vdpau] 720x406 =3D> 720x406 H.264 VDPAU acceleration=20
Dropping frame with size not matching configured size (720x406 vs 720x396 vs
720x406)
Dropping frame with size not matching configured size (720x406 vs 720x396 vs
720x406)
-----------------------------------------------
with an avi one :

libavformat version 58.20.100 (external)
Mismatching header version 58.12.100
MPEG-PS file format detected.
VIDEO:  MPEG2  720x576  (aspect 2)  25.000 fps  9800.0 kbps (1225.0 kbyte/s)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Forced video codec: ffmpeg12vdpau
Opening video decoder: [ffmpeg] FFmpeg's libavcodec codec family
libavcodec version 58.35.100 (external)
Mismatching header version 58.18.100
Selected video codec: [ffmpeg12vdpau] vfm: ffmpeg (FFmpeg MPEG-1/2 (VDPAU))
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Load subtitles in /disque4/espace11/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Opening audio decoder: [ffmpeg] FFmpeg/libavcodec audio decoders
AUDIO: 48000 Hz, 2 ch, floatle, 448.0 kbit/14.58% (ratio: 56000->384000)
Selected audio codec: [ffac3] afm: ffmpeg (FFmpeg AC-3)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
AO: [pulse] 48000Hz 2ch floatle (4 bytes per sample)
Starting playback...
[ac3 @ 0x7f1181774840]Got unexpected packet after EOF
[ac3 @ 0x7f1181774840]Got unexpected packet after EOF
[ac3 @ 0x7f1181774840]Got unexpected packet after EOF
[ac3 @ 0x7f1181774840]Got unexpected packet after EOF
[ac3 @ 0x7f1181774840]Got unexpected packet after EOF
[ac3 @ 0x7f1181774840]Got unexpected packet after EOF
[ac3 @ 0x7f1181774840]Got unexpected packet after EOF
[ac3 @ 0x7f1181774840]Got unexpected packet after EOF
Movie-Aspect is undefined - no prescaling applied.
VO: [vdpau] 720x576 =3D> 720x576 MPEG2 VDPAU acceleration=20
[mpegvideo @ 0x7f1181774840]Image too small, temporary buffers cannot funct=
ion
[mpegvideo @ 0x7f1181774840]get_buffer() failed to allocate context scratch
buffers.
Error while decoding frame!
[mpegvideo @ 0x7f1181774840]Image too small, temporary buffers cannot funct=
ion
[mpegvideo @ 0x7f1181774840]get_buffer() failed to allocate context scratch
buffers.
Error while decoding frame!
[mpegvideo @ 0x7f1181774840]Image too small, temporary buffers cannot funct=
ion
[mpegvideo @ 0x7f1181774840]get_buffer() failed to allocate context scratch=
=20


So, if you have an idea...

cordialement,

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15523137940.c1F572D7a.6306
Date: Mon, 11 Mar 2019 14:16:34 +0000
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
   title=3D"NEW - nv106 nv108 confusion"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109952#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nv106 nv108 confusion"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109952">bug 10995=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
moebius1&#64;free.fr" title=3D"moebius &lt;moebius1&#64;free.fr&gt;"> <span=
 class=3D"fn">moebius</span></a>
</span></b>
        <pre>thank for your answer,
I've tried to open several files with same results : black screen
Using mplayer -vo vdpau -vc
ffmpeg12vdpau,ffwmv3vdpau,ffvc1vdpau,ffh264vdpau,ffodivxvdpau, &lt;file&gt;


with a mpeg file :

Starting playback...
Movie-Aspect is undefined - no prescaling applied.
VO: [vdpau] 720x576 =3D&gt; 720x576 MPEG2 VDPAU acceleration=20
[mpegvideo &#64; 0x7eff23048840]Image too small, temporary buffers cannot f=
unction
[mpegvideo &#64; 0x7eff23048840]get_buffer() failed to allocate context scr=
atch
buffers.
Error while decoding frame!
[mpegvideo &#64; 0x7eff23048840]Image too small, temporary buffers cannot f=
unction
[mpegvideo &#64; 0x7eff23048840]get_buffer() failed to allocate context scr=
atch
buffers.
Error while decoding frame!
[mpegvideo &#64; 0x7eff23048840]Image too small, temporary buffers cannot f=
unction
[mpegvideo &#64; 0x7eff23048840]get_buffer() failed to allocate context scr=
atch
buffers.
-------------------------------
with a mp4 one :

libavformat version 58.20.100 (external)
Mismatching header version 58.12.100
libavformat file format detected.
[mov,mp4,m4a,3gp,3g2,mj2 &#64; 0x7fcb1faa7e00]Protocol name not provided, c=
annot
determine if input is local or a network protocol, buffers and access patte=
rns
cannot be configured optimally without knowing the protocol
[lavf] stream 0: video (h264), -vid 0
[lavf] stream 1: audio (aac), -aid 0, -alang und
VIDEO:  [H264]  720x406  24bpp  25.000 fps  1590.0 kbps (194.1 kbyte/s)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Forced video codec: ffmpeg12vdpau
Forced video codec: ffwmv3vdpau
Forced video codec: ffvc1vdpau
Forced video codec: ffh264vdpau
Opening video decoder: [ffmpeg] FFmpeg's libavcodec codec family
libavcodec version 58.35.100 (external)
Mismatching header version 58.18.100
Selected video codec: [ffh264vdpau] vfm: ffmpeg (FFmpeg H.264 (VDPAU))
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Clip info:
 major_brand: mp42
 minor_version: 0
 compatible_brands: isommp42
 creation_time: 2019-02-13T04:17:07.000000Z
Load subtitles in /disque4/espace11/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Opening audio decoder: [ffmpeg] FFmpeg/libavcodec audio decoders
AUDIO: 48000 Hz, 2 ch, floatle, 125.4 kbit/4.08% (ratio: 15679-&gt;384000)
Selected audio codec: [ffaac] afm: ffmpeg (FFmpeg AAC (MPEG-2/MPEG-4 Audio))
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
AO: [pulse] 48000Hz 2ch floatle (4 bytes per sample)
Starting playback...
Movie-Aspect is 1.77:1 - prescaling to correct movie aspect.
VO: [vdpau] 720x406 =3D&gt; 720x406 H.264 VDPAU acceleration=20
Movie-Aspect is 1.77:1 - prescaling to correct movie aspect.
VO: [vdpau] 720x406 =3D&gt; 720x406 H.264 VDPAU acceleration=20
Dropping frame with size not matching configured size (720x406 vs 720x396 vs
720x406)
Dropping frame with size not matching configured size (720x406 vs 720x396 vs
720x406)
-----------------------------------------------
with an avi one :

libavformat version 58.20.100 (external)
Mismatching header version 58.12.100
MPEG-PS file format detected.
VIDEO:  MPEG2  720x576  (aspect 2)  25.000 fps  9800.0 kbps (1225.0 kbyte/s)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Forced video codec: ffmpeg12vdpau
Opening video decoder: [ffmpeg] FFmpeg's libavcodec codec family
libavcodec version 58.35.100 (external)
Mismatching header version 58.18.100
Selected video codec: [ffmpeg12vdpau] vfm: ffmpeg (FFmpeg MPEG-1/2 (VDPAU))
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Load subtitles in /disque4/espace11/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Opening audio decoder: [ffmpeg] FFmpeg/libavcodec audio decoders
AUDIO: 48000 Hz, 2 ch, floatle, 448.0 kbit/14.58% (ratio: 56000-&gt;384000)
Selected audio codec: [ffac3] afm: ffmpeg (FFmpeg AC-3)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
AO: [pulse] 48000Hz 2ch floatle (4 bytes per sample)
Starting playback...
[ac3 &#64; 0x7f1181774840]Got unexpected packet after EOF
[ac3 &#64; 0x7f1181774840]Got unexpected packet after EOF
[ac3 &#64; 0x7f1181774840]Got unexpected packet after EOF
[ac3 &#64; 0x7f1181774840]Got unexpected packet after EOF
[ac3 &#64; 0x7f1181774840]Got unexpected packet after EOF
[ac3 &#64; 0x7f1181774840]Got unexpected packet after EOF
[ac3 &#64; 0x7f1181774840]Got unexpected packet after EOF
[ac3 &#64; 0x7f1181774840]Got unexpected packet after EOF
Movie-Aspect is undefined - no prescaling applied.
VO: [vdpau] 720x576 =3D&gt; 720x576 MPEG2 VDPAU acceleration=20
[mpegvideo &#64; 0x7f1181774840]Image too small, temporary buffers cannot f=
unction
[mpegvideo &#64; 0x7f1181774840]get_buffer() failed to allocate context scr=
atch
buffers.
Error while decoding frame!
[mpegvideo &#64; 0x7f1181774840]Image too small, temporary buffers cannot f=
unction
[mpegvideo &#64; 0x7f1181774840]get_buffer() failed to allocate context scr=
atch
buffers.
Error while decoding frame!
[mpegvideo &#64; 0x7f1181774840]Image too small, temporary buffers cannot f=
unction
[mpegvideo &#64; 0x7f1181774840]get_buffer() failed to allocate context scr=
atch=20


So, if you have an idea...

cordialement,</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15523137940.c1F572D7a.6306--

--===============1636595367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1636595367==--
