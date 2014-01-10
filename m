From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73459] nv10 get_rt_format: Assertion `0' failed.
Date: Fri, 10 Jan 2014 19:00:15 +0000
Message-ID: <bug-73459-8800-uT7IR2eA2u@http.bugs.freedesktop.org/>
References: <bug-73459-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0998331609=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73459-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0998331609==
Content-Type: multipart/alternative; boundary="1389380414.a78576350.25503"; charset="us-ascii"


--1389380414.a78576350.25503
Date: Fri, 10 Jan 2014 19:00:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73459

--- Comment #3 from Diego Nieto Cid <dnietoc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Ilia thanks for the fast response. Yes, applying the patch prevents wine from
crashing and at a quick glance games appear to work correctly.

There's an error message:

      Mesa: User error: GL_INVALID_ENUM in glDisable(GL_COLOR_SUM)

but I guess it's unrelated.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389380414.a78576350.25503
Date: Fri, 10 Jan 2014 19:00:14 +0000
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
   title="NEW --- - nv10 get_rt_format: Assertion `0' failed."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73459#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nv10 get_rt_format: Assertion `0' failed."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73459">bug 73459</a>
              from <span class="vcard"><a class="email" href="mailto:dnietoc&#64;gmail.com" title="Diego Nieto Cid &lt;dnietoc&#64;gmail.com&gt;"> <span class="fn">Diego Nieto Cid</span></a>
</span></b>
        <pre>Ilia thanks for the fast response. Yes, applying the patch prevents wine from
crashing and at a quick glance games appear to work correctly.

There's an error message:

      Mesa: User error: GL_INVALID_ENUM in glDisable(GL_COLOR_SUM)

but I guess it's unrelated.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389380414.a78576350.25503--

--===============0998331609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0998331609==--
