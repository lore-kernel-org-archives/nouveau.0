From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91232] Torchlight 1&2 (in Wine): glitchy models when
 hardware skinning enabled
Date: Sun, 05 Jul 2015 20:57:32 +0000
Message-ID: <bug-91232-8800-dfwmtmoJB9@http.bugs.freedesktop.org/>
References: <bug-91232-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2063161790=="
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


--===============2063161790==
Content-Type: multipart/alternative; boundary="1436129852.53ee6b1.15695"; charset="UTF-8"


--1436129852.53ee6b1.15695
Date: Sun, 5 Jul 2015 20:57:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91232

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 116966
  --> https://bugs.freedesktop.org/attachment.cgi?id=116966&action=edit
init unknown values to (0, 0, 0, 1)

This fixes the table in Bloodrayne 2, I think. (Having some unrelated issues,
so not 100% sure.)

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1436129852.53ee6b1.15695
Date: Sun, 5 Jul 2015 20:57:32 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91232#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Torchlight 1&amp;2 (in Wine): glitchy models when hardware skinning enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91232">bug 91232</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=116966" name="attach_116966" title="init unknown values to (0, 0, 0, 1)">attachment 116966</a> <a href="attachment.cgi?id=116966&amp;action=edit" title="init unknown values to (0, 0, 0, 1)">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=91232&amp;attachment=116966'>[review]</a>
init unknown values to (0, 0, 0, 1)

This fixes the table in Bloodrayne 2, I think. (Having some unrelated issues,
so not 100% sure.)</pre>
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

--1436129852.53ee6b1.15695--

--===============2063161790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2063161790==--
