From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90348] Spilling failure of b96 merged value
Date: Tue, 26 May 2015 17:27:52 +0000
Message-ID: <bug-90348-8800-kYLaLuynWD@http.bugs.freedesktop.org/>
References: <bug-90348-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1256999593=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90348-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1256999593==
Content-Type: multipart/alternative; boundary="1432661272.ABAC0.22645"; charset="UTF-8"


--1432661272.ABAC0.22645
Date: Tue, 26 May 2015 17:27:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90348

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
This is a preliminary patch to resolve the issue that I wrote a while back:

https://github.com/imirkin/mesa/commit/25c74a866b5b555699520552caeccb1e8426d86b.patch

Note that it needs a counterpart unspill variant too (although that's not hit
by this shader). And ideally it'd be smart enough to go for a 64 + 32 store
rather than 3x 32, but that's probably too much -- split then re-merge. (Or can
split take unevenly sized defs? That seems like asking for trouble.)

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1432661272.ABAC0.22645
Date: Tue, 26 May 2015 17:27:52 +0000
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
   title="NEW - Spilling failure of b96 merged value"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90348#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Spilling failure of b96 merged value"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90348">bug 90348</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>This is a preliminary patch to resolve the issue that I wrote a while back:

<a href="https://github.com/imirkin/mesa/commit/25c74a866b5b555699520552caeccb1e8426d86b.patch">https://github.com/imirkin/mesa/commit/25c74a866b5b555699520552caeccb1e8426d86b.patch</a>

Note that it needs a counterpart unspill variant too (although that's not hit
by this shader). And ideally it'd be smart enough to go for a 64 + 32 store
rather than 3x 32, but that's probably too much -- split then re-merge. (Or can
split take unevenly sized defs? That seems like asking for trouble.)</pre>
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

--1432661272.ABAC0.22645--

--===============1256999593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1256999593==--
