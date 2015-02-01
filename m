From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88868] PowerPC e5500, kernel crash, GT520, GT610
Date: Sun, 01 Feb 2015 22:48:08 +0000
Message-ID: <bug-88868-8800-WFyrRss19O@http.bugs.freedesktop.org/>
References: <bug-88868-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0166132802=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88868-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0166132802==
Content-Type: multipart/alternative; boundary="1422830888.aEAc541.26900"; charset="UTF-8"


--1422830888.aEAc541.26900
Date: Sun, 1 Feb 2015 22:48:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88868

--- Comment #17 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Dmitriy from comment #16)
> Created attachment 113026 [details]
> incorrect image
> 
> Dear Ben and Ilia. Thank you for your answers.
> 
> There is no BIOS on our device. We have u-boot instead of it. But that patch
> from Ben is necessary even in kernel of the version 3.18.5.

Yeah, that's expected. The write needs to be posted to the card (not related to
BIOS POST), and the extra read forces that to happen.

> 
> The result of the monitor connection is in attach picture. The image is
> incorrect. I tested both video cards GT520 and GT610, the result is the same.

Welcome to the 1960's :) Neat picture...

> 
> There are some errors in the initialisation log.
> nouveau E[   PFIFO][0000:01:00.0] PBDMA0: (unknown bits 0x00004000)
> nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 1 [DRM] subc 0 mthd 0x0000 data
> 0x00000000
> .......
> nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
> nouveau 0000:01:00.0: registered panic notifier

The full errors would be useful, esp after userspace starts up.

> 
> Could the wrong work of video card  be the reason of these errors?  Or what
> else is to be tested to find out the cause of wrong function.

I suspect there are a few issues here. I'd start with turning acceleration off,
that may magically "fix" things (but obviously also lose any sort of accel).
You can use Option "NoAccel" "true" in xorg.conf or boot with
nouveau.noaccel=1.

I guess we may have to tell the card to byteswap stuff and/or use the proper
reversed formats (e.g. A2BGR10 vs RGB10A2) when reading from "GART" space...
and/or when uploading textures... that'd be annoying.

Oh also I'd advise against using mesa's 3d acceleration, at least initially --
there are some well-known byteswap issues there (which may or may not have been
fixed, the number of people using BE machines is vanishingly small).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422830888.aEAc541.26900
Date: Sun, 1 Feb 2015 22:48:08 +0000
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
   title="NEW - PowerPC e5500, kernel crash, GT520, GT610"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88868#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PowerPC e5500, kernel crash, GT520, GT610"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88868">bug 88868</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Dmitriy from <a href="show_bug.cgi?id=88868#c16">comment #16</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=113026" name="attach_113026" title="incorrect image">attachment 113026</a> <a href="attachment.cgi?id=113026&amp;action=edit" title="incorrect image">[details]</a></span>
&gt; incorrect image
&gt; 
&gt; Dear Ben and Ilia. Thank you for your answers.
&gt; 
&gt; There is no BIOS on our device. We have u-boot instead of it. But that patch
&gt; from Ben is necessary even in kernel of the version 3.18.5.</span >

Yeah, that's expected. The write needs to be posted to the card (not related to
BIOS POST), and the extra read forces that to happen.

<span class="quote">&gt; 
&gt; The result of the monitor connection is in attach picture. The image is
&gt; incorrect. I tested both video cards GT520 and GT610, the result is the same.</span >

Welcome to the 1960's :) Neat picture...

<span class="quote">&gt; 
&gt; There are some errors in the initialisation log.
&gt; nouveau E[   PFIFO][0000:01:00.0] PBDMA0: (unknown bits 0x00004000)
&gt; nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 1 [DRM] subc 0 mthd 0x0000 data
&gt; 0x00000000
&gt; .......
&gt; nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
&gt; nouveau 0000:01:00.0: registered panic notifier</span >

The full errors would be useful, esp after userspace starts up.

<span class="quote">&gt; 
&gt; Could the wrong work of video card  be the reason of these errors?  Or what
&gt; else is to be tested to find out the cause of wrong function.</span >

I suspect there are a few issues here. I'd start with turning acceleration off,
that may magically &quot;fix&quot; things (but obviously also lose any sort of accel).
You can use Option &quot;NoAccel&quot; &quot;true&quot; in xorg.conf or boot with
nouveau.noaccel=1.

I guess we may have to tell the card to byteswap stuff and/or use the proper
reversed formats (e.g. A2BGR10 vs RGB10A2) when reading from &quot;GART&quot; space...
and/or when uploading textures... that'd be annoying.

Oh also I'd advise against using mesa's 3d acceleration, at least initially --
there are some well-known byteswap issues there (which may or may not have been
fixed, the number of people using BE machines is vanishingly small).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422830888.aEAc541.26900--

--===============0166132802==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0166132802==--
