From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87436] INVALID_STATE [UNK05] chid 0 mthd 0x0080 data
	0x00000000
Date: Sun, 21 Dec 2014 19:28:06 +0000
Message-ID: <bug-87436-8800-DEiwjhvH3c@http.bugs.freedesktop.org/>
References: <bug-87436-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0647804635=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87436-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0647804635==
Content-Type: multipart/alternative; boundary="1419190086.43EcAc2.4532"; charset="UTF-8"


--1419190086.43EcAc2.4532
Date: Sun, 21 Dec 2014 19:28:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87436

--- Comment #6 from Pavel Malyshev <p.malishev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I'm running Fedora 21 with:
xorg-x11-drv-nouveau-1.0.11-1.fc21.x86_64
xorg-x11-server-common-1.16.2.901-1.fc21.x86_64
kernel: 3.17.6-300.fc21.x86_64

I have:
01:00.0 VGA compatible controller: NVIDIA Corporation G86M [GeForce 8400M GS]
(rev a1)

I've caught this one:
[0000:01:00.0] INVALID_STATE [UNK05] chid 0 mthd 0x0080 data 0x00000000
[0000:01:00.0] Core:
[0000:01:00.0]     0x0084: 0x019e02e2 -> 0x00000000
[0000:01:00.0]     0x0088: 0xf0000000 

Screen hung (was not updated) but I was able to login to the box over SSH.

Not sure if it the same bug. Let me know if I need to open another one.

Attached: journalctl -ab1 | grep -i nouveau

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419190086.43EcAc2.4532
Date: Sun, 21 Dec 2014 19:28:06 +0000
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
   title="NEW - INVALID_STATE [UNK05] chid 0 mthd 0x0080 data 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87436#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - INVALID_STATE [UNK05] chid 0 mthd 0x0080 data 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87436">bug 87436</a>
              from <span class="vcard"><a class="email" href="mailto:p.malishev&#64;gmail.com" title="Pavel Malyshev &lt;p.malishev&#64;gmail.com&gt;"> <span class="fn">Pavel Malyshev</span></a>
</span></b>
        <pre>I'm running Fedora 21 with:
xorg-x11-drv-nouveau-1.0.11-1.fc21.x86_64
xorg-x11-server-common-1.16.2.901-1.fc21.x86_64
kernel: 3.17.6-300.fc21.x86_64

I have:
01:00.0 VGA compatible controller: NVIDIA Corporation G86M [GeForce 8400M GS]
(rev a1)

I've caught this one:
[0000:01:00.0] INVALID_STATE [UNK05] chid 0 mthd 0x0080 data 0x00000000
[0000:01:00.0] Core:
[0000:01:00.0]     0x0084: 0x019e02e2 -&gt; 0x00000000
[0000:01:00.0]     0x0088: 0xf0000000 

Screen hung (was not updated) but I was able to login to the box over SSH.

Not sure if it the same bug. Let me know if I need to open another one.

Attached: journalctl -ab1 | grep -i nouveau</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1419190086.43EcAc2.4532--

--===============0647804635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0647804635==--
