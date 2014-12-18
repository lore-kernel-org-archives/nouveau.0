From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84101] [NV96] null deref in nouveau_i2c_acquire_pad,
 triggered by xcmddc
Date: Thu, 18 Dec 2014 18:12:02 +0000
Message-ID: <bug-84101-8800-mdY8dFmtx7@http.bugs.freedesktop.org/>
References: <bug-84101-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1807637670=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-84101-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1807637670==
Content-Type: multipart/alternative; boundary="1418926322.e31C34c1.13757"; charset="UTF-8"


--1418926322.e31C34c1.13757
Date: Thu, 18 Dec 2014 18:12:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84101

--- Comment #3 from danny_archer-97jfqw80gc6171pxa8y+qA@public.gmane.org ---
Created attachment 110997
  --> https://bugs.freedesktop.org/attachment.cgi?id=110997&action=edit
Another kernel log

I had another crash that seems to be caused by the same thing. Kernel version:
3.18.1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418926322.e31C34c1.13757
Date: Thu, 18 Dec 2014 18:12:02 +0000
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
   title="NEW - [NV96] null deref in nouveau_i2c_acquire_pad, triggered by xcmddc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84101#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] null deref in nouveau_i2c_acquire_pad, triggered by xcmddc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84101">bug 84101</a>
              from <span class="vcard"><a class="email" href="mailto:danny_archer&#64;fastmail.fm" title="danny_archer&#64;fastmail.fm">danny_archer&#64;fastmail.fm</a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=110997" name="attach_110997" title="Another kernel log">attachment 110997</a> <a href="attachment.cgi?id=110997&amp;action=edit" title="Another kernel log">[details]</a></span>
Another kernel log

I had another crash that seems to be caused by the same thing. Kernel version:
3.18.1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418926322.e31C34c1.13757--

--===============1807637670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1807637670==--
