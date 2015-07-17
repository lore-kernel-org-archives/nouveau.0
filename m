From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91373] Nouveau fills kern.log with gigabytes of data
 when molecule screensaver is ran
Date: Fri, 17 Jul 2015 14:54:34 +0000
Message-ID: <bug-91373-8800-Vh92pq56yi@http.bugs.freedesktop.org/>
References: <bug-91373-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1970962533=="
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


--===============1970962533==
Content-Type: multipart/alternative; boundary="1437144873.BEddB751.30368"; charset="UTF-8"


--1437144873.BEddB751.30368
Date: Fri, 17 Jul 2015 14:54:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91373

--- Comment #1 from Olivier Diotte <vhann3000+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Looks much better on v3.19.

The computer didn't lock up after 3 xscreensaver-command -lock.

Interestingly though, on the HDMI screen, the first time, the molecule wasn't
rotating and error messages appeared. This was in dmesg:

[  131.177645] nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
[  131.177651] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel
7, recovering...
[  160.403618] nouveau E[molecule[2408]] failed to idle channel 0xcccc0000
[molecule[2408]]
[  175.398186] nouveau E[molecule[2408]] failed to idle channel 0xcccc0000
[molecule[2408]]

Didn't get any error since, still testing.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1437144873.BEddB751.30368
Date: Fri, 17 Jul 2015 14:54:33 +0000
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
   title="NEW - Nouveau fills kern.log with gigabytes of data when molecule screensaver is ran"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91373#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau fills kern.log with gigabytes of data when molecule screensaver is ran"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91373">bug 91373</a>
              from <span class="vcard"><a class="email" href="mailto:vhann3000+freedesktop&#64;gmail.com" title="Olivier Diotte &lt;vhann3000+freedesktop&#64;gmail.com&gt;"> <span class="fn">Olivier Diotte</span></a>
</span></b>
        <pre>Looks much better on v3.19.

The computer didn't lock up after 3 xscreensaver-command -lock.

Interestingly though, on the HDMI screen, the first time, the molecule wasn't
rotating and error messages appeared. This was in dmesg:

[  131.177645] nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
[  131.177651] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel
7, recovering...
[  160.403618] nouveau E[molecule[2408]] failed to idle channel 0xcccc0000
[molecule[2408]]
[  175.398186] nouveau E[molecule[2408]] failed to idle channel 0xcccc0000
[molecule[2408]]

Didn't get any error since, still testing.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1437144873.BEddB751.30368--

--===============1970962533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1970962533==--
