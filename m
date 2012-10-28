From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54883] Nvidia GLX560M: Display corruption in GTK+
 apps and unable to wake from sleep
Date: Sun, 28 Oct 2012 17:41:21 +0000
Message-ID: <bug-54883-8800-h9wxTXl1mv@http.bugs.freedesktop.org/>
References: <bug-54883-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0750082941=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54883-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0750082941==
Content-Type: multipart/alternative; boundary="1351446081.F18430.7048"; charset="us-ascii"


--1351446081.F18430.7048
Date: Sun, 28 Oct 2012 17:41:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54883

Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
From Gentoo's bugzilla

> Ah... Downgrading kernel to gentoo-sources-3.3* solves the issue.
> 
> Looks like my investigation towards mesa regression was wrong. Simply any newer kernel than 3.3* regresses this way.
> 
> Now with mesa etc. on 9999 and gentoo-sources-3.3.8-r1 issue is gone.
> 
> Any idea what and how I may narrow this down utilizing this discovery?
> 
> xf86-video-nouveau-1.0.3 fixed all the issues for me on gentoo-sources-3.6.1

Marking as fixed

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351446081.F18430.7048
Date: Sun, 28 Oct 2012 17:41:21 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Nvidia GLX560M: Display corruption in GTK+ apps and unable to wake from sleep"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54883">bug 54883</a>
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
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Nvidia GLX560M: Display corruption in GTK+ apps and unable to wake from sleep"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54883#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Nvidia GLX560M: Display corruption in GTK+ apps and unable to wake from sleep"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54883">bug 54883</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>From Gentoo's bugzilla

<span class="quote">&gt; Ah... Downgrading kernel to gentoo-sources-3.3* solves the issue.
&gt; 
&gt; Looks like my investigation towards mesa regression was wrong. Simply any newer kernel than 3.3* regresses this way.
&gt; 
&gt; Now with mesa etc. on 9999 and gentoo-sources-3.3.8-r1 issue is gone.
&gt; 
&gt; Any idea what and how I may narrow this down utilizing this discovery?
&gt; 
&gt; xf86-video-nouveau-1.0.3 fixed all the issues for me on gentoo-sources-3.6.1</span >

Marking as fixed</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351446081.F18430.7048--

--===============0750082941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0750082941==--
