From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67277] Lockdep splat on kernel 3.10.0
Date: Wed, 21 Aug 2013 08:17:03 +0000
Message-ID: <bug-67277-8800-bhwhdbZiDC@http.bugs.freedesktop.org/>
References: <bug-67277-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1628501726=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67277-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1628501726==
Content-Type: multipart/alternative; boundary="1377073023.4b8b18C2.18811"; charset="us-ascii"


--1377073023.4b8b18C2.18811
Date: Wed, 21 Aug 2013 08:17:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67277

--- Comment #3 from Salah Coronya <salah.coronya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 84371
  --> https://bugs.freedesktop.org/attachment.cgi?id=84371&action=edit
lockep splat 3.11-rc6+

I have the same thing in the current nouveau head (   
3b56bba6abaa70d629fccdcf8490e087ea3a1ab4). Same lock but triggered differently.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377073023.4b8b18C2.18811
Date: Wed, 21 Aug 2013 08:17:03 +0000
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
   title="NEW --- - Lockdep splat on kernel 3.10.0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67277#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Lockdep splat on kernel 3.10.0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67277">bug 67277</a>
              from <span class="vcard"><a class="email" href="mailto:salah.coronya&#64;gmail.com" title="Salah Coronya &lt;salah.coronya&#64;gmail.com&gt;"> <span class="fn">Salah Coronya</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=84371" name="attach_84371" title="lockep splat 3.11-rc6+">attachment 84371</a> <a href="attachment.cgi?id=84371&amp;action=edit" title="lockep splat 3.11-rc6+">[details]</a></span>
lockep splat 3.11-rc6+

I have the same thing in the current nouveau head (   
3b56bba6abaa70d629fccdcf8490e087ea3a1ab4). Same lock but triggered differently.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377073023.4b8b18C2.18811--

--===============1628501726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1628501726==--
