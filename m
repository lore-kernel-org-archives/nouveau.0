From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64323] Severe misrendering in Left 4 Dead 2
Date: Wed, 04 Dec 2013 21:36:10 +0000
Message-ID: <bug-64323-8800-06ObAtHdVs@http.bugs.freedesktop.org/>
References: <bug-64323-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1103688158=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64323-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1103688158==
Content-Type: multipart/alternative; boundary="1386192970.31183.19011"; charset="us-ascii"


--1386192970.31183.19011
Date: Wed, 4 Dec 2013 21:36:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64323

--- Comment #28 from anakin.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
There's now a commit with the older patch which does the wait and reduce FPS:
http://cgit.freedesktop.org/mesa/mesa/commit/?id=0e5bf8565106833e1a678ebdae81fdf1657391c9

Shouldn't we have the latest one instead (mess around with buffer transfers
only when needed) ?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386192970.31183.19011
Date: Wed, 4 Dec 2013 21:36:10 +0000
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
   title="NEW --- - Severe misrendering in Left 4 Dead 2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64323#c28">Comment # 28</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Severe misrendering in Left 4 Dead 2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64323">bug 64323</a>
              from <span class="vcard"><a class="email" href="mailto:anakin.cs&#64;gmail.com" title="anakin.cs&#64;gmail.com">anakin.cs&#64;gmail.com</a>
</span></b>
        <pre>There's now a commit with the older patch which does the wait and reduce FPS:
<a href="http://cgit.freedesktop.org/mesa/mesa/commit/?id=0e5bf8565106833e1a678ebdae81fdf1657391c9">http://cgit.freedesktop.org/mesa/mesa/commit/?id=0e5bf8565106833e1a678ebdae81fdf1657391c9</a>

Shouldn't we have the latest one instead (mess around with buffer transfers
only when needed) ?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386192970.31183.19011--

--===============1103688158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1103688158==--
