From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89842] Nvidia nouveau drivers hangs all gnome when
 open the new legacy tray in 3.16.0
Date: Sun, 26 Apr 2015 16:44:29 +0000
Message-ID: <bug-89842-8800-o5EE4E3tzA@http.bugs.freedesktop.org/>
References: <bug-89842-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1192096081=="
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


--===============1192096081==
Content-Type: multipart/alternative; boundary="1430066669.d3D8b4.13062"; charset="UTF-8"


--1430066669.d3D8b4.13062
Date: Sun, 26 Apr 2015 16:44:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89842

--- Comment #7 from Sean Bogie <spbogie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
git bisect puts the first bad commit @
commit 5ea6f1c32628887c9df0c53bc8c199eb12633fec
Author: Maarten Lankhorst <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Date:   Thu Feb 26 11:54:03 2015 +0100

    nouveau: make nouveau importing global buffers completely thread-safe, with
tests
...


ArchLinux bug report (https://bugs.archlinux.org/task/44680) suggests an
additional reproduction method "when I move my mouse over VLC's seekbar and it
shows a small tooltip to show the time gnome-shell freezes".

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1430066669.d3D8b4.13062
Date: Sun, 26 Apr 2015 16:44:29 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89842#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nvidia nouveau drivers hangs all gnome when open the new legacy tray in 3.16.0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89842">bug 89842</a>
              from <span class="vcard"><a class="email" href="mailto:spbogie&#64;gmail.com" title="Sean Bogie &lt;spbogie&#64;gmail.com&gt;"> <span class="fn">Sean Bogie</span></a>
</span></b>
        <pre>git bisect puts the first bad commit &#64;
commit 5ea6f1c32628887c9df0c53bc8c199eb12633fec
Author: Maarten Lankhorst &lt;<a href="mailto:maarten.lankhorst&#64;ubuntu.com">maarten.lankhorst&#64;ubuntu.com</a>&gt;
Date:   Thu Feb 26 11:54:03 2015 +0100

    nouveau: make nouveau importing global buffers completely thread-safe, with
tests
...


ArchLinux bug report (<a href="https://bugs.archlinux.org/task/44680">https://bugs.archlinux.org/task/44680</a>) suggests an
additional reproduction method &quot;when I move my mouse over VLC's seekbar and it
shows a small tooltip to show the time gnome-shell freezes&quot;.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1430066669.d3D8b4.13062--

--===============1192096081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1192096081==--
