From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93254] [NVA5] The Long Dark (game) is very slow
 because of "kernel rejected pushbuf" messages in log files
Date: Fri, 04 Dec 2015 22:06:20 +0000
Message-ID: <bug-93254-8800-Bhf0DI5Kev@http.bugs.freedesktop.org/>
References: <bug-93254-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1035920161=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93254-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1035920161==
Content-Type: multipart/alternative; boundary="1449266780.E05A1.29897"; charset="UTF-8"


--1449266780.E05A1.29897
Date: Fri, 4 Dec 2015 22:06:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93254

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Interesting... so this may actually be a legit situation of "gpu not processing
pushbufs fast enough" and we run out of IB space. For some reason each pushbuf
has a very small quantity of commands... oh, I see. It's just a ton of
small-ish indexed draws, each of which ends up going through
nouveau_pushbuf_data() which in turn causes a new IB slot to be used up.

We need to have some way to figure out how many IB slots are open... or
throttle pushbuf submission or... something.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1449266780.E05A1.29897
Date: Fri, 4 Dec 2015 22:06:20 +0000
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
   title="NEW - [NVA5] The Long Dark (game) is very slow because of &quot;kernel rejected pushbuf&quot; messages in log files"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93254#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA5] The Long Dark (game) is very slow because of &quot;kernel rejected pushbuf&quot; messages in log files"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93254">bug 93254</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Interesting... so this may actually be a legit situation of &quot;gpu not processing
pushbufs fast enough&quot; and we run out of IB space. For some reason each pushbuf
has a very small quantity of commands... oh, I see. It's just a ton of
small-ish indexed draws, each of which ends up going through
nouveau_pushbuf_data() which in turn causes a new IB slot to be used up.

We need to have some way to figure out how many IB slots are open... or
throttle pushbuf submission or... something.</pre>
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

--1449266780.E05A1.29897--

--===============1035920161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1035920161==--
