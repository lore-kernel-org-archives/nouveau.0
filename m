From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86115] Suspend to RAM fails when using Nouveau
Date: Mon, 10 Nov 2014 15:58:10 +0000
Message-ID: <bug-86115-8800-wbzNbjbCU9@http.bugs.freedesktop.org/>
References: <bug-86115-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2137216648=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86115-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2137216648==
Content-Type: multipart/alternative; boundary="1415635090.5c1D3.2001"; charset="UTF-8"


--1415635090.5c1D3.2001
Date: Mon, 10 Nov 2014 15:58:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86115

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
There was a change which fixed fbcon acceleration after resume -- before it
effectively switched into software mode on resume, but that got fixed.
Unfortunately if the GPU is unhappy on resume, that means that the console also
hangs.

Specifically it was commit ecf24de071f4f6cea79ecef5d990794df5875ee1. Could you
test a few kernels to see whether it's the same issue you're seeing?

e.g. does 3.14 work while 3.15 fails? If so, can you do a bisect to confirm
(and if not, also do a bisect to figure out what broke it).

git bisect start v3.16 v3.13 -- drivers/gpu/drm/nouveau

should cover the whole range you mentioned (3.13 = good, 3.16 = bad).

Separately, could you attach a full dmesg after boot? That should answer a
number of basic questions about some of your setup's specifics. Additionally,
how is your monitor(s) connected?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1415635090.5c1D3.2001
Date: Mon, 10 Nov 2014 15:58:10 +0000
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
   title="NEW - Suspend to RAM fails when using Nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86115#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Suspend to RAM fails when using Nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86115">bug 86115</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>There was a change which fixed fbcon acceleration after resume -- before it
effectively switched into software mode on resume, but that got fixed.
Unfortunately if the GPU is unhappy on resume, that means that the console also
hangs.

Specifically it was commit ecf24de071f4f6cea79ecef5d990794df5875ee1. Could you
test a few kernels to see whether it's the same issue you're seeing?

e.g. does 3.14 work while 3.15 fails? If so, can you do a bisect to confirm
(and if not, also do a bisect to figure out what broke it).

git bisect start v3.16 v3.13 -- drivers/gpu/drm/nouveau

should cover the whole range you mentioned (3.13 = good, 3.16 = bad).

Separately, could you attach a full dmesg after boot? That should answer a
number of basic questions about some of your setup's specifics. Additionally,
how is your monitor(s) connected?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1415635090.5c1D3.2001--

--===============2137216648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2137216648==--
