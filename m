From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87715] [NV50] Changing resolution away from
 1680x1050 results in scattered display
Date: Sat, 03 Jan 2015 19:49:38 +0000
Message-ID: <bug-87715-8800-5hFnWzFerG@http.bugs.freedesktop.org/>
References: <bug-87715-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0093724328=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87715-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0093724328==
Content-Type: multipart/alternative; boundary="1420314578.23F1FAE1.808"; charset="UTF-8"


--1420314578.23F1FAE1.808
Date: Sat, 3 Jan 2015 19:49:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87715

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Bruno Wolff from comment #5)
> Is it worth testing this on mesa 10.5 at this time? 10.5 is in rawhide and
> the 3.19 kernel will probably be soon. I don't want to move the affected
> machine on to rawhide right now, but I could test a live image in the not
> too distant future.

The issue is almost definitely in the kernel. Potentially it's tickled by
xf86-video-nouveau. Mesa is almost definitely not connected.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1420314578.23F1FAE1.808
Date: Sat, 3 Jan 2015 19:49:38 +0000
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
   title="NEW - [NV50] Changing resolution away from 1680x1050 results in scattered display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87715#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV50] Changing resolution away from 1680x1050 results in scattered display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87715">bug 87715</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Bruno Wolff from <a href="show_bug.cgi?id=87715#c5">comment #5</a>)
<span class="quote">&gt; Is it worth testing this on mesa 10.5 at this time? 10.5 is in rawhide and
&gt; the 3.19 kernel will probably be soon. I don't want to move the affected
&gt; machine on to rawhide right now, but I could test a live image in the not
&gt; too distant future.</span >

The issue is almost definitely in the kernel. Potentially it's tickled by
xf86-video-nouveau. Mesa is almost definitely not connected.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420314578.23F1FAE1.808--

--===============0093724328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0093724328==--
