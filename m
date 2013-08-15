From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68126] drm Nouveau fails compile
Date: Thu, 15 Aug 2013 00:26:49 +0000
Message-ID: <bug-68126-8800-9TZJ24HnYD@http.bugs.freedesktop.org/>
References: <bug-68126-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0189585719=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68126-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0189585719==
Content-Type: multipart/alternative; boundary="1376526409.11EeC00C1.31819"; charset="us-ascii"


--1376526409.11EeC00C1.31819
Date: Thu, 15 Aug 2013 00:26:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68126

--- Comment #2 from min2 <min2-OQ2JkDkuTc7l0auHykxRS0EOCMrvLtNR@public.gmane.org> ---
9f9ccf707c54156b4559a4b1206022c2ca2d45cd is the first bad commit
commit 9f9ccf707c54156b4559a4b1206022c2ca2d45cd
Author: Kenneth Graunke <kenneth-xkhwgxqQjnbNLxjTenLetw@public.gmane.org>
Date:   Tue Dec 4 13:31:57 2012 -0800

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376526409.11EeC00C1.31819
Date: Thu, 15 Aug 2013 00:26:49 +0000
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
   title="NEW --- - drm Nouveau fails compile"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68126#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - drm Nouveau fails compile"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68126">bug 68126</a>
              from <span class="vcard"><a class="email" href="mailto:min2&#64;mail.mailinator.com" title="min2 &lt;min2&#64;mail.mailinator.com&gt;"> <span class="fn">min2</span></a>
</span></b>
        <pre>9f9ccf707c54156b4559a4b1206022c2ca2d45cd is the first bad commit
commit 9f9ccf707c54156b4559a4b1206022c2ca2d45cd
Author: Kenneth Graunke &lt;<a href="mailto:kenneth&#64;whitecape.org">kenneth&#64;whitecape.org</a>&gt;
Date:   Tue Dec 4 13:31:57 2012 -0800</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376526409.11EeC00C1.31819--

--===============0189585719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0189585719==--
