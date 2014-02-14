From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74316] [NV92] Graphical corruption on KDE
 shutdown/restart/log out screen
Date: Fri, 14 Feb 2014 18:28:55 +0000
Message-ID: <bug-74316-8800-lKzjAp1uzv@http.bugs.freedesktop.org/>
References: <bug-74316-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0574248970=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74316-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0574248970==
Content-Type: multipart/alternative; boundary="1392402535.157c21.23098"; charset="us-ascii"


--1392402535.157c21.23098
Date: Fri, 14 Feb 2014 18:28:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74316

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |NOTOURBUG

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #4)
> Here's the error I get with MESA_DEBUG=1:
> Mesa: User error: GL_INVALID_OPERATION in glBlitFramebufferEXT(bad src/dst
> multisample pixel formats)

The application is performing some invalid operation, and mesa is complaining
about it. Not a driver bug. Could be a core mesa bug if it's incorrectly
determining that the operation is invalid :)

Feel free to reopen if the KDE people determine that this really is a nouveau
bug somehow.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392402535.157c21.23098
Date: Fri, 14 Feb 2014 18:28:55 +0000
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
   title="RESOLVED NOTOURBUG - [NV92] Graphical corruption on KDE shutdown/restart/log out screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74316">bug 74316</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>NOTOURBUG
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTOURBUG - [NV92] Graphical corruption on KDE shutdown/restart/log out screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74316#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTOURBUG - [NV92] Graphical corruption on KDE shutdown/restart/log out screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74316">bug 74316</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=74316#c4">comment #4</a>)
<span class="quote">&gt; Here's the error I get with MESA_DEBUG=1:
&gt; Mesa: User error: GL_INVALID_OPERATION in glBlitFramebufferEXT(bad src/dst
&gt; multisample pixel formats)</span >

The application is performing some invalid operation, and mesa is complaining
about it. Not a driver bug. Could be a core mesa bug if it's incorrectly
determining that the operation is invalid :)

Feel free to reopen if the KDE people determine that this really is a nouveau
bug somehow.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392402535.157c21.23098--

--===============0574248970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0574248970==--
