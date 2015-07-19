From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90435] [NV46] moving 3D objects drawn static
Date: Sun, 19 Jul 2015 10:11:28 +0000
Message-ID: <bug-90435-8800-zWSt2p5HwN@http.bugs.freedesktop.org/>
References: <bug-90435-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1047986446=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90435-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1047986446==
Content-Type: multipart/alternative; boundary="1437300688.bE6d101.3599"; charset="UTF-8"


--1437300688.bE6d101.3599
Date: Sun, 19 Jul 2015 10:11:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90435

--- Comment #17 from Christoph Scholz <christoph.scholz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Great. Using kernel parameter nouveau.config=NvMSI=0 did the trick!

Thanks.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1437300688.bE6d101.3599
Date: Sun, 19 Jul 2015 10:11:28 +0000
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
   title="NEW - [NV46] moving 3D objects drawn static"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90435#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV46] moving 3D objects drawn static"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90435">bug 90435</a>
              from <span class="vcard"><a class="email" href="mailto:christoph.scholz&#64;gmail.com" title="Christoph Scholz &lt;christoph.scholz&#64;gmail.com&gt;"> <span class="fn">Christoph Scholz</span></a>
</span></b>
        <pre>Great. Using kernel parameter nouveau.config=NvMSI=0 did the trick!

Thanks.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1437300688.bE6d101.3599--

--===============1047986446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1047986446==--
