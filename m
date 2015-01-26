From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84721] [NVC1] Nvidia Geforce GT 630 using nouveau on
 3.16 kernel. dangerous Fan speed
Date: Mon, 26 Jan 2015 23:13:43 +0000
Message-ID: <bug-84721-8800-ptcaMmYVqo@http.bugs.freedesktop.org/>
References: <bug-84721-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1679008503=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-84721-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1679008503==
Content-Type: multipart/alternative; boundary="1422314023.62D8c5.21112"; charset="UTF-8"


--1422314023.62D8c5.21112
Date: Mon, 26 Jan 2015 23:13:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84721

--- Comment #13 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Krzysztof Katowicz-Kowalewski from comment #12)
> @r004, I had the same problem with my system and I've made little
> investigation. Indeed the problem appeared in 3.15 and it's still there in
> latest 3.18 kernel. For the quick and easy work-around use kernel 3.14 or
> lower.

Identifying the commit that broke things between 3.14 and 3.15 would go a long
way to solving this issue.

git bisect start v3.15 v3.14 -- drivers/gpu/drm/nouveau

should limit the bisect to just nouveau.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422314023.62D8c5.21112
Date: Mon, 26 Jan 2015 23:13:43 +0000
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
   title="NEW - [NVC1] Nvidia Geforce GT 630 using nouveau on 3.16 kernel. dangerous Fan speed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84721#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC1] Nvidia Geforce GT 630 using nouveau on 3.16 kernel. dangerous Fan speed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84721">bug 84721</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Krzysztof Katowicz-Kowalewski from <a href="show_bug.cgi?id=84721#c12">comment #12</a>)
<span class="quote">&gt; &#64;r004, I had the same problem with my system and I've made little
&gt; investigation. Indeed the problem appeared in 3.15 and it's still there in
&gt; latest 3.18 kernel. For the quick and easy work-around use kernel 3.14 or
&gt; lower.</span >

Identifying the commit that broke things between 3.14 and 3.15 would go a long
way to solving this issue.

git bisect start v3.15 v3.14 -- drivers/gpu/drm/nouveau

should limit the bisect to just nouveau.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422314023.62D8c5.21112--

--===============1679008503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1679008503==--
