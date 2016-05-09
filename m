From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95282] G96: system hang on video playback via vdpau
Date: Mon, 09 May 2016 17:36:16 +0000
Message-ID: <bug-95282-8800-VAsAhp21FD@http.bugs.freedesktop.org/>
References: <bug-95282-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2019345675=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95282-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2019345675==
Content-Type: multipart/alternative; boundary="14628153751.19fA7BE.6055";
 charset="UTF-8"


--14628153751.19fA7BE.6055
Date: Mon, 9 May 2016 17:36:15 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95282

--- Comment #7 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

VDPAU enabled in xine-ui:
...
# video driver to use
# { auto  vdpau  aadxr3  dxr3  xv  vaapi  raw  opengl2  opengl  aa  xshm  caca 
none  xxmc  sdl  fb  xvmc }, default: 0
video.driver:vdpau

...
# vdpau: color of none video area in output window
# numeric, default: 0
#video.output.vdpau_background_color:0

# vdpau: HD deinterlace method
# { bob  half temporal  temporal }, default: 2
#video.output.vdpau_hd_deinterlace_method:temporal

# vdpau: disable deinterlacing when progressive_frame flag is set
# bool, default: 0
#video.output.vdpau_honor_progressive:0

# vdpau: SD deinterlace method
# { bob  half temporal  temporal }, default: 2
#video.output.vdpau_sd_deinterlace_method:temporal

# vdpau: restrict enabling video properties for SD video only
# { none  noise  sharpness  noise+sharpness }, default: 0
#video.output.vdpau_sd_only_properties:none

# vdpau: disable advanced deinterlacers chroma filter
# bool, default: 0
#video.output.vdpau_skip_chroma_deinterlace:0

...
# default length of display queue
# numeric, default: 3
#video.output.vdpau_display_queue_length:3

# maximum number of output surfaces buffered for reuse
# numeric, default: 10
#video.output.vdpau_output_surface_buffer_size:10

...
# priority for vdpau_h264 decoder
# numeric, default: 0
#engine.decoder_priorities.vdpau_h264:0

# priority for vdpau_h264_alter decoder
# numeric, default: 0
#engine.decoder_priorities.vdpau_h264_alter:0

# priority for vdpau_mpeg12 decoder
# numeric, default: 0
#engine.decoder_priorities.vdpau_mpeg12:0

# priority for vdpau_mpeg4 decoder
# numeric, default: 0
#engine.decoder_priorities.vdpau_mpeg4:0

# priority for vdpau_vc1 decoder
# numeric, default: 0
#engine.decoder_priorities.vdpau_vc1:0

...

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14628153751.19fA7BE.6055
Date: Mon, 9 May 2016 17:36:15 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - G96: system hang on video playback via vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95282#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - G96: system hang on video playback via vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95282">bug 95282</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
VDPAU enabled in xine-ui:
...
# video driver to use
# { auto  vdpau  aadxr3  dxr3  xv  vaapi  raw  opengl2  opengl  aa  xshm  caca 
none  xxmc  sdl  fb  xvmc }, default: 0
video.driver:vdpau

...
# vdpau: color of none video area in output window
# numeric, default: 0
#video.output.vdpau_background_color:0

# vdpau: HD deinterlace method
# { bob  half temporal  temporal }, default: 2
#video.output.vdpau_hd_deinterlace_method:temporal

# vdpau: disable deinterlacing when progressive_frame flag is set
# bool, default: 0
#video.output.vdpau_honor_progressive:0

# vdpau: SD deinterlace method
# { bob  half temporal  temporal }, default: 2
#video.output.vdpau_sd_deinterlace_method:temporal

# vdpau: restrict enabling video properties for SD video only
# { none  noise  sharpness  noise+sharpness }, default: 0
#video.output.vdpau_sd_only_properties:none

# vdpau: disable advanced deinterlacers chroma filter
# bool, default: 0
#video.output.vdpau_skip_chroma_deinterlace:0

...
# default length of display queue
# numeric, default: 3
#video.output.vdpau_display_queue_length:3

# maximum number of output surfaces buffered for reuse
# numeric, default: 10
#video.output.vdpau_output_surface_buffer_size:10

...
# priority for vdpau_h264 decoder
# numeric, default: 0
#engine.decoder_priorities.vdpau_h264:0

# priority for vdpau_h264_alter decoder
# numeric, default: 0
#engine.decoder_priorities.vdpau_h264_alter:0

# priority for vdpau_mpeg12 decoder
# numeric, default: 0
#engine.decoder_priorities.vdpau_mpeg12:0

# priority for vdpau_mpeg4 decoder
# numeric, default: 0
#engine.decoder_priorities.vdpau_mpeg4:0

# priority for vdpau_vc1 decoder
# numeric, default: 0
#engine.decoder_priorities.vdpau_vc1:0

...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14628153751.19fA7BE.6055--

--===============2019345675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2019345675==--
