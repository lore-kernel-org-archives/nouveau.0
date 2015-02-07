From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78530] Memory corruption on Lenovo t440p with runpm
Date: Sat, 07 Feb 2015 13:15:08 +0000
Message-ID: <bug-78530-8800-3FAAAyOk8I@http.bugs.freedesktop.org/>
References: <bug-78530-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0733148292=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78530-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0733148292==
Content-Type: multipart/alternative; boundary="1423314908.e77B573.28077"; charset="UTF-8"


--1423314908.e77B573.28077
Date: Sat, 7 Feb 2015 13:15:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78530

--- Comment #21 from Nikolay Amiantov <nikoamia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
@doudou on Github managed to solve this problem[1][2] -- Nouveau can port the
same fix, I think.

[1]:
https://github.com/Bumblebee-Project/bbswitch/issues/78#issuecomment-67741841
[2]: https://github.com/Bumblebee-Project/bbswitch/pull/102

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1423314908.e77B573.28077
Date: Sat, 7 Feb 2015 13:15:08 +0000
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
          bz_status_REOPENED "
   title="REOPENED - Memory corruption on Lenovo t440p with runpm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78530#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - Memory corruption on Lenovo t440p with runpm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78530">bug 78530</a>
              from <span class="vcard"><a class="email" href="mailto:nikoamia&#64;gmail.com" title="Nikolay Amiantov &lt;nikoamia&#64;gmail.com&gt;"> <span class="fn">Nikolay Amiantov</span></a>
</span></b>
        <pre>&#64;doudou on Github managed to solve this problem[1][2] -- Nouveau can port the
same fix, I think.

[1]:
<a href="https://github.com/Bumblebee-Project/bbswitch/issues/78#issuecomment-67741841">https://github.com/Bumblebee-Project/bbswitch/issues/78#issuecomment-67741841</a>
[2]: <a href="https://github.com/Bumblebee-Project/bbswitch/pull/102">https://github.com/Bumblebee-Project/bbswitch/pull/102</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1423314908.e77B573.28077--

--===============0733148292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0733148292==--
