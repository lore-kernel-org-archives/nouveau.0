From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72315] Fedora 19 64-bit X crash
Date: Thu, 05 Dec 2013 13:48:43 +0000
Message-ID: <bug-72315-8800-1GVJAWGTPX@http.bugs.freedesktop.org/>
References: <bug-72315-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0012952982=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72315-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0012952982==
Content-Type: multipart/alternative; boundary="1386251323.086f1c31.20667"; charset="us-ascii"


--1386251323.086f1c31.20667
Date: Thu, 5 Dec 2013 13:48:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72315

--- Comment #2 from bryan.coleman-SAIwBcqG6t4@public.gmane.org ---
Yes, things seem to work just fine with the one exception being this case. 


This was a one-time-ever occurrence and hopefully the last.  My thought 
was to pass on the information to see if it could be helpful to the 
developer.

The card is a NVS 510.




From:   <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>
To:     <bryan.coleman-SAIwBcqG6t4@public.gmane.org>
Date:   12/04/2013 03:09 PM
Subject:        [Bug 72315] Fedora 19 64-bit X crash



Comment # 1 on bug 72315 from Ilia Mirkin 
Do things work well otherwise? Might this card be a NVC1? If so, get 
3.11.10+,
3.12.2+ or 3.13-rc1+, there's a commit that fixes semi-random failures in 
there
for NVC1.

Take a look at http://nouveau.freedesktop.org/wiki/Bugs/ for some of the
information that could be useful. At the very least complete logs and what
hardware you have.

Is this issue reproducible in any way, or one-time-ever occurrence?
You are receiving this mail because: 
You are on the CC list for the bug.
You reported the bug.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386251323.086f1c31.20667
Date: Thu, 5 Dec 2013 13:48:43 +0000
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
   title="NEW --- - Fedora 19 64-bit X crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72315#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Fedora 19 64-bit X crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72315">bug 72315</a>
              from <span class="vcard"><a class="email" href="mailto:bryan.coleman&#64;dart.biz" title="bryan.coleman&#64;dart.biz">bryan.coleman&#64;dart.biz</a>
</span></b>
        <pre>Yes, things seem to work just fine with the one exception being this case. 


This was a one-time-ever occurrence and hopefully the last.  My thought 
was to pass on the information to see if it could be helpful to the 
developer.

The card is a NVS 510.




From:   &lt;<a href="mailto:bugzilla-daemon&#64;freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a>&gt;
To:     &lt;<a href="mailto:bryan.coleman&#64;dart.biz">bryan.coleman&#64;dart.biz</a>&gt;
Date:   12/04/2013 03:09 PM
Subject:        [<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Fedora 19 64-bit X crash"
   href="show_bug.cgi?id=72315">Bug 72315</a>] Fedora 19 64-bit X crash



<a href="show_bug.cgi?id=72315#c1">Comment # 1</a> on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Fedora 19 64-bit X crash"
   href="show_bug.cgi?id=72315">bug 72315</a> from Ilia Mirkin 
Do things work well otherwise? Might this card be a NVC1? If so, get 
3.11.10+,
3.12.2+ or 3.13-rc1+, there's a commit that fixes semi-random failures in 
there
for NVC1.

Take a look at <a href="http://nouveau.freedesktop.org/wiki/Bugs/">http://nouveau.freedesktop.org/wiki/Bugs/</a> for some of the
information that could be useful. At the very least complete logs and what
hardware you have.

Is this issue reproducible in any way, or one-time-ever occurrence?
You are receiving this mail because: 
You are on the CC list for the bug.
You reported the bug.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386251323.086f1c31.20667--

--===============0012952982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0012952982==--
