From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92556] System hangs at visiting WebGL site
Date: Thu, 29 Oct 2015 05:05:37 +0000
Message-ID: <bug-92556-8800-op17mmWxdT@http.bugs.freedesktop.org/>
References: <bug-92556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1601007144=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92556-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1601007144==
Content-Type: multipart/alternative; boundary="1446095137.cFeAc0.5031"; charset="UTF-8"


--1446095137.cFeAc0.5031
Date: Thu, 29 Oct 2015 05:05:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92556

--- Comment #3 from uxv <mrs.sub-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
The cause of the errors is Firefox' "layers.acceleration.force-enabled" config
parameter set to "true". When I set it to "false" I no more see any hang or
errors. 

But if it's set to "false", then tearing happens with smooth scrolling. Setting
the parameter to "true" avoids tearing, but hangs system on any WebGL site.

It's true for Mesa 10 and 11.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1446095137.cFeAc0.5031
Date: Thu, 29 Oct 2015 05:05:37 +0000
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
   title="NEW - System hangs at visiting WebGL site"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92556#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - System hangs at visiting WebGL site"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92556">bug 92556</a>
              from <span class="vcard"><a class="email" href="mailto:mrs.sub&#64;gmail.com" title="uxv &lt;mrs.sub&#64;gmail.com&gt;"> <span class="fn">uxv</span></a>
</span></b>
        <pre>The cause of the errors is Firefox' &quot;layers.acceleration.force-enabled&quot; config
parameter set to &quot;true&quot;. When I set it to &quot;false&quot; I no more see any hang or
errors. 

But if it's set to &quot;false&quot;, then tearing happens with smooth scrolling. Setting
the parameter to &quot;true&quot; avoids tearing, but hangs system on any WebGL site.

It's true for Mesa 10 and 11.</pre>
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

--1446095137.cFeAc0.5031--

--===============1601007144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1601007144==--
