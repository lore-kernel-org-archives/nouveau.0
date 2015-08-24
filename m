From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91632] Assert in nouveau_pushbuf_data
Date: Mon, 24 Aug 2015 13:55:18 +0000
Message-ID: <bug-91632-8800-FuFfCfgF9j@http.bugs.freedesktop.org/>
References: <bug-91632-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1797299391=="
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


--===============1797299391==
Content-Type: multipart/alternative; boundary="1440424518.d2cF4f1.7457"; charset="UTF-8"


--1440424518.d2cF4f1.7457
Date: Mon, 24 Aug 2015 13:55:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91632

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Allan Sandfeld from comment #2)
> The original qtwebengine bug is at
> https://bugreports.qt.io/browse/QTBUG-41242
> 
> One interesting thing I discovered was that using the EGL/GLES mode instead
> of GLX/GL solved the issue. I assume at your level it shouldn't be that
> different. So it could be a difference in how EGL vs GLX acts.

The issue was happening for me with Unigine Heaven run with DRI3 + DRI_PRIME=1.
Then I started running it with vblank_mode=0 and all my problems disappeared. I
haven't checked whether removing vblank_mode=0 would cause the issues to
reappear. I was happy to blame it on the DRI3 boogeyman and moved on (I tend
not to have a good grasp on these types of issues in the first place...
normally I wouldn't touch DRI3 but it really makes nouveau dev quite a bit
easier with a primary non-nvidia adapter since I can load/unload nouveau/nvidia
at will and still have things display on my regular screen).

Not sure how vsync would cause the problems, but I was getting actual shader
traps reported in dmesg. Do you (or whoever is having the issue) have that as
well?

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1440424518.d2cF4f1.7457
Date: Mon, 24 Aug 2015 13:55:18 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91632#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Assert in nouveau_pushbuf_data"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91632">bug 91632</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Allan Sandfeld from <a href="show_bug.cgi?id=91632#c2">comment #2</a>)
<span class="quote">&gt; The original qtwebengine bug is at
&gt; <a href="https://bugreports.qt.io/browse/QTBUG-41242">https://bugreports.qt.io/browse/QTBUG-41242</a>
&gt; 
&gt; One interesting thing I discovered was that using the EGL/GLES mode instead
&gt; of GLX/GL solved the issue. I assume at your level it shouldn't be that
&gt; different. So it could be a difference in how EGL vs GLX acts.</span >

The issue was happening for me with Unigine Heaven run with DRI3 + DRI_PRIME=1.
Then I started running it with vblank_mode=0 and all my problems disappeared. I
haven't checked whether removing vblank_mode=0 would cause the issues to
reappear. I was happy to blame it on the DRI3 boogeyman and moved on (I tend
not to have a good grasp on these types of issues in the first place...
normally I wouldn't touch DRI3 but it really makes nouveau dev quite a bit
easier with a primary non-nvidia adapter since I can load/unload nouveau/nvidia
at will and still have things display on my regular screen).

Not sure how vsync would cause the problems, but I was getting actual shader
traps reported in dmesg. Do you (or whoever is having the issue) have that as
well?</pre>
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

--1440424518.d2cF4f1.7457--

--===============1797299391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1797299391==--
