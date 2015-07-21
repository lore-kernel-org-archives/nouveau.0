From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91373] Nouveau fills kern.log with gigabytes of data
 when molecule screensaver is run
Date: Tue, 21 Jul 2015 13:53:41 +0000
Message-ID: <bug-91373-8800-frYmv71Q4d@http.bugs.freedesktop.org/>
References: <bug-91373-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0470814012=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91373-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0470814012==
Content-Type: multipart/alternative; boundary="1437486821.F0431.6026"; charset="UTF-8"


--1437486821.F0431.6026
Date: Tue, 21 Jul 2015 13:53:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91373

--- Comment #6 from Olivier Diotte <vhann3000+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
v4.1.0 is no go:

Jul 20 12:55:17 dioo-XPS kernel: [ 3734.622246] usb 1-11: USB disconnect,
device number 24
Jul 20 18:20:59 dioo-XPS kernel: [23270.087336] nouveau E[  
PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
Jul 20 18:20:59 dioo-XPS kernel: [23270.087341] nouveau E[  
PFIFO][0000:01:00.0] PGRAPH engine fault on channel 2, recovering...
Jul 21 08:05:11 dioo-XPS kernel: [72704.336625] audit: type=1400
audit(1437480311.763:67): apparmor="STATUS" operation="profile_replace"
name="/usr/lib/cups/backend/cups-pdf" pid=4404 comm="apparmor_parser"

I'll try v4.0 (since I don't have much to lose by doing so), but I'm guessing
there won't be much difference.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1437486821.F0431.6026
Date: Tue, 21 Jul 2015 13:53:41 +0000
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
   title="NEW - Nouveau fills kern.log with gigabytes of data when molecule screensaver is run"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91373#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau fills kern.log with gigabytes of data when molecule screensaver is run"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91373">bug 91373</a>
              from <span class="vcard"><a class="email" href="mailto:vhann3000+freedesktop&#64;gmail.com" title="Olivier Diotte &lt;vhann3000+freedesktop&#64;gmail.com&gt;"> <span class="fn">Olivier Diotte</span></a>
</span></b>
        <pre>v4.1.0 is no go:

Jul 20 12:55:17 dioo-XPS kernel: [ 3734.622246] usb 1-11: USB disconnect,
device number 24
Jul 20 18:20:59 dioo-XPS kernel: [23270.087336] nouveau E[  
PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
Jul 20 18:20:59 dioo-XPS kernel: [23270.087341] nouveau E[  
PFIFO][0000:01:00.0] PGRAPH engine fault on channel 2, recovering...
Jul 21 08:05:11 dioo-XPS kernel: [72704.336625] audit: type=1400
audit(1437480311.763:67): apparmor=&quot;STATUS&quot; operation=&quot;profile_replace&quot;
name=&quot;/usr/lib/cups/backend/cups-pdf&quot; pid=4404 comm=&quot;apparmor_parser&quot;

I'll try v4.0 (since I don't have much to lose by doing so), but I'm guessing
there won't be much difference.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1437486821.F0431.6026--

--===============0470814012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0470814012==--
