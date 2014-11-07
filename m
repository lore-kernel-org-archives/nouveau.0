From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86006] [NV84] Nvidia GeForce 8600 GT VDPAU h264
 hardware acceleration
Date: Fri, 07 Nov 2014 19:45:39 +0000
Message-ID: <bug-86006-8800-cNEuzTp3bj@http.bugs.freedesktop.org/>
References: <bug-86006-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1806927396=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86006-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1806927396==
Content-Type: multipart/alternative; boundary="1415389539.bDb6Bb1.31233"; charset="UTF-8"


--1415389539.bDb6Bb1.31233
Date: Fri, 7 Nov 2014 19:45:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86006

--- Comment #12 from Ilya Indigo <13ilya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
mplayer -vo vdpau -vc ffmpeg12vdpau,ffh264vdpau,
/ILYA/Video/Documentaries/Space/Through\ the\ Wormhole/Through\ the\ Wormhole\
3.03\ -\ Is\ The\ Universe\ Alive.mkv
MPlayer -4.7 (C) 2000-2014 MPlayer Team
mplayer: could not connect to socket
mplayer: No such file or directory
Failed to open LIRC support. You will not be able to use your remote control.

Playing /ILYA/Video/Documentaries/Space/Through the Wormhole/Through the
Wormhole 3.03 - Is The Universe Alive.mkv.
libavformat version 55.48.100 (internal)
libavformat file format detected.
[lavf] stream 0: video (h264), -vid 0
[lavf] stream 1: audio (ac3), -aid 0, -alang eng
[lavf] stream 2: audio (dca), -aid 1, -alang eng
VIDEO:  [H264]  1920x1080  0bpp  50.000 fps    0.0 kbps ( 0.0 kbyte/s)
Clip info:
 encoder: libebml v1.3.0 + libmatroska v1.4.0
 creation_time: 2014-06-13 10:53:11
Load subtitles in /ILYA/Video/Documentaries/Space/Through the Wormhole/
==========================================================================
Forced video codec: ffmpeg12vdpau
Forced video codec: ffh264vdpau
Opening video decoder: [ffmpeg] FFmpeg's libavcodec codec family
libavcodec version 55.69.100 (internal)
Selected video codec: [ffh264vdpau] vfm: ffmpeg (FFmpeg H.264 (VDPAU))
==========================================================================
==========================================================================
Trying to force audio codec driver family libmad...
Opening audio decoder: [ffmpeg] FFmpeg/libavcodec audio decoders
AUDIO: 48000 Hz, 2 ch, floatle, 256.0 kbit/8.33% (ratio: 32000->384000)
Selected audio codec: [ffac3] afm: ffmpeg (FFmpeg AC-3)
==========================================================================
AO: [pulse] Init failed: Connection refused
Failed to initialize audio driver 'pulse'
AO: [alsa] 48000Hz 2ch floatle (4 bytes per sample)
Starting playback...
Movie-Aspect is 1.78:1 - prescaling to correct movie aspect.
VO: [vdpau] 1920x1080 => 1920x1080 H.264 VDPAU acceleration  [zoom]
Movie-Aspect is 1.78:1 - prescaling to correct movie aspect.
VO: [vdpau] 1920x1080 => 1920x1080 H.264 VDPAU acceleration  [zoom]
A:  44.8 V:  44.8 A-V:  0.000 ct:  0.000   0/  0 17%  0%  0.8% 3 0 


Black  screen with sound and blinking pixels in left upper conner

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1415389539.bDb6Bb1.31233
Date: Fri, 7 Nov 2014 19:45:39 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV84] Nvidia GeForce 8600 GT VDPAU h264 hardware acceleration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86006#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV84] Nvidia GeForce 8600 GT VDPAU h264 hardware acceleration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86006">bug 86006</a>
              from <span class="vcard"><a class="email" href="mailto:13ilya&#64;gmail.com" title="Ilya Indigo &lt;13ilya&#64;gmail.com&gt;"> <span class="fn">Ilya Indigo</span></a>
</span></b>
        <pre>mplayer -vo vdpau -vc ffmpeg12vdpau,ffh264vdpau,
/ILYA/Video/Documentaries/Space/Through\ the\ Wormhole/Through\ the\ Wormhole\
3.03\ -\ Is\ The\ Universe\ Alive.mkv
MPlayer -4.7 (C) 2000-2014 MPlayer Team
mplayer: could not connect to socket
mplayer: No such file or directory
Failed to open LIRC support. You will not be able to use your remote control.

Playing /ILYA/Video/Documentaries/Space/Through the Wormhole/Through the
Wormhole 3.03 - Is The Universe Alive.mkv.
libavformat version 55.48.100 (internal)
libavformat file format detected.
[lavf] stream 0: video (h264), -vid 0
[lavf] stream 1: audio (ac3), -aid 0, -alang eng
[lavf] stream 2: audio (dca), -aid 1, -alang eng
VIDEO:  [H264]  1920x1080  0bpp  50.000 fps    0.0 kbps ( 0.0 kbyte/s)
Clip info:
 encoder: libebml v1.3.0 + libmatroska v1.4.0
 creation_time: 2014-06-13 10:53:11
Load subtitles in /ILYA/Video/Documentaries/Space/Through the Wormhole/
==========================================================================
Forced video codec: ffmpeg12vdpau
Forced video codec: ffh264vdpau
Opening video decoder: [ffmpeg] FFmpeg's libavcodec codec family
libavcodec version 55.69.100 (internal)
Selected video codec: [ffh264vdpau] vfm: ffmpeg (FFmpeg H.264 (VDPAU))
==========================================================================
==========================================================================
Trying to force audio codec driver family libmad...
Opening audio decoder: [ffmpeg] FFmpeg/libavcodec audio decoders
AUDIO: 48000 Hz, 2 ch, floatle, 256.0 kbit/8.33% (ratio: 32000-&gt;384000)
Selected audio codec: [ffac3] afm: ffmpeg (FFmpeg AC-3)
==========================================================================
AO: [pulse] Init failed: Connection refused
Failed to initialize audio driver 'pulse'
AO: [alsa] 48000Hz 2ch floatle (4 bytes per sample)
Starting playback...
Movie-Aspect is 1.78:1 - prescaling to correct movie aspect.
VO: [vdpau] 1920x1080 =&gt; 1920x1080 H.264 VDPAU acceleration  [zoom]
Movie-Aspect is 1.78:1 - prescaling to correct movie aspect.
VO: [vdpau] 1920x1080 =&gt; 1920x1080 H.264 VDPAU acceleration  [zoom]
A:  44.8 V:  44.8 A-V:  0.000 ct:  0.000   0/  0 17%  0%  0.8% 3 0 


Black  screen with sound and blinking pixels in left upper conner</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1415389539.bDb6Bb1.31233--

--===============1806927396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1806927396==--
