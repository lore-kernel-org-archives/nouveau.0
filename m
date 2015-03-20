From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89679] [NV50] Portal/Half-Life 2 will not start
	(native Steam)
Date: Fri, 20 Mar 2015 01:05:05 +0000
Message-ID: <bug-89679-8800-Fcj3dX7k6U@http.bugs.freedesktop.org/>
References: <bug-89679-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1963232342=="
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


--===============1963232342==
Content-Type: multipart/alternative; boundary="1426813504.6Ce80dE0.21437"; charset="UTF-8"


--1426813504.6Ce80dE0.21437
Date: Fri, 20 Mar 2015 01:05:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89679

--- Comment #2 from Nick Tenney <nick.tenney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I was bisecting and it *appeared* to go well. Apparently something else must be
involved as the last known good commit (worked during the bisect) no longer
worked when I restested. Digging further...

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1426813504.6Ce80dE0.21437
Date: Fri, 20 Mar 2015 01:05:04 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89679#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV50] Portal/Half-Life 2 will not start (native Steam)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89679">bug 89679</a>
              from <span class="vcard"><a class="email" href="mailto:nick.tenney&#64;gmail.com" title="Nick Tenney &lt;nick.tenney&#64;gmail.com&gt;"> <span class="fn">Nick Tenney</span></a>
</span></b>
        <pre>I was bisecting and it *appeared* to go well. Apparently something else must be
involved as the last known good commit (worked during the bisect) no longer
worked when I restested. Digging further...</pre>
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

--1426813504.6Ce80dE0.21437--

--===============1963232342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1963232342==--
