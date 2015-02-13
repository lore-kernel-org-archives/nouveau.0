From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89113] NVA8 constantly flickers when clocked to
	lowest pstate
Date: Fri, 13 Feb 2015 22:53:01 +0000
Message-ID: <bug-89113-8800-kojAXrPwdC@http.bugs.freedesktop.org/>
References: <bug-89113-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0185033267=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89113-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0185033267==
Content-Type: multipart/alternative; boundary="1423867980.fFCbcAE1.19406"; charset="UTF-8"


--1423867980.fFCbcAE1.19406
Date: Fri, 13 Feb 2015 22:53:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89113

--- Comment #4 from C, Zhang <charleszhang77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Right. That makes a lot of sense; unplugging an external monitor fixes the
issue. I guess it's just a hardware limitation then. The blob does indeed avoid
03 with an extra monitor attached. Thanks for the help! That'd be another thing
to worry about if dynamic power scaling were ever implemented for nouveau then.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1423867980.fFCbcAE1.19406
Date: Fri, 13 Feb 2015 22:53:00 +0000
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
   title="NEW - NVA8 constantly flickers when clocked to lowest pstate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89113#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NVA8 constantly flickers when clocked to lowest pstate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89113">bug 89113</a>
              from <span class="vcard"><a class="email" href="mailto:charleszhang77&#64;gmail.com" title="C, Zhang &lt;charleszhang77&#64;gmail.com&gt;"> <span class="fn">C, Zhang</span></a>
</span></b>
        <pre>Right. That makes a lot of sense; unplugging an external monitor fixes the
issue. I guess it's just a hardware limitation then. The blob does indeed avoid
03 with an extra monitor attached. Thanks for the help! That'd be another thing
to worry about if dynamic power scaling were ever implemented for nouveau then.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1423867980.fFCbcAE1.19406--

--===============0185033267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0185033267==--
