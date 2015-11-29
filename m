From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92077] nouveau graphics freeze when using KDE Plasma
 5; PGR engine fault
Date: Sun, 29 Nov 2015 19:16:12 +0000
Message-ID: <bug-92077-8800-ZyEITTW1hT@http.bugs.freedesktop.org/>
References: <bug-92077-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0584936830=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92077-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0584936830==
Content-Type: multipart/alternative; boundary="1448824572.1687c1.23370"; charset="UTF-8"


--1448824572.1687c1.23370
Date: Sun, 29 Nov 2015 19:16:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92077

--- Comment #15 from zoominee <gentoo-5cK0ikVjkE4@public.gmane.org> ---
For information, my package versions are now:
mesa 11.0.6
xorg-server 1.17.4
xf86-video-nouveau 1.0.11
linux kernel 4.1.12 self-compiled with the patch from Comment 11

The bug persists, it still occurs even when I do not replay the old apitrace.

Now it manifests as the whole screen freezing (display is static), except for
the mouse cursor, which I can still move around with the mouse. I cannot
perform any actions with the keyboard, and clicking the mouse doesn't do
anything either.

The error messages are the same as in Description, except for the times and
some of the memory addresses. The error messages now attribute the error to the
X process, not the plasmashell process as before.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1448824572.1687c1.23370
Date: Sun, 29 Nov 2015 19:16:12 +0000
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
   title="NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engine fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92077#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engine fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92077">bug 92077</a>
              from <span class="vcard"><a class="email" href="mailto:gentoo&#64;moin.fi" title="zoominee &lt;gentoo&#64;moin.fi&gt;"> <span class="fn">zoominee</span></a>
</span></b>
        <pre>For information, my package versions are now:
mesa 11.0.6
xorg-server 1.17.4
xf86-video-nouveau 1.0.11
linux kernel 4.1.12 self-compiled with the patch from <a href="show_bug.cgi?id=92077#c11">Comment 11</a>

The bug persists, it still occurs even when I do not replay the old apitrace.

Now it manifests as the whole screen freezing (display is static), except for
the mouse cursor, which I can still move around with the mouse. I cannot
perform any actions with the keyboard, and clicking the mouse doesn't do
anything either.

The error messages are the same as in Description, except for the times and
some of the memory addresses. The error messages now attribute the error to the
X process, not the plasmashell process as before.</pre>
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

--1448824572.1687c1.23370--

--===============0584936830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0584936830==--
