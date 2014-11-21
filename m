From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82118] nouveau tearing with xvideo
Date: Fri, 21 Nov 2014 11:54:24 +0000
Message-ID: <bug-82118-8800-zCXUFaDFbd@http.bugs.freedesktop.org/>
References: <bug-82118-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1104703224=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82118-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1104703224==
Content-Type: multipart/alternative; boundary="1416570863.FFf8FEa31.18354"; charset="UTF-8"


--1416570863.FFf8FEa31.18354
Date: Fri, 21 Nov 2014 11:54:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82118

--- Comment #2 from lameventanas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
(In reply to Ilia Mirkin from comment #1)
> I believe recent changes to the ddx and kernel have improved this. Please
> update to xf86-video-nouveau 1.0.11 and kernel 3.17.x and retest. GLXVBlank
> defaults to true now, I believe.
> 
> However it's at least a little odd that xvinfo is returning Adaptor #0:
> "Intel(R) Textured Video" -- nouveau returns different strings. Perhaps you
> ran xvinfo on the wrong screen?

Thanks, that is great news, but I'm having other problems with Xvideo (bug
51579), so it is hard to test at the moment (and I haven't updated to kernel
3.17.x yet).

Yes, the xvinfo is from the wrong screen, product of ssh + automatic x11
forwarding (I love that feature).

Here is the correct information, in case it helps:

X-Video Extension version 2.2
screen #0
  Adaptor #0: "Nouveau GeForce 8/9 Textured Video"
    number of ports: 32
    port base: 63
    operations supported: PutImage 
    supported visuals:
      depth 24, visualID 0x21
      depth 24, visualID 0x22
    number of attributes: 7
      "XV_SET_DEFAULTS" (range 0 to 0)
              client settable attribute
      "XV_SYNC_TO_VBLANK" (range 0 to 1)
              client settable attribute
              client gettable attribute (current value is 1)
      "XV_BRIGHTNESS" (range -1000 to 1000)
              client settable attribute
              client gettable attribute (current value is 0)
      "XV_CONTRAST" (range -1000 to 1000)
              client settable attribute
              client gettable attribute (current value is 0)
      "XV_SATURATION" (range -1000 to 1000)
              client settable attribute
              client gettable attribute (current value is 0)
      "XV_HUE" (range -1000 to 1000)
              client settable attribute
              client gettable attribute (current value is 0)
      "XV_ITURBT_709" (range 0 to 1)
              client settable attribute
              client gettable attribute (current value is 0)
    maximum XvImage size: 8192 x 8192
    Number of image formats: 4
      id: 0x32315659 (YV12)
        guid: 59563132-0000-0010-8000-00aa00389b71
        bits per pixel: 12
        number of planes: 3
        type: YUV (planar)
      id: 0x30323449 (I420)
        guid: 49343230-0000-0010-8000-00aa00389b71
        bits per pixel: 12
        number of planes: 3
        type: YUV (planar)
      id: 0x32595559 (YUY2)
        guid: 59555932-0000-0010-8000-00aa00389b71
        bits per pixel: 16
        number of planes: 1
        type: YUV (packed)
      id: 0x59565955 (UYVY)
        guid: 55595659-0000-0010-8000-00aa00389b71
        bits per pixel: 16
        number of planes: 1
        type: YUV (packed)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416570863.FFf8FEa31.18354
Date: Fri, 21 Nov 2014 11:54:23 +0000
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
   title="NEW - nouveau tearing with xvideo"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82118#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau tearing with xvideo"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82118">bug 82118</a>
              from <span class="vcard"><a class="email" href="mailto:lameventanas&#64;gmail.com" title="lameventanas&#64;gmail.com">lameventanas&#64;gmail.com</a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=82118#c1">comment #1</a>)
<span class="quote">&gt; I believe recent changes to the ddx and kernel have improved this. Please
&gt; update to xf86-video-nouveau 1.0.11 and kernel 3.17.x and retest. GLXVBlank
&gt; defaults to true now, I believe.
&gt; 
&gt; However it's at least a little odd that xvinfo is returning Adaptor #0:
&gt; &quot;Intel(R) Textured Video&quot; -- nouveau returns different strings. Perhaps you
&gt; ran xvinfo on the wrong screen?</span >

Thanks, that is great news, but I'm having other problems with Xvideo (<a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [NVA8] Xv shows black image on ION chipset"
   href="show_bug.cgi?id=51579">bug
51579</a>), so it is hard to test at the moment (and I haven't updated to kernel
3.17.x yet).

Yes, the xvinfo is from the wrong screen, product of ssh + automatic x11
forwarding (I love that feature).

Here is the correct information, in case it helps:

X-Video Extension version 2.2
screen #0
  Adaptor #0: &quot;Nouveau GeForce 8/9 Textured Video&quot;
    number of ports: 32
    port base: 63
    operations supported: PutImage 
    supported visuals:
      depth 24, visualID 0x21
      depth 24, visualID 0x22
    number of attributes: 7
      &quot;XV_SET_DEFAULTS&quot; (range 0 to 0)
              client settable attribute
      &quot;XV_SYNC_TO_VBLANK&quot; (range 0 to 1)
              client settable attribute
              client gettable attribute (current value is 1)
      &quot;XV_BRIGHTNESS&quot; (range -1000 to 1000)
              client settable attribute
              client gettable attribute (current value is 0)
      &quot;XV_CONTRAST&quot; (range -1000 to 1000)
              client settable attribute
              client gettable attribute (current value is 0)
      &quot;XV_SATURATION&quot; (range -1000 to 1000)
              client settable attribute
              client gettable attribute (current value is 0)
      &quot;XV_HUE&quot; (range -1000 to 1000)
              client settable attribute
              client gettable attribute (current value is 0)
      &quot;XV_ITURBT_709&quot; (range 0 to 1)
              client settable attribute
              client gettable attribute (current value is 0)
    maximum XvImage size: 8192 x 8192
    Number of image formats: 4
      id: 0x32315659 (YV12)
        guid: 59563132-0000-0010-8000-00aa00389b71
        bits per pixel: 12
        number of planes: 3
        type: YUV (planar)
      id: 0x30323449 (I420)
        guid: 49343230-0000-0010-8000-00aa00389b71
        bits per pixel: 12
        number of planes: 3
        type: YUV (planar)
      id: 0x32595559 (YUY2)
        guid: 59555932-0000-0010-8000-00aa00389b71
        bits per pixel: 16
        number of planes: 1
        type: YUV (packed)
      id: 0x59565955 (UYVY)
        guid: 55595659-0000-0010-8000-00aa00389b71
        bits per pixel: 16
        number of planes: 1
        type: YUV (packed)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416570863.FFf8FEa31.18354--

--===============1104703224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1104703224==--
