From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86115] Suspend to RAM fails when using Nouveau
Date: Mon, 10 Nov 2014 15:45:19 +0000
Message-ID: <bug-86115-8800-P3bDaC6DCe@http.bugs.freedesktop.org/>
References: <bug-86115-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0090807498=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86115-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0090807498==
Content-Type: multipart/alternative; boundary="1415634318.0beD2.29548"; charset="UTF-8"


--1415634318.0beD2.29548
Date: Mon, 10 Nov 2014 15:45:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86115

--- Comment #4 from Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org> ---
In order to make things a bit more straight, could you retest S3 after doing:
  echo 1 > /sys/power/pm_async
?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1415634318.0beD2.29548
Date: Mon, 10 Nov 2014 15:45:18 +0000
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
   title="NEW - Suspend to RAM fails when using Nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86115#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Suspend to RAM fails when using Nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86115">bug 86115</a>
              from <span class="vcard"><a class="email" href="mailto:tiwai&#64;suse.de" title="Takashi Iwai &lt;tiwai&#64;suse.de&gt;"> <span class="fn">Takashi Iwai</span></a>
</span></b>
        <pre>In order to make things a bit more straight, could you retest S3 after doing:
  echo 1 &gt; /sys/power/pm_async
?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1415634318.0beD2.29548--

--===============0090807498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0090807498==--
