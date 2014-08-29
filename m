From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83079] [NVC0] Dota 2 (Linux native and Wine) crash
 with Nouveau Drivers
Date: Fri, 29 Aug 2014 03:10:14 +0000
Message-ID: <bug-83079-8800-pRvGqIcwo8@http.bugs.freedesktop.org/>
References: <bug-83079-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1472586527=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83079-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1472586527==
Content-Type: multipart/alternative; boundary="1409281814.1FD220Cd1.21704"; charset="us-ascii"


--1409281814.1FD220Cd1.21704
Date: Fri, 29 Aug 2014 03:10:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83079

--- Comment #15 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 105404
  --> https://bugs.freedesktop.org/attachment.cgi?id=105404&action=edit
avoid infinite recursion in findFirstUses

Does the attached patch help? Should apply to approximately any version of
mesa. It looks like it somehow ends up getting into a loop. Probably due to all
the merging that ends up getting done during RA and manually modifying the
->defs (and uses?) lists. Not entirely sure though.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409281814.1FD220Cd1.21704
Date: Fri, 29 Aug 2014 03:10:14 +0000
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
   title="NEW --- - [NVC0] Dota 2 (Linux native and Wine) crash with Nouveau Drivers"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83079#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC0] Dota 2 (Linux native and Wine) crash with Nouveau Drivers"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83079">bug 83079</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=105404" name="attach_105404" title="avoid infinite recursion in findFirstUses">attachment 105404</a> <a href="attachment.cgi?id=105404&amp;action=edit" title="avoid infinite recursion in findFirstUses">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=83079&amp;attachment=105404'>[review]</a>
avoid infinite recursion in findFirstUses

Does the attached patch help? Should apply to approximately any version of
mesa. It looks like it somehow ends up getting into a loop. Probably due to all
the merging that ends up getting done during RA and manually modifying the
-&gt;defs (and uses?) lists. Not entirely sure though.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409281814.1FD220Cd1.21704--

--===============1472586527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1472586527==--
