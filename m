From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82714] [G84] nouveau fails to properly initialize GPU
Date: Sat, 13 Dec 2014 12:39:02 +0000
Message-ID: <bug-82714-8800-KR3GBZKmXw@http.bugs.freedesktop.org/>
References: <bug-82714-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1732897656=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82714-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1732897656==
Content-Type: multipart/alternative; boundary="1418474341.7ce0401.3924"; charset="UTF-8"


--1418474341.7ce0401.3924
Date: Sat, 13 Dec 2014 12:39:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82714

--- Comment #4 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
(In reply to Bruno from comment #3)
> Are you testing on a system where the GeForce 8600 GTS is a secondary GPU
> and not initialized by VBIOS?

I wasn't, you're right. I'll plug my HD6870 along and see if I can debug this.
Does it only go wrong when launching kmscon, or is also the same with X or
Wayland?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418474341.7ce0401.3924
Date: Sat, 13 Dec 2014 12:39:01 +0000
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
          bz_status_REOPENED "
   title="REOPENED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714">bug 82714</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>(In reply to Bruno from <a href="show_bug.cgi?id=82714#c3">comment #3</a>)
<span class="quote">&gt; Are you testing on a system where the GeForce 8600 GTS is a secondary GPU
&gt; and not initialized by VBIOS?</span >

I wasn't, you're right. I'll plug my HD6870 along and see if I can debug this.
Does it only go wrong when launching kmscon, or is also the same with X or
Wayland?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418474341.7ce0401.3924--

--===============1732897656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1732897656==--
