From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73791] [NV96] [BISECTED] Regression: 9600M GT fails
 to boot with 3.13-rc8
Date: Sun, 19 Jan 2014 12:48:53 +0000
Message-ID: <bug-73791-8800-rSuHRUp7Hz@http.bugs.freedesktop.org/>
References: <bug-73791-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1476832696=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73791-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1476832696==
Content-Type: multipart/alternative; boundary="1390135732.46EE521.26180"; charset="us-ascii"


--1390135732.46EE521.26180
Date: Sun, 19 Jan 2014 12:48:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73791

--- Comment #2 from Andreas Reis <andreas.reis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
It's at Torvalds's current HEAD ("Merge
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net"), so yes.

I also double checked 'git diff'; the 'populate master' commit is the only one
reverted.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390135732.46EE521.26180
Date: Sun, 19 Jan 2014 12:48:52 +0000
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
   title="NEW --- - [NV96] [BISECTED] Regression: 9600M GT fails to boot with 3.13-rc8"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73791#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] [BISECTED] Regression: 9600M GT fails to boot with 3.13-rc8"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73791">bug 73791</a>
              from <span class="vcard"><a class="email" href="mailto:andreas.reis&#64;gmail.com" title="Andreas Reis &lt;andreas.reis&#64;gmail.com&gt;"> <span class="fn">Andreas Reis</span></a>
</span></b>
        <pre>It's at Torvalds's current HEAD (&quot;Merge
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net&quot;), so yes.

I also double checked 'git diff'; the 'populate master' commit is the only one
reverted.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390135732.46EE521.26180--

--===============1476832696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1476832696==--
