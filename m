From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91171] Space Rangers 2 (in Wine) shows only black
	screen
Date: Sat, 04 Jul 2015 20:55:45 +0000
Message-ID: <bug-91171-8800-XHfGnv7gwU@http.bugs.freedesktop.org/>
References: <bug-91171-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0895736549=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91171-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0895736549==
Content-Type: multipart/alternative; boundary="1436043344.73Ae88241.5881"; charset="UTF-8"


--1436043344.73Ae88241.5881
Date: Sat, 4 Jul 2015 20:55:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91171

--- Comment #5 from Henri Verbeet <hverbeet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #4)
> discarding the old stuff. [Looks like it does both glXCreateContext *and*
> glXCreateContextAttribsARB, and discards the first one of those.]
> 
Yeah... we first need a context to be able to call wglGetProcAddress(), to get
the wglCreateContextAttribsARB() pointer.

> I was looking over what flush did, and it does indeed explicitly flush the
> frontbuffer to screen if it's the current drawbuffer. [or something along
> those lines]. Tracing through that flow, it's entirely over my head...
> interactions between multiple modules of which I know nothing. I don't see
> anywhere where it'd be waiting for that blit to complete either, but that
> doesn't mean it's not there. Perhaps this should be a glFinish()?
> 
We don't wait for it to finish, but we shouldn't have to.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1436043344.73Ae88241.5881
Date: Sat, 4 Jul 2015 20:55:44 +0000
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
   title="NEW - Space Rangers 2 (in Wine) shows only black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91171#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Space Rangers 2 (in Wine) shows only black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91171">bug 91171</a>
              from <span class="vcard"><a class="email" href="mailto:hverbeet&#64;gmail.com" title="Henri Verbeet &lt;hverbeet&#64;gmail.com&gt;"> <span class="fn">Henri Verbeet</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=91171#c4">comment #4</a>)
<span class="quote">&gt; discarding the old stuff. [Looks like it does both glXCreateContext *and*
&gt; glXCreateContextAttribsARB, and discards the first one of those.]
&gt; </span >
Yeah... we first need a context to be able to call wglGetProcAddress(), to get
the wglCreateContextAttribsARB() pointer.

<span class="quote">&gt; I was looking over what flush did, and it does indeed explicitly flush the
&gt; frontbuffer to screen if it's the current drawbuffer. [or something along
&gt; those lines]. Tracing through that flow, it's entirely over my head...
&gt; interactions between multiple modules of which I know nothing. I don't see
&gt; anywhere where it'd be waiting for that blit to complete either, but that
&gt; doesn't mean it's not there. Perhaps this should be a glFinish()?
&gt; </span >
We don't wait for it to finish, but we shouldn't have to.</pre>
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

--1436043344.73Ae88241.5881--

--===============0895736549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0895736549==--
