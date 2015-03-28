From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89679] [NV50] Portal/Half-Life 2 will not start
	(native Steam)
Date: Sat, 28 Mar 2015 04:07:34 +0000
Message-ID: <bug-89679-8800-zQfrGvammo@http.bugs.freedesktop.org/>
References: <bug-89679-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2095068819=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89679-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2095068819==
Content-Type: multipart/alternative; boundary="1427515654.621d0.23042"; charset="UTF-8"


--1427515654.621d0.23042
Date: Sat, 28 Mar 2015 04:07:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89679

--- Comment #6 from Nick Tenney <nick.tenney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Now that it's tomorrow (EST) and this apparently compiled in time, reverting
the commit excepting the query alloc space change resulted in a crash. Just for
kicks and giggles, I went back to master and changed the QUERY_ALLOC_SPACE back
to 128 and all was well. We have a winner.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1427515654.621d0.23042
Date: Sat, 28 Mar 2015 04:07:34 +0000
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
   title="NEW - [NV50] Portal/Half-Life 2 will not start (native Steam)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89679#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV50] Portal/Half-Life 2 will not start (native Steam)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89679">bug 89679</a>
              from <span class="vcard"><a class="email" href="mailto:nick.tenney&#64;gmail.com" title="Nick Tenney &lt;nick.tenney&#64;gmail.com&gt;"> <span class="fn">Nick Tenney</span></a>
</span></b>
        <pre>Now that it's tomorrow (EST) and this apparently compiled in time, reverting
the commit excepting the query alloc space change resulted in a crash. Just for
kicks and giggles, I went back to master and changed the QUERY_ALLOC_SPACE back
to 128 and all was well. We have a winner.</pre>
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

--1427515654.621d0.23042--

--===============2095068819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2095068819==--
