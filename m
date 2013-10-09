From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67255] [NVC3] black screen after resuming from
	Hibernate
Date: Wed, 09 Oct 2013 10:44:22 +0000
Message-ID: <bug-67255-8800-zqkwdwKKfo@http.bugs.freedesktop.org/>
References: <bug-67255-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1438240240=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67255-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1438240240==
Content-Type: multipart/alternative; boundary="1381315462.124148C31.6986"; charset="us-ascii"


--1381315462.124148C31.6986
Date: Wed, 9 Oct 2013 10:44:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67255

--- Comment #9 from Mike <michele.cane-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I have tried with 3.12-rc4 and the problem persists. I have attached dmesg
after resuming from suspention (which works) and resuming from hibernation
(wich does not work) with nouveau.debug=trace.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381315462.124148C31.6986
Date: Wed, 9 Oct 2013 10:44:22 +0000
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
   title="NEW --- - [NVC3] black screen after resuming from Hibernate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67255#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC3] black screen after resuming from Hibernate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67255">bug 67255</a>
              from <span class="vcard"><a class="email" href="mailto:michele.cane&#64;gmail.com" title="Mike &lt;michele.cane&#64;gmail.com&gt;"> <span class="fn">Mike</span></a>
</span></b>
        <pre>I have tried with 3.12-rc4 and the problem persists. I have attached dmesg
after resuming from suspention (which works) and resuming from hibernation
(wich does not work) with nouveau.debug=trace.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381315462.124148C31.6986--

--===============1438240240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1438240240==--
