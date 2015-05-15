From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90276] [NVE6] screen freeze with PDISP errors,
	bisected
Date: Fri, 15 May 2015 10:23:53 +0000
Message-ID: <bug-90276-8800-9snf8rZPHK@http.bugs.freedesktop.org/>
References: <bug-90276-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1485426521=="
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


--===============1485426521==
Content-Type: multipart/alternative; boundary="1431685432.5D8d7d631.16081"; charset="UTF-8"


--1431685432.5D8d7d631.16081
Date: Fri, 15 May 2015 10:23:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90276

--- Comment #12 from Arthur Heymans <arthurphilippeheymans-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I can confirm that this fixes the PDISP errors!

But I still get the original error (screen freeze) while launching some games:

nouveau E[   PFIFO][0000:01:00.0] read fault at 0x000a940000 [PTE] from
CE2/GR_CE on channel 0x007f369000 [unknown]

Using
mesa 10.5.5-1
linux-git with this fix
libdrm 2.4.61-1
xf86-video-nouveau 1.0.11-3

Should I file a new bug for that issue?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431685432.5D8d7d631.16081
Date: Fri, 15 May 2015 10:23:52 +0000
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
   title="NEW - [NVE6] screen freeze with PDISP errors, bisected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90276#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] screen freeze with PDISP errors, bisected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90276">bug 90276</a>
              from <span class="vcard"><a class="email" href="mailto:arthurphilippeheymans&#64;gmail.com" title="Arthur Heymans &lt;arthurphilippeheymans&#64;gmail.com&gt;"> <span class="fn">Arthur Heymans</span></a>
</span></b>
        <pre>I can confirm that this fixes the PDISP errors!

But I still get the original error (screen freeze) while launching some games:

nouveau E[   PFIFO][0000:01:00.0] read fault at 0x000a940000 [PTE] from
CE2/GR_CE on channel 0x007f369000 [unknown]

Using
mesa 10.5.5-1
linux-git with this fix
libdrm 2.4.61-1
xf86-video-nouveau 1.0.11-3

Should I file a new bug for that issue?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431685432.5D8d7d631.16081--

--===============1485426521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1485426521==--
