From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89730] NV50: LightDM GTK+ Greeter Background -
 inconsistent display
Date: Tue, 24 Mar 2015 18:56:25 +0000
Message-ID: <bug-89730-8800-M2PQvAZrfo@http.bugs.freedesktop.org/>
References: <bug-89730-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0926748264=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89730-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0926748264==
Content-Type: multipart/alternative; boundary="1427223385.82E71fCE1.25771"; charset="UTF-8"


--1427223385.82E71fCE1.25771
Date: Tue, 24 Mar 2015 18:56:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89730

--- Comment #7 from andrew p. <pan.pav.7c5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Some clarifications:
- Greeter is usual GTK3 application.
- No WM or compositor run in greeter session.
- Greeter creates one GtkWindow for each monitor.
- Greeter uses standard cairo functions to draw monitor's window background.

There are no "login" or "panel" windows - just child widgets inside fullscreen
window.
This grey color looks like default window color - just set
"background=#default" to see it.
So, the question - why gtk draw semi-transparent panel correctly (using parent
window background as base) and do not do it for "free" space.

Add "allow-debugging=true" option to lightdm-gtk-greeter.conf to get more
informative log.

Some questions:
1. What happened if background is color (#0f0)? I don't expect that there will
be any difference, just interesting.
2. Another gtk theme? Or empty "theme-name=".

I saw very similar bug some time ago - laptop with archlinux and catalyst. In
some cases gtk didn't draw whole windows except some widgets (text entries -
blinking cursor). But this bug is gone now.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427223385.82E71fCE1.25771
Date: Tue, 24 Mar 2015 18:56:25 +0000
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
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730">bug 89730</a>
              from <span class="vcard"><a class="email" href="mailto:pan.pav.7c5&#64;gmail.com" title="andrew p. &lt;pan.pav.7c5&#64;gmail.com&gt;"> <span class="fn">andrew p.</span></a>
</span></b>
        <pre>Some clarifications:
- Greeter is usual GTK3 application.
- No WM or compositor run in greeter session.
- Greeter creates one GtkWindow for each monitor.
- Greeter uses standard cairo functions to draw monitor's window background.

There are no &quot;login&quot; or &quot;panel&quot; windows - just child widgets inside fullscreen
window.
This grey color looks like default window color - just set
&quot;background=#default&quot; to see it.
So, the question - why gtk draw semi-transparent panel correctly (using parent
window background as base) and do not do it for &quot;free&quot; space.

Add &quot;allow-debugging=true&quot; option to lightdm-gtk-greeter.conf to get more
informative log.

Some questions:
1. What happened if background is color (#0f0)? I don't expect that there will
be any difference, just interesting.
2. Another gtk theme? Or empty &quot;theme-name=&quot;.

I saw very similar bug some time ago - laptop with archlinux and catalyst. In
some cases gtk didn't draw whole windows except some widgets (text entries -
blinking cursor). But this bug is gone now.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427223385.82E71fCE1.25771--

--===============0926748264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0926748264==--
