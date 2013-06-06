From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63135] [bisected] G69/nv50 DisplayPort dual-head
 fails to switch to KMS
Date: Thu, 06 Jun 2013 22:37:01 +0000
Message-ID: <bug-63135-8800-ijGYrUwrly@http.bugs.freedesktop.org/>
References: <bug-63135-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1949047466=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-63135-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1949047466==
Content-Type: multipart/alternative; boundary="1370558220.ae7EC1.7058"; charset="us-ascii"


--1370558220.ae7EC1.7058
Date: Thu, 6 Jun 2013 22:37:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63135

--- Comment #18 from Devin J. Pohly <djpohly+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
No, the original problem was not 100% reproducible.  It always felt (this is
only a guess) like it had something to do with how long the KMS switch took...
if it took too long, the monitors went into powersave, and the system would
almost certainly hang.

There seem to be three possibilities for a boot on a bugged revision:
1. Everything works.
2. Displays go into powersave, system hangs, and you can't ssh or use SysRq.
3. (Rare.)  Displays go into powersave but you can still use SysRq.

For the latest attachments, I used a serial console to reliably get logs from
cases 1 and 2.  The original logs (from a 3.9-series kernel) relied on getting
case 3 so I could REISUB and read the logs on next boot, but this may not show
the bug properly.  Would you like me to get logs from a recent kernel using the
serial console so you can compare?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1370558220.ae7EC1.7058
Date: Thu, 6 Jun 2013 22:37:00 +0000
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
   title="NEW --- - [bisected] G69/nv50 DisplayPort dual-head fails to switch to KMS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [bisected] G69/nv50 DisplayPort dual-head fails to switch to KMS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135">bug 63135</a>
              from <span class="vcard"><a class="email" href="mailto:djpohly+freedesktop&#64;gmail.com" title="Devin J. Pohly &lt;djpohly+freedesktop&#64;gmail.com&gt;"> <span class="fn">Devin J. Pohly</span></a>
</span></b>
        <pre>No, the original problem was not 100% reproducible.  It always felt (this is
only a guess) like it had something to do with how long the KMS switch took...
if it took too long, the monitors went into powersave, and the system would
almost certainly hang.

There seem to be three possibilities for a boot on a bugged revision:
1. Everything works.
2. Displays go into powersave, system hangs, and you can't ssh or use SysRq.
3. (Rare.)  Displays go into powersave but you can still use SysRq.

For the latest attachments, I used a serial console to reliably get logs from
cases 1 and 2.  The original logs (from a 3.9-series kernel) relied on getting
case 3 so I could REISUB and read the logs on next boot, but this may not show
the bug properly.  Would you like me to get logs from a recent kernel using the
serial console so you can compare?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1370558220.ae7EC1.7058--

--===============1949047466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1949047466==--
