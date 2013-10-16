From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55450] [NV17] nouveau driver fails to restore screen
 content / video mode after resume from s2ram
Date: Wed, 16 Oct 2013 20:59:31 +0000
Message-ID: <bug-55450-8800-FB26kB76ZZ@http.bugs.freedesktop.org/>
References: <bug-55450-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0232105036=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-55450-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0232105036==
Content-Type: multipart/alternative; boundary="1381957171.3b740ADF2.15271"; charset="us-ascii"


--1381957171.3b740ADF2.15271
Date: Wed, 16 Oct 2013 20:59:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55450

--- Comment #16 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #14)
> Well the problem was that nouveau has gone into my initrd. A simple
> NO_KMS_IN_INITRD="yes" followed by an mkinitrd did the trick.
From my POV kms drivers in initrd is a very bad idea.

> just gained test results are not encouraging:
> * echo mem >/sys/power/state  without nouveau  -> bluescreen
> * echo mem >/sys/power/state  without nouveau and with vga=0  -> funny text
> screen flicker
> 
I'm suspecting that those two are different (possibly related) issues. Although
once we can get a non-lockup system after s2r we can look into the (alleged)
nouveau issue.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381957171.3b740ADF2.15271
Date: Wed, 16 Oct 2013 20:59:31 +0000
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
   title="RESOLVED MOVED - [NV17] nouveau driver fails to restore screen content / video mode after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55450#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED MOVED - [NV17] nouveau driver fails to restore screen content / video mode after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55450">bug 55450</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=55450#c14">comment #14</a>)
<span class="quote">&gt; Well the problem was that nouveau has gone into my initrd. A simple
&gt; NO_KMS_IN_INITRD=&quot;yes&quot; followed by an mkinitrd did the trick.</span >
From my POV kms drivers in initrd is a very bad idea.

<span class="quote">&gt; just gained test results are not encouraging:
&gt; * echo mem &gt;/sys/power/state  without nouveau  -&gt; bluescreen
&gt; * echo mem &gt;/sys/power/state  without nouveau and with vga=0  -&gt; funny text
&gt; screen flicker
&gt; </span >
I'm suspecting that those two are different (possibly related) issues. Although
once we can get a non-lockup system after s2r we can look into the (alleged)
nouveau issue.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381957171.3b740ADF2.15271--

--===============0232105036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0232105036==--
