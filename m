From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64493] X server crashes when launch Savage XR
Date: Sun, 12 May 2013 22:33:30 +0000
Message-ID: <bug-64493-8800-UeiLB7e6Wx@http.bugs.freedesktop.org/>
References: <bug-64493-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1247111238=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64493-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1247111238==
Content-Type: multipart/alternative; boundary="1368398010.f3dcB80.22336"; charset="us-ascii"


--1368398010.f3dcB80.22336
Date: Sun, 12 May 2013 22:33:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64493

--- Comment #2 from Stanislav <ginermail-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 79217
  --> https://bugs.freedesktop.org/attachment.cgi?id=79217&action=edit
dmesg

> 1. Find out which component did you update when the issue occurred
> * The game, X, xf86-video-nouveau, mesa, kernel ?
Unfortunately I can't remember. I'd been using proprietary driver before today
as I didn't get luck with nouveau.

> 2. Check if the software renderer produces the same result
> * export LIBGL_ALWAYS_SOFTWARE=1 && savage...
Same result

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1368398010.f3dcB80.22336
Date: Sun, 12 May 2013 22:33:30 +0000
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
   title="NEW --- - X server crashes when launch Savage XR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64493#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - X server crashes when launch Savage XR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64493">bug 64493</a>
              from <span class="vcard"><a class="email" href="mailto:ginermail&#64;gmail.com" title="Stanislav &lt;ginermail&#64;gmail.com&gt;"> <span class="fn">Stanislav</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=79217" name="attach_79217" title="dmesg">attachment 79217</a> <a href="attachment.cgi?id=79217&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

<span class="quote">&gt; 1. Find out which component did you update when the issue occurred
&gt; * The game, X, xf86-video-nouveau, mesa, kernel ?</span >
Unfortunately I can't remember. I'd been using proprietary driver before today
as I didn't get luck with nouveau.

<span class="quote">&gt; 2. Check if the software renderer produces the same result
&gt; * export LIBGL_ALWAYS_SOFTWARE=1 &amp;&amp; savage...</span >
Same result</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1368398010.f3dcB80.22336--

--===============1247111238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1247111238==--
