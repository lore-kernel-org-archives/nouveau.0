From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90871] NV30: Xfwm4 use_compositing - garbled display
Date: Tue, 20 Oct 2015 19:40:31 +0000
Message-ID: <bug-90871-8800-0oSiO5hEJ6@http.bugs.freedesktop.org/>
References: <bug-90871-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0655714060=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90871-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0655714060==
Content-Type: multipart/alternative; boundary="1445370031.f3Ff161.2659"; charset="UTF-8"


--1445370031.f3Ff161.2659
Date: Tue, 20 Oct 2015 19:40:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90871

--- Comment #48 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Olivier Fourdan from comment #47)
> (In reply to Ilia Mirkin from comment #46)
> > Pretty sure it's what I said -- the test program doesn't do a glXMakeCurrent
> > before calling gl functions, which means their output is invalid. Not an
> > epoxy issue. Rearranging the test program's code to fix this is annoying
> > though.
> 
> No it's not, if the test program is invalid, it ought to be fixed.
> 
> > I wonder if this is a real issue in xfwm code as well.
> 
> Yes, most likely. This code is still early beta in xfwm4. I'll try to fix it
> and Poma will be able to test I guess.

The main reason why it's annoying to fix in the test program is that you use
that knowledge for selecting fbconfigs... which you need to do before making a
context current. Now you could either (a) do a 2-step process whereby you first
see if the ext is there, and then go and select another config or (b) make the
assumption that rect support is an all-or-nothing thing -- either no configs
have it or they all do, so no need to check it when evaluating fbconfig
validity.

I'm moderately sure that'd be a valid assumption.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1445370031.f3Ff161.2659
Date: Tue, 20 Oct 2015 19:40:31 +0000
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
          bz_status_ASSIGNED "
   title="ASSIGNED - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871#c48">Comment # 48</a>
              on <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871">bug 90871</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Olivier Fourdan from <a href="show_bug.cgi?id=90871#c47">comment #47</a>)
<span class="quote">&gt; (In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90871#c46">comment #46</a>)
&gt; &gt; Pretty sure it's what I said -- the test program doesn't do a glXMakeCurrent
&gt; &gt; before calling gl functions, which means their output is invalid. Not an
&gt; &gt; epoxy issue. Rearranging the test program's code to fix this is annoying
&gt; &gt; though.
&gt; 
&gt; No it's not, if the test program is invalid, it ought to be fixed.
&gt; 
&gt; &gt; I wonder if this is a real issue in xfwm code as well.
&gt; 
&gt; Yes, most likely. This code is still early beta in xfwm4. I'll try to fix it
&gt; and Poma will be able to test I guess.</span >

The main reason why it's annoying to fix in the test program is that you use
that knowledge for selecting fbconfigs... which you need to do before making a
context current. Now you could either (a) do a 2-step process whereby you first
see if the ext is there, and then go and select another config or (b) make the
assumption that rect support is an all-or-nothing thing -- either no configs
have it or they all do, so no need to check it when evaluating fbconfig
validity.

I'm moderately sure that'd be a valid assumption.</pre>
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

--1445370031.f3Ff161.2659--

--===============0655714060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0655714060==--
