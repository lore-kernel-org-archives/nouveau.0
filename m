From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89969] vaDriverInit fails with gallium/nouveau driver
Date: Fri, 17 Jul 2015 23:08:26 +0000
Message-ID: <bug-89969-8800-3Isgrpv7AW@http.bugs.freedesktop.org/>
References: <bug-89969-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0049924379=="
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


--===============0049924379==
Content-Type: multipart/alternative; boundary="1437174506.BB30FbB2.29698"; charset="UTF-8"


--1437174506.BB30FbB2.29698
Date: Fri, 17 Jul 2015 23:08:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89969

--- Comment #8 from Julien Isorce <julien.isorce-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 117214
  --> https://bugs.freedesktop.org/attachment.cgi?id=117214&action=edit
WIP - nouveau: add support for chunk decoding


A: resize buffer in nvc0_decoder_bsp:
http://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/nvc0/nvc0_video_bsp.c#n73

B: memcpy of the data in nouveau_vp3_bsp:
http://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/nouveau_vp3_video_bsp.c#n294

For radeon driver it both happens in ruvd_decode_bitstream.

To compare radeon to nouveau:

struct ruvd_decoder.bs_buffers is an array of struct rvid_buffer that hold a
ref on struct r600_resource, aka pipe_resource.

struct nouveau_vp3_decoder.bsp_bo is an array of struct nouveau_bo (which comes
from libdrm/nouveau library)

So if I am right, in the function nvc0_decoder_decode_bitstream it should
resize the nouveau_bo buffers and store current data, i.e. A and B. 

So I made a patch that first splits nvc0_decoder_bsp to extract A and B into a
new function nvc0_decoder_bsp_next_chunk. The remaining part of
nvc0_decoder_bsp go to nvc0_decoder_bsp_end_frame.

I just realize the patch is missing the preserving part while resizing buffers
(equivalent of the memcpy in rvid_resize_buffer
http://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/radeon/radeon_video.c#n100)
that could explain why it is still not working.

But I wanted to know if I am on the right track or not ?

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1437174506.BB30FbB2.29698
Date: Fri, 17 Jul 2015 23:08:26 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89969#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - vaDriverInit fails with gallium/nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89969">bug 89969</a>
              from <span class="vcard"><a class="email" href="mailto:julien.isorce&#64;gmail.com" title="Julien Isorce &lt;julien.isorce&#64;gmail.com&gt;"> <span class="fn">Julien Isorce</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=117214" name="attach_117214" title="WIP - nouveau: add support for chunk decoding">attachment 117214</a> <a href="attachment.cgi?id=117214&amp;action=edit" title="WIP - nouveau: add support for chunk decoding">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=89969&amp;attachment=117214'>[review]</a>
WIP - nouveau: add support for chunk decoding


A: resize buffer in nvc0_decoder_bsp:
<a href="http://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/nvc0/nvc0_video_bsp.c#n73">http://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/nvc0/nvc0_video_bsp.c#n73</a>

B: memcpy of the data in nouveau_vp3_bsp:
<a href="http://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/nouveau_vp3_video_bsp.c#n294">http://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/nouveau_vp3_video_bsp.c#n294</a>

For radeon driver it both happens in ruvd_decode_bitstream.

To compare radeon to nouveau:

struct ruvd_decoder.bs_buffers is an array of struct rvid_buffer that hold a
ref on struct r600_resource, aka pipe_resource.

struct nouveau_vp3_decoder.bsp_bo is an array of struct nouveau_bo (which comes
from libdrm/nouveau library)

So if I am right, in the function nvc0_decoder_decode_bitstream it should
resize the nouveau_bo buffers and store current data, i.e. A and B. 

So I made a patch that first splits nvc0_decoder_bsp to extract A and B into a
new function nvc0_decoder_bsp_next_chunk. The remaining part of
nvc0_decoder_bsp go to nvc0_decoder_bsp_end_frame.

I just realize the patch is missing the preserving part while resizing buffers
(equivalent of the memcpy in rvid_resize_buffer
<a href="http://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/radeon/radeon_video.c#n100">http://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/radeon/radeon_video.c#n100</a>)
that could explain why it is still not working.

But I wanted to know if I am on the right track or not ?</pre>
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

--1437174506.BB30FbB2.29698--

--===============0049924379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0049924379==--
