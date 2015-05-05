From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89247] [NVE7] short display freeze on xrandr --query
Date: Tue, 05 May 2015 22:12:33 +0000
Message-ID: <bug-89247-8800-zi4Jfxo3T7@http.bugs.freedesktop.org/>
References: <bug-89247-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1189268003=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89247-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1189268003==
Content-Type: multipart/alternative; boundary="1430863953.3fa18F01.17113"; charset="UTF-8"


--1430863953.3fa18F01.17113
Date: Tue, 5 May 2015 22:12:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89247

--- Comment #21 from exi+freedesktop-LwM2R4sIHAOzQB+pC5nmwQ@public.gmane.org ---
Created attachment 115567
  --> https://bugs.freedesktop.org/attachment.cgi?id=115567&action=edit
strace of xrandr with timing info

I don't know if this helps but here is an 'strace -f -r -C -- xrandr -q'
output, showing the slow syscall.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1430863953.3fa18F01.17113
Date: Tue, 5 May 2015 22:12:33 +0000
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
   title="NEW - [NVE7] short display freeze on xrandr --query"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89247#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] short display freeze on xrandr --query"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89247">bug 89247</a>
              from <span class="vcard"><a class="email" href="mailto:exi+freedesktop&#64;wthack.de" title="exi+freedesktop&#64;wthack.de">exi+freedesktop&#64;wthack.de</a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=115567" name="attach_115567" title="strace of xrandr with timing info">attachment 115567</a> <a href="attachment.cgi?id=115567&amp;action=edit" title="strace of xrandr with timing info">[details]</a></span>
strace of xrandr with timing info

I don't know if this helps but here is an 'strace -f -r -C -- xrandr -q'
output, showing the slow syscall.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1430863953.3fa18F01.17113--

--===============1189268003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1189268003==--
