From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89842] Nvidia nouveau drivers hangs all gnome when
 open the new legacy tray in 3.16.0
Date: Thu, 02 Apr 2015 16:19:48 +0000
Message-ID: <bug-89842-8800-r2PWyjeen3@http.bugs.freedesktop.org/>
References: <bug-89842-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2131043442=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89842-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2131043442==
Content-Type: multipart/alternative; boundary="1427991588.F8f1E2.9313"; charset="UTF-8"


--1427991588.F8f1E2.9313
Date: Thu, 2 Apr 2015 16:19:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89842

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Somehow gnome-shell is able to convince nouveau to do something very dumb. I
didn't even think this was possible... libdrm is supposed to de-dup these, no?

nouveau E[gnome-shell[1773]] multiple instances of buffer 215 on validation
list
nouveau E[gnome-shell[1773]] validate_init
nouveau E[gnome-shell[1773]] validate: -22

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427991588.F8f1E2.9313
Date: Thu, 2 Apr 2015 16:19:48 +0000
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
   title="NEW - Nvidia nouveau drivers hangs all gnome when open the new legacy tray in 3.16.0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89842#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nvidia nouveau drivers hangs all gnome when open the new legacy tray in 3.16.0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89842">bug 89842</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Somehow gnome-shell is able to convince nouveau to do something very dumb. I
didn't even think this was possible... libdrm is supposed to de-dup these, no?

nouveau E[gnome-shell[1773]] multiple instances of buffer 215 on validation
list
nouveau E[gnome-shell[1773]] validate_init
nouveau E[gnome-shell[1773]] validate: -22</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427991588.F8f1E2.9313--

--===============2131043442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2131043442==--
