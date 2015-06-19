From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91025] nouveau fails to run with NV5 [Riva TNT2 /
	TNT2 Pro]
Date: Fri, 19 Jun 2015 15:21:37 +0000
Message-ID: <bug-91025-8800-rSmiM5zODV@http.bugs.freedesktop.org/>
References: <bug-91025-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1462085197=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91025-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1462085197==
Content-Type: multipart/alternative; boundary="1434727297.0d8e872.21064"; charset="UTF-8"


--1434727297.0d8e872.21064
Date: Fri, 19 Jun 2015 15:21:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91025

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to anonymissimus from comment #5)
> Sorry, I only know how to apply git c source code patches onto a git
> repository, not a Linux OS.

What is linux, but a git repository :) Anyways, if you're not comfortable
building your own kernel, I guess you'll have to wait until these patches hit
mainline and make it into pre-built kernels.

I didn't mark them for backporting since I didn't have a positive test result,
but if you can test a kernel once these make it upstream (for linux kernel 4.2
I'd guess), we can then mark it for backports.

I can also give you a modified vbios image that uses other opcodes to achieve
the same results if you like. You'd have to stick it in your initrd and add a
kernel parameter to read from it instead of from the GPU. Let me know if you're
interested.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1434727297.0d8e872.21064
Date: Fri, 19 Jun 2015 15:21:37 +0000
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
   title="NEW - nouveau fails to run with NV5 [Riva TNT2 / TNT2 Pro]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91025#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau fails to run with NV5 [Riva TNT2 / TNT2 Pro]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91025">bug 91025</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to anonymissimus from <a href="show_bug.cgi?id=91025#c5">comment #5</a>)
<span class="quote">&gt; Sorry, I only know how to apply git c source code patches onto a git
&gt; repository, not a Linux OS.</span >

What is linux, but a git repository :) Anyways, if you're not comfortable
building your own kernel, I guess you'll have to wait until these patches hit
mainline and make it into pre-built kernels.

I didn't mark them for backporting since I didn't have a positive test result,
but if you can test a kernel once these make it upstream (for linux kernel 4.2
I'd guess), we can then mark it for backports.

I can also give you a modified vbios image that uses other opcodes to achieve
the same results if you like. You'd have to stick it in your initrd and add a
kernel parameter to read from it instead of from the GPU. Let me know if you're
interested.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1434727297.0d8e872.21064--

--===============1462085197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1462085197==--
