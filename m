From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90276] [NVE4] read fault error, bisected
Date: Thu, 22 Oct 2015 15:14:03 +0000
Message-ID: <bug-90276-8800-IHrvOqJIpN@http.bugs.freedesktop.org/>
References: <bug-90276-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1507124223=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90276-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1507124223==
Content-Type: multipart/alternative; boundary="1445526842.8eC1B61.27338"; charset="UTF-8"


--1445526842.8eC1B61.27338
Date: Thu, 22 Oct 2015 15:14:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90276

--- Comment #23 from Arthur Heymans <arthurphilippeheymans-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Using
linux 4.2.3
mesa 11.0.3
I still get frequent things like
 nouveau E[   PFIFO][0000:03:00.0] read fault at 0x0011990000
[UNSUPPORTED_KIND] from CE2/GR_CE on channel 0x007f121000 [unknown]
which freezes display.
So I would say nothing really changed.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1445526842.8eC1B61.27338
Date: Thu, 22 Oct 2015 15:14:02 +0000
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
   title="NEW - [NVE4] read fault error, bisected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90276#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] read fault error, bisected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90276">bug 90276</a>
              from <span class="vcard"><a class="email" href="mailto:arthurphilippeheymans&#64;gmail.com" title="Arthur Heymans &lt;arthurphilippeheymans&#64;gmail.com&gt;"> <span class="fn">Arthur Heymans</span></a>
</span></b>
        <pre>Using
linux 4.2.3
mesa 11.0.3
I still get frequent things like
 nouveau E[   PFIFO][0000:03:00.0] read fault at 0x0011990000
[UNSUPPORTED_KIND] from CE2/GR_CE on channel 0x007f121000 [unknown]
which freezes display.
So I would say nothing really changed.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445526842.8eC1B61.27338--

--===============1507124223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1507124223==--
