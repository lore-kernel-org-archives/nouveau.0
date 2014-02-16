From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74316] [NV92] Graphical corruption on KDE
 shutdown/restart/log out screen
Date: Sun, 16 Feb 2014 00:54:39 +0000
Message-ID: <bug-74316-8800-T6ns8oklKC@http.bugs.freedesktop.org/>
References: <bug-74316-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1354549181=="
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


--===============1354549181==
Content-Type: multipart/alternative; boundary="1392512078.5bBb4ce20.23760"; charset="us-ascii"


--1392512078.5bBb4ce20.23760
Date: Sun, 16 Feb 2014 00:54:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74316

AnAkkk <anakin.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|NOTOURBUG                   |---

--- Comment #6 from AnAkkk <anakin.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
According to kde developers, there may be a mesa or nouveau bug after all:

"Fredrik says, the configs should arrive with min. samples first, so this would
be a MESA/nouveau bug.'

"It seems to prefer TrueColor over DirectColor (that's expected) over sample
count sorting (may be intended), but even then 0x157 should apparently take
precedence: 

0x153 24 tc 0 24 0 r . . 8 8 8 0 . . 0 0 0 0 0 0 0 0 0 None 
0x157 24 tc 0 24 0 r y . 8 8 8 0 . . 0 0 0 0 0 0 0 0 0 None 
0x1ae 24 dc 0 24 0 r y . 8 8 8 0 . . 0 0 0 0 0 0 0 0 0 None 

So given the sample count sorting is still supposed, there's a bug in either
nouveau or MESA, it appears the double buffer support is ignored when sorting
the list (so that 0x153 and 0x157 are assumed equal, 0x153 moved to front and
0x157 ignored from sorting) - but that's sth. for the MESA devs to say =)"

See https://bugs.kde.org/show_bug.cgi?id=330986#c41

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392512078.5bBb4ce20.23760
Date: Sun, 16 Feb 2014 00:54:38 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:anakin.cs&#64;gmail.com" title="AnAkkk &lt;anakin.cs&#64;gmail.com&gt;"> <span class="fn">AnAkkk</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV92] Graphical corruption on KDE shutdown/restart/log out screen"
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
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>NOTOURBUG
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV92] Graphical corruption on KDE shutdown/restart/log out screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74316#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV92] Graphical corruption on KDE shutdown/restart/log out screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74316">bug 74316</a>
              from <span class="vcard"><a class="email" href="mailto:anakin.cs&#64;gmail.com" title="AnAkkk &lt;anakin.cs&#64;gmail.com&gt;"> <span class="fn">AnAkkk</span></a>
</span></b>
        <pre>According to kde developers, there may be a mesa or nouveau bug after all:

&quot;Fredrik says, the configs should arrive with min. samples first, so this would
be a MESA/nouveau bug.'

&quot;It seems to prefer TrueColor over DirectColor (that's expected) over sample
count sorting (may be intended), but even then 0x157 should apparently take
precedence: 

0x153 24 tc 0 24 0 r . . 8 8 8 0 . . 0 0 0 0 0 0 0 0 0 None 
0x157 24 tc 0 24 0 r y . 8 8 8 0 . . 0 0 0 0 0 0 0 0 0 None 
0x1ae 24 dc 0 24 0 r y . 8 8 8 0 . . 0 0 0 0 0 0 0 0 0 None 

So given the sample count sorting is still supposed, there's a bug in either
nouveau or MESA, it appears the double buffer support is ignored when sorting
the list (so that 0x153 and 0x157 are assumed equal, 0x153 moved to front and
0x157 ignored from sorting) - but that's sth. for the MESA devs to say =)&quot;

See <a href="https://bugs.kde.org/show_bug.cgi?id=330986#c41">https://bugs.kde.org/show_bug.cgi?id=330986#c41</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392512078.5bBb4ce20.23760--

--===============1354549181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1354549181==--
