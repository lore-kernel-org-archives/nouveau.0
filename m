From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81072] [NVC1] GPU lockup after "read fault at
 0x0000039000 [PAGE_NOT_PRESENT] from PCOPY0"
Date: Thu, 13 Nov 2014 14:10:35 +0000
Message-ID: <bug-81072-8800-NJcS5RIHwZ@http.bugs.freedesktop.org/>
References: <bug-81072-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1625137003=="
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


--===============1625137003==
Content-Type: multipart/alternative; boundary="1415887835.E2AC7Aaa2.28323"; charset="UTF-8"


--1415887835.E2AC7Aaa2.28323
Date: Thu, 13 Nov 2014 14:10:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81072

--- Comment #3 from Andrew <andrew-OdxIvmRDBcO1Z/+hSey0Gg@public.gmane.org> ---
I have the same issue (same symptoms and apparent cause). I can usually SSH
into the box, however a hard reset is required before the GPU will function
again. A soft reboot (using reboot or halt) leaves the screen on and with
whatever image was there when he GPU locked up. Generally the lock up occurs
when interacting with firefox but that might be coincidental.

Here is the tail end of dmesg last time it occurred:

[631973.764168] scsi 21:0:0:0: Direct-Access     Generic  Ultra HS-SD/MMC  1.82
PQ: 0 ANSI: 0
[631973.764503] sd 21:0:0:0: Attached scsi generic sg8 type 0
[631973.781306] sd 21:0:0:0: [sdh] Attached SCSI removable disk
[670004.997024] type=1400 audit(1415799667.273:94): apparmor="STATUS"
operation="profile_replace" profile="unconfined"
name="/usr/lib/cups/backend/cups-pdf" pid=24612 comm="apparmor_parser"
[670004.997030] type=1400 audit(1415799667.273:95): apparmor="STATUS"
operation="profile_replace" profile="unconfined" name="/usr/sbin/cupsd"
pid=24612 comm="apparmor_parser"
[670004.997300] type=1400 audit(1415799667.273:96): apparmor="STATUS"
operation="profile_replace" profile="unconfined" name="/usr/sbin/cupsd"
pid=24612 comm="apparmor_parser"
[757535.322498] type=1400 audit(1415887157.175:97): apparmor="STATUS"
operation="profile_replace" profile="unconfined"
name="/usr/lib/cups/backend/cups-pdf" pid=3423 comm="apparmor_parser"
[757535.322505] type=1400 audit(1415887157.175:98): apparmor="STATUS"
operation="profile_replace" profile="unconfined" name="/usr/sbin/cupsd"
pid=3423 comm="apparmor_parser"
[757535.322776] type=1400 audit(1415887157.175:99): apparmor="STATUS"
operation="profile_replace" profile="unconfined" name="/usr/sbin/cupsd"
pid=3423 comm="apparmor_parser"
[757612.584375] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0000039000
[PAGE_NOT_PRESENT] from PCOPY0/PCOPY0 on channel 0x001fdb2000 [DRM]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1415887835.E2AC7Aaa2.28323
Date: Thu, 13 Nov 2014 14:10:35 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81072#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC1] GPU lockup after &quot;read fault at 0x0000039000 [PAGE_NOT_PRESENT] from PCOPY0&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81072">bug 81072</a>
              from <span class="vcard"><a class="email" href="mailto:andrew&#64;fritztech.com" title="Andrew &lt;andrew&#64;fritztech.com&gt;"> <span class="fn">Andrew</span></a>
</span></b>
        <pre>I have the same issue (same symptoms and apparent cause). I can usually SSH
into the box, however a hard reset is required before the GPU will function
again. A soft reboot (using reboot or halt) leaves the screen on and with
whatever image was there when he GPU locked up. Generally the lock up occurs
when interacting with firefox but that might be coincidental.

Here is the tail end of dmesg last time it occurred:

[631973.764168] scsi 21:0:0:0: Direct-Access     Generic  Ultra HS-SD/MMC  1.82
PQ: 0 ANSI: 0
[631973.764503] sd 21:0:0:0: Attached scsi generic sg8 type 0
[631973.781306] sd 21:0:0:0: [sdh] Attached SCSI removable disk
[670004.997024] type=1400 audit(1415799667.273:94): apparmor=&quot;STATUS&quot;
operation=&quot;profile_replace&quot; profile=&quot;unconfined&quot;
name=&quot;/usr/lib/cups/backend/cups-pdf&quot; pid=24612 comm=&quot;apparmor_parser&quot;
[670004.997030] type=1400 audit(1415799667.273:95): apparmor=&quot;STATUS&quot;
operation=&quot;profile_replace&quot; profile=&quot;unconfined&quot; name=&quot;/usr/sbin/cupsd&quot;
pid=24612 comm=&quot;apparmor_parser&quot;
[670004.997300] type=1400 audit(1415799667.273:96): apparmor=&quot;STATUS&quot;
operation=&quot;profile_replace&quot; profile=&quot;unconfined&quot; name=&quot;/usr/sbin/cupsd&quot;
pid=24612 comm=&quot;apparmor_parser&quot;
[757535.322498] type=1400 audit(1415887157.175:97): apparmor=&quot;STATUS&quot;
operation=&quot;profile_replace&quot; profile=&quot;unconfined&quot;
name=&quot;/usr/lib/cups/backend/cups-pdf&quot; pid=3423 comm=&quot;apparmor_parser&quot;
[757535.322505] type=1400 audit(1415887157.175:98): apparmor=&quot;STATUS&quot;
operation=&quot;profile_replace&quot; profile=&quot;unconfined&quot; name=&quot;/usr/sbin/cupsd&quot;
pid=3423 comm=&quot;apparmor_parser&quot;
[757535.322776] type=1400 audit(1415887157.175:99): apparmor=&quot;STATUS&quot;
operation=&quot;profile_replace&quot; profile=&quot;unconfined&quot; name=&quot;/usr/sbin/cupsd&quot;
pid=3423 comm=&quot;apparmor_parser&quot;
[757612.584375] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0000039000
[PAGE_NOT_PRESENT] from PCOPY0/PCOPY0 on channel 0x001fdb2000 [DRM]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1415887835.E2AC7Aaa2.28323--

--===============1625137003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1625137003==--
