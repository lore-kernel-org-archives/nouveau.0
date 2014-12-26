From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87244] [NV94] X hangs,
 logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after
 101 spins, halt followed by an X trace
Date: Fri, 26 Dec 2014 19:23:10 +0000
Message-ID: <bug-87244-8800-jDqRjBI9JZ@http.bugs.freedesktop.org/>
References: <bug-87244-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1084517217=="
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


--===============1084517217==
Content-Type: multipart/alternative; boundary="1419621790.B1B32.20331"; charset="UTF-8"


--1419621790.B1B32.20331
Date: Fri, 26 Dec 2014 19:23:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87244

--- Comment #5 from Zlatko Calusic <zcalusic-7aYyyD3GOf7R7s880joybQ@public.gmane.org> ---
Ha ha ha, you made me laugh with "hard to confirm a negative" comment, been
there - done that. :) This time I got a bit lucky, because I ran
3.18-rc-something the whole time (fixing some other kernel bugs I reported),
and when 3.18 got released and suddenly become unstable there were only about a
dozen nouveau commits to bisect. It was quite easy to find the faulty one.

Also, I was getting lockups pretty fast, about 6-12 hours after reboot, before
I reverted that commit. And now my system has been rock solid for 2 weeks, so
I'm pretty confident the revert is the right fix.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419621790.B1B32.20331
Date: Fri, 26 Dec 2014 19:23:10 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87244#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] X hangs, logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after 101 spins, halt followed by an X trace"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87244">bug 87244</a>
              from <span class="vcard"><a class="email" href="mailto:zcalusic&#64;bitsync.net" title="Zlatko Calusic &lt;zcalusic&#64;bitsync.net&gt;"> <span class="fn">Zlatko Calusic</span></a>
</span></b>
        <pre>Ha ha ha, you made me laugh with &quot;hard to confirm a negative&quot; comment, been
there - done that. :) This time I got a bit lucky, because I ran
3.18-rc-something the whole time (fixing some other kernel bugs I reported),
and when 3.18 got released and suddenly become unstable there were only about a
dozen nouveau commits to bisect. It was quite easy to find the faulty one.

Also, I was getting lockups pretty fast, about 6-12 hours after reboot, before
I reverted that commit. And now my system has been rock solid for 2 weeks, so
I'm pretty confident the revert is the right fix.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1419621790.B1B32.20331--

--===============1084517217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1084517217==--
