From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90871] NV30: Xfwm4 use_compositing - garbled display
Date: Tue, 20 Oct 2015 19:35:46 +0000
Message-ID: <bug-90871-8800-fCLRvThHzZ@http.bugs.freedesktop.org/>
References: <bug-90871-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0865807485=="
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


--===============0865807485==
Content-Type: multipart/alternative; boundary="1445369746.3d8fc560.1254"; charset="UTF-8"


--1445369746.3d8fc560.1254
Date: Tue, 20 Oct 2015 19:35:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90871

--- Comment #47 from Olivier Fourdan <fourdan-eaOCjQ5FDoY@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #46)
> Just my incompetence

Mine, rather.

> glMatrixMode has to go *before* glPushMatrix, not
> after. Oops. Moving it up makes the program behave as expected, at least on
> intel/hsw.
> 
> Pretty sure it's what I said -- the test program doesn't do a glXMakeCurrent
> before calling gl functions, which means their output is invalid. Not an
> epoxy issue. Rearranging the test program's code to fix this is annoying
> though.

No it's not, if the test program is invalid, it ought to be fixed.

> I wonder if this is a real issue in xfwm code as well.

Yes, most likely. This code is still early beta in xfwm4. I'll try to fix it
and Poma will be able to test I guess.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1445369746.3d8fc560.1254
Date: Tue, 20 Oct 2015 19:35:46 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871#c47">Comment # 47</a>
              on <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871">bug 90871</a>
              from <span class="vcard"><a class="email" href="mailto:fourdan&#64;xfce.org" title="Olivier Fourdan &lt;fourdan&#64;xfce.org&gt;"> <span class="fn">Olivier Fourdan</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90871#c46">comment #46</a>)
<span class="quote">&gt; Just my incompetence</span >

Mine, rather.

<span class="quote">&gt; glMatrixMode has to go *before* glPushMatrix, not
&gt; after. Oops. Moving it up makes the program behave as expected, at least on
&gt; intel/hsw.
&gt; 
&gt; Pretty sure it's what I said -- the test program doesn't do a glXMakeCurrent
&gt; before calling gl functions, which means their output is invalid. Not an
&gt; epoxy issue. Rearranging the test program's code to fix this is annoying
&gt; though.</span >

No it's not, if the test program is invalid, it ought to be fixed.

<span class="quote">&gt; I wonder if this is a real issue in xfwm code as well.</span >

Yes, most likely. This code is still early beta in xfwm4. I'll try to fix it
and Poma will be able to test I guess.</pre>
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

--1445369746.3d8fc560.1254--

--===============0865807485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0865807485==--
