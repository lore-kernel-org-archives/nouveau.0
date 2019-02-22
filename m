From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109742] New: vdpau state tracker on nv92 started to
 hit assert after vl compute work
Date: Fri, 22 Feb 2019 09:35:21 +0000
Message-ID: <bug-109742-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1523581366=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1523581366==
Content-Type: multipart/alternative; boundary="15508281220.4c0518.3703"
Content-Transfer-Encoding: 7bit


--15508281220.4c0518.3703
Date: Fri, 22 Feb 2019 09:35:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109742

            Bug ID: 109742
           Summary: vdpau state tracker on nv92 started to hit assert
                    after vl compute work
           Product: Mesa
           Version: git
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: randrik-JGs/UdohzUI@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 143438
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D143438&action=3Dedit
hack patch to disable compute reporting in nv50

Hello.=20

I tried to update my mesa install and hit one bug.

mplayer /dev/shm/tmp/output.mkv
MPlayer SVN-r38122-5.5.0 (C) 2000-2019 MPlayer Team
224 audio & 464 video codecs

Playing /dev/shm/tmp/output.mkv.
libavformat version 58.26.101 (internal)
libavformat file format detected.
[lavf] stream 0: video (vp8), -vid 0
[lavf] stream 1: audio (vorbis), -aid 0, -alang rus
VIDEO:  [VP80]  1280x720  0bpp  30.000 fps    0.0 kbps ( 0.0 kbyte/s)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Opening video decoder: [ffmpeg] FFmpeg's libavcodec codec family
libavcodec version 58.47.100 (internal)
Selected video codec: [ffvp8] vfm: ffmpeg (FFmpeg VP8)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Clip info:
 ENCODER: Lavf58.20.100
Load subtitles in /dev/shm/tmp/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Forced audio codec: mad
Opening audio decoder: [ffmpeg] FFmpeg/libavcodec audio decoders
AUDIO: 44100 Hz, 2 ch, floatle, 0.0 kbit/0.00% (ratio: 0->352800)
Selected audio codec: [ffvorbis] afm: ffmpeg (FFmpeg Vorbis)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
AL lib: (EE) UpdateDeviceParams: Failed to set 44100hz, got 48000hz instead
AO: [openal] 48000Hz 2ch s16le (2 bytes per sample)
Starting playback...
Movie-Aspect is undefined - no prescaling applied.
VO: [vdpau] 1280x720 =3D> 1280x720 Planar YV12
mplayer: nv50/nv50_state.c:659: nv50_bind_sampler_states: Assertion
`!"unexpected shader type"' failed.


MPlayer interrupted by signal 6 in module: decode video
- MPlayer crashed. This shouldn't happen.
  It can be a bug in the MPlayer code _or_ in your drivers _or_ in your
  gcc version. If you think it's MPlayer's fault, please read
  DOCS/HTML/en/bugreports.html and follow the instructions there. We can't =
and
  won't help unless you provide this information when reporting a possible =
bug.
AL lib: (EE) alc_cleanup: 1 device not closed


MPlayer interrupted by signal 11 in module: decode video

mesa version Mesa 19.1.0-devel (git-55e00a2ea8) was good.

disabling PIPE_CAP_COMPUTE for nv50 'fixes' bug for me.

Note, I hope internal use of compute shaders still unaffected, or may be I =
read
https://cgit.freedesktop.org/mesa/mesa/commit/src/gallium/drivers/nouveau/n=
v50/nv50_screen.c?id=3Dff72440b40211326eda118232fabd53965410afd
wrongly?

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15508281220.4c0518.3703
Date: Fri, 22 Feb 2019 09:35:22 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - vdpau state tracker on nv92 started to hit assert after v=
l compute work"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109742">109742</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>vdpau state tracker on nv92 started to hit assert after vl co=
mpute work
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>randrik&#64;mail.ru
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D143438=
" name=3D"attach_143438" title=3D"hack patch to disable compute reporting i=
n nv50">attachment 143438</a> <a href=3D"attachment.cgi?id=3D143438&amp;act=
ion=3Dedit" title=3D"hack patch to disable compute reporting in nv50">[deta=
ils]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D109742&amp=
;attachment=3D143438'>[review]</a>
hack patch to disable compute reporting in nv50

Hello.=20

I tried to update my mesa install and hit one bug.

mplayer /dev/shm/tmp/output.mkv
MPlayer SVN-r38122-5.5.0 (C) 2000-2019 MPlayer Team
224 audio &amp; 464 video codecs

Playing /dev/shm/tmp/output.mkv.
libavformat version 58.26.101 (internal)
libavformat file format detected.
[lavf] stream 0: video (vp8), -vid 0
[lavf] stream 1: audio (vorbis), -aid 0, -alang rus
VIDEO:  [VP80]  1280x720  0bpp  30.000 fps    0.0 kbps ( 0.0 kbyte/s)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Opening video decoder: [ffmpeg] FFmpeg's libavcodec codec family
libavcodec version 58.47.100 (internal)
Selected video codec: [ffvp8] vfm: ffmpeg (FFmpeg VP8)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Clip info:
 ENCODER: Lavf58.20.100
Load subtitles in /dev/shm/tmp/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Forced audio codec: mad
Opening audio decoder: [ffmpeg] FFmpeg/libavcodec audio decoders
AUDIO: 44100 Hz, 2 ch, floatle, 0.0 kbit/0.00% (ratio: 0-&gt;352800)
Selected audio codec: [ffvorbis] afm: ffmpeg (FFmpeg Vorbis)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
AL lib: (EE) UpdateDeviceParams: Failed to set 44100hz, got 48000hz instead
AO: [openal] 48000Hz 2ch s16le (2 bytes per sample)
Starting playback...
Movie-Aspect is undefined - no prescaling applied.
VO: [vdpau] 1280x720 =3D&gt; 1280x720 Planar YV12
mplayer: nv50/nv50_state.c:659: nv50_bind_sampler_states: Assertion
`!&quot;unexpected shader type&quot;' failed.


MPlayer interrupted by signal 6 in module: decode video
- MPlayer crashed. This shouldn't happen.
  It can be a bug in the MPlayer code _or_ in your drivers _or_ in your
  gcc version. If you think it's MPlayer's fault, please read
  DOCS/HTML/en/bugreports.html and follow the instructions there. We can't =
and
  won't help unless you provide this information when reporting a possible =
bug.
AL lib: (EE) alc_cleanup: 1 device not closed


MPlayer interrupted by signal 11 in module: decode video

mesa version Mesa 19.1.0-devel (git-55e00a2ea8) was good.

disabling PIPE_CAP_COMPUTE for nv50 'fixes' bug for me.

Note, I hope internal use of compute shaders still unaffected, or may be I =
read
<a href=3D"https://cgit.freedesktop.org/mesa/mesa/commit/src/gallium/driver=
s/nouveau/nv50/nv50_screen.c?id=3Dff72440b40211326eda118232fabd53965410afd"=
>https://cgit.freedesktop.org/mesa/mesa/commit/src/gallium/drivers/nouveau/=
nv50/nv50_screen.c?id=3Dff72440b40211326eda118232fabd53965410afd</a>
wrongly?</pre>
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

--15508281220.4c0518.3703--

--===============1523581366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1523581366==--
