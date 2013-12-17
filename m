From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71824] [NVE6] NULL deref on boot when there is
 nothing in DCB on 3.13-rc
Date: Tue, 17 Dec 2013 05:57:10 +0000
Message-ID: <bug-71824-8800-pgVKt5ZiZq@http.bugs.freedesktop.org/>
References: <bug-71824-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1118464195=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71824-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1118464195==
Content-Type: multipart/alternative; boundary="1387259830.Dbc8d2.19921"; charset="us-ascii"


--1387259830.Dbc8d2.19921
Date: Tue, 17 Dec 2013 05:57:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71824

Guo Jinxian <jinxianx.guo-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |VERIFIED

--- Comment #10 from Guo Jinxian <jinxianx.guo-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> ---
Checked on -testing (95d42e7d341861132ffec806328dd7fc85516995), this bug had
fixed, thanks.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387259830.Dbc8d2.19921
Date: Tue, 17 Dec 2013 05:57:10 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:jinxianx.guo&#64;intel.com" title="Guo Jinxian &lt;jinxianx.guo&#64;intel.com&gt;"> <span class="fn">Guo Jinxian</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_VERIFIED  bz_closed"
   title="VERIFIED FIXED - [NVE6] NULL deref on boot when there is nothing in DCB on 3.13-rc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71824">bug 71824</a>
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
           <td>VERIFIED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_VERIFIED  bz_closed"
   title="VERIFIED FIXED - [NVE6] NULL deref on boot when there is nothing in DCB on 3.13-rc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71824#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_VERIFIED  bz_closed"
   title="VERIFIED FIXED - [NVE6] NULL deref on boot when there is nothing in DCB on 3.13-rc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71824">bug 71824</a>
              from <span class="vcard"><a class="email" href="mailto:jinxianx.guo&#64;intel.com" title="Guo Jinxian &lt;jinxianx.guo&#64;intel.com&gt;"> <span class="fn">Guo Jinxian</span></a>
</span></b>
        <pre>Checked on -testing (95d42e7d341861132ffec806328dd7fc85516995), this bug had
fixed, thanks.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387259830.Dbc8d2.19921--

--===============1118464195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1118464195==--
