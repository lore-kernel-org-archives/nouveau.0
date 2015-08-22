From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91722] [NVE4] PGRAPH - grctx template channel unload
 timeout, failed to construct context, init failed, -16
Date: Sat, 22 Aug 2015 02:06:55 +0000
Message-ID: <bug-91722-8800-DLt5S7Lob5@http.bugs.freedesktop.org/>
References: <bug-91722-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1015208872=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91722-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1015208872==
Content-Type: multipart/alternative; boundary="1440209215.3b3f5F80.7373"; charset="UTF-8"


--1440209215.3b3f5F80.7373
Date: Sat, 22 Aug 2015 02:06:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91722

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to kyle.devir from comment #0)
> I have an Nvidia GeForce GTX 880M, which nouveau does not play with nicely.

Please try the following patch:
http://cgit.freedesktop.org/~darktama/nouveau/commit/?h=hack-gk106m&id=64b75967fe13499f12876ec10a31d9141e828714

Make sure to use nouveau.runpm=0

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1440209215.3b3f5F80.7373
Date: Sat, 22 Aug 2015 02:06:55 +0000
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
   title="NEW - [NVE4] PGRAPH - grctx template channel unload timeout, failed to construct context, init failed, -16"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91722#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] PGRAPH - grctx template channel unload timeout, failed to construct context, init failed, -16"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91722">bug 91722</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to kyle.devir from <a href="show_bug.cgi?id=91722#c0">comment #0</a>)
<span class="quote">&gt; I have an Nvidia GeForce GTX 880M, which nouveau does not play with nicely.</span >

Please try the following patch:
<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?h=hack-gk106m&amp;id=64b75967fe13499f12876ec10a31d9141e828714">http://cgit.freedesktop.org/~darktama/nouveau/commit/?h=hack-gk106m&amp;id=64b75967fe13499f12876ec10a31d9141e828714</a>

Make sure to use nouveau.runpm=0</pre>
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

--1440209215.3b3f5F80.7373--

--===============1015208872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1015208872==--
