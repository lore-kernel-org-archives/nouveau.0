From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86356] [nv50] Graphical glitches in dota2
Date: Sun, 16 Nov 2014 23:14:30 +0000
Message-ID: <bug-86356-8800-svNuNWf9Qa@http.bugs.freedesktop.org/>
References: <bug-86356-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0221859108=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86356-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0221859108==
Content-Type: multipart/alternative; boundary="1416179670.F37EA0.30228"; charset="UTF-8"


--1416179670.F37EA0.30228
Date: Sun, 16 Nov 2014 23:14:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86356

--- Comment #3 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
The following messages while replaying the trace are due to the trimming:

Mesa: User error: GL_INVALID_OPERATION in glDeleteShader
XX: glDebugOutputCallback: High severity API error 2, GL_INVALID_OPERATION in
glDeleteShader
0 XX glDeleteShader(shader = YY)

Running against debug mesa (./configure --enable-debug ...) does not trigger
any asserts or produce extra output to stderr/stdout.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416179670.F37EA0.30228
Date: Sun, 16 Nov 2014 23:14:30 +0000
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
   title="NEW - [nv50] Graphical glitches in dota2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86356#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [nv50] Graphical glitches in dota2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86356">bug 86356</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>The following messages while replaying the trace are due to the trimming:

Mesa: User error: GL_INVALID_OPERATION in glDeleteShader
XX: glDebugOutputCallback: High severity API error 2, GL_INVALID_OPERATION in
glDeleteShader
0 XX glDeleteShader(shader = YY)

Running against debug mesa (./configure --enable-debug ...) does not trigger
any asserts or produce extra output to stderr/stdout.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416179670.F37EA0.30228--

--===============0221859108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0221859108==--
