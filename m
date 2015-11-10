From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92893] NV34: XPresent compositor scrambled
Date: Tue, 10 Nov 2015 19:41:18 +0000
Message-ID: <bug-92893-8800-fN1ctIbcLD@http.bugs.freedesktop.org/>
References: <bug-92893-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1528025164=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92893-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1528025164==
Content-Type: multipart/alternative; boundary="1447184478.bBAAaC1.4609"; charset="UTF-8"


--1447184478.bBAAaC1.4609
Date: Tue, 10 Nov 2015 19:41:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92893

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to poma from comment #0)
> Created attachment 119551 [details]
> NV34 xf86-video-nouveau XPresent scramble
> 
> "enable dri3 support without glamor"
> http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=241e728
> 
> broke XPresent compositor on NV34.

Yeah that commit had a bunch of problems, many of which were subsequently
fixed. Do the issues still happen with git head? Or at least at commit
08ef36dc67 ?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447184478.bBAAaC1.4609
Date: Tue, 10 Nov 2015 19:41:18 +0000
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
   title="NEW - NV34: XPresent compositor scrambled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92893#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV34: XPresent compositor scrambled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92893">bug 92893</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to poma from <a href="show_bug.cgi?id=92893#c0">comment #0</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=119551" name="attach_119551" title="NV34 xf86-video-nouveau XPresent scramble">attachment 119551</a> <a href="attachment.cgi?id=119551&amp;action=edit" title="NV34 xf86-video-nouveau XPresent scramble">[details]</a></span>
&gt; NV34 xf86-video-nouveau XPresent scramble
&gt; 
&gt; &quot;enable dri3 support without glamor&quot;
&gt; <a href="http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=241e728">http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=241e728</a>
&gt; 
&gt; broke XPresent compositor on NV34.</span >

Yeah that commit had a bunch of problems, many of which were subsequently
fixed. Do the issues still happen with git head? Or at least at commit
08ef36dc67 ?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447184478.bBAAaC1.4609--

--===============1528025164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1528025164==--
