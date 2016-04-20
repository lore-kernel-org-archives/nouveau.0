From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69882] [NVE6] GPU lockups
Date: Wed, 20 Apr 2016 03:33:38 +0000
Message-ID: <bug-69882-8800-LiJKbgNm6J@http.bugs.freedesktop.org/>
References: <bug-69882-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1285326101=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69882-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1285326101==
Content-Type: multipart/alternative; boundary="14611232184.4FBdF9AD.13942";
 charset="UTF-8"


--14611232184.4FBdF9AD.13942
Date: Wed, 20 Apr 2016 03:33:38 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=69882

--- Comment #21 from Lucas Ribeiro <lucasout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Just tried karolherbst nouveau reclocking tree:
https://github.com/karolherbst/nouveau/tree/stable_reclocking_kepler_v4

Using this module and reclocking to pstate 07 fixed the hangs I was having
before. Maybe this fixes 660 hangs too.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14611232184.4FBdF9AD.13942
Date: Wed, 20 Apr 2016 03:33:38 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [NVE6] GPU lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69882#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [NVE6] GPU lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69882">bug 69882</a>
              from <span class="vcard"><a class="email" href="mailto:lucasout&#64;gmail.com" title="Lucas Ribeiro &lt;lucasout&#64;gmail.com&gt;"> <span class="fn">Lucas Ribeiro</span></a>
</span></b>
        <pre>Just tried karolherbst nouveau reclocking tree:
<a href="https://github.com/karolherbst/nouveau/tree/stable_reclocking_kepler_v4">https://github.com/karolherbst/nouveau/tree/stable_reclocking_kepler_v4</a>

Using this module and reclocking to pstate 07 fixed the hangs I was having
before. Maybe this fixes 660 hangs too.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14611232184.4FBdF9AD.13942--

--===============1285326101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1285326101==--
