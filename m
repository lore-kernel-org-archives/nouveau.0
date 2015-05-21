From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90306] Nouveau crashes with multiple monitors
Date: Thu, 21 May 2015 02:15:34 +0000
Message-ID: <bug-90306-8800-INLDcSXuOI@http.bugs.freedesktop.org/>
References: <bug-90306-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0141745941=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90306-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0141745941==
Content-Type: multipart/alternative; boundary="1432174534.fE883.3815"; charset="UTF-8"


--1432174534.fE883.3815
Date: Thu, 21 May 2015 02:15:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90306

--- Comment #6 from Lars Seipel <lars.seipel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Turns out the issue was introduced with:

commit 3740c82590d87714b41b8b48bd3062178cbe0b17
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Thu Mar 26 09:18:32 2015 +1000

    drm/nouveau/gr/gf100-: add symbolic names for classes

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

It seems that one of the added constants got hit by a typo. I sent
a patch to the list (CCed to Ben).

Now, that fixes things for me. The original report could still be an unrelated
problem.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432174534.fE883.3815
Date: Thu, 21 May 2015 02:15:34 +0000
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
   title="NEW - Nouveau crashes with multiple monitors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90306#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau crashes with multiple monitors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90306">bug 90306</a>
              from <span class="vcard"><a class="email" href="mailto:lars.seipel&#64;gmail.com" title="Lars Seipel &lt;lars.seipel&#64;gmail.com&gt;"> <span class="fn">Lars Seipel</span></a>
</span></b>
        <pre>Turns out the issue was introduced with:

commit 3740c82590d87714b41b8b48bd3062178cbe0b17
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Thu Mar 26 09:18:32 2015 +1000

    drm/nouveau/gr/gf100-: add symbolic names for classes

    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;

It seems that one of the added constants got hit by a typo. I sent
a patch to the list (CCed to Ben).

Now, that fixes things for me. The original report could still be an unrelated
problem.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432174534.fE883.3815--

--===============0141745941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0141745941==--
