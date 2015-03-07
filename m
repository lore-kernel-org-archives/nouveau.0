From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89484] [NVD9] xrandr no output to DisplayPort with
 GeForce GT 520M.
Date: Sat, 07 Mar 2015 21:25:57 +0000
Message-ID: <bug-89484-8800-dLGaFt6W9g@http.bugs.freedesktop.org/>
References: <bug-89484-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0797843423=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89484-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0797843423==
Content-Type: multipart/alternative; boundary="1425763557.F6b7c31.21026"; charset="UTF-8"


--1425763557.F6b7c31.21026
Date: Sat, 7 Mar 2015 21:25:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89484

--- Comment #6 from Corey Bresnan <corey.quixote-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Corey Bresnan from comment #5)
> (In reply to Ilia Mirkin from comment #4)
> > [    5.212934] nouveau  [     DRM] TMDS table version 2.0
> > [    5.212935] nouveau  [     DRM] DCB version 4.0
> > [    5.212937] nouveau  [     DRM] DCB outp 00: 020003a6 0f220010
> > [    5.212938] nouveau  [     DRM] DCB outp 01: 02000362 00020010
> > [    5.212940] nouveau  [     DRM] DCB conn 00: 00101046
> > [    5.213611] nouveau E[   VBIOS][0000:01:00.0] 0x5c86[0]: script needs crtc
> > 
> > Something unexpected is going on in the VBIOS which breaks everything. Did
> > this work with older kernels?
> 
> At this point, I can only say for certain that it hasn't worked since
> 3.18.4-1-ARCH (currently using 3.18.6-1-ARCH); before that I was using
> Nvidia's proprietary drivers and have not tested with nouveau.

Downgraded to kernels 3.16.* and 3.17.* with the same results.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1425763557.F6b7c31.21026
Date: Sat, 7 Mar 2015 21:25:57 +0000
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
   title="NEW - [NVD9] xrandr no output to DisplayPort with GeForce GT 520M."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89484#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVD9] xrandr no output to DisplayPort with GeForce GT 520M."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89484">bug 89484</a>
              from <span class="vcard"><a class="email" href="mailto:corey.quixote&#64;gmail.com" title="Corey Bresnan &lt;corey.quixote&#64;gmail.com&gt;"> <span class="fn">Corey Bresnan</span></a>
</span></b>
        <pre>(In reply to Corey Bresnan from <a href="show_bug.cgi?id=89484#c5">comment #5</a>)
<span class="quote">&gt; (In reply to Ilia Mirkin from <a href="show_bug.cgi?id=89484#c4">comment #4</a>)
&gt; &gt; [    5.212934] nouveau  [     DRM] TMDS table version 2.0
&gt; &gt; [    5.212935] nouveau  [     DRM] DCB version 4.0
&gt; &gt; [    5.212937] nouveau  [     DRM] DCB outp 00: 020003a6 0f220010
&gt; &gt; [    5.212938] nouveau  [     DRM] DCB outp 01: 02000362 00020010
&gt; &gt; [    5.212940] nouveau  [     DRM] DCB conn 00: 00101046
&gt; &gt; [    5.213611] nouveau E[   VBIOS][0000:01:00.0] 0x5c86[0]: script needs crtc
&gt; &gt; 
&gt; &gt; Something unexpected is going on in the VBIOS which breaks everything. Did
&gt; &gt; this work with older kernels?
&gt; 
&gt; At this point, I can only say for certain that it hasn't worked since
&gt; 3.18.4-1-ARCH (currently using 3.18.6-1-ARCH); before that I was using
&gt; Nvidia's proprietary drivers and have not tested with nouveau.</span >

Downgraded to kernels 3.16.* and 3.17.* with the same results.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1425763557.F6b7c31.21026--

--===============0797843423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0797843423==--
