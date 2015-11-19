From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93004] Guild Wars 2 crash on nouveau DX11 cards
Date: Thu, 19 Nov 2015 19:02:05 +0000
Message-ID: <bug-93004-8800-lMjXDDAmAD@http.bugs.freedesktop.org/>
References: <bug-93004-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1777704874=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93004-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1777704874==
Content-Type: multipart/alternative; boundary="1447959725.746BbAF0.6631"; charset="UTF-8"


--1447959725.746BbAF0.6631
Date: Thu, 19 Nov 2015 19:02:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93004

--- Comment #2 from Patrick Rudolph <siro-afHDD34IFkZrovVCs/uTlw@public.gmane.org> ---
Here's the trace (86MByte):
https://drive.google.com/file/d/0ByOfJQh38LRvSHk5YjgwdzVuRWc/view?usp=sharing

You need apitrace:
http://people.freedesktop.org/~jrfonseca/apitrace/

Run it using Gallium nine enabled wine:
wine ./apitrace-msvc/x86/bin/d3dretrace.exe Gw2.trace

To get the valgrind output I used:
valgrind -v --track-origins=yes --leak-check=full --trace-children=yes
--vex-iropt-register-updates=allregs-at-mem-access --workaround-gcc296-bugs=yes
wine ./apitrace-msvc/x86/bin/d3dretrace.exe Gw2.trace

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1447959725.746BbAF0.6631
Date: Thu, 19 Nov 2015 19:02:05 +0000
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
   title="NEW - Guild Wars 2 crash on nouveau DX11 cards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93004#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Guild Wars 2 crash on nouveau DX11 cards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93004">bug 93004</a>
              from <span class="vcard"><a class="email" href="mailto:siro&#64;das-labor.org" title="Patrick Rudolph &lt;siro&#64;das-labor.org&gt;"> <span class="fn">Patrick Rudolph</span></a>
</span></b>
        <pre>Here's the trace (86MByte):
<a href="https://drive.google.com/file/d/0ByOfJQh38LRvSHk5YjgwdzVuRWc/view?usp=sharing">https://drive.google.com/file/d/0ByOfJQh38LRvSHk5YjgwdzVuRWc/view?usp=sharing</a>

You need apitrace:
<a href="http://people.freedesktop.org/~jrfonseca/apitrace/">http://people.freedesktop.org/~jrfonseca/apitrace/</a>

Run it using Gallium nine enabled wine:
wine ./apitrace-msvc/x86/bin/d3dretrace.exe Gw2.trace

To get the valgrind output I used:
valgrind -v --track-origins=yes --leak-check=full --trace-children=yes
--vex-iropt-register-updates=allregs-at-mem-access --workaround-gcc296-bugs=yes
wine ./apitrace-msvc/x86/bin/d3dretrace.exe Gw2.trace</pre>
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

--1447959725.746BbAF0.6631--

--===============1777704874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1777704874==--
