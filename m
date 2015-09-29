From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92013] [NVA0] 4.3-rc1 fan set to full speed after
 resume from suspend
Date: Tue, 29 Sep 2015 02:13:59 +0000
Message-ID: <bug-92013-8800-ghoN5yPJZC@http.bugs.freedesktop.org/>
References: <bug-92013-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0017209274=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92013-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0017209274==
Content-Type: multipart/alternative; boundary="1443492839.7cBbcdc12.22589"; charset="UTF-8"


--1443492839.7cBbcdc12.22589
Date: Tue, 29 Sep 2015 02:13:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92013

--- Comment #4 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I just pushed a fix[1] to my tree, and will get it into 4.3 before it's
released.

[1]
http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=89c6340107f41f8e273efb273c20b732d768aa41

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1443492839.7cBbcdc12.22589
Date: Tue, 29 Sep 2015 02:13:59 +0000
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
   title="NEW - [NVA0] 4.3-rc1 fan set to full speed after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92013#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA0] 4.3-rc1 fan set to full speed after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92013">bug 92013</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>I just pushed a fix[1] to my tree, and will get it into 4.3 before it's
released.

[1]
<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=89c6340107f41f8e273efb273c20b732d768aa41">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=89c6340107f41f8e273efb273c20b732d768aa41</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1443492839.7cBbcdc12.22589--

--===============0017209274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0017209274==--
