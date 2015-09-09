From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90276] [NVE4] read fault error, bisected
Date: Wed, 09 Sep 2015 10:46:44 +0000
Message-ID: <bug-90276-8800-oNHdEkVcmj@http.bugs.freedesktop.org/>
References: <bug-90276-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0597541228=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90276-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0597541228==
Content-Type: multipart/alternative; boundary="1441795604.E7e4e8bb2.10628"; charset="UTF-8"


--1441795604.E7e4e8bb2.10628
Date: Wed, 9 Sep 2015 10:46:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90276

--- Comment #20 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Arthur Heymans from comment #17)
> Reversing 3d9e3921f4d77bcaeea913c48b894d1208f0cb06 solves the problem.
> 
> Howerever c39f472e9f14e49a9bc091977ced0ec45fc00c57 changes some names so I
> don't know what to for recent kernels.

One possible issue (albeit unlikely) is that due to u32 maths the extra
multiplication (combined with << 8) is causing an overflow. Fwiw latest
upstream is explicitly using u64 typed variables.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1441795604.E7e4e8bb2.10628
Date: Wed, 9 Sep 2015 10:46:44 +0000
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
   title="NEW - [NVE4] read fault error, bisected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90276#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] read fault error, bisected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90276">bug 90276</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to Arthur Heymans from <a href="show_bug.cgi?id=90276#c17">comment #17</a>)
<span class="quote">&gt; Reversing 3d9e3921f4d77bcaeea913c48b894d1208f0cb06 solves the problem.
&gt; 
&gt; Howerever c39f472e9f14e49a9bc091977ced0ec45fc00c57 changes some names so I
&gt; don't know what to for recent kernels.</span >

One possible issue (albeit unlikely) is that due to u32 maths the extra
multiplication (combined with &lt;&lt; 8) is causing an overflow. Fwiw latest
upstream is explicitly using u64 typed variables.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1441795604.E7e4e8bb2.10628--

--===============0597541228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0597541228==--
