From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90567] Display freeze when starting League of
	Legends (Wine)
Date: Wed, 27 May 2015 15:08:20 +0000
Message-ID: <bug-90567-8800-grxZCvzzY3@http.bugs.freedesktop.org/>
References: <bug-90567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2083560959=="
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


--===============2083560959==
Content-Type: multipart/alternative; boundary="1432739300.BDDEA1.17133"; charset="UTF-8"


--1432739300.BDDEA1.17133
Date: Wed, 27 May 2015 15:08:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90567

--- Comment #21 from Detlev Casanova <detlev.casanova-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I haven't been able to reproduce the issue with a trace, I tried multiple ones.

I realized that when retracing, with verbose output, I get this in the end:

451252 @0 glEnable(cap = GL_BLEND) // incomplete
453956 @1 glFenceSync(condition = GL_SYNC_GPU_COMMANDS_COMPLETE, flags = 0) //
incomplete
apitrace: warning: caught signal 11
453956: error: caught an unhandled exception
glretrace+0x2a637c
/usr/lib/libpthread.so.0+0x1065f
glretrace+0x217db2
glretrace+0xf363
glretrace+0xb2d5
glretrace+0xb8eb
/usr/lib/libpthread.so.0+0x7353
/usr/lib/libc.so.6: clone+0x6c
?
apitrace: info: taking default action for signal 11
Erreur de segmentation (core dumped)

The last 2 calls seem incomplete (not completely traced by apitrace ?) and
then, glretrace crashes.

Is there a way to end apitrace32 to properly generate the end of the trace ?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432739300.BDDEA1.17133
Date: Wed, 27 May 2015 15:08:20 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90567#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Display freeze when starting League of Legends (Wine)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90567">bug 90567</a>
              from <span class="vcard"><a class="email" href="mailto:detlev.casanova&#64;gmail.com" title="Detlev Casanova &lt;detlev.casanova&#64;gmail.com&gt;"> <span class="fn">Detlev Casanova</span></a>
</span></b>
        <pre>I haven't been able to reproduce the issue with a trace, I tried multiple ones.

I realized that when retracing, with verbose output, I get this in the end:

451252 &#64;0 glEnable(cap = GL_BLEND) // incomplete
453956 &#64;1 glFenceSync(condition = GL_SYNC_GPU_COMMANDS_COMPLETE, flags = 0) //
incomplete
apitrace: warning: caught signal 11
453956: error: caught an unhandled exception
glretrace+0x2a637c
/usr/lib/libpthread.so.0+0x1065f
glretrace+0x217db2
glretrace+0xf363
glretrace+0xb2d5
glretrace+0xb8eb
/usr/lib/libpthread.so.0+0x7353
/usr/lib/libc.so.6: clone+0x6c
?
apitrace: info: taking default action for signal 11
Erreur de segmentation (core dumped)

The last 2 calls seem incomplete (not completely traced by apitrace ?) and
then, glretrace crashes.

Is there a way to end apitrace32 to properly generate the end of the trace ?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432739300.BDDEA1.17133--

--===============2083560959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2083560959==--
