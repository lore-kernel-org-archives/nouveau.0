From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20780] nouveau corrupts at start,
 then crashes after a few drawing operations. 7800gt when
 NoAccel=false
Date: Sun, 18 Aug 2013 18:10:33 +0000
Message-ID: <bug-20780-8800-X3zPZJk29Y@http.bugs.freedesktop.org/>
References: <bug-20780-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1026097826=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20780-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1026097826==
Content-Type: multipart/alternative; boundary="1376849433.8C77b603.7623"; charset="us-ascii"


--1376849433.8C77b603.7623
Date: Sun, 18 Aug 2013 18:10:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=20780

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |INVALID

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
It appears that this bug report has laid dormant for quite a while. Sorry we
haven't gotten to it. Since we fix bugs all the time, chances are pretty good
that your issue has been fixed with the latest software. Please give it a shot.
(Linux kernel 3.10.7, xf86-video-nouveau 1.0.9, mesa 9.1.6, or their git
versions.) If upgrading to the latest isn't an option for you, your distro's
bugzilla is probably the right destination for your bug report.

In an effort to clean up our bug list, we're pre-emptively closing all bugs
that haven't seen updates since 2011. If the original issue remains, please
make sure to provide fresh info, see http://nouveau.freedesktop.org/wiki/Bugs/
for what we need to see, and re-open this one.

Thanks,

The Nouveau Team

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376849433.8C77b603.7623
Date: Sun, 18 Aug 2013 18:10:33 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - nouveau corrupts at start, then crashes after a few drawing operations. 7800gt when NoAccel=false"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20780">bug 20780</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>ASSIGNED
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>INVALID
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - nouveau corrupts at start, then crashes after a few drawing operations. 7800gt when NoAccel=false"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20780#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - nouveau corrupts at start, then crashes after a few drawing operations. 7800gt when NoAccel=false"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20780">bug 20780</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>It appears that this bug report has laid dormant for quite a while. Sorry we
haven't gotten to it. Since we fix bugs all the time, chances are pretty good
that your issue has been fixed with the latest software. Please give it a shot.
(Linux kernel 3.10.7, xf86-video-nouveau 1.0.9, mesa 9.1.6, or their git
versions.) If upgrading to the latest isn't an option for you, your distro's
bugzilla is probably the right destination for your bug report.

In an effort to clean up our bug list, we're pre-emptively closing all bugs
that haven't seen updates since 2011. If the original issue remains, please
make sure to provide fresh info, see <a href="http://nouveau.freedesktop.org/wiki/Bugs/">http://nouveau.freedesktop.org/wiki/Bugs/</a>
for what we need to see, and re-open this one.

Thanks,

The Nouveau Team</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376849433.8C77b603.7623--

--===============1026097826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1026097826==--
