From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89775] Grpahics card G72 [GeForce 7200 GS / 7300 SE]
 3d does not work
Date: Wed, 21 Oct 2015 12:46:29 +0000
Message-ID: <bug-89775-8800-91rUgXWLHl@http.bugs.freedesktop.org/>
References: <bug-89775-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0577634082=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89775-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0577634082==
Content-Type: multipart/alternative; boundary="1445431588.Addec1e1.1656"; charset="UTF-8"


--1445431588.Addec1e1.1656
Date: Wed, 21 Oct 2015 12:46:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89775

--- Comment #2 from russianneuromancer-k+OT61UuxXo@public.gmane.org ---
gdm graw just black screen and cursor with Linux 4.2, but installing Linux 4.3
or adding boot option nouveau.config=NvMSI=0 for Linux 4.2 solved this issue.

I not sure it's the same issue that elefat reported, just want to let
developers know that disabling MSI for this GPU solves this particular issue
with gdm (since it's resolved there is no point for me in registering new
report).

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1445431588.Addec1e1.1656
Date: Wed, 21 Oct 2015 12:46:28 +0000
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
   title="NEW - Grpahics card G72 [GeForce 7200 GS / 7300 SE] 3d does not work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89775#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Grpahics card G72 [GeForce 7200 GS / 7300 SE] 3d does not work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89775">bug 89775</a>
              from <span class="vcard"><a class="email" href="mailto:russianneuromancer&#64;ya.ru" title="russianneuromancer&#64;ya.ru">russianneuromancer&#64;ya.ru</a>
</span></b>
        <pre>gdm graw just black screen and cursor with Linux 4.2, but installing Linux 4.3
or adding boot option nouveau.config=NvMSI=0 for Linux 4.2 solved this issue.

I not sure it's the same issue that elefat reported, just want to let
developers know that disabling MSI for this GPU solves this particular issue
with gdm (since it's resolved there is no point for me in registering new
report).</pre>
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

--1445431588.Addec1e1.1656--

--===============0577634082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0577634082==--
