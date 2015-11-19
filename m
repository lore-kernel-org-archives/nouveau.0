From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92761] [NVF0] dmesg full of nouveau E[
 PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301 (0x01024215)
Date: Thu, 19 Nov 2015 12:56:38 +0000
Message-ID: <bug-92761-8800-aT9e5sGSQY@http.bugs.freedesktop.org/>
References: <bug-92761-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0104843338=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92761-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0104843338==
Content-Type: multipart/alternative; boundary="1447937798.Ce7a3e1.17180"; charset="UTF-8"


--1447937798.Ce7a3e1.17180
Date: Thu, 19 Nov 2015 12:56:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92761

--- Comment #6 from ascanio.alba7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
1. Using nvidia 352.63 to generate mmiotrace.

2. This card locks up with gdm -> desktop (wayland or X)
a. gdm starts desktop and immediately returns to gdm
b. 2nd attempt to start desktop usually results in a hard lockup - alt-sysrq
works

3. lightdm -> X is ok

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447937798.Ce7a3e1.17180
Date: Thu, 19 Nov 2015 12:56:38 +0000
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
   title="NEW - [NVF0] dmesg full of nouveau E[ PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301 (0x01024215)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92761#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVF0] dmesg full of nouveau E[ PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301 (0x01024215)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92761">bug 92761</a>
              from <span class="vcard"><a class="email" href="mailto:ascanio.alba7&#64;gmail.com" title="ascanio.alba7&#64;gmail.com">ascanio.alba7&#64;gmail.com</a>
</span></b>
        <pre>1. Using nvidia 352.63 to generate mmiotrace.

2. This card locks up with gdm -&gt; desktop (wayland or X)
a. gdm starts desktop and immediately returns to gdm
b. 2nd attempt to start desktop usually results in a hard lockup - alt-sysrq
works

3. lightdm -&gt; X is ok</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447937798.Ce7a3e1.17180--

--===============0104843338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0104843338==--
