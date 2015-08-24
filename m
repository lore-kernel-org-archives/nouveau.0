From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91632] Assert in nouveau_pushbuf_data
Date: Mon, 24 Aug 2015 13:46:42 +0000
Message-ID: <bug-91632-8800-k0ZsZOIUp7@http.bugs.freedesktop.org/>
References: <bug-91632-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1223118181=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91632-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1223118181==
Content-Type: multipart/alternative; boundary="1440424002.37eB5821.5789"; charset="UTF-8"


--1440424002.37eB5821.5789
Date: Mon, 24 Aug 2015 13:46:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91632

--- Comment #2 from Allan Sandfeld <kde-7WRYCqIwvBxWk0Htik3J/w@public.gmane.org> ---
The original qtwebengine bug is at https://bugreports.qt.io/browse/QTBUG-41242

One interesting thing I discovered was that using the EGL/GLES mode instead of
GLX/GL solved the issue. I assume at your level it shouldn't be that different.
So it could be a difference in how EGL vs GLX acts.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1440424002.37eB5821.5789
Date: Mon, 24 Aug 2015 13:46:42 +0000
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
   title="NEW - Assert in nouveau_pushbuf_data"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91632#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Assert in nouveau_pushbuf_data"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91632">bug 91632</a>
              from <span class="vcard"><a class="email" href="mailto:kde&#64;carewolf.com" title="Allan Sandfeld &lt;kde&#64;carewolf.com&gt;"> <span class="fn">Allan Sandfeld</span></a>
</span></b>
        <pre>The original qtwebengine bug is at <a href="https://bugreports.qt.io/browse/QTBUG-41242">https://bugreports.qt.io/browse/QTBUG-41242</a>

One interesting thing I discovered was that using the EGL/GLES mode instead of
GLX/GL solved the issue. I assume at your level it shouldn't be that different.
So it could be a difference in how EGL vs GLX acts.</pre>
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

--1440424002.37eB5821.5789--

--===============1223118181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1223118181==--
