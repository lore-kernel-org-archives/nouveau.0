From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69387] X hangs on resume/monitor blank with
	nv50cal_space: -16
Date: Sun, 29 Sep 2013 08:11:35 +0000
Message-ID: <bug-69387-8800-5GXwF5n5lm@http.bugs.freedesktop.org/>
References: <bug-69387-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0043463377=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69387-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0043463377==
Content-Type: multipart/alternative; boundary="1380442295.5D08501.8122"; charset="us-ascii"


--1380442295.5D08501.8122
Date: Sun, 29 Sep 2013 08:11:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69387

--- Comment #2 from Maris Nartiss <maris.nartiss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
After kernel upgrade to 3.11.1 and xorg-server-1.14.3, resume from suspend was
still broken but I didn't observe any hangs during power save mode.

This issue can be completely fixed by adding Option "NoAccel" "true" to
xorg.conf file. Suspend/resume seems to work flawles without acceleration. It
fixed also some random hangs during normal work (no bug report as no idea how
to triger them or anything in system logs). 
Leaving this bug open suspend/resume should work also with enabled
acceleration.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380442295.5D08501.8122
Date: Sun, 29 Sep 2013 08:11:35 +0000
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
   title="NEW --- - X hangs on resume/monitor blank with nv50cal_space: -16"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69387#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - X hangs on resume/monitor blank with nv50cal_space: -16"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69387">bug 69387</a>
              from <span class="vcard"><a class="email" href="mailto:maris.nartiss&#64;gmail.com" title="Maris Nartiss &lt;maris.nartiss&#64;gmail.com&gt;"> <span class="fn">Maris Nartiss</span></a>
</span></b>
        <pre>After kernel upgrade to 3.11.1 and xorg-server-1.14.3, resume from suspend was
still broken but I didn't observe any hangs during power save mode.

This issue can be completely fixed by adding Option &quot;NoAccel&quot; &quot;true&quot; to
xorg.conf file. Suspend/resume seems to work flawles without acceleration. It
fixed also some random hangs during normal work (no bug report as no idea how
to triger them or anything in system logs). 
Leaving this bug open suspend/resume should work also with enabled
acceleration.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380442295.5D08501.8122--

--===============0043463377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0043463377==--
