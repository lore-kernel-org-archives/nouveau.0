From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67878] Hardware freeze after resume from suspend
Date: Fri, 09 Aug 2013 16:13:55 +0000
Message-ID: <bug-67878-8800-ktiwYxvP8J@http.bugs.freedesktop.org/>
References: <bug-67878-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0927924713=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67878-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0927924713==
Content-Type: multipart/alternative; boundary="1376064835.81DE5ecD1.27519"; charset="us-ascii"


--1376064835.81DE5ecD1.27519
Date: Fri, 9 Aug 2013 16:13:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67878

--- Comment #9 from Ben Gamari <bgamari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Rereading bugs #59057 and #62835, it's not entirely clear whether the bug was
actually ever fixed; it may be that the reporter simply worked around it.
Comment #33 of Bug #59057
(https://bugs.freedesktop.org/show_bug.cgi?id=59057#c33) actually refers to
commit e5a58edc94a20a7ef4b7db67c166c4ca0588bad0
(46c13c131d3b73080aa0f50f45e834a9ab3c0e71 in Linus's tree) as working. Going to
test this and surrounding commits to verify this.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376064835.81DE5ecD1.27519
Date: Fri, 9 Aug 2013 16:13:55 +0000
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
   title="NEW --- - Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878">bug 67878</a>
              from <span class="vcard"><a class="email" href="mailto:bgamari&#64;gmail.com" title="Ben Gamari &lt;bgamari&#64;gmail.com&gt;"> <span class="fn">Ben Gamari</span></a>
</span></b>
        <pre>Rereading bugs #59057 and #62835, it's not entirely clear whether the bug was
actually ever fixed; it may be that the reporter simply worked around it.
<a href="show_bug.cgi?id=67878#c33">Comment #33</a> of <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Black screen after resume from s2ram"
   href="show_bug.cgi?id=59057">Bug #59057</a>
(<a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Black screen after resume from s2ram"
   href="show_bug.cgi?id=59057#c33">https://bugs.freedesktop.org/show_bug.cgi?id=59057#c33</a>) actually refers to
commit e5a58edc94a20a7ef4b7db67c166c4ca0588bad0
(46c13c131d3b73080aa0f50f45e834a9ab3c0e71 in Linus's tree) as working. Going to
test this and surrounding commits to verify this.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376064835.81DE5ecD1.27519--

--===============0927924713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0927924713==--
