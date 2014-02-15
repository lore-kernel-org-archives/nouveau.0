From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75013] [NVC1] [Quadro 600] Display update issues,
 stale rendered content
Date: Sat, 15 Feb 2014 09:55:53 +0000
Message-ID: <bug-75013-8800-L3lkB8E6ll@http.bugs.freedesktop.org/>
References: <bug-75013-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0416213059=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75013-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0416213059==
Content-Type: multipart/alternative; boundary="1392458152.FaF52.1240"; charset="us-ascii"


--1392458152.FaF52.1240
Date: Sat, 15 Feb 2014 09:55:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75013

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[Quadro 600] [Ubuntu 13.10] |[NVC1] [Quadro 600] Display
                   |Display update issues,      |update issues, stale
                   |stale rendered content      |rendered content

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I see that you're using displayport. Is it an actual DP monitor, or are you
using a DP->xyz adapter?

I recently posted a patch that should fix computing number of lanes/lane speeds
for DP on pre-nvd0 cards:
http://lists.freedesktop.org/archives/nouveau/2014-February/016205.html

Can you see if that helps you? Should apply to any 3.9+ kernel.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392458152.FaF52.1240
Date: Sat, 15 Feb 2014 09:55:52 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [Quadro 600] Display update issues, stale rendered content"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75013">bug 75013</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[Quadro 600] [Ubuntu 13.10] Display update issues, stale rendered content
           </td>
           <td>[NVC1] [Quadro 600] Display update issues, stale rendered content
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [Quadro 600] Display update issues, stale rendered content"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75013#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [Quadro 600] Display update issues, stale rendered content"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75013">bug 75013</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I see that you're using displayport. Is it an actual DP monitor, or are you
using a DP-&gt;xyz adapter?

I recently posted a patch that should fix computing number of lanes/lane speeds
for DP on pre-nvd0 cards:
<a href="http://lists.freedesktop.org/archives/nouveau/2014-February/016205.html">http://lists.freedesktop.org/archives/nouveau/2014-February/016205.html</a>

Can you see if that helps you? Should apply to any 3.9+ kernel.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392458152.FaF52.1240--

--===============0416213059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0416213059==--
