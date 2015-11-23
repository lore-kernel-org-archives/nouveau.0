From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92438] Segfault in pushbuf_kref when running the
 android emulator (qemu) on nv50
Date: Mon, 23 Nov 2015 05:30:18 +0000
Message-ID: <bug-92438-8800-NHSfBFrK4g@http.bugs.freedesktop.org/>
References: <bug-92438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0202136358=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92438-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0202136358==
Content-Type: multipart/alternative; boundary="1448256618.C0f21.5856"; charset="UTF-8"


--1448256618.C0f21.5856
Date: Mon, 23 Nov 2015 05:30:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92438

--- Comment #31 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I've pushed out a couple of changes which might improve the situation. Please
give your software a shot and see if it stops crashing. This should definitely
resolve the glium issues... Gabriele, would ideally hear from you if they fix
anything on your end.

Specifically these two commits:

http://cgit.freedesktop.org/mesa/mesa/commit/?id=079f713754a9e5d7802b655d54320bd37f24fbfa
http://cgit.freedesktop.org/mesa/mesa/commit/?id=ad5f6b03e793b9390e3b9f3eca68bd43f9d809eb

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1448256618.C0f21.5856
Date: Mon, 23 Nov 2015 05:30:18 +0000
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
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438#c31">Comment # 31</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438">bug 92438</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I've pushed out a couple of changes which might improve the situation. Please
give your software a shot and see if it stops crashing. This should definitely
resolve the glium issues... Gabriele, would ideally hear from you if they fix
anything on your end.

Specifically these two commits:

<a href="http://cgit.freedesktop.org/mesa/mesa/commit/?id=079f713754a9e5d7802b655d54320bd37f24fbfa">http://cgit.freedesktop.org/mesa/mesa/commit/?id=079f713754a9e5d7802b655d54320bd37f24fbfa</a>
<a href="http://cgit.freedesktop.org/mesa/mesa/commit/?id=ad5f6b03e793b9390e3b9f3eca68bd43f9d809eb">http://cgit.freedesktop.org/mesa/mesa/commit/?id=ad5f6b03e793b9390e3b9f3eca68bd43f9d809eb</a></pre>
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

--1448256618.C0f21.5856--

--===============0202136358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0202136358==--
