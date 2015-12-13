From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92515] Virtualbox with 3D acceleration and with
 installed vbox-additions crashes
Date: Sun, 13 Dec 2015 21:43:35 +0000
Message-ID: <bug-92515-8800-75acYyZCuK@http.bugs.freedesktop.org/>
References: <bug-92515-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0761917645=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92515-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0761917645==
Content-Type: multipart/alternative; boundary="1450043015.3e3DA1.22457"; charset="UTF-8"


--1450043015.3e3DA1.22457
Date: Sun, 13 Dec 2015 21:43:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92515

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I think it's been pretty much established that vbox uses opengl from multiple
threads at the same time. This is likely to lead to crashes with nouveau... no
amount of upgrading will fix this. [However it should be noted that 10.6 series
was end-of-lifed a long time ago... 11.0.x series is the supported one, with
11.1 coming out soon.]

Resolving this issue is very low on my todo list. Right now I'm aware of two
applications this affects -- vbox, a proprietary closed source app which
includes a kernel module that taints the kernel, and warsow 2.0, which just
came out, and includes a workaround to disable the multithreading. And this
wouldn't matter, but it's also a giant pain to fix in a way that doesn't break
perf for 99.9999% of the users.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1450043015.3e3DA1.22457
Date: Sun, 13 Dec 2015 21:43:35 +0000
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
   title="NEW - Virtualbox with 3D acceleration and with installed vbox-additions crashes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92515#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Virtualbox with 3D acceleration and with installed vbox-additions crashes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92515">bug 92515</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I think it's been pretty much established that vbox uses opengl from multiple
threads at the same time. This is likely to lead to crashes with nouveau... no
amount of upgrading will fix this. [However it should be noted that 10.6 series
was end-of-lifed a long time ago... 11.0.x series is the supported one, with
11.1 coming out soon.]

Resolving this issue is very low on my todo list. Right now I'm aware of two
applications this affects -- vbox, a proprietary closed source app which
includes a kernel module that taints the kernel, and warsow 2.0, which just
came out, and includes a workaround to disable the multithreading. And this
wouldn't matter, but it's also a giant pain to fix in a way that doesn't break
perf for 99.9999% of the users.</pre>
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

--1450043015.3e3DA1.22457--

--===============0761917645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0761917645==--
