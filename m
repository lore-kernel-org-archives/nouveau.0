From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71116] [Ubuntu userspace upgrade 13.04 ->
 13.10][regression] NV34 card fails to properly resume.
Date: Sat, 02 Nov 2013 14:59:07 +0000
Message-ID: <bug-71116-8800-c4Jw7QJ3He@http.bugs.freedesktop.org/>
References: <bug-71116-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0676470157=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71116-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0676470157==
Content-Type: multipart/alternative; boundary="1383404346.446E1.22304"; charset="us-ascii"


--1383404346.446E1.22304
Date: Sat, 2 Nov 2013 14:59:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71116

--- Comment #3 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Woa, tried nvidia-173 on

- 3.11
- 3.10
- 3.4

All failed to resume with a black screen. I guess nouveau used to have an edge
on this one!

So, no mmiotraces =( ...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383404346.446E1.22304
Date: Sat, 2 Nov 2013 14:59:06 +0000
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
   title="NEW --- - [Ubuntu userspace upgrade 13.04 -&gt; 13.10][regression] NV34 card fails to properly resume."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [Ubuntu userspace upgrade 13.04 -&gt; 13.10][regression] NV34 card fails to properly resume."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116">bug 71116</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Woa, tried nvidia-173 on

- 3.11
- 3.10
- 3.4

All failed to resume with a black screen. I guess nouveau used to have an edge
on this one!

So, no mmiotraces =( ...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383404346.446E1.22304--

--===============0676470157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0676470157==--
