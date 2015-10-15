From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92438] Segfault in pushbuf_kref when running the
 android emulator (qemu) on nv50
Date: Thu, 15 Oct 2015 19:53:52 +0000
Message-ID: <bug-92438-8800-lgDjDg5IkC@http.bugs.freedesktop.org/>
References: <bug-92438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0054733328=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92438-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0054733328==
Content-Type: multipart/alternative; boundary="1444938831.AdBd1.31241"; charset="UTF-8"


--1444938831.AdBd1.31241
Date: Thu, 15 Oct 2015 19:53:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92438

--- Comment #14 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Gabriele Svelto from comment #13)
> Thanks for the info. I can reproduce this bug fairly easily so I can help
> diagnosing it, would a trace of the OpenGL calls help? This often happens
> after only a few seconds so it's not going to be a huge one.
> 
> BTW I'm not running a GPU from the Tesla family, this is a GeForce
> 9600GT/NV94.

NV94 is a tesla. Tesla is G80:MCP89 (aka nv50 family).

If you can make an apitrace that repros it for you consistently on replay
that'd be incredibly useful. However I suspect there's more to it and a plain
apitrace won't be able to repro the issue.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1444938831.AdBd1.31241
Date: Thu, 15 Oct 2015 19:53:51 +0000
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
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438">bug 92438</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Gabriele Svelto from <a href="show_bug.cgi?id=92438#c13">comment #13</a>)
<span class="quote">&gt; Thanks for the info. I can reproduce this bug fairly easily so I can help
&gt; diagnosing it, would a trace of the OpenGL calls help? This often happens
&gt; after only a few seconds so it's not going to be a huge one.
&gt; 
&gt; BTW I'm not running a GPU from the Tesla family, this is a GeForce
&gt; 9600GT/NV94.</span >

NV94 is a tesla. Tesla is G80:MCP89 (aka nv50 family).

If you can make an apitrace that repros it for you consistently on replay
that'd be incredibly useful. However I suspect there's more to it and a plain
apitrace won't be able to repro the issue.</pre>
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

--1444938831.AdBd1.31241--

--===============0054733328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0054733328==--
