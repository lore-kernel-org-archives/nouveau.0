From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89842] Nvidia nouveau drivers hangs all gnome when
 opening the new legacy tray (and many other situations) in 3.16.0
Date: Mon, 11 May 2015 12:53:38 +0000
Message-ID: <bug-89842-8800-gqlpCII34P@http.bugs.freedesktop.org/>
References: <bug-89842-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1429486161=="
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


--===============1429486161==
Content-Type: multipart/alternative; boundary="1431348818.a6bAB455.9010"; charset="UTF-8"


--1431348818.a6bAB455.9010
Date: Mon, 11 May 2015 12:53:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89842

--- Comment #14 from Matthew Miller <mattdm-u0/72CSfwU0dnm+yROfE0A@public.gmane.org> ---
(In reply to Joe Verreau from comment #13)
> In closer review of the thread above I checked on downgrading libdrm from
> 2.4.60.  In my installation yum tells me I need to also downgrade
> libdrm-devel and apparently the downgrade version is 2.4.58 rather than
> 2.4.59.  Is that what you recommend?

Joe, are you on the Fedora 22 bet? If so, an update will be going out soon. You
can get it immediately from
https://admin.fedoraproject.org/updates/FEDORA-2015-7930/libdrm-2.4.61-3.fc22

This is version 2.4.61, which fixes the regression. If you're not on F22, I
expect updates will be coming soon. In the meantime, go ahead and downgrade to
whatever works.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431348818.a6bAB455.9010
Date: Mon, 11 May 2015 12:53:38 +0000
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
   title="NEW - Nvidia nouveau drivers hangs all gnome when opening the new legacy tray (and many other situations) in 3.16.0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89842#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nvidia nouveau drivers hangs all gnome when opening the new legacy tray (and many other situations) in 3.16.0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89842">bug 89842</a>
              from <span class="vcard"><a class="email" href="mailto:mattdm&#64;mattdm.org" title="Matthew Miller &lt;mattdm&#64;mattdm.org&gt;"> <span class="fn">Matthew Miller</span></a>
</span></b>
        <pre>(In reply to Joe Verreau from <a href="show_bug.cgi?id=89842#c13">comment #13</a>)
<span class="quote">&gt; In closer review of the thread above I checked on downgrading libdrm from
&gt; 2.4.60.  In my installation yum tells me I need to also downgrade
&gt; libdrm-devel and apparently the downgrade version is 2.4.58 rather than
&gt; 2.4.59.  Is that what you recommend?</span >

Joe, are you on the Fedora 22 bet? If so, an update will be going out soon. You
can get it immediately from
<a href="https://admin.fedoraproject.org/updates/FEDORA-2015-7930/libdrm-2.4.61-3.fc22">https://admin.fedoraproject.org/updates/FEDORA-2015-7930/libdrm-2.4.61-3.fc22</a>

This is version 2.4.61, which fixes the regression. If you're not on F22, I
expect updates will be coming soon. In the meantime, go ahead and downgrade to
whatever works.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431348818.a6bAB455.9010--

--===============1429486161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1429486161==--
