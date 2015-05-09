From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90350] [G96] Portal's portal are incorrectly rendered
Date: Sat, 09 May 2015 00:24:54 +0000
Message-ID: <bug-90350-8800-GdhUQKcazd@http.bugs.freedesktop.org/>
References: <bug-90350-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1518792260=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90350-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1518792260==
Content-Type: multipart/alternative; boundary="1431131093.D4750.22340"; charset="UTF-8"


--1431131093.D4750.22340
Date: Sat, 9 May 2015 00:24:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90350

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 115652
  --> https://bugs.freedesktop.org/attachment.cgi?id=115652&action=edit
saturate shader test

On each of your NV96 and NVAC, please run the attached test through
shader_runner. Also remove the "+ arg2" from the result computation and run it
again. I suspect that only NV96 + arg2 removed will fail.

[The results that *actually* test clamping are 16, 20, 28, and 36.]

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1431131093.D4750.22340
Date: Sat, 9 May 2015 00:24:53 +0000
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
   title="NEW - [G96] Portal's portal are incorrectly rendered"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90350#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [G96] Portal's portal are incorrectly rendered"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90350">bug 90350</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=115652" name="attach_115652" title="saturate shader test">attachment 115652</a> <a href="attachment.cgi?id=115652&amp;action=edit" title="saturate shader test">[details]</a></span>
saturate shader test

On each of your NV96 and NVAC, please run the attached test through
shader_runner. Also remove the &quot;+ arg2&quot; from the result computation and run it
again. I suspect that only NV96 + arg2 removed will fail.

[The results that *actually* test clamping are 16, 20, 28, and 36.]</pre>
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

--1431131093.D4750.22340--

--===============1518792260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1518792260==--
