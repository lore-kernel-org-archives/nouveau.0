From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90363] [nv50] HW state is not reset correctly when
 using a new GL context
Date: Thu, 07 May 2015 18:25:01 +0000
Message-ID: <bug-90363-8800-9SKgnXkRBS@http.bugs.freedesktop.org/>
References: <bug-90363-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1313653288=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90363-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1313653288==
Content-Type: multipart/alternative; boundary="1431023101.A68e0.3602"; charset="UTF-8"


--1431023101.A68e0.3602
Date: Thu, 7 May 2015 18:25:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90363

--- Comment #2 from Matteo Bruni <matteo.mystral-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 115624
  --> https://bugs.freedesktop.org/attachment.cgi?id=115624&action=edit
Improved fix

The attached works for me. It's the patch from Ilia with an additional state
copy in nv50_create.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1431023101.A68e0.3602
Date: Thu, 7 May 2015 18:25:01 +0000
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
   title="NEW - [nv50] HW state is not reset correctly when using a new GL context"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90363#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [nv50] HW state is not reset correctly when using a new GL context"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90363">bug 90363</a>
              from <span class="vcard"><a class="email" href="mailto:matteo.mystral&#64;gmail.com" title="Matteo Bruni &lt;matteo.mystral&#64;gmail.com&gt;"> <span class="fn">Matteo Bruni</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=115624" name="attach_115624" title="Improved fix">attachment 115624</a> <a href="attachment.cgi?id=115624&amp;action=edit" title="Improved fix">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=90363&amp;attachment=115624'>[review]</a>
Improved fix

The attached works for me. It's the patch from Ilia with an additional state
copy in nv50_create.</pre>
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

--1431023101.A68e0.3602--

--===============1313653288==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1313653288==--
