From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56347] NVPlatformProbe routine does not mark the
 entity as Shared for ZaphodHeads.
Date: Fri, 02 Nov 2012 03:29:26 +0000
Message-ID: <bug-56347-8800-L1ptinP5aj@http.bugs.freedesktop.org/>
References: <bug-56347-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1326144438=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56347-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1326144438==
Content-Type: multipart/alternative; boundary="1351826966.6a4Bac2.1950"; charset="us-ascii"


--1351826966.6a4Bac2.1950
Date: Fri, 2 Nov 2012 03:29:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56347

--- Comment #5 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 69408
  --> https://bugs.freedesktop.org/attachment.cgi?id=69408&action=edit
Four stage patch adding the relevant functions to NVPlatformProbe

Guy can you try the patch series

I have reworked it a bit, to be more consistent with the coding style and
eliminate some minor memory leak I have introduced

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351826966.6a4Bac2.1950
Date: Fri, 2 Nov 2012 03:29:26 +0000
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
          bz_status_ASSIGNED "
   title="ASSIGNED --- - NVPlatformProbe routine does not mark the entity as Shared for ZaphodHeads."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56347#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED --- - NVPlatformProbe routine does not mark the entity as Shared for ZaphodHeads."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56347">bug 56347</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=69408" name="attach_69408" title="Four stage patch adding the relevant functions to NVPlatformProbe">attachment 69408</a> <a href="attachment.cgi?id=69408&amp;action=edit" title="Four stage patch adding the relevant functions to NVPlatformProbe">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=56347&amp;attachment=69408'>[review]</a>
Four stage patch adding the relevant functions to NVPlatformProbe

Guy can you try the patch series

I have reworked it a bit, to be more consistent with the coding style and
eliminate some minor memory leak I have introduced</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351826966.6a4Bac2.1950--

--===============1326144438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1326144438==--
