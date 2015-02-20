From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87244] [NV94] X hangs,
 logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after
 101 spins, halt followed by an X trace
Date: Fri, 20 Feb 2015 10:39:01 +0000
Message-ID: <bug-87244-8800-DUpWrz4RgN@http.bugs.freedesktop.org/>
References: <bug-87244-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1002156919=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87244-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1002156919==
Content-Type: multipart/alternative; boundary="1424428741.f8C6Bd3.29115"; charset="UTF-8"


--1424428741.f8C6Bd3.29115
Date: Fri, 20 Feb 2015 10:39:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87244

--- Comment #16 from Arif Saleem <ahsaleem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi All,
We're having this issue on a whole bunch of F21 x86_64 machines. I took the
3.18.7-200 F21 source rpm, and applied Zlatko's patch from Comment 10, and
rebuilt the kernel. The important rpms are here :
http://arif.easyss.net/stuff/kernel-3.18.7-nouveau/

I haven't actually rebooted any of the machines onto this kernel yet, but this
might help some people.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1424428741.f8C6Bd3.29115
Date: Fri, 20 Feb 2015 10:39:01 +0000
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
   title="NEW - [NV94] X hangs, logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after 101 spins, halt followed by an X trace"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87244#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] X hangs, logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after 101 spins, halt followed by an X trace"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87244">bug 87244</a>
              from <span class="vcard"><a class="email" href="mailto:ahsaleem&#64;gmail.com" title="Arif Saleem &lt;ahsaleem&#64;gmail.com&gt;"> <span class="fn">Arif Saleem</span></a>
</span></b>
        <pre>Hi All,
We're having this issue on a whole bunch of F21 x86_64 machines. I took the
3.18.7-200 F21 source rpm, and applied Zlatko's patch from <a href="show_bug.cgi?id=87244#c10">Comment 10</a>, and
rebuilt the kernel. The important rpms are here :
<a href="http://arif.easyss.net/stuff/kernel-3.18.7-nouveau/">http://arif.easyss.net/stuff/kernel-3.18.7-nouveau/</a>

I haven't actually rebooted any of the machines onto this kernel yet, but this
might help some people.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1424428741.f8C6Bd3.29115--

--===============1002156919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1002156919==--
