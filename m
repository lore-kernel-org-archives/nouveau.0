From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66022] pwm1[_enable] faults after hibernate/restore
 related to automatic (or otherwise) fan management
Date: Sat, 22 Jun 2013 01:26:27 +0000
Message-ID: <bug-66022-8800-yoViDbm6CY@http.bugs.freedesktop.org/>
References: <bug-66022-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1422745593=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66022-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1422745593==
Content-Type: multipart/alternative; boundary="1371864388.48aFB372.22596"; charset="us-ascii"


--1371864388.48aFB372.22596
Date: Sat, 22 Jun 2013 01:26:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66022

--- Comment #2 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 81189
  --> https://bugs.freedesktop.org/attachment.cgi?id=81189&action=edit
fix for bug#1

This patch should resolve the first bug. Please give it a try and as usual
observe the temperatures

Cheers
Emil

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1371864388.48aFB372.22596
Date: Sat, 22 Jun 2013 01:26:28 +0000
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
   title="NEW --- - pwm1[_enable] faults after hibernate/restore related to automatic (or otherwise) fan management"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66022#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - pwm1[_enable] faults after hibernate/restore related to automatic (or otherwise) fan management"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66022">bug 66022</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=81189" name="attach_81189" title="fix for bug#1">attachment 81189</a> <a href="attachment.cgi?id=81189&amp;action=edit" title="fix for bug#1">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=66022&amp;attachment=81189'>[review]</a>
fix for <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Optimizations"
   href="show_bug.cgi?id=1">bug#1</a>

This patch should resolve the first bug. Please give it a try and as usual
observe the temperatures

Cheers
Emil</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1371864388.48aFB372.22596--

--===============1422745593==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1422745593==--
