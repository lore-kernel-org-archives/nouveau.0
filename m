From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92892] [NVA8] KDE Plasma locks up: Nouveau reports
 error "resource sanity check" "unable to handle kernel paging request"
Date: Thu, 03 Dec 2015 20:52:43 +0000
Message-ID: <bug-92892-8800-ylGFNgQ2ez@http.bugs.freedesktop.org/>
References: <bug-92892-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0865884249=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92892-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0865884249==
Content-Type: multipart/alternative; boundary="1449175963.ee4DA141.764"; charset="UTF-8"


--1449175963.ee4DA141.764
Date: Thu, 3 Dec 2015 20:52:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92892

--- Comment #8 from doktor.yak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I have a very similar setup.
- OpenSUSE Tumbleweed
- Dell Laptop (E6510)
- NVIDIA Corporation GT218M [NVS 3100M]
- upgraded kernel to 4.3.0


And exactly the same symptoms
(down to the same call backtrace).


Thus, I can help testing driver fixes if needed.

Also @Volker Lukas:
- Where did you get the older still functioning copy (4.2.4 ?)
I would like download and have until the 4.3.0 kernel gets fixed, but all the
tumbleweed mirror seem to have deleted the older kernel RPMs and only have the
latest one.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1449175963.ee4DA141.764
Date: Thu, 3 Dec 2015 20:52:43 +0000
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
   title="NEW - [NVA8] KDE Plasma locks up: Nouveau reports error &quot;resource sanity check&quot; &quot;unable to handle kernel paging request&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92892#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA8] KDE Plasma locks up: Nouveau reports error &quot;resource sanity check&quot; &quot;unable to handle kernel paging request&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92892">bug 92892</a>
              from <span class="vcard"><a class="email" href="mailto:doktor.yak&#64;gmail.com" title="doktor.yak&#64;gmail.com">doktor.yak&#64;gmail.com</a>
</span></b>
        <pre>I have a very similar setup.
- OpenSUSE Tumbleweed
- Dell Laptop (E6510)
- NVIDIA Corporation GT218M [NVS 3100M]
- upgraded kernel to 4.3.0


And exactly the same symptoms
(down to the same call backtrace).


Thus, I can help testing driver fixes if needed.

Also &#64;Volker Lukas:
- Where did you get the older still functioning copy (4.2.4 ?)
I would like download and have until the 4.3.0 kernel gets fixed, but all the
tumbleweed mirror seem to have deleted the older kernel RPMs and only have the
latest one.</pre>
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

--1449175963.ee4DA141.764--

--===============0865884249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0865884249==--
