From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90932] gm107 font glitches with kernel 4.1rc
Date: Mon, 29 Jun 2015 08:41:01 +0000
Message-ID: <bug-90932-8800-joVtSucgQ6@http.bugs.freedesktop.org/>
References: <bug-90932-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1888766206=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90932-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1888766206==
Content-Type: multipart/alternative; boundary="1435567261.C1d246B1.23518"; charset="UTF-8"


--1435567261.C1d246B1.23518
Date: Mon, 29 Jun 2015 08:41:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90932

--- Comment #14 from Marcus Moeller <marcus.moeller-OI3hZJvNYWs@public.gmane.org> ---
Created attachment 116784
  --> https://bugs.freedesktop.org/attachment.cgi?id=116784&action=edit
modesetting driver with latest Xorg updates

Latest test with vmlinuz-4.1.0-1, updated xorg-x11-server-Xorg to 1.17.2-1 and
modesetting driver makes it even worse (though there is no high CPU load
anymore)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1435567261.C1d246B1.23518
Date: Mon, 29 Jun 2015 08:41:01 +0000
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
   title="NEW - gm107 font glitches with kernel 4.1rc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90932#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - gm107 font glitches with kernel 4.1rc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90932">bug 90932</a>
              from <span class="vcard"><a class="email" href="mailto:marcus.moeller&#64;gmx.ch" title="Marcus Moeller &lt;marcus.moeller&#64;gmx.ch&gt;"> <span class="fn">Marcus Moeller</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=116784" name="attach_116784" title="modesetting driver with latest Xorg updates">attachment 116784</a> <a href="attachment.cgi?id=116784&amp;action=edit" title="modesetting driver with latest Xorg updates">[details]</a></span>
modesetting driver with latest Xorg updates

Latest test with vmlinuz-4.1.0-1, updated xorg-x11-server-Xorg to 1.17.2-1 and
modesetting driver makes it even worse (though there is no high CPU load
anymore)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1435567261.C1d246B1.23518--

--===============1888766206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1888766206==--
