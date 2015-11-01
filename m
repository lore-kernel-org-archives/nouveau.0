From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90351] [Regression,
 bisected] Backlight of internal eDP display doesn't turn off any
 more (Dell XPS 17/GeForce GT 555M)
Date: Sun, 01 Nov 2015 22:22:29 +0000
Message-ID: <bug-90351-8800-jANVhrERMb@http.bugs.freedesktop.org/>
References: <bug-90351-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0955768723=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90351-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0955768723==
Content-Type: multipart/alternative; boundary="1446416548.18bB1.12211"; charset="UTF-8"


--1446416548.18bB1.12211
Date: Sun, 1 Nov 2015 22:22:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90351

--- Comment #1 from Erik van Pienbroek <erik-freedesktop-bugzilla-7hpmIAI+aCYpZwe9G04TCw@public.gmane.org> ---
This bug still exists on kernel 4.3.0-rc7.
The patch mentioned here still behaves the same as mentioned in the initial bug
report (backlight of internal display can be turned off, but externally
connected DP displays fail to be turned off)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446416548.18bB1.12211
Date: Sun, 1 Nov 2015 22:22:28 +0000
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
   title="NEW - [Regression, bisected] Backlight of internal eDP display doesn't turn off any more (Dell XPS 17/GeForce GT 555M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90351#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [Regression, bisected] Backlight of internal eDP display doesn't turn off any more (Dell XPS 17/GeForce GT 555M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90351">bug 90351</a>
              from <span class="vcard"><a class="email" href="mailto:erik-freedesktop-bugzilla&#64;vanpienbroek.nl" title="Erik van Pienbroek &lt;erik-freedesktop-bugzilla&#64;vanpienbroek.nl&gt;"> <span class="fn">Erik van Pienbroek</span></a>
</span></b>
        <pre>This bug still exists on kernel 4.3.0-rc7.
The patch mentioned here still behaves the same as mentioned in the initial bug
report (backlight of internal display can be turned off, but externally
connected DP displays fail to be turned off)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446416548.18bB1.12211--

--===============0955768723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0955768723==--
