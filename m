From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90567] Display freeze when starting League of
	Legends (Wine)
Date: Mon, 25 May 2015 20:31:09 +0000
Message-ID: <bug-90567-8800-KHWfYjMADl@http.bugs.freedesktop.org/>
References: <bug-90567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1253509396=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90567-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1253509396==
Content-Type: multipart/alternative; boundary="1432585869.2B3D2.28436"; charset="UTF-8"


--1432585869.2B3D2.28436
Date: Mon, 25 May 2015 20:31:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90567

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, well this is phenomenally bad then:

nouveau E[League of Legen[1565]] Unknown handle 0x00000017
nouveau E[League of Legen[1565]] validate_init
nouveau E[League of Legen[1565]] validate: -2

And in your earlier logs:

nouveau E[League of Legen[2046]] Unknown handle 0x0000020e
nouveau E[League of Legen[2046]] validate_init
nouveau E[League of Legen[2046]] validate: -2
nouveau E[League of Legen[2046]] multiple instances of buffer 3 on validation
list
nouveau E[League of Legen[2046]] validate_init
nouveau E[League of Legen[2046]] validate: -22

I guess the earlier log may have happened with 2.4.60 -- that one would trigger
the "multiple instances" error. Unknown handle is really really bad though.

Ben (or anyone)? I don't see how this can happen... Are we not holding on to
some buffer that we should be? Should pushbuf_refn take a ref on the bo?

Detlev, could you create an apitrace that reproduces the issue? I think that
could ease debugging. (https://github.com/apitrace/apitrace)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432585869.2B3D2.28436
Date: Mon, 25 May 2015 20:31:09 +0000
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
   title="NEW - Display freeze when starting League of Legends (Wine)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90567#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Display freeze when starting League of Legends (Wine)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90567">bug 90567</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, well this is phenomenally bad then:

nouveau E[League of Legen[1565]] Unknown handle 0x00000017
nouveau E[League of Legen[1565]] validate_init
nouveau E[League of Legen[1565]] validate: -2

And in your earlier logs:

nouveau E[League of Legen[2046]] Unknown handle 0x0000020e
nouveau E[League of Legen[2046]] validate_init
nouveau E[League of Legen[2046]] validate: -2
nouveau E[League of Legen[2046]] multiple instances of buffer 3 on validation
list
nouveau E[League of Legen[2046]] validate_init
nouveau E[League of Legen[2046]] validate: -22

I guess the earlier log may have happened with 2.4.60 -- that one would trigger
the &quot;multiple instances&quot; error. Unknown handle is really really bad though.

Ben (or anyone)? I don't see how this can happen... Are we not holding on to
some buffer that we should be? Should pushbuf_refn take a ref on the bo?

Detlev, could you create an apitrace that reproduces the issue? I think that
could ease debugging. (<a href="https://github.com/apitrace/apitrace">https://github.com/apitrace/apitrace</a>)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432585869.2B3D2.28436--

--===============1253509396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1253509396==--
