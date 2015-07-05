From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91232] Torchlight 1&2 (in Wine): glitchy models when
 hardware skinning enabled
Date: Sun, 05 Jul 2015 17:57:11 +0000
Message-ID: <bug-91232-8800-BRgSlXn3Cu@http.bugs.freedesktop.org/>
References: <bug-91232-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1975699169=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91232-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1975699169==
Content-Type: multipart/alternative; boundary="1436119031.5Bfbcd1.31253"; charset="UTF-8"


--1436119031.5Bfbcd1.31253
Date: Sun, 5 Jul 2015 17:57:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91232

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 116960
  --> https://bugs.freedesktop.org/attachment.cgi?id=116960&action=edit
init unknown values to 0

As I suspected, getting nouveau to init these to 0 fixes the issue. But IMO the
glsl compiler is the one doing something dodgy here...

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1436119031.5Bfbcd1.31253
Date: Sun, 5 Jul 2015 17:57:11 +0000
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
   title="NEW - Torchlight 1&amp;2 (in Wine): glitchy models when hardware skinning enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91232#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Torchlight 1&amp;2 (in Wine): glitchy models when hardware skinning enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91232">bug 91232</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=116960" name="attach_116960" title="init unknown values to 0">attachment 116960</a> <a href="attachment.cgi?id=116960&amp;action=edit" title="init unknown values to 0">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=91232&amp;attachment=116960'>[review]</a>
init unknown values to 0

As I suspected, getting nouveau to init these to 0 fixes the issue. But IMO the
glsl compiler is the one doing something dodgy here...</pre>
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

--1436119031.5Bfbcd1.31253--

--===============1975699169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1975699169==--
