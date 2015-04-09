From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89969] vaDriverInit fails with gallium/nouveau driver
Date: Thu, 09 Apr 2015 16:02:09 +0000
Message-ID: <bug-89969-8800-SLyuGPjrQy@http.bugs.freedesktop.org/>
References: <bug-89969-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1641619889=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89969-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1641619889==
Content-Type: multipart/alternative; boundary="1428595329.eA1cD00f1.7179"; charset="UTF-8"


--1428595329.eA1cD00f1.7179
Date: Thu, 9 Apr 2015 16:02:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89969

--- Comment #3 from Julien Isorce <julien.isorce-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
basic libva unit tests passes but it fails to decode 2 videos mpeg12
(nouveau_vp3_fill_picparm_mpeg12_bsp) and h264
(nouveau_vp3_fill_picparm_h264_bsp).

nouveau_vp3_fill_picparm_mpeg12_bsp (map=0x7ffff7e3c000 <error: Cannot access
memory at address 0x7ffff7e3c000>, desc=0x0, dec=0x7fffe004a000)
    at nouveau_vp3_video_bsp.c:121
121       pic_bsp->picture_structure = desc->picture_structure;
(gdb) bt
#0  nouveau_vp3_fill_picparm_mpeg12_bsp (map=0x7ffff7e3c000 <error: Cannot
access memory at address 0x7ffff7e3c000>, desc=0x0, dec=0x7fffe004a000)
    at nouveau_vp3_video_bsp.c:121
#1  nouveau_vp3_bsp (dec=dec@entry=0x7fffe004a000, desc=desc@entry=...,
target=target@entry=0x7fffe001fe00, comm_seq=comm_seq@entry=2, 
    num_buffers=num_buffers@entry=1, data=data@entry=0x7fffe7ffdcd0,
num_bytes=num_bytes@entry=0x7fffe7ffdcc0) at nouveau_vp3_video_bsp.c:257
#2  0x00007ffff072118e in nvc0_decoder_bsp (dec=dec@entry=0x7fffe004a000,
desc=desc@entry=..., target=target@entry=0x7fffe001fe00,
comm_seq=comm_seq@entry=2, 
    num_buffers=1, data=0x7fffe7ffdcd0, num_bytes=0x7fffe7ffdcc0,
vp_caps=vp_caps@entry=0x7fffe7ffdbd8, is_ref=is_ref@entry=0x7fffe7ffdbdc, 
    refs=refs@entry=0x7fffe7ffdbe0) at nvc0/nvc0_video_bsp.c:117
#3  0x00007ffff0721650 in nvc0_decoder_decode_bitstream
(decoder=0x7fffe004a000, video_target=0x7fffe001fe00, picture=0x0,
num_buffers=<optimised out>, 
    data=<optimised out>, num_bytes=<optimised out>) at nvc0/nvc0_video.c:48

Program received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7fffe7fff700 (LWP 854)]
nouveau_vp3_bsp (dec=dec@entry=0x7fffe0068040, desc=desc@entry=...,
target=target@entry=0x7fffe0063110, comm_seq=comm_seq@entry=2, 
    num_buffers=num_buffers@entry=2, data=data@entry=0x7fffe7ffe150,
num_bytes=num_bytes@entry=0x7fffe7ffe140) at nouveau_vp3_video_bsp.c:270
270          caps = nouveau_vp3_fill_picparm_h264_bsp(dec, desc.h264, bsp);
(gdb) bt
#0  nouveau_vp3_bsp (dec=dec@entry=0x7fffe0068040, desc=desc@entry=...,
target=target@entry=0x7fffe0063110, comm_seq=comm_seq@entry=2, 
    num_buffers=num_buffers@entry=2, data=data@entry=0x7fffe7ffe150,
num_bytes=num_bytes@entry=0x7fffe7ffe140) at nouveau_vp3_video_bsp.c:270
#1  0x00007ffff02a918e in nvc0_decoder_bsp (dec=dec@entry=0x7fffe0068040,
desc=desc@entry=..., target=target@entry=0x7fffe0063110,
comm_seq=comm_seq@entry=2, 
    num_buffers=2, data=0x7fffe7ffe150, num_bytes=0x7fffe7ffe140,
vp_caps=vp_caps@entry=0x7fffe7ffe058, is_ref=is_ref@entry=0x7fffe7ffe05c, 
    refs=refs@entry=0x7fffe7ffe060) at nvc0/nvc0_video_bsp.c:117
#2  0x00007ffff02a9650 in nvc0_decoder_decode_bitstream
(decoder=0x7fffe0068040, video_target=0x7fffe0063110, picture=0x0,
num_buffers=<optimised out>, 
    data=<optimised out>, num_bytes=<optimised out>) at nvc0/nvc0_video.c:48

Worth to mention that gallium/vdpau succeeds to decode these 2 videos. Also
libva succeeds to decode video using libva's vdpau-driver on top of
gallium/vdpau.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1428595329.eA1cD00f1.7179
Date: Thu, 9 Apr 2015 16:02:09 +0000
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
   title="NEW - vaDriverInit fails with gallium/nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89969#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - vaDriverInit fails with gallium/nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89969">bug 89969</a>
              from <span class="vcard"><a class="email" href="mailto:julien.isorce&#64;gmail.com" title="Julien Isorce &lt;julien.isorce&#64;gmail.com&gt;"> <span class="fn">Julien Isorce</span></a>
</span></b>
        <pre>basic libva unit tests passes but it fails to decode 2 videos mpeg12
(nouveau_vp3_fill_picparm_mpeg12_bsp) and h264
(nouveau_vp3_fill_picparm_h264_bsp).

nouveau_vp3_fill_picparm_mpeg12_bsp (map=0x7ffff7e3c000 &lt;error: Cannot access
memory at address 0x7ffff7e3c000&gt;, desc=0x0, dec=0x7fffe004a000)
    at nouveau_vp3_video_bsp.c:121
121       pic_bsp-&gt;picture_structure = desc-&gt;picture_structure;
(gdb) bt
#0  nouveau_vp3_fill_picparm_mpeg12_bsp (map=0x7ffff7e3c000 &lt;error: Cannot
access memory at address 0x7ffff7e3c000&gt;, desc=0x0, dec=0x7fffe004a000)
    at nouveau_vp3_video_bsp.c:121
#1  nouveau_vp3_bsp (dec=dec&#64;entry=0x7fffe004a000, desc=desc&#64;entry=...,
target=target&#64;entry=0x7fffe001fe00, comm_seq=comm_seq&#64;entry=2, 
    num_buffers=num_buffers&#64;entry=1, data=data&#64;entry=0x7fffe7ffdcd0,
num_bytes=num_bytes&#64;entry=0x7fffe7ffdcc0) at nouveau_vp3_video_bsp.c:257
#2  0x00007ffff072118e in nvc0_decoder_bsp (dec=dec&#64;entry=0x7fffe004a000,
desc=desc&#64;entry=..., target=target&#64;entry=0x7fffe001fe00,
comm_seq=comm_seq&#64;entry=2, 
    num_buffers=1, data=0x7fffe7ffdcd0, num_bytes=0x7fffe7ffdcc0,
vp_caps=vp_caps&#64;entry=0x7fffe7ffdbd8, is_ref=is_ref&#64;entry=0x7fffe7ffdbdc, 
    refs=refs&#64;entry=0x7fffe7ffdbe0) at nvc0/nvc0_video_bsp.c:117
#3  0x00007ffff0721650 in nvc0_decoder_decode_bitstream
(decoder=0x7fffe004a000, video_target=0x7fffe001fe00, picture=0x0,
num_buffers=&lt;optimised out&gt;, 
    data=&lt;optimised out&gt;, num_bytes=&lt;optimised out&gt;) at nvc0/nvc0_video.c:48

Program received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7fffe7fff700 (LWP 854)]
nouveau_vp3_bsp (dec=dec&#64;entry=0x7fffe0068040, desc=desc&#64;entry=...,
target=target&#64;entry=0x7fffe0063110, comm_seq=comm_seq&#64;entry=2, 
    num_buffers=num_buffers&#64;entry=2, data=data&#64;entry=0x7fffe7ffe150,
num_bytes=num_bytes&#64;entry=0x7fffe7ffe140) at nouveau_vp3_video_bsp.c:270
270          caps = nouveau_vp3_fill_picparm_h264_bsp(dec, desc.h264, bsp);
(gdb) bt
#0  nouveau_vp3_bsp (dec=dec&#64;entry=0x7fffe0068040, desc=desc&#64;entry=...,
target=target&#64;entry=0x7fffe0063110, comm_seq=comm_seq&#64;entry=2, 
    num_buffers=num_buffers&#64;entry=2, data=data&#64;entry=0x7fffe7ffe150,
num_bytes=num_bytes&#64;entry=0x7fffe7ffe140) at nouveau_vp3_video_bsp.c:270
#1  0x00007ffff02a918e in nvc0_decoder_bsp (dec=dec&#64;entry=0x7fffe0068040,
desc=desc&#64;entry=..., target=target&#64;entry=0x7fffe0063110,
comm_seq=comm_seq&#64;entry=2, 
    num_buffers=2, data=0x7fffe7ffe150, num_bytes=0x7fffe7ffe140,
vp_caps=vp_caps&#64;entry=0x7fffe7ffe058, is_ref=is_ref&#64;entry=0x7fffe7ffe05c, 
    refs=refs&#64;entry=0x7fffe7ffe060) at nvc0/nvc0_video_bsp.c:117
#2  0x00007ffff02a9650 in nvc0_decoder_decode_bitstream
(decoder=0x7fffe0068040, video_target=0x7fffe0063110, picture=0x0,
num_buffers=&lt;optimised out&gt;, 
    data=&lt;optimised out&gt;, num_bytes=&lt;optimised out&gt;) at nvc0/nvc0_video.c:48

Worth to mention that gallium/vdpau succeeds to decode these 2 videos. Also
libva succeeds to decode video using libva's vdpau-driver on top of
gallium/vdpau.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1428595329.eA1cD00f1.7179--

--===============1641619889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1641619889==--
