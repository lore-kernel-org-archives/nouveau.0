From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86006] [NV84] Nvidia GeForce 8600 GT VDPAU h264
 hardware acceleration
Date: Fri, 07 Nov 2014 19:14:29 +0000
Message-ID: <bug-86006-8800-U9Gpy1Bh6A@http.bugs.freedesktop.org/>
References: <bug-86006-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0491856555=="
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


--===============0491856555==
Content-Type: multipart/alternative; boundary="1415387668.C5e2B4ab1.18860"; charset="UTF-8"


--1415387668.C5e2B4ab1.18860
Date: Fri, 7 Nov 2014 19:14:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86006

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Ilya Indigo from comment #6)
> Through mpv through VDPAU, played similarly. Through mpv through

Please double-check with mplayer -- not mplayer2, not mpv, not xine, not
gstreamer, not anything else... mplayer. http://mplayerhq.hu/

I highly suspect it'll be the same issues, but it's still good to know.

Assuming that the same issues persist, can you grab the first ~200 lines from
the output of

VDPAU_TRACE=255 mplayer -vo vdpau -vc ffh264vdpau foo.mkv

This should include full frame contents and settings being sent to vdpau.
Additionally, include the first, say, 100KB of the video file (double-check
first that it plays ok without vdpau and is still broken with vdpau) which
should make testing much easier.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1415387668.C5e2B4ab1.18860
Date: Fri, 7 Nov 2014 19:14:28 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86006#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV84] Nvidia GeForce 8600 GT VDPAU h264 hardware acceleration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86006">bug 86006</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Ilya Indigo from <a href="show_bug.cgi?id=86006#c6">comment #6</a>)
<span class="quote">&gt; Through mpv through VDPAU, played similarly. Through mpv through</span >

Please double-check with mplayer -- not mplayer2, not mpv, not xine, not
gstreamer, not anything else... mplayer. <a href="http://mplayerhq.hu/">http://mplayerhq.hu/</a>

I highly suspect it'll be the same issues, but it's still good to know.

Assuming that the same issues persist, can you grab the first ~200 lines from
the output of

VDPAU_TRACE=255 mplayer -vo vdpau -vc ffh264vdpau foo.mkv

This should include full frame contents and settings being sent to vdpau.
Additionally, include the first, say, 100KB of the video file (double-check
first that it plays ok without vdpau and is still broken with vdpau) which
should make testing much easier.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1415387668.C5e2B4ab1.18860--

--===============0491856555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0491856555==--
