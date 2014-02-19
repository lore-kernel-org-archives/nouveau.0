From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75199] [NVD7] unsupported GT620M in Samsung
 All-in-One PC DP500A2D
Date: Wed, 19 Feb 2014 18:41:12 +0000
Message-ID: <bug-75199-8800-C9N8qptiI8@http.bugs.freedesktop.org/>
References: <bug-75199-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1102760886=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75199-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1102760886==
Content-Type: multipart/alternative; boundary="1392835271.2C182.27536"; charset="us-ascii"


--1392835271.2C182.27536
Date: Wed, 19 Feb 2014 18:41:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75199

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |NOTABUG

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Running stuff with DRI_PRIME=1 should cause it to use the nvidia card (e.g.
DRI_PRIME=1 glxinfo). However that will only work once you've set up
offloading. Take a look at http://nouveau.freedesktop.org/wiki/Optimus/. (Not
sure what glxheads is... glxinfo is pretty authoritative though.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392835271.2C182.27536
Date: Wed, 19 Feb 2014 18:41:11 +0000
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
   title="RESOLVED NOTABUG - [NVD7] unsupported GT620M in Samsung All-in-One PC DP500A2D"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75199">bug 75199</a>
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
           <td>NOTABUG
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - [NVD7] unsupported GT620M in Samsung All-in-One PC DP500A2D"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75199#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - [NVD7] unsupported GT620M in Samsung All-in-One PC DP500A2D"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75199">bug 75199</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Running stuff with DRI_PRIME=1 should cause it to use the nvidia card (e.g.
DRI_PRIME=1 glxinfo). However that will only work once you've set up
offloading. Take a look at <a href="http://nouveau.freedesktop.org/wiki/Optimus/">http://nouveau.freedesktop.org/wiki/Optimus/</a>. (Not
sure what glxheads is... glxinfo is pretty authoritative though.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392835271.2C182.27536--

--===============1102760886==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1102760886==--
