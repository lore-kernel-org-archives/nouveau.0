From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73847] Shutdown fails almost every time since,
 upgrade to kernel 3.12
Date: Mon, 20 Jan 2014 21:57:01 +0000
Message-ID: <bug-73847-8800-tEhSMg9TYF@http.bugs.freedesktop.org/>
References: <bug-73847-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1043892447=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73847-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1043892447==
Content-Type: multipart/alternative; boundary="1390255021.e52587F2.20701"; charset="us-ascii"


--1390255021.e52587F2.20701
Date: Mon, 20 Jan 2014 21:57:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73847

--- Comment #1 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Suspecting that you might need the following commit

commit 33e3fd5567a8e04154f2a4b8978fb0f65f25224d
Author: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Wed Nov 6 13:48:16 2013 +1000

    nouveau: drop interrupt busy setting.

    This causes problems with never going busy due to ptherm polling,
    and after talking to Ben I can't see it being required.

    Signed-off-by: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>


Seems like it's in 3.13 only but it might be worth sending it to -stable if it
resolves your problem.

FWIW for this type of problems, only a complete dmesg output is preferred.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390255021.e52587F2.20701
Date: Mon, 20 Jan 2014 21:57:01 +0000
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
   title="NEW --- - Shutdown fails almost every time since, upgrade to kernel 3.12"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73847#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Shutdown fails almost every time since, upgrade to kernel 3.12"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73847">bug 73847</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Suspecting that you might need the following commit

commit 33e3fd5567a8e04154f2a4b8978fb0f65f25224d
Author: Dave Airlie &lt;<a href="mailto:airlied&#64;redhat.com">airlied&#64;redhat.com</a>&gt;
Date:   Wed Nov 6 13:48:16 2013 +1000

    nouveau: drop interrupt busy setting.

    This causes problems with never going busy due to ptherm polling,
    and after talking to Ben I can't see it being required.

    Signed-off-by: Dave Airlie &lt;<a href="mailto:airlied&#64;redhat.com">airlied&#64;redhat.com</a>&gt;


Seems like it's in 3.13 only but it might be worth sending it to -stable if it
resolves your problem.

FWIW for this type of problems, only a complete dmesg output is preferred.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390255021.e52587F2.20701--

--===============1043892447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1043892447==--
