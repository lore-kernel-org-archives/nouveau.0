From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70464] [NVC3] runpm not working
Date: Tue, 15 Oct 2013 10:16:45 +0000
Message-ID: <bug-70464-8800-5QpLRjMY1v@http.bugs.freedesktop.org/>
References: <bug-70464-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1342838327=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70464-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1342838327==
Content-Type: multipart/alternative; boundary="1381832205.Dbbf5F2.24592"; charset="us-ascii"


--1381832205.Dbbf5F2.24592
Date: Tue, 15 Oct 2013 10:16:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70464

Dave Airlie <airlied-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #2 from Dave Airlie <airlied-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> ---
look in /sys/kernel/debug/vgaswitcheroo/state

to see if it says DynOff and DynPwr arond the glxinfo command

it sounds liek the gpu is waking up fine.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381832205.Dbbf5F2.24592
Date: Tue, 15 Oct 2013 10:16:45 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:airlied&#64;freedesktop.org" title="Dave Airlie &lt;airlied&#64;freedesktop.org&gt;"> <span class="fn">Dave Airlie</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NVC3] runpm not working"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70464">bug 70464</a>
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
           <td>NEEDINFO
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NVC3] runpm not working"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70464#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NVC3] runpm not working"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70464">bug 70464</a>
              from <span class="vcard"><a class="email" href="mailto:airlied&#64;freedesktop.org" title="Dave Airlie &lt;airlied&#64;freedesktop.org&gt;"> <span class="fn">Dave Airlie</span></a>
</span></b>
        <pre>look in /sys/kernel/debug/vgaswitcheroo/state

to see if it says DynOff and DynPwr arond the glxinfo command

it sounds liek the gpu is waking up fine.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381832205.Dbbf5F2.24592--

--===============1342838327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1342838327==--
