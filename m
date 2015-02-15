From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87819] [NVAC] EQ overflowing
Date: Sun, 15 Feb 2015 00:21:56 +0000
Message-ID: <bug-87819-8800-yRzohZDY14@http.bugs.freedesktop.org/>
References: <bug-87819-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1729589387=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87819-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1729589387==
Content-Type: multipart/alternative; boundary="1423959715.F0aCA1.6223"; charset="UTF-8"


--1423959715.F0aCA1.6223
Date: Sun, 15 Feb 2015 00:21:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87819

--- Comment #16 from Stuart Longland <stuartl-3e+Fe6x+Dsh6S/UX/emfpkB+6BGkLq7r@public.gmane.org> ---
Ahh right, I understood it was a fork of the kernel tree and so added it as a
remote in my git repository, pulled it in and tried to build it as such.

So I've now built kernel 3.19 (commit
bfa76d49576599a4b9f9b7a71f23d73d6dcff735).  I shall reboot and test with that
in its stock configuration.

Then if I get problems, I'll try out the above git tree, building the
nouveau.ko module out-of-tree, install it, do another reboot and see if the
problem persists.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1423959715.F0aCA1.6223
Date: Sun, 15 Feb 2015 00:21:55 +0000
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
   title="NEW - [NVAC] EQ overflowing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87819#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] EQ overflowing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87819">bug 87819</a>
              from <span class="vcard"><a class="email" href="mailto:stuartl&#64;longlandclan.yi.org" title="Stuart Longland &lt;stuartl&#64;longlandclan.yi.org&gt;"> <span class="fn">Stuart Longland</span></a>
</span></b>
        <pre>Ahh right, I understood it was a fork of the kernel tree and so added it as a
remote in my git repository, pulled it in and tried to build it as such.

So I've now built kernel 3.19 (commit
bfa76d49576599a4b9f9b7a71f23d73d6dcff735).  I shall reboot and test with that
in its stock configuration.

Then if I get problems, I'll try out the above git tree, building the
nouveau.ko module out-of-tree, install it, do another reboot and see if the
problem persists.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1423959715.F0aCA1.6223--

--===============1729589387==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1729589387==--
