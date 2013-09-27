From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69876] [NVC3] Reverse prime sometimes freezes the
	machine
Date: Fri, 27 Sep 2013 16:16:22 +0000
Message-ID: <bug-69876-8800-1UdG4OcCnS@http.bugs.freedesktop.org/>
References: <bug-69876-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1445799636=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69876-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1445799636==
Content-Type: multipart/alternative; boundary="1380298582.5E77B602.7230"; charset="us-ascii"


--1380298582.5E77B602.7230
Date: Fri, 27 Sep 2013 16:16:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69876

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Revers prime sometime       |[NVC3] Reverse prime
                   |freezes the machine         |sometimes freezes the
                   |                            |machine

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Perhaps an interesting resource for you:
http://nouveau.freedesktop.org/wiki/Optimus/

I'm no expect in the matter, but I'm pretty sure that you shouldn't be using
vgaswitcheroo in conjunction with the new runtime pm stuff. Try disabling it
(vgaswitcheroo). Alternatively (or in addition to), try disabling the new
runtime pm logic, perhaps it doesn't work correctly for you.

Is this a new issue? IOW, did this work properly on older kernels? If so, and
the above fails, a bisect may be in order.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380298582.5E77B602.7230
Date: Fri, 27 Sep 2013 16:16:22 +0000
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
   title="NEW --- - [NVC3] Reverse prime sometimes freezes the machine"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69876">bug 69876</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Revers prime sometime freezes the machine
           </td>
           <td>[NVC3] Reverse prime sometimes freezes the machine
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC3] Reverse prime sometimes freezes the machine"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69876#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC3] Reverse prime sometimes freezes the machine"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69876">bug 69876</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Perhaps an interesting resource for you:
<a href="http://nouveau.freedesktop.org/wiki/Optimus/">http://nouveau.freedesktop.org/wiki/Optimus/</a>

I'm no expect in the matter, but I'm pretty sure that you shouldn't be using
vgaswitcheroo in conjunction with the new runtime pm stuff. Try disabling it
(vgaswitcheroo). Alternatively (or in addition to), try disabling the new
runtime pm logic, perhaps it doesn't work correctly for you.

Is this a new issue? IOW, did this work properly on older kernels? If so, and
the above fails, a bisect may be in order.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380298582.5E77B602.7230--

--===============1445799636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1445799636==--
