From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 48090] Spam of system log with EDID messages
Date: Sun, 04 Nov 2012 09:23:14 +0000
Message-ID: <bug-48090-8800-XUDwuURfia@http.bugs.freedesktop.org/>
References: <bug-48090-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1153609417=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-48090-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1153609417==
Content-Type: multipart/alternative; boundary="1352020994.D7aD081.27962"; charset="us-ascii"


--1352020994.D7aD081.27962
Date: Sun, 4 Nov 2012 09:23:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=48090

--- Comment #3 from mieszcz-QwMmmZtx9AKLlq1WhhkdqA@public.gmane.org ---
Emil thank you for the tip, it acts good as workaround.
Now I just compiled new kernel with support of nouveau.
And except of above described log spamming it works perfectly.

But I don't understand one thing. Why the driver is mentioning different EDID
data in the logs, and different in 
/sys/class/drm/card0/card0-eDP-1

While status of other video outputs is disabled

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352020994.D7aD081.27962
Date: Sun, 4 Nov 2012 09:23:14 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - Spam of system log with EDID messages"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48090#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - Spam of system log with EDID messages"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48090">bug 48090</a>
              from <span class="vcard"><a class="email" href="mailto:mieszcz&#64;mieszczak.com.pl" title="mieszcz&#64;mieszczak.com.pl">mieszcz&#64;mieszczak.com.pl</a>
</span></b>
        <pre>Emil thank you for the tip, it acts good as workaround.
Now I just compiled new kernel with support of nouveau.
And except of above described log spamming it works perfectly.

But I don't understand one thing. Why the driver is mentioning different EDID
data in the logs, and different in 
/sys/class/drm/card0/card0-eDP-1

While status of other video outputs is disabled</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1352020994.D7aD081.27962--

--===============1153609417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1153609417==--
