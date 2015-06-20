From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91037] desktop freezes shortly after boot with NV11
 [GeForce2 MX/MX 400]
Date: Sat, 20 Jun 2015 14:20:58 +0000
Message-ID: <bug-91037-8800-DZbcPC3H0N@http.bugs.freedesktop.org/>
References: <bug-91037-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1896186427=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91037-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1896186427==
Content-Type: multipart/alternative; boundary="1434810057.a4e61.12608"; charset="UTF-8"


--1434810057.a4e61.12608
Date: Sat, 20 Jun 2015 14:20:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91037

--- Comment #3 from anonymissimus-KvP5wT2u2U0@public.gmane.org ---
I tried to "momentarily fix" the problem by stopping/restarting X

/etc/init.d/lightdm stop
/etc/init.d/lightdm start

under debian; this only works for as long as the hang hasn't happened yet.
Trying it afterwards takes me to a black screen when starting X. However,
ctrl+alt+F1 did (I think) always work, with delay at least. Therefore, the hang
level according to http://nouveau.freedesktop.org/wiki/HangDiagnosis/ is 2.
Attaching the log from this session as well, supposedly the most useful one.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1434810057.a4e61.12608
Date: Sat, 20 Jun 2015 14:20:57 +0000
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
   title="NEW - desktop freezes shortly after boot with NV11 [GeForce2 MX/MX 400]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91037#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - desktop freezes shortly after boot with NV11 [GeForce2 MX/MX 400]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91037">bug 91037</a>
              from <span class="vcard"><a class="email" href="mailto:anonymissimus&#64;arcor.de" title="anonymissimus&#64;arcor.de">anonymissimus&#64;arcor.de</a>
</span></b>
        <pre>I tried to &quot;momentarily fix&quot; the problem by stopping/restarting X

/etc/init.d/lightdm stop
/etc/init.d/lightdm start

under debian; this only works for as long as the hang hasn't happened yet.
Trying it afterwards takes me to a black screen when starting X. However,
ctrl+alt+F1 did (I think) always work, with delay at least. Therefore, the hang
level according to <a href="http://nouveau.freedesktop.org/wiki/HangDiagnosis/">http://nouveau.freedesktop.org/wiki/HangDiagnosis/</a> is 2.
Attaching the log from this session as well, supposedly the most useful one.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1434810057.a4e61.12608--

--===============1896186427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1896186427==--
