From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87179] [NVE7] Warning while reenabling Optimus
	dedicated card
Date: Thu, 11 Dec 2014 00:08:22 +0000
Message-ID: <bug-87179-8800-Eq6vg32odz@http.bugs.freedesktop.org/>
References: <bug-87179-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0632737810=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87179-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0632737810==
Content-Type: multipart/alternative; boundary="1418256502.Aba4FdE1.19069"; charset="UTF-8"


--1418256502.Aba4FdE1.19069
Date: Thu, 11 Dec 2014 00:08:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87179

--- Comment #2 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 110702
  --> https://bugs.freedesktop.org/attachment.cgi?id=110702&action=edit
possible fix

Is this issue creproducible for you?  If so, please give the attached patch a
try and see if it helps!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418256502.Aba4FdE1.19069
Date: Thu, 11 Dec 2014 00:08:22 +0000
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
   title="NEW - [NVE7] Warning while reenabling Optimus dedicated card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87179#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] Warning while reenabling Optimus dedicated card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87179">bug 87179</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=110702" name="attach_110702" title="possible fix">attachment 110702</a> <a href="attachment.cgi?id=110702&amp;action=edit" title="possible fix">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=87179&amp;attachment=110702'>[review]</a>
possible fix

Is this issue creproducible for you?  If so, please give the attached patch a
try and see if it helps!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418256502.Aba4FdE1.19069--

--===============0632737810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0632737810==--
