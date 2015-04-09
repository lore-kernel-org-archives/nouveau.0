From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89969] vaDriverInit fails with gallium/nouveau driver
Date: Thu, 09 Apr 2015 17:13:33 +0000
Message-ID: <bug-89969-8800-vzF7IcyZKQ@http.bugs.freedesktop.org/>
References: <bug-89969-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0796826437=="
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


--===============0796826437==
Content-Type: multipart/alternative; boundary="1428599613.222672.24177"; charset="UTF-8"


--1428599613.222672.24177
Date: Thu, 9 Apr 2015 17:13:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89969

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Unlike public API's, gallium API's are fluid and not extremely well-defined.
They're primarily defined by the existing users, and secondarily by
documentation when those users disagree. Video API's are especially poorly
defined, as there are only 2 real driver implementations (radeon + nouveau),
and until recently, only st/xvmc and st/vdpau (and everyone except me hates
st/xvmc).

I believe that st/va had to make some changes to how functions were called and
what parameters they were allowed to have, but the updates were only made to
the radeon drivers. Unfortunately I don't know what those updates were. Emil
mentioned chunked decoding, but I don't really know what that is. Perhaps you
can look at the st/va enablement patches for radeon and see what all they had
to change.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1428599613.222672.24177
Date: Thu, 9 Apr 2015 17:13:33 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89969#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - vaDriverInit fails with gallium/nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89969">bug 89969</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Unlike public API's, gallium API's are fluid and not extremely well-defined.
They're primarily defined by the existing users, and secondarily by
documentation when those users disagree. Video API's are especially poorly
defined, as there are only 2 real driver implementations (radeon + nouveau),
and until recently, only st/xvmc and st/vdpau (and everyone except me hates
st/xvmc).

I believe that st/va had to make some changes to how functions were called and
what parameters they were allowed to have, but the updates were only made to
the radeon drivers. Unfortunately I don't know what those updates were. Emil
mentioned chunked decoding, but I don't really know what that is. Perhaps you
can look at the st/va enablement patches for radeon and see what all they had
to change.</pre>
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

--1428599613.222672.24177--

--===============0796826437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0796826437==--
