From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50121] [Regression] Since kernel v3.5 several cards
 fail to resume, introduced by: 'convert to exec engine,
 and improve channel sync'
Date: Wed, 27 Feb 2013 03:17:42 +0000
Message-ID: <bug-50121-8800-ZQ5IKZMPMf@http.bugs.freedesktop.org/>
References: <bug-50121-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0362956818=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50121-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0362956818==
Content-Type: multipart/alternative; boundary="1361935063.Ca506E54.25133"; charset="us-ascii"


--1361935063.Ca506E54.25133
Date: Wed, 27 Feb 2013 03:17:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=50121

--- Comment #70 from Mr-4 <mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> ---
(In reply to comment #69)
> Is the crash consistent? Does it happen every time? The fix should be
> applied at v3.7.3:
No.

I've downgraded the kernel slightly - from 3.7.9-201 to 3.7.9-101 (both
official releases from Fedora) and after the first hibernate/restore cycle I
get:

nouveau  [   PFIFO][0000:01:00.0] DMA_PUSHER - Ch 0 Get 0x00000004 Put
0x000000c0 State 0x80000720 (err: INVALID_CMD) Push 0x00000000


However, the restore seems to work OK - I have no side effects after it is
done, apart from the above message, so this might be an indication on what goes
wrong - don't know, but thought to post it here.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361935063.Ca506E54.25133
Date: Wed, 27 Feb 2013 03:17:43 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121#c70">Comment # 70</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121">bug 50121</a>
              from <span class="vcard"><a class="email" href="mailto:mr.dash.four&#64;googlemail.com" title="Mr-4 &lt;mr.dash.four&#64;googlemail.com&gt;"> <span class="fn">Mr-4</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=50121#c69">comment #69</a>)
<span class="quote">&gt; Is the crash consistent? Does it happen every time? The fix should be
&gt; applied at v3.7.3:</span >
No.

I've downgraded the kernel slightly - from 3.7.9-201 to 3.7.9-101 (both
official releases from Fedora) and after the first hibernate/restore cycle I
get:

nouveau  [   PFIFO][0000:01:00.0] DMA_PUSHER - Ch 0 Get 0x00000004 Put
0x000000c0 State 0x80000720 (err: INVALID_CMD) Push 0x00000000


However, the restore seems to work OK - I have no side effects after it is
done, apart from the above message, so this might be an indication on what goes
wrong - don't know, but thought to post it here.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361935063.Ca506E54.25133--

--===============0362956818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0362956818==--
