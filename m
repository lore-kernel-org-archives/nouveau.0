From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90276] [NVE6] screen freeze with PDISP errors,
	bisected
Date: Sat, 16 May 2015 20:27:13 +0000
Message-ID: <bug-90276-8800-i0PBV1sKz2@http.bugs.freedesktop.org/>
References: <bug-90276-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0711941382=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90276-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0711941382==
Content-Type: multipart/alternative; boundary="1431808033.BaEadaC72.2166"; charset="UTF-8"


--1431808033.BaEadaC72.2166
Date: Sat, 16 May 2015 20:27:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90276

--- Comment #14 from Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
You can workaround it by applying the contents of commits: 
79456e1a10d5f4e708822287ed0e97af469bf49b
d979ab975ecdb336ed4da77a808be813a293b59e
d7bda18c9102b65078c132fd7d7ffd835058f021
13dfe1286d1ea1af4c9330b039c2316d0d92c484
at each step of the bisection.

Of course it's possible that those 5 patches (4 above and
3d9e3921f4d77bcaeea913c48b894d1208f0cb06) are the culprit, so first check
whether 3d9e3921f4d77bcaeea913c48b894d1208f0cb06 + above patches works.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431808033.BaEadaC72.2166
Date: Sat, 16 May 2015 20:27:13 +0000
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
   title="NEW - [NVE6] screen freeze with PDISP errors, bisected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90276#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] screen freeze with PDISP errors, bisected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90276">bug 90276</a>
              from <span class="vcard"><a class="email" href="mailto:marcin.slusarz&#64;gmail.com" title="Marcin Slusarz &lt;marcin.slusarz&#64;gmail.com&gt;"> <span class="fn">Marcin Slusarz</span></a>
</span></b>
        <pre>You can workaround it by applying the contents of commits: 
79456e1a10d5f4e708822287ed0e97af469bf49b
d979ab975ecdb336ed4da77a808be813a293b59e
d7bda18c9102b65078c132fd7d7ffd835058f021
13dfe1286d1ea1af4c9330b039c2316d0d92c484
at each step of the bisection.

Of course it's possible that those 5 patches (4 above and
3d9e3921f4d77bcaeea913c48b894d1208f0cb06) are the culprit, so first check
whether 3d9e3921f4d77bcaeea913c48b894d1208f0cb06 + above patches works.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431808033.BaEadaC72.2166--

--===============0711941382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0711941382==--
