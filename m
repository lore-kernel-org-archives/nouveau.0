From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79912] Nouveau unuseable with 3 monitors and a
	geforce GTX 670
Date: Thu, 20 Nov 2014 20:32:28 +0000
Message-ID: <bug-79912-8800-ENNPJcj3K0@http.bugs.freedesktop.org/>
References: <bug-79912-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0946114282=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79912-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0946114282==
Content-Type: multipart/alternative; boundary="1416515548.DcCB7b4c1.24043"; charset="UTF-8"


--1416515548.DcCB7b4c1.24043
Date: Thu, 20 Nov 2014 20:32:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79912

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
It seems like there are a bunch of different and unrelated issues here. HDMI +
purple line has been fixed (in 3.18-rcX by commit
a522946174b5ae389af0856c422d865a63c70316). That warning is weird... feels like
perhaps you're running on a kernel with CMA enabled? If so, disable it.

Please test this out on 3.18-rc5 or later.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416515548.DcCB7b4c1.24043
Date: Thu, 20 Nov 2014 20:32:28 +0000
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
   title="NEW - Nouveau unuseable with 3 monitors and a geforce GTX 670"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79912#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau unuseable with 3 monitors and a geforce GTX 670"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79912">bug 79912</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>It seems like there are a bunch of different and unrelated issues here. HDMI +
purple line has been fixed (in 3.18-rcX by commit
a522946174b5ae389af0856c422d865a63c70316). That warning is weird... feels like
perhaps you're running on a kernel with CMA enabled? If so, disable it.

Please test this out on 3.18-rc5 or later.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416515548.DcCB7b4c1.24043--

--===============0946114282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0946114282==--
