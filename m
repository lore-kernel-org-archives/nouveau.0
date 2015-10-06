From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91319] Nouveau driver cannot extract FCODE ROM / DCB
 Block from OpenFirmware Device tree
Date: Tue, 06 Oct 2015 10:10:21 +0000
Message-ID: <bug-91319-8800-fkviw9Wqtv@http.bugs.freedesktop.org/>
References: <bug-91319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1780961678=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91319-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1780961678==
Content-Type: multipart/alternative; boundary="1444126220.5dbd1.18118"; charset="UTF-8"


--1444126220.5dbd1.18118
Date: Tue, 6 Oct 2015 10:10:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91319

--- Comment #13 from Peter Saisanas <psaisanas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I can confirm that the patch works with my config which is great news.

However, the patch does not apply cleanly to vanilla 4.3-rc4, it seems to
reject parts of the patch to shadowof.c.

After manually changing shadowof.c, i.e. the parts of the patch that was
rejected, compiled and hooray, it works!

Awesome, thanks imirkin!

Do you require any more info?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1444126220.5dbd1.18118
Date: Tue, 6 Oct 2015 10:10:20 +0000
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
   title="NEW - Nouveau driver cannot extract FCODE ROM / DCB Block from OpenFirmware Device tree"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91319#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver cannot extract FCODE ROM / DCB Block from OpenFirmware Device tree"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91319">bug 91319</a>
              from <span class="vcard"><a class="email" href="mailto:psaisanas&#64;gmail.com" title="Peter Saisanas &lt;psaisanas&#64;gmail.com&gt;"> <span class="fn">Peter Saisanas</span></a>
</span></b>
        <pre>I can confirm that the patch works with my config which is great news.

However, the patch does not apply cleanly to vanilla 4.3-rc4, it seems to
reject parts of the patch to shadowof.c.

After manually changing shadowof.c, i.e. the parts of the patch that was
rejected, compiled and hooray, it works!

Awesome, thanks imirkin!

Do you require any more info?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444126220.5dbd1.18118--

--===============1780961678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1780961678==--
