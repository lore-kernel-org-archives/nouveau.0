From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Thu, 18 Jun 2015 18:13:35 +0000
Message-ID: <bug-90887-8800-G1QdNgovNv@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1811957339=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1811957339==
Content-Type: multipart/alternative; boundary="1434651215.33EA4d0.22834"; charset="UTF-8"


--1434651215.33EA4d0.22834
Date: Thu, 18 Jun 2015 18:13:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

--- Comment #10 from jr <j-r-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org> ---
I can confirm that your patch fixes all occurences of the problem I've found so
far (Lifeless Planet, Eidolon, Costume Quest with FXAA option, Two Worlds 2 sky
texture).

I slightly prefer keeping the edge order intact, as this feels 'more correct'
to me (which admittedly doesn't mean much) and allows to collapse the separate
loops into one (which is only a micro optimization preventing a little bit of
alloc/free). But since I cannot promise to have time to debug and fix problems
with my patch (though I expect to be reachable by this email address for the
forseeable future), it is best to choose the approach you feel most comfortable
with.

I'm happy either way and very grateful that you could spend time on this issue.
Thanks!

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1434651215.33EA4d0.22834
Date: Thu, 18 Jun 2015 18:13:35 +0000
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
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">bug 90887</a>
              from <span class="vcard"><a class="email" href="mailto:j-r&#64;online.de" title="jr &lt;j-r&#64;online.de&gt;"> <span class="fn">jr</span></a>
</span></b>
        <pre>I can confirm that your patch fixes all occurences of the problem I've found so
far (Lifeless Planet, Eidolon, Costume Quest with FXAA option, Two Worlds 2 sky
texture).

I slightly prefer keeping the edge order intact, as this feels 'more correct'
to me (which admittedly doesn't mean much) and allows to collapse the separate
loops into one (which is only a micro optimization preventing a little bit of
alloc/free). But since I cannot promise to have time to debug and fix problems
with my patch (though I expect to be reachable by this email address for the
forseeable future), it is best to choose the approach you feel most comfortable
with.

I'm happy either way and very grateful that you could spend time on this issue.
Thanks!</pre>
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

--1434651215.33EA4d0.22834--

--===============1811957339==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1811957339==--
