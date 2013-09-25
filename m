From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 36090] [NV34] [NV49] terminal's visual bell is very
 slow with nouveau
Date: Wed, 25 Sep 2013 17:39:12 +0000
Message-ID: <bug-36090-8800-FiNoUCHWdB@http.bugs.freedesktop.org/>
References: <bug-36090-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0776179568=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-36090-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0776179568==
Content-Type: multipart/alternative; boundary="1380130752.2dA7fEdE4.17226"; charset="us-ascii"


--1380130752.2dA7fEdE4.17226
Date: Wed, 25 Sep 2013 17:39:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=36090

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, by increasing the terminal size, I do indeed see that the visual bell is
really rather slow. During that time, X is using up 100% CPU, so it's probably
something highly unoptimal happening in the DDX.

It seems like almost all of that CPU time is going into fbSolid() from libfb,
but sadly perf isn't telling me where it's getting called from for some reason.
I'll try to look into it later, but wanted to record this observation in case I
don't get to it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380130752.2dA7fEdE4.17226
Date: Wed, 25 Sep 2013 17:39:12 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - [NV34] [NV49] terminal's visual bell is very slow with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=36090#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV34] [NV49] terminal's visual bell is very slow with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=36090">bug 36090</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, by increasing the terminal size, I do indeed see that the visual bell is
really rather slow. During that time, X is using up 100% CPU, so it's probably
something highly unoptimal happening in the DDX.

It seems like almost all of that CPU time is going into fbSolid() from libfb,
but sadly perf isn't telling me where it's getting called from for some reason.
I'll try to look into it later, but wanted to record this observation in case I
don't get to it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380130752.2dA7fEdE4.17226--

--===============0776179568==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0776179568==--
