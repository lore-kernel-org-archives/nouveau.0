From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90567] Display freeze when starting League of
	Legends (Wine)
Date: Sun, 21 Jun 2015 23:15:46 +0000
Message-ID: <bug-90567-8800-hdueHRSxcp@http.bugs.freedesktop.org/>
References: <bug-90567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1591128450=="
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


--===============1591128450==
Content-Type: multipart/alternative; boundary="1434928546.d4deC6f2.32639"; charset="UTF-8"


--1434928546.d4deC6f2.32639
Date: Sun, 21 Jun 2015 23:15:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90567

--- Comment #25 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Detlev Casanova from comment #21)
> I haven't been able to reproduce the issue with a trace, I tried multiple
> ones.
> 
> I realized that when retracing, with verbose output, I get this in the end:
> 
> 451252 @0 glEnable(cap = GL_BLEND) // incomplete
> 453956 @1 glFenceSync(condition = GL_SYNC_GPU_COMMANDS_COMPLETE, flags = 0)
> // incomplete

This is the same issue that supertuxkart 0.9 was having, it'd die in a
glFenceSync. I believe I tracked down the underlying issue and sent a patch to
fix it:

http://patchwork.freedesktop.org/patch/52425/

Please try applying that patch to your mesa build and see if it helps.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1434928546.d4deC6f2.32639
Date: Sun, 21 Jun 2015 23:15:46 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90567#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Display freeze when starting League of Legends (Wine)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90567">bug 90567</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Detlev Casanova from <a href="show_bug.cgi?id=90567#c21">comment #21</a>)
<span class="quote">&gt; I haven't been able to reproduce the issue with a trace, I tried multiple
&gt; ones.
&gt; 
&gt; I realized that when retracing, with verbose output, I get this in the end:
&gt; 
&gt; 451252 &#64;0 glEnable(cap = GL_BLEND) // incomplete
&gt; 453956 &#64;1 glFenceSync(condition = GL_SYNC_GPU_COMMANDS_COMPLETE, flags = 0)
&gt; // incomplete</span >

This is the same issue that supertuxkart 0.9 was having, it'd die in a
glFenceSync. I believe I tracked down the underlying issue and sent a patch to
fix it:

<a href="http://patchwork.freedesktop.org/patch/52425/">http://patchwork.freedesktop.org/patch/52425/</a>

Please try applying that patch to your mesa build and see if it helps.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1434928546.d4deC6f2.32639--

--===============1591128450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1591128450==--
