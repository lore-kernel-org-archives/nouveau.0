From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87361] [NV4C] GPU lock-up after booting to desktop
 in Fedora 20 & 21 (Nvidia Geforce 6100 IGP)
Date: Tue, 16 Dec 2014 23:26:32 +0000
Message-ID: <bug-87361-8800-ZTvYqQF99W@http.bugs.freedesktop.org/>
References: <bug-87361-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1712699949=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87361-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1712699949==
Content-Type: multipart/alternative; boundary="1418772391.03387f1.10201"; charset="UTF-8"


--1418772391.03387f1.10201
Date: Tue, 16 Dec 2014 23:26:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87361

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Actually disabling MSI may just be the easiest thing to do. A NV4E user (also
an IGP) also had issues. So few people have these devices, and MSI doesn't
really provide any serious advantages for them, and NVIDIA never made use of it
in their driver -- the hw could have bugs, or who knows what.

I sent a patch to disable, should hopefully be backported to various stable
kernels as well. [MSI support in nouveau was first enabled in kernel 3.13 IIRC]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418772391.03387f1.10201
Date: Tue, 16 Dec 2014 23:26:31 +0000
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
   title="NEW - [NV4C] GPU lock-up after booting to desktop in Fedora 20 &amp; 21 (Nvidia Geforce 6100 IGP)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87361#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV4C] GPU lock-up after booting to desktop in Fedora 20 &amp; 21 (Nvidia Geforce 6100 IGP)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87361">bug 87361</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Actually disabling MSI may just be the easiest thing to do. A NV4E user (also
an IGP) also had issues. So few people have these devices, and MSI doesn't
really provide any serious advantages for them, and NVIDIA never made use of it
in their driver -- the hw could have bugs, or who knows what.

I sent a patch to disable, should hopefully be backported to various stable
kernels as well. [MSI support in nouveau was first enabled in kernel 3.13 IIRC]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418772391.03387f1.10201--

--===============1712699949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1712699949==--
