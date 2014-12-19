From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87469] [NV34] Invisible cursor on Xorg
Date: Fri, 19 Dec 2014 07:43:46 +0000
Message-ID: <bug-87469-8800-E5IeT8KOjo@http.bugs.freedesktop.org/>
References: <bug-87469-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2018014994=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87469-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2018014994==
Content-Type: multipart/alternative; boundary="1418975026.ce316D1.14219"; charset="UTF-8"


--1418975026.ce316D1.14219
Date: Fri, 19 Dec 2014 07:43:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87469

--- Comment #10 from Fernando Rodriguez <frodriguez.developer-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org> ---
Thanks for the help. I got the cursor back, and for the first time in this
machine, acceleration is also working. The solution was to compile
amd64-agpgart as a module (not built-in). So unless you consider that a bug you
can close this bug. Btw, it also requires and SMP enabled kernel for me even
though it's a single core. If I disable SMP it hangs as soon as the module is
loaded.

I also compiled the VIA AGP driver as a module (which according to the
documentation for CONFIG_AGP_AMD64 is required) but apparently I don't need it
cause it's not getting loaded.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418975026.ce316D1.14219
Date: Fri, 19 Dec 2014 07:43:46 +0000
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
   title="NEW - [NV34] Invisible cursor on Xorg"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87469#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV34] Invisible cursor on Xorg"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87469">bug 87469</a>
              from <span class="vcard"><a class="email" href="mailto:frodriguez.developer&#64;outlook.com" title="Fernando Rodriguez &lt;frodriguez.developer&#64;outlook.com&gt;"> <span class="fn">Fernando Rodriguez</span></a>
</span></b>
        <pre>Thanks for the help. I got the cursor back, and for the first time in this
machine, acceleration is also working. The solution was to compile
amd64-agpgart as a module (not built-in). So unless you consider that a bug you
can close this bug. Btw, it also requires and SMP enabled kernel for me even
though it's a single core. If I disable SMP it hangs as soon as the module is
loaded.

I also compiled the VIA AGP driver as a module (which according to the
documentation for CONFIG_AGP_AMD64 is required) but apparently I don't need it
cause it's not getting loaded.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418975026.ce316D1.14219--

--===============2018014994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2018014994==--
