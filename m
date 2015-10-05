From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81072] [NVC1] GPU lockup after "read fault at
 0x0000039000 [PAGE_NOT_PRESENT] from PCOPY0"
Date: Mon, 05 Oct 2015 11:36:30 +0000
Message-ID: <bug-81072-8800-ObMCwx1sIY@http.bugs.freedesktop.org/>
References: <bug-81072-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1088132222=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81072-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1088132222==
Content-Type: multipart/alternative; boundary="1444044990.6382857a2.4664"; charset="UTF-8"


--1444044990.6382857a2.4664
Date: Mon, 5 Oct 2015 11:36:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81072

--- Comment #5 from Patryk Zawadzki <patrys-k0Z414SquRyhPH1hqNUYSQ@public.gmane.org> ---
Just got some more:

nouveau E[Xorg[2265]] failed to idle channel 0xcccc0000 [Xorg[2265]]
nouveau E[Xorg[2265]] failed to idle channel 0xcccc0000 [Xorg[2265]]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1444044990.6382857a2.4664
Date: Mon, 5 Oct 2015 11:36:30 +0000
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
   title="NEW - [NVC1] GPU lockup after &quot;read fault at 0x0000039000 [PAGE_NOT_PRESENT] from PCOPY0&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81072#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC1] GPU lockup after &quot;read fault at 0x0000039000 [PAGE_NOT_PRESENT] from PCOPY0&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81072">bug 81072</a>
              from <span class="vcard"><a class="email" href="mailto:patrys&#64;pld-linux.org" title="Patryk Zawadzki &lt;patrys&#64;pld-linux.org&gt;"> <span class="fn">Patryk Zawadzki</span></a>
</span></b>
        <pre>Just got some more:

nouveau E[Xorg[2265]] failed to idle channel 0xcccc0000 [Xorg[2265]]
nouveau E[Xorg[2265]] failed to idle channel 0xcccc0000 [Xorg[2265]]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444044990.6382857a2.4664--

--===============1088132222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1088132222==--
