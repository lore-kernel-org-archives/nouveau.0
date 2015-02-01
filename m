From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88893] [NV46] GPU lockup with Quadro NVS 110M
Date: Sun, 01 Feb 2015 17:40:52 +0000
Message-ID: <bug-88893-8800-UCAMIM9F5k@http.bugs.freedesktop.org/>
References: <bug-88893-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0877649810=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88893-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0877649810==
Content-Type: multipart/alternative; boundary="1422812452.FA5b1Dd2.9826"; charset="UTF-8"


--1422812452.FA5b1Dd2.9826
Date: Sun, 1 Feb 2015 17:40:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88893

--- Comment #11 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Richard from comment #10)
> For the heck of it I tried an older kernel from F19, 3.14.27 and no
> different.
> 
> I haven't mentioned it before and I don't think it showed up in the logs but
> when I try to reboot after getting GPU lockup I also get errors like "failed
> to idle channel 0xcccc0000"

Hm, that's surprising if acceleration is disabled. Perhaps fb accel is breaking
things... try also adding nouveau.nofbaccel=1 . If it still happens, try
removing all traces of vdpau from your system (just removing libvdpau.so.1
should be enough).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422812452.FA5b1Dd2.9826
Date: Sun, 1 Feb 2015 17:40:52 +0000
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
   title="NEW - [NV46] GPU lockup with Quadro NVS 110M"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88893#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV46] GPU lockup with Quadro NVS 110M"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88893">bug 88893</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Richard from <a href="show_bug.cgi?id=88893#c10">comment #10</a>)
<span class="quote">&gt; For the heck of it I tried an older kernel from F19, 3.14.27 and no
&gt; different.
&gt; 
&gt; I haven't mentioned it before and I don't think it showed up in the logs but
&gt; when I try to reboot after getting GPU lockup I also get errors like &quot;failed
&gt; to idle channel 0xcccc0000&quot;</span >

Hm, that's surprising if acceleration is disabled. Perhaps fb accel is breaking
things... try also adding nouveau.nofbaccel=1 . If it still happens, try
removing all traces of vdpau from your system (just removing libvdpau.so.1
should be enough).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422812452.FA5b1Dd2.9826--

--===============0877649810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0877649810==--
