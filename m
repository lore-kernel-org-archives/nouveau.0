From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69350] [NV96] Second card output corrupted after
 suspend / resume
Date: Fri, 01 Nov 2013 08:53:06 +0000
Message-ID: <bug-69350-8800-UHDbIvMRjo@http.bugs.freedesktop.org/>
References: <bug-69350-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2016184114=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69350-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2016184114==
Content-Type: multipart/alternative; boundary="1383295986.ff5F31.4848"; charset="us-ascii"


--1383295986.ff5F31.4848
Date: Fri, 1 Nov 2013 08:53:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69350

--- Comment #6 from Thomas Bettler <thomas.bettler-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Restarting the X Server would restore the correct colors. however this is not a
real fix as running X sessions are lost.

The bug is still present with 3.12-rc7

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383295986.ff5F31.4848
Date: Fri, 1 Nov 2013 08:53:06 +0000
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
   title="NEW --- - [NV96] Second card output corrupted after suspend / resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69350#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] Second card output corrupted after suspend / resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69350">bug 69350</a>
              from <span class="vcard"><a class="email" href="mailto:thomas.bettler&#64;gmail.com" title="Thomas Bettler &lt;thomas.bettler&#64;gmail.com&gt;"> <span class="fn">Thomas Bettler</span></a>
</span></b>
        <pre>Restarting the X Server would restore the correct colors. however this is not a
real fix as running X sessions are lost.

The bug is still present with 3.12-rc7</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383295986.ff5F31.4848--

--===============2016184114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2016184114==--
