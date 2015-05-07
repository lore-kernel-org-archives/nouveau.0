From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90363] [nv50] HW state is not reset correctly when
 using a new GL context
Date: Thu, 07 May 2015 16:51:46 +0000
Message-ID: <bug-90363-8800-Gwvq6bBS7W@http.bugs.freedesktop.org/>
References: <bug-90363-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2103846802=="
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


--===============2103846802==
Content-Type: multipart/alternative; boundary="1431017506.01520.15834"; charset="UTF-8"


--1431017506.01520.15834
Date: Thu, 7 May 2015 16:51:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90363

--- Comment #1 from Matteo Bruni <matteo.mystral-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 115623
  --> https://bugs.freedesktop.org/attachment.cgi?id=115623&action=edit
Ilia's attempted fix

I'm attaching Ilia's patch for this issue, from IRC. It doesn't work for me
(yet) but this should be more like the correct fix.

BTW, I can try to make a standalone, GL testcase for this bug. It might take a
while though.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1431017506.01520.15834
Date: Thu, 7 May 2015 16:51:46 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90363#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [nv50] HW state is not reset correctly when using a new GL context"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90363">bug 90363</a>
              from <span class="vcard"><a class="email" href="mailto:matteo.mystral&#64;gmail.com" title="Matteo Bruni &lt;matteo.mystral&#64;gmail.com&gt;"> <span class="fn">Matteo Bruni</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=115623" name="attach_115623" title="Ilia's attempted fix">attachment 115623</a> <a href="attachment.cgi?id=115623&amp;action=edit" title="Ilia's attempted fix">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=90363&amp;attachment=115623'>[review]</a>
Ilia's attempted fix

I'm attaching Ilia's patch for this issue, from IRC. It doesn't work for me
(yet) but this should be more like the correct fix.

BTW, I can try to make a standalone, GL testcase for this bug. It might take a
while though.</pre>
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

--1431017506.01520.15834--

--===============2103846802==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2103846802==--
