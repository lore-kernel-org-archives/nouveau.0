From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93834] BUG: unable to handle kernel paging request
 at ffff88110fa7cffc
Date: Sat, 23 Jan 2016 20:03:38 +0000
Message-ID: <bug-93834-8800-RFfss4Dvh1@http.bugs.freedesktop.org/>
References: <bug-93834-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1802261244=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93834-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1802261244==
Content-Type: multipart/alternative; boundary="14535794181.AdA53e616.28559";
 charset="UTF-8"


--14535794181.AdA53e616.28559
Date: Sat, 23 Jan 2016 20:03:38 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93834

--- Comment #1 from Vladimir Panteleev <freedesktop-xEfZ0fjVPPX2SC1gVPJUZ6xOck334EZe@public.gmane.org> ---
The problem seemingly disappeared after a power cycle. Worth noting that I had
loaded the nvidia binary blob before uninstalling, rebooting, and encountering
the nouveau oops. Repeated reboots persisted the fault; the power cycle seemed
to have cleared it.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14535794181.AdA53e616.28559
Date: Sat, 23 Jan 2016 20:03:38 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - BUG: unable to handle kernel paging request at ffff88110fa7cffc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93834#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - BUG: unable to handle kernel paging request at ffff88110fa7cffc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93834">bug 93834</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop&#64;thecybershadow.net" title="Vladimir Panteleev &lt;freedesktop&#64;thecybershadow.net&gt;"> <span class="fn">Vladimir Panteleev</span></a>
</span></b>
        <pre>The problem seemingly disappeared after a power cycle. Worth noting that I had
loaded the nvidia binary blob before uninstalling, rebooting, and encountering
the nouveau oops. Repeated reboots persisted the fault; the power cycle seemed
to have cleared it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14535794181.AdA53e616.28559--

--===============1802261244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1802261244==--
