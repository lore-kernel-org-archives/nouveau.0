From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80675] [NVAA] Nouveau KMS framebuffer hand-over:
 no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848) with 32MB
 graphics RAM, X11 ok
Date: Fri, 31 Oct 2014 20:49:51 +0000
Message-ID: <bug-80675-8800-OQx2RJcQMF@http.bugs.freedesktop.org/>
References: <bug-80675-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0008348822=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80675-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0008348822==
Content-Type: multipart/alternative; boundary="1414788590.4a87622.10125"; charset="UTF-8"


--1414788590.4a87622.10125
Date: Fri, 31 Oct 2014 20:49:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80675

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Walter Haidinger from comment #6)
> Update: I got my consoles back! :-)
> 
> Fix: Increased the ivdeo RAM set in the BIOS for the video card from 32MB to
> 64MB.
> I've also modified the title accordingly.
> 
> Before:
>  nouveau  [     DRM] VRAM: 32 MiB
> 
> Now:
>  nouveau  [     DRM] VRAM: 64 MiB
> 
> Before closing this bug, could you at least add a warning if someone sets
> the video memory below 64MB?

There shouldn't be any issue with using 32MB of vram. However I do think that
the scanout buffer has to be in VRAM... which should be *more* than sufficient
for 1024x768. Sounds like we're doing something very wrong somewhere...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414788590.4a87622.10125
Date: Fri, 31 Oct 2014 20:49:50 +0000
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
   title="NEW - [NVAA] Nouveau KMS framebuffer hand-over: no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848) with 32MB graphics RAM, X11 ok"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80675#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAA] Nouveau KMS framebuffer hand-over: no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848) with 32MB graphics RAM, X11 ok"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80675">bug 80675</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Walter Haidinger from <a href="show_bug.cgi?id=80675#c6">comment #6</a>)
<span class="quote">&gt; Update: I got my consoles back! :-)
&gt; 
&gt; Fix: Increased the ivdeo RAM set in the BIOS for the video card from 32MB to
&gt; 64MB.
&gt; I've also modified the title accordingly.
&gt; 
&gt; Before:
&gt;  nouveau  [     DRM] VRAM: 32 MiB
&gt; 
&gt; Now:
&gt;  nouveau  [     DRM] VRAM: 64 MiB
&gt; 
&gt; Before closing this bug, could you at least add a warning if someone sets
&gt; the video memory below 64MB?</span >

There shouldn't be any issue with using 32MB of vram. However I do think that
the scanout buffer has to be in VRAM... which should be *more* than sufficient
for 1024x768. Sounds like we're doing something very wrong somewhere...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414788590.4a87622.10125--

--===============0008348822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0008348822==--
