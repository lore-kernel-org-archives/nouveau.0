From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87436] INVALID_STATE [UNK05] chid 0 mthd 0x0080 data
	0x00000000
Date: Wed, 06 May 2015 13:52:31 +0000
Message-ID: <bug-87436-8800-aQ8EypZEA6@http.bugs.freedesktop.org/>
References: <bug-87436-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1638768726=="
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


--===============1638768726==
Content-Type: multipart/alternative; boundary="1430920351.C30dCe8d5.18387"; charset="UTF-8"


--1430920351.C30dCe8d5.18387
Date: Wed, 6 May 2015 13:52:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87436

--- Comment #10 from Michael Mercier <mickours-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I have the same problem on Arch Linux. Some information:

uname -a
Linux laptours 4.0.1-1-ARCH #1 SMP PREEMPT Wed Apr 29 12:00:26 CEST 2015 x86_64
GNU/Linux

Packages versions:
xf86-video-nouveau 1.0.11-3
mesa 10.5.4-1
xorg-server 1.17.1-5

I already have posted my dmesg.

I sometimes get a complete xorg freeze. I post the journalctl output grep with
nouveau

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1430920351.C30dCe8d5.18387
Date: Wed, 6 May 2015 13:52:31 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87436#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - INVALID_STATE [UNK05] chid 0 mthd 0x0080 data 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87436">bug 87436</a>
              from <span class="vcard"><a class="email" href="mailto:mickours&#64;gmail.com" title="Michael Mercier &lt;mickours&#64;gmail.com&gt;"> <span class="fn">Michael Mercier</span></a>
</span></b>
        <pre>I have the same problem on Arch Linux. Some information:

uname -a
Linux laptours 4.0.1-1-ARCH #1 SMP PREEMPT Wed Apr 29 12:00:26 CEST 2015 x86_64
GNU/Linux

Packages versions:
xf86-video-nouveau 1.0.11-3
mesa 10.5.4-1
xorg-server 1.17.1-5

I already have posted my dmesg.

I sometimes get a complete xorg freeze. I post the journalctl output grep with
nouveau</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1430920351.C30dCe8d5.18387--

--===============1638768726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1638768726==--
